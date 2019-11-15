From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 23:27:10 +0100
Subject: [Buildroot] [git commit] package/ltp-testsuite: fix static build
 with lts-musl
Message-ID: <20191115221951.A57F98F06F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5279c58e230c364689b711b4058683b889faa3b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/a43def025d44344a4a690b52a52b3959e20b5d26

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0005-Fix-static-linking-with-musl-fts.patch    | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/ltp-testsuite/0005-Fix-static-linking-with-musl-fts.patch b/package/ltp-testsuite/0005-Fix-static-linking-with-musl-fts.patch
new file mode 100644
index 0000000000..9fa888d47e
--- /dev/null
+++ b/package/ltp-testsuite/0005-Fix-static-linking-with-musl-fts.patch
@@ -0,0 +1,50 @@
+From 9bf80b5781fc62e0dd821413a6d21f2689ee4ef1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 14 Oct 2019 11:47:49 +0200
+Subject: [PATCH] Fix static linking with musl-fts
+
+Don't append libraries to LDLIBS but prepend them in cpuset_lib/Makefile
+and cpuset/Makefile.inc to allow the user to provide its FTS library
+such as -lfts for musl/uclibc through LDLIBS
+
+This will fix static build of ltp with musl-fts on uclibc
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9155326e1ff7c2bb2218122c453872c2fc76f65e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/linux-test-project/ltp/pull/616]
+---
+ testcases/kernel/controllers/cpuset/Makefile.inc        | 2 +-
+ testcases/kernel/controllers/cpuset/cpuset_lib/Makefile | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/controllers/cpuset/Makefile.inc b/testcases/kernel/controllers/cpuset/Makefile.inc
+index db6a84305..c03dd77d7 100644
+--- a/testcases/kernel/controllers/cpuset/Makefile.inc
++++ b/testcases/kernel/controllers/cpuset/Makefile.inc
+@@ -41,7 +41,7 @@ MAKE_DEPS		:= $(LIBCONTROLLERS) $(LIBCPUSET)
+ 
+ LDFLAGS			+= -L$(abs_builddir)/$(LIBCPUSET_DIR) -L$(abs_builddir)/$(LIBCONTROLLERS_DIR)
+ 
+-LDLIBS			+= -lcpu_set -lcontrollers -lltp
++LDLIBS			:= -lcpu_set -lcontrollers -lltp $(LDLIBS)
+ 
+ INSTALL_TARGETS		?= *.sh
+ 
+diff --git a/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile b/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
+index 322d03cac..069ebc38c 100644
+--- a/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
++++ b/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
+@@ -25,7 +25,7 @@ top_srcdir 		?= ../../../../..
+ 
+ include $(top_srcdir)/include/mk/testcases.mk
+ 
+-LDLIBS			+= -lm -lcontrollers -lltp
++LDLIBS			:= -lm -lcontrollers -lltp $(LDLIBS)
+ 
+ LIB			:= libcpu_set.a
+ 
+-- 
+2.24.0
+
