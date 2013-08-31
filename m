From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 21:34:02 -0000
Subject: [Buildroot] [git commit] package: add the duma memory debugging
	library
Message-ID: <20130831213337.492C89B5D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bda69bf4e4b642ab199ffa13c7356709885f129d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the duma memory debugging library. This is based on an earlier
patch by Baruch Siach, with minor changes to build for latest
buildroot sources.

[Thomas P: misc cleanups, drop non-C++ support as it wasn't compiling,
added thread dependency.]

Signed-off-by: Reuben Dowle <reuben.dowle@4rf.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |    1 +
 package/duma/Config.in                           |   20 ++++++++++++
 package/duma/duma-01-fix-cross-compilation.patch |   37 ++++++++++++++++++++++
 package/duma/duma.mk                             |   34 ++++++++++++++++++++
 4 files changed, 92 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4fcff65..2ee843e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -23,6 +23,7 @@ source "package/dhrystone/Config.in"
 source "package/dstat/Config.in"
 source "package/dmalloc/Config.in"
 source "package/dropwatch/Config.in"
+source "package/duma/Config.in"
 source "package/gdb/Config.in"
 source "package/iozone/Config.in"
 source "package/kexec/Config.in"
diff --git a/package/duma/Config.in b/package/duma/Config.in
new file mode 100644
index 0000000..d233062
--- /dev/null
+++ b/package/duma/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_DUMA
+	bool "duma"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  D.U.M.A. - Detect Unintended Memory Access. A fork of the
+	  Electric Fence library. Detects buffer overflow and
+	  underflow, and also memory leaks.
+
+	  http://duma.sourceforge.net
+
+if BR2_PACKAGE_DUMA
+
+config BR2_PACKAGE_DUMA_NO_LEAKDETECTION
+	bool "disable memory leak detection"
+
+endif # BR2_PACKAGE_DUMA
+
+comment "duma requires C++ and thread support in toolchain"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/duma/duma-01-fix-cross-compilation.patch b/package/duma/duma-01-fix-cross-compilation.patch
new file mode 100644
index 0000000..eceaf06
--- /dev/null
+++ b/package/duma/duma-01-fix-cross-compilation.patch
@@ -0,0 +1,37 @@
+Allow cross compilation. Adapted from crosstool-ng.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+
+Index: b/GNUmakefile
+===================================================================
+--- a/GNUmakefile
++++ b/GNUmakefile
+@@ -93,10 +93,6 @@
+ # also define 'WIN32'
+ 
+ # some defaults:
+-CC=gcc
+-CXX=g++
+-AR=ar
+-RANLIB=ranlib
+ INSTALL=install
+ RM=rm
+ RMFORCE=rm -f
+@@ -471,7 +467,7 @@
+ 
+ createconf$(EXEPOSTFIX): createconf.o
+ 	- $(RMFORCE) createconf$(EXEPOSTFIX)
+-	$(CC) $(CFLAGS) $(DUMA_OPTIONS) createconf.o -o createconf$(EXEPOSTFIX)
++	$(CC_FOR_BUILD) $(HOST_CFLAGS) $(DUMA_OPTIONS) createconf.o -o createconf$(EXEPOSTFIX)
+ 
+ tstheap$(EXEPOSTFIX): libduma.a tstheap.o
+ 	- $(RMFORCE) tstheap$(EXEPOSTFIX)
+@@ -532,7 +528,7 @@
+ # define rules how to build objects for createconf
+ #
+ createconf.o:
+-	$(CC) $(CFLAGS) $(DUMA_OPTIONS) -c createconf.c -o $@
++	$(CC_FOR_BUILD) $(HOST_CFLAGS) $(DUMA_OPTIONS) -c createconf.c -o $@
+ 
+ 
+ #
diff --git a/package/duma/duma.mk b/package/duma/duma.mk
new file mode 100644
index 0000000..93ae16e
--- /dev/null
+++ b/package/duma/duma.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# duma
+#
+################################################################################
+
+DUMA_VERSION = 2_5_15
+DUMA_SOURCE = duma_$(DUMA_VERSION).tar.gz
+DUMA_SITE = http://downloads.sourceforge.net/project/duma/duma/2.5.15
+DUMA_LICENSE = GPLv2+ LGPLv2.1+
+DUMA_LICENSE_FILES = COPYING-GPL COPYING-LGPL
+
+DUMA_INSTALL_STAGING = YES
+
+DUMA_OPTIONS = \
+	$(if $(BR2_PACKAGE_DUMA_NO_LEAKDETECTION),-DDUMA_LIB_NO_LEAKDETECTION)
+
+# The dependency of some source files in duma_config.h, which is generated at
+# build time, is not specified in the Makefile. Force non-parallel build.
+define DUMA_BUILD_CMDS
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS)       \
+		DUMA_OPTIONS="$(DUMA_OPTIONS)"   \
+		$(DUMA_CPP) -C $(@D)
+endef
+
+define DUMA_INSTALL_STAGING_CMDS
+	$(MAKE) prefix=$(STAGING_DIR)/usr install -C $(@D)
+endef
+
+define DUMA_INSTALL_TARGET_CMDS
+	$(MAKE) prefix=$(TARGET_DIR)/usr install -C $(@D)
+endef
+
+$(eval $(generic-package))
