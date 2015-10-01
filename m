From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 1 Oct 2015 14:23:57 +0100
Subject: [Buildroot] [PATCH] gdb: do not build documentation for bfd and
	gprof
Message-ID: <1443705837-23322-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our previous patch to disable the documentation in gdb wasn't complete.
There are cases where the documentation under bfd and gprof directories
is being built, causing the subsequent failure due to missing makeinfo.
This patch fixes that problem.

Fixes:

  http://autobuild.buildroot.org/results/244/2442e697d8a300496434fd42fcb1ee3941d13e06/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gdb/gdb.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 58a1232..15f394c 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -54,6 +54,12 @@ endif
 # Prevent gdb to build the documentation
 define GDB_DISABLE_DOC
 	$(SED) '/^SUBDIRS =/ s/doc//' $(@D)/gdb/Makefile.in
+	if test -e $(@D)/bfd/doc/Makefile.in ; then \
+		$(SED) 's/^INFO_DEPS =.*$$/INFO_DEPS =/' $(@D)/bfd/doc/Makefile.in ; \
+	fi
+	if test -e $(@D)/gprof/Makefile.in ; then \
+		$(SED) 's/^INFO_DEPS =.*$$/INFO_DEPS =/' $(@D)/gprof/Makefile.in ; \
+	fi
 endef
 GDB_PRE_CONFIGURE_HOOKS += GDB_DISABLE_DOC
 HOST_GDB_PRE_CONFIGURE_HOOKS += GDB_DISABLE_DOC
-- 
1.7.1
