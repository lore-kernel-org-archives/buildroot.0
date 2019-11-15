From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 15 Nov 2019 22:56:36 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/ltp-testsuite: fix static build with lts-musl
Message-ID: <20191115215636.13947-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/a43def025d44344a4a690b52a52b3959e20b5d26

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Don't add a new FTS_LIBS variable but prepend libraries to LDLIBS
   instead of appending them

 ...005-Fix-static-linking-with-musl-fts.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/ltp-testsuite/0005-Fix-static-linking-with-musl-fts.patch

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
-- 
2.24.0
