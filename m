From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 26 Sep 2013 20:12:09 +0000
Subject: [Buildroot] [PATCH] Allow Buildroot to update toolchain
Message-ID: <F9C551623D2CBB4C9488801D14F864C639AD62E9@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sometimes it is useful to self contain a toolchain.  To do this, one
must somehow build in the extra libraries needed to make the toolchain
complete.  This patch adjusts Buildroot to, by configuration, modify the
external toolchain while building additional libraries.

Signed-off-by: Andy Kennedy <andy.kennedy@adtran.com>
---
diff -Naur a/package/Makefile.in b/package/Makefile.in
--- a/package/Makefile.in	2013-09-17 06:42:07.000000000 -0500
+++ b/package/Makefile.in	2013-09-26 09:28:26.000000000 -0500
@@ -77,7 +77,9 @@
 endif
 
 STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
+ifneq ($(BR2_TOOLCHAIN_COPY_LIBS_INTO_TOOLCHAIN),y)
 STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
+endif
 
 TARGET_OPTIMIZATION:=$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
@@ -161,6 +163,11 @@
 TARGET_CC_NOCCACHE  := $(TARGET_CC)
 TARGET_CXX_NOCCACHE := $(TARGET_CXX)
 
+ifeq ($(BR2_TOOLCHAIN_COPY_LIBS_INTO_TOOLCHAIN),y)
+TARGET_CROSS=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
+STAGING_DIR    := $(shell $(TARGET_CC) --print-sysroot)
+endif
+
 ifeq ($(BR2_CCACHE),y)
 TARGET_CC  := $(CCACHE) $(TARGET_CC)
 TARGET_CXX := $(CCACHE) $(TARGET_CXX)
diff -Naur a/toolchain/helpers.mk b/toolchain/helpers.mk
--- a/toolchain/helpers.mk	2013-09-17 06:42:07.000000000 -0500
+++ b/toolchain/helpers.mk	2013-09-26 11:16:53.000000000 -0500
@@ -81,6 +81,10 @@
  \
 	echo -n
 
+ifeq ($(BR2_TOOLCHAIN_COPY_LIBS_INTO_TOOLCHAIN),y)
+	copy_toolchain_lib_root := echo "Not doing copy toolchain" ; exit ; $(copy_toolchain_lib_root)
+endif
+
 #
 # Copy the full external toolchain sysroot directory to the staging
 # dir. The operation of this function is rendered a little bit
@@ -160,6 +164,9 @@
 	fi ; \
 	find $(STAGING_DIR) -type d | xargs chmod 755
 
+ifeq ($(BR2_TOOLCHAIN_COPY_LIBS_INTO_TOOLCHAIN),y)
+	copy_toolchain_sysroot := echo "Not doing a copy" ; exit ; $(copy_toolchain_sysroot)
+endif
 #
 # Check the availability of a particular glibc feature. This function
 # is used to check toolchain options that are always supported by
diff -Naur a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
--- a/toolchain/toolchain-external/Config.in	2013-09-17 06:42:07.000000000 -0500
+++ b/toolchain/toolchain-external/Config.in	2013-09-25 16:33:48.000000000 -0500
@@ -948,6 +948,15 @@
 	  here, separated by spaces. They will be copied to the
 	  target's /lib directory.
 
+config BR2_TOOLCHAIN_COPY_LIBS_INTO_TOOLCHAIN
+	bool "Copy Libraries from Buildroot into toolchain sysroot"
+	help
+	  Select this option if you want to have Buildroot copy
+	  the generated libraries you have selected into the
+	  External toolchain.  This is useful if you want to make
+	  a fully loaded toolchain (with no external sysroot) for
+	  building standalone applications outside of Buildroot.
+
 endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
