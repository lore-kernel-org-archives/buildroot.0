From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 8 Sep 2015 14:22:45 +0100
Subject: [Buildroot] [PATCH] gdb: prevent building the documentation
Message-ID: <1441718565-24492-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gdb needs makeinfo to build the documentation. Since we do not provide a
host-makeinfo package this will fail in any system where makeinfo is
missing. However, we can workaround this problem by preventing gdb to
build the documentation.

Fixes:

  http://autobuild.buildroot.net/results/dd5/dd50ed99abb2c8495def826866b184030953f90e/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gdb/gdb.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 338de20..7a8f8c7 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -114,6 +114,12 @@ else
 GDB_CONF_OPTS += --without-zlib
 endif
 
+# Prevent gdb to build the documentation
+define GDB_DISABLE_DOC
+$(SED) '/^SUBDIRS =/ s/doc//' $(@D)/gdb/Makefile.in
+endef
+GDB_PRE_CONFIGURE_HOOKS += GDB_DISABLE_DOC
+
 # This removes some unneeded Python scripts and XML target description
 # files that are not useful for a normal usage of the debugger.
 define GDB_REMOVE_UNNEEDED_FILES
-- 
1.7.1
