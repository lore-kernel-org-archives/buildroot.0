From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 02:22:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target/linux
	toolchain/dependencies tool etc...
Message-ID: <20070822092207.DB0C9A610D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 02:22:07 -0700 (Wed, 22 Aug 2007)
New Revision: 19634

Log:
- improve the way host prerequisites for "dependencies" are established


Modified:
   trunk/buildroot/target/linux/Makefile.in
   trunk/buildroot/toolchain/dependencies/dependencies.mk
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-08-22 09:20:33 UTC (rev 19633)
+++ trunk/buildroot/target/linux/Makefile.in	2007-08-22 09:22:07 UTC (rev 19634)
@@ -59,14 +59,6 @@
 LINUX26_KERNEL=$(BINARIES_DIR)/linux-kernel-$(LINUX26_VERSION)-$(KERNEL_ARCH)
 endif
 
-ifeq ($(BR2_KERNEL_HEADERS_LZMA),y)
-ifeq ($(BR2_KERNEL_HEADERS_LZMA_INSTALL),y)
-DEPEND_ON_HOST_LZMA:=lzma-host-install
-else
-DEPEND_ON_HOST_LZMA:=lzma-host
-endif
-endif
-
 # Version of Linux AFTER patches
 LINUX26_DIR=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
 
@@ -165,7 +157,7 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
 
-linux26: $(DEPEND_ON_HOST_LZMA) $(INITRAMFS_TARGET) $(LINUX26_KERNEL)
+linux26: $(INITRAMFS_TARGET) $(LINUX26_KERNEL)
 
 $(LINUX26_DIR)/.modules_installed: $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
 	touch $@

Modified: trunk/buildroot/toolchain/dependencies/dependencies.mk
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.mk	2007-08-22 09:20:33 UTC (rev 19633)
+++ trunk/buildroot/toolchain/dependencies/dependencies.mk	2007-08-22 09:22:07 UTC (rev 19634)
@@ -5,11 +5,15 @@
 #
 ######################################################################
 
+DEPENDENCIES_HOST_PREREQ:=
 ifeq ($(BR2_STRIP_sstrip),y)
-# XXX: this is a little bit ugly, yep.
-MAYBE_SSTRIP_HOST:=sstrip_host
+DEPENDENCIES_HOST_PREREQ+=sstrip_host
 endif
-dependencies: host-sed host-lzma $(MAYBE_SSTRIP_HOST)
+ifneq ($(findstring y,$(BR2_KERNEL_HEADERS_LZMA)),)
+DEPENDENCIES_HOST_PREREQ+=host-lzma
+endif
+
+dependencies: host-sed $(DEPENDENCIES_HOST_PREREQ)
 	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
 		HOST_SED_DIR="$(HOST_SED_DIR)" \
 		$(TOPDIR)/toolchain/dependencies/dependencies.sh

Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2007-08-22 09:20:33 UTC (rev 19633)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2007-08-22 09:22:07 UTC (rev 19634)
@@ -74,19 +74,6 @@
 	  initramfs filesystems.  This requires the lzma
 	  program in your development environment.
 
-config BR2_KERNEL_HEADERS_LZMA_INSTALL
-	bool "Install lzma in /usr/local/bin (Requires system password) for sudo"
-	depends on BR2_KERNEL_HEADERS_2_6_21 || BR2_KERNEL_HEADERS_2_6_22
-	depends on BR2_KERNEL_HEADERS_LZMA
-	default n
-	help
-	  Install the lzma package in the /usr/local/bin directory
-	  so it is available for future builds.  This requires sudo.
-	  If you do not know the system password you should not set
-	  this option. If you do not have lzma installed the only way
-	  to complete the linux build, ifl you apply the lzma patches
-	  is to have '$(STAGING_DIR)/usr/bin' in your path.
-
 config BR2_KERNEL_HEADERS_PATCH_DIR
 	bool "Add additional headers from $(KERNEL_HEADERS_PATCH_DIR)"
 	default n
