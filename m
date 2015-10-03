From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 23:14:27 +0200
Subject: [Buildroot] [git commit] gdb: do not build documentation for bfd
	and gprof
Message-ID: <20151003212011.BFDE4818EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1180bafd8e1de2b12db3c7c235b128c9e48d4abb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our previous patch to disable the documentation in gdb wasn't complete.
There are cases where the documentation under bfd and gprof directories
is being built, causing the subsequent failure due to missing makeinfo.
This patch fixes that problem.

Fixes:

  http://autobuild.buildroot.org/results/244/2442e697d8a300496434fd42fcb1ee3941d13e06/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
