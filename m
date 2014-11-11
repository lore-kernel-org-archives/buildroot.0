From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 11 Nov 2014 16:56:48 +0300
Subject: [Buildroot] [PATCH v2] rt-tests: allow building subset of tests
	with non-NPTL toolchains
Message-ID: <1415714208-825-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some architectures are still stuck with non-NPTL toolchains.
These are for example ARC, Blackfin, Xtensa etc.

Still rt-tests are very good benchmarks and it would be good to enable use of
at least selected (those that will be built) tests on those architectures.

This change makes it possible to only build subset of tests that don't require
NPTL calls.

Following tests will be built with non-NPTL toolchain:
 * signaltest
 * ptsematest
 * sigwaittest
 * svsematest
 * sendme
 * hackbench

Still it's required to have a toolchain with threads support because most of
mentioned tests use threads.

03-fix-non-nptl-buil.patch was submitted upstream:
https://www.mail-archive.com/linux-kernel at vger.kernel.org/msg762958.html
so as soon as it is accepted with the next version bump this patch should be
removed.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
Compared to v1 dependency on threads support in toolchain was added.
---
 package/rt-tests/03-fix-non-nptl-buil.patch | 55 +++++++++++++++++++++++++++++
 package/rt-tests/Config.in                  |  7 ++--
 package/rt-tests/rt-tests.mk                |  6 ++++
 3 files changed, 64 insertions(+), 4 deletions(-)
 create mode 100644 package/rt-tests/03-fix-non-nptl-buil.patch

diff --git a/package/rt-tests/03-fix-non-nptl-buil.patch b/package/rt-tests/03-fix-non-nptl-buil.patch
new file mode 100644
index 0000000..5c65018
--- /dev/null
+++ b/package/rt-tests/03-fix-non-nptl-buil.patch
@@ -0,0 +1,55 @@
+From c6920f97be02ca3fba9320b043acd578ce4c62d8 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Mon, 10 Nov 2014 10:00:13 +0300
+Subject: [PATCH] Makefile: allow building selected tests with non-NPTL
+ toolchain
+
+Some architectures are still stuck with non-NPTL toolchains.
+These are for example ARC, Blackfin, Xtensa etc.
+
+Still rt-tests are very good benchmarks and it would be good to enable use of
+at least selected (those that will be built) tests on those architectures.
+
+This change makes it possible to only build subset of tests that don't require
+NPTL calls.
+
+By default behavior is not modified - all tests are built, but if one wants
+to build with non-NPTL toolchain just add "HAVE_NPTL=no" in command line
+or modify "HAVE_NPTL" variable right in Makefile and execute "make".
+
+This patch was submitted upstream:
+https://www.mail-archive.com/linux-kernel at vger.kernel.org/msg762958.html
+so as soon as it is accepted with the next version bump this patch should be
+removed.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+Cc: Vineet Gupta <vgupta@synopsys.com>
+Cc: Clark Williams <clark.williams@gmail.com>
+---
+ Makefile | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 318a5c6..675edf7 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,8 +1,13 @@
+ VERSION_STRING = 0.89
+ 
+-sources = cyclictest.c signaltest.c pi_stress.c rt-migrate-test.c	\
+-	  ptsematest.c sigwaittest.c svsematest.c pmqtest.c sendme.c 	\
+-	  pip_stress.c hackbench.c
++HAVE_NPTL ?= yes
++
++ifeq ($(HAVE_NPTL),yes)
++sources = cyclictest.c pi_stress.c pip_stress.c pmqtest.c rt-migrate-test.c
++endif
++
++sources += signaltest.c ptsematest.c sigwaittest.c svsematest.c sendme.c \
++	  hackbench.c
+ 
+ TARGETS = $(sources:.c=)
+ 
+-- 
+1.9.3
+
diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 81e5d06..34669b2 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
-	# no _tid field in 'struct sigevent'
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Set of utilities for testing the real-time behaviour of a
 	  Linux system.
@@ -26,5 +25,5 @@ comment "rt-tests may not work on MIPS with an external uClibc toolchain"
 	depends on BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
-comment "rt-tests needs a toolchain w/ NPTL"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+comment "rt-tests needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 4cd99c0..1980556 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -13,15 +13,21 @@ ifeq ($(BR2_PACKAGE_PYTHON),y)
 RT_TESTS_DEPENDENCIES = python
 endif
 
+ifneq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
+RT_TESTS_HAVE_NPTL=no
+endif
+
 define RT_TESTS_BUILD_CMDS
 	$(MAKE) -C $(@D) 			\
 		CC="$(TARGET_CC)" 		\
+		HAVE_NPTL=$(RT_TESTS_HAVE_NPTL)	\
 		CFLAGS="$(TARGET_CFLAGS)"	\
 		prefix=/usr
 endef
 
 define RT_TESTS_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) 				\
+		HAVE_NPTL=$(RT_TESTS_HAVE_NPTL)		\
 		DESTDIR="$(TARGET_DIR)" 		\
 		prefix=/usr 				\
 		$(if $(BR2_PACKAGE_PYTHON),HASPYTHON=1 PYLIB=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/) \
-- 
1.9.3
