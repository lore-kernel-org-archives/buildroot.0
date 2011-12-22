From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Dec 2011 13:13:38 +0100
Subject: [Buildroot] [PATCH] rt-tests: new package
Message-ID: <1324556018-17540-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |    1 +
 package/rt-tests/Config.in                       |   13 +++++++
 package/rt-tests/rt-tests-fix-build-system.patch |   43 ++++++++++++++++++++++
 package/rt-tests/rt-tests.mk                     |   25 +++++++++++++
 4 files changed, 82 insertions(+), 0 deletions(-)
 create mode 100644 package/rt-tests/Config.in
 create mode 100644 package/rt-tests/rt-tests-fix-build-system.patch
 create mode 100644 package/rt-tests/rt-tests.mk

diff --git a/package/Config.in b/package/Config.in
index b6df18a..e5e11be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -28,6 +28,7 @@ source "package/ltrace/Config.in"
 source "package/memstat/Config.in"
 source "package/netperf/Config.in"
 source "package/oprofile/Config.in"
+source "package/rt-tests/Config.in"
 source "package/strace/Config.in"
 source "package/whetstone/Config.in"
 source "package/valgrind/Config.in"
diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
new file mode 100644
index 0000000..e645266
--- /dev/null
+++ b/package/rt-tests/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_RT_TESTS
+	bool "rt-tests"
+	help
+	  Set of utilities for testing the real-time behaviour of a
+	  Linux system.
+
+	  All tools are simple C programs with no dependencies, except
+	  the hwlatdetect utility, which is a Python script and
+	  therefore requires the Python interpreter. It will only be
+	  installed if a Python interpreter has been selected in the
+	  Buildroot configuration.
+
+	  http://rt.wiki.kernel.org
diff --git a/package/rt-tests/rt-tests-fix-build-system.patch b/package/rt-tests/rt-tests-fix-build-system.patch
new file mode 100644
index 0000000..9d6aa05
--- /dev/null
+++ b/package/rt-tests/rt-tests-fix-build-system.patch
@@ -0,0 +1,43 @@
+Fix various minor issues with rt-tests build system
+
+The issues fixed are :
+
+ * Remove the automatic NUMA detection from the host
+   architecture. This is broken when doing cross-compilation. One can
+   still set NUMA=1 if NUMA support is desired.
+
+ * Expand the CFLAGS provided through the environment instead of
+   overriding it.
+
+ * Provide a HASPYTHON variable to tell whether the target system has
+   Python or not. Otherwise, the build system simply tests whether
+   Python is available on the host. The PYLIB variable is also changed
+   so that it can be overriden from the environment, in order to
+   provide the correct Python module location for the target.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: rt-tests/Makefile
+===================================================================
+--- rt-tests.orig/Makefile
++++ rt-tests/Makefile
+@@ -14,15 +14,11 @@
+ mandir	?= $(prefix)/share/man
+ srcdir	?= $(prefix)/src
+ 
+-machinetype = $(shell uname -m | \
+-    sed -e 's/i.86/i386/' -e 's/mips.*/mips/' -e 's/ppc.*/powerpc/')
+-ifneq ($(filter x86_64 i386 ia64 mips powerpc,$(machinetype)),)
+-NUMA 	:= 1
+-endif
+-
+-CFLAGS = -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
++override CFLAGS += -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
+ 
+-PYLIB  := $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
++ifeq ($(HASPYTHON),1)
++PYLIB ?= $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
++endif
+ 
+ ifndef DEBUG
+ 	CFLAGS	+= -O2
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
new file mode 100644
index 0000000..222733f
--- /dev/null
+++ b/package/rt-tests/rt-tests.mk
@@ -0,0 +1,25 @@
+RT_TESTS_SITE    = http://snapshot.debian.org/archive/debian/20111202T222101Z/pool/main/r/rt-tests/
+RT_TESTS_VERSION = 0.83
+RT_TESTS_SOURCE  = rt-tests_$(RT_TESTS_VERSION).orig.tar.gz
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+RT_TESTS_DEPENDENCIES = python
+endif
+
+define RT_TESTS_BUILD_CMDS
+	$(MAKE) -C $(@D) 			\
+		CC="$(TARGET_CC)" 		\
+		CFLAGS="$(TARGET_CFLAGS)"	\
+		prefix=/usr
+endef
+
+define RT_TESTS_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) 				\
+		DESTDIR="$(TARGET_DIR)" 		\
+		prefix=/usr 				\
+		$(if $(BR2_PACKAGE_PYTHON),HASPYTHON=1 PYLIB=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/) \
+		install
+endef
+
+$(eval $(call GENTARGETS))
+
-- 
1.7.4.1
