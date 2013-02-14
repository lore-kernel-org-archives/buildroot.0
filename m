From: Reuben Dowle <reuben.dowle@4rf.com>
Date: Thu, 14 Feb 2013 23:05:53 +0000
Subject: [Buildroot] [PATCH] package: add the duma memory debugging library
Message-ID: <069B5A25F9844945B625ADE7258AC94C061E77EA@4rf-nz-orion.local.4rf.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the duma memory debugging library. This is based on an earlier patch by
Baruch Siach, with minor changes to build for latest buildroot sources.

Signed-off-by: Reuben Dowle <reuben.dowle@4rf.com>
---
 package/duma/Config.in                       |   15 ++++++++++
 package/duma/duma-2_5_15-cross-compile.patch |   36 +++++++++++++++++++++++
 package/duma/duma-2_5_15-separate-cpp.patch  |   23 +++++++++++++++
 package/duma/duma.mk                         |   40 ++++++++++++++++++++++++++
 4 files changed, 114 insertions(+)
 create mode 100644 package/duma/Config.in
 create mode 100644 package/duma/duma-2_5_15-cross-compile.patch
 create mode 100644 package/duma/duma-2_5_15-separate-cpp.patch
 create mode 100644 package/duma/duma.mk

diff --git a/package/duma/Config.in b/package/duma/Config.in
new file mode 100644
index 0000000..7f7a765
--- /dev/null
+++ b/package/duma/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_DUMA
+       bool "duma"
+       help
+         D.U.M.A. - Detect Unintended Memory Access. A fork of the Electric
+         Fence library. Detects buffer overflow and underflow, and also memory
+         leaks.
+
+         http://duma.sourceforge.net
+
+if BR2_PACKAGE_DUMA
+
+config BR2_PACKAGE_DUMA_NO_LEAKDETECTION
+       bool "disable memory leak detection"
+
+endif # BR2_PACKAGE_DUMA
diff --git a/package/duma/duma-2_5_15-cross-compile.patch b/package/duma/duma-2_5_15-cross-compile.patch
new file mode 100644
index 0000000..323ab42
--- /dev/null
+++ b/package/duma/duma-2_5_15-cross-compile.patch
@@ -0,0 +1,36 @@
+Allow cross compilation. Adapted from crosstool-ng.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+diff -durN duma_2_5_15.orig/GNUmakefile duma_2_5_15/GNUmakefile
+--- duma_2_5_15.orig/GNUmakefile       2008-08-03 21:22:38.000000000 +0200
++++ duma_2_5_15/GNUmakefile    2009-06-19 15:32:23.000000000 +0200
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
+       - $(RMFORCE) createconf$(EXEPOSTFIX)
+-      $(CC) $(CFLAGS) $(DUMA_OPTIONS) createconf.o -o createconf$(EXEPOSTFIX)
++      $(CC_FOR_BUILD) $(HOSTCFLAGS) $(DUMA_OPTIONS) createconf.o -o createconf$(EXEPOSTFIX)
+
+ tstheap$(EXEPOSTFIX): libduma.a tstheap.o
+       - $(RMFORCE) tstheap$(EXEPOSTFIX)
+@@ -532,7 +528,7 @@
+ # define rules how to build objects for createconf
+ #
+ createconf.o:
+-      $(CC) $(CFLAGS) $(DUMA_OPTIONS) -c createconf.c -o $@
++      $(CC_FOR_BUILD) $(HOSTCFLAGS) $(DUMA_OPTIONS) -c createconf.c -o $@
+
+
+ #
diff --git a/package/duma/duma-2_5_15-separate-cpp.patch b/package/duma/duma-2_5_15-separate-cpp.patch
new file mode 100644
index 0000000..cdf5706
--- /dev/null
+++ b/package/duma/duma-2_5_15-separate-cpp.patch
@@ -0,0 +1,23 @@
+Allow build without C++ support. Taken from crosstool-ng.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+diff -durN duma_2_5_15.orig/GNUmakefile duma_2_5_15/GNUmakefile
+--- duma_2_5_15.orig/GNUmakefile       2009-06-19 16:41:53.000000000 +0200
++++ duma_2_5_15/GNUmakefile    2009-06-19 16:43:53.000000000 +0200
+@@ -289,9 +289,13 @@
+       dumatest.c tstheap.c thread-test.c testmt.c dumatestpp.cpp testoperators.cpp \
+       createconf.c
+
+-OBJECTS=dumapp.o duma.o sem_inc.o print.o
++OBJECTS = duma.o sem_inc.o print.o
++SO_OBJECTS = duma_so.o sem_inc_so.o print_so.o
+
+-SO_OBJECTS=dumapp_so.o duma_so.o sem_inc_so.o print_so.o
++ifeq ($(DUMA_CPP),1)
++OBJECTS += dumapp.o
++SO_OBJECTS += dumapp_so.o
++endif
+
+ # Make all the top-level targets the makefile knows about.
+ all:  libduma.a tstheap$(EXEPOSTFIX) dumatest$(EXEPOSTFIX) thread-test$(EXEPOSTFIX) testmt$(EXEPOSTFIX) dumatestpp$(EXEPOSTFIX) testoperators$(EXEPOSTFIX) $(DUMA_DYN_DEPS)
diff --git a/package/duma/duma.mk b/package/duma/duma.mk
new file mode 100644
index 0000000..28eea0f
--- /dev/null
+++ b/package/duma/duma.mk
@@ -0,0 +1,40 @@
+#############################################################
+#
+# duma
+#
+#############################################################
+DUMA_VERSION = 2_5_15
+DUMA_SOURCE = duma_$(DUMA_VERSION).tar.gz
+DUMA_SITE = http://downloads.sourceforge.net/project/duma/duma/2.5.15
+DUMA_LICENSE = GPLv2+ LGPLv2.1+
+DUMA_LICENSE_FILES = COPYING-GPL COPYING-LGPL
+
+DUMA_INSTALL_STAGING = YES
+
+DUMA_OPTIONS = $(if $(BR2_PACKAGE_DUMA_NO_LEAKDETECTION), \
+                       -DDUMA_LIB_NO_LEAKDETECTION)
+
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+DUMA_CPP = DUMA_CPP=1
+else
+DUMA_CPP =
+DUMA_OPTIONS += -DDUMA_SO_NO_CPP_SUPPORT -DDUMA_LIB_NO_CPP_SUPPORT
+endif
+
+# The dependency of some source files in duma_config.h, which is generated at
+# build time, is not specified in the Makefile. Force non-parallel build.
+define DUMA_BUILD_CMDS
+       $(MAKE1) $(TARGET_CONFIGURE_OPTS)               \
+               DUMA_OPTIONS=$(strip $(DUMA_OPTIONS))   \
+               $(DUMA_CPP) -C $(@D)
+endef
+
+define DUMA_INSTALL_STAGING_CMDS
+       $(MAKE) prefix=$(STAGING_DIR)/usr install -C $(@D)
+endef
+
+define DUMA_INSTALL_TARGET_CMDS
+       $(MAKE) prefix=$(TARGET_DIR)/usr install -C $(@D)
+endef
+
+$(eval $(generic-package))
--
1.7.10.4

The information in this email communication (inclusive of attachments) is confidential to 4RF Limited and the intended recipient(s). If you are not the intended recipient(s), please note that any use, disclosure, distribution or copying of this information or any part thereof is strictly prohibited and that the author accepts no liability for the consequences of any action taken on the basis of the information provided. If you have received this email in error, please notify the sender immediately by return email and then delete all instances of this email from your system. 4RF Limited will not accept responsibility for any consequences associated with the use of this email (including, but not limited to, damages sustained as a result of any viruses and/or any action or lack of action taken in reliance on it).
