From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 14 Oct 2019 18:53:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: fix static build
 with lts-musl
Message-ID: <20191014165335.4884-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/9155326e1ff7c2bb2218122c453872c2fc76f65e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-to-fix-static-linking-with-musl-fts.patch | 48 +++++++++++++++++++
 package/ltp-testsuite/ltp-testsuite.mk        |  2 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 package/ltp-testsuite/0003-Add-FTS_LIBS-to-fix-static-linking-with-musl-fts.patch

diff --git a/package/ltp-testsuite/0003-Add-FTS_LIBS-to-fix-static-linking-with-musl-fts.patch b/package/ltp-testsuite/0003-Add-FTS_LIBS-to-fix-static-linking-with-musl-fts.patch
new file mode 100644
index 0000000000..ddfc423af5
--- /dev/null
+++ b/package/ltp-testsuite/0003-Add-FTS_LIBS-to-fix-static-linking-with-musl-fts.patch
@@ -0,0 +1,48 @@
+From 12fbf9d051f13477ca560ba174362e8b0f4d446b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 14 Oct 2019 11:47:49 +0200
+Subject: [PATCH] Add FTS_LIBS to fix static linking with musl-fts
+
+Add FTS_LIBS to cpuset_lib/Makefile and cpuset/Makefile.inc to allow the
+user to provide its FTS library such as -lfts for musl/uclibc
+
+This will fix static build of ltp with musl-fts on uclibc
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9155326e1ff7c2bb2218122c453872c2fc76f65e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ testcases/kernel/controllers/cpuset/Makefile.inc        | 2 +-
+ testcases/kernel/controllers/cpuset/cpuset_lib/Makefile | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/controllers/cpuset/Makefile.inc b/testcases/kernel/controllers/cpuset/Makefile.inc
+index db6a84305..65967c85b 100644
+--- a/testcases/kernel/controllers/cpuset/Makefile.inc
++++ b/testcases/kernel/controllers/cpuset/Makefile.inc
+@@ -41,7 +41,7 @@ MAKE_DEPS		:= $(LIBCONTROLLERS) $(LIBCPUSET)
+ 
+ LDFLAGS			+= -L$(abs_builddir)/$(LIBCPUSET_DIR) -L$(abs_builddir)/$(LIBCONTROLLERS_DIR)
+ 
+-LDLIBS			+= -lcpu_set -lcontrollers -lltp
++LDLIBS			+= -lcpu_set -lcontrollers -lltp $(FTS_LIBS)
+ 
+ INSTALL_TARGETS		?= *.sh
+ 
+diff --git a/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile b/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
+index 322d03cac..2f9f93c69 100644
+--- a/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
++++ b/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
+@@ -25,7 +25,7 @@ top_srcdir 		?= ../../../../..
+ 
+ include $(top_srcdir)/include/mk/testcases.mk
+ 
+-LDLIBS			+= -lm -lcontrollers -lltp
++LDLIBS			+= -lm -lcontrollers -lltp $(FTS_LIBS)
+ 
+ LIB			:= libcpu_set.a
+ 
+-- 
+2.23.0
+
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 0c850d2b67..57099f606d 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -53,7 +53,7 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 LTP_TESTSUITE_DEPENDENCIES += musl-fts
-LTP_TESTSUITE_LIBS += -lfts
+LTP_TESTSUITE_MAKE_OPTS += FTS_LIBS=-lfts
 endif
 
 LTP_TESTSUITE_CONF_ENV += \
-- 
2.23.0
