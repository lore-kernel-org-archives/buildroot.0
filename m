From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 26 Jun 2007 09:36:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20070626163632.3ACE1A464B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-26 09:36:31 -0700 (Tue, 26 Jun 2007)
New Revision: 18945

Log:
- filter out eventual -fPIC -fpic -DPIC flags from the target cflags
  Honor the .config setting for KCONFIG and FORMAT iff not imposed by the target/device. If they are not set in the config, the defaults (zImage etc) still apply.


Modified:
   trunk/buildroot/target/linux26.mk


Changeset:
Modified: trunk/buildroot/target/linux26.mk
===================================================================
--- trunk/buildroot/target/linux26.mk	2007-06-26 16:35:07 UTC (rev 18944)
+++ trunk/buildroot/target/linux26.mk	2007-06-26 16:36:31 UTC (rev 18945)
@@ -24,7 +24,26 @@
 #LINUX26_FORMAT=vmlinux
 #LINUX26_BINLOC=$(LINUX26_FORMAT)
 
+# Linux kernel configuration file
 # Has to be set by the target/device
+# If it is not set by the target/device, then pick the one from .config
+# LINUX26_KCONFIG=$(BR2_BOARD_PATH)/linux26.config
+ifndef LINUX26_KCONFIG
+ifneq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_KCONFIG))),)
+LINUX26_KCONFIG=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_KCONFIG)))
+#"))
+#"))
+endif
+endif
+ifndef LINUX26_FORMAT
+ifneq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT))),)
+LINUX26_FORMAT=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT)))
+#"))
+#"))
+endif
+endif
+
+# Has to be set by the target/device
 # LINUX26_FORMAT=bzImage
 ifndef LINUX26_FORMAT
 LINUX26_FORMAT=zImage
@@ -35,10 +54,6 @@
 LINUX26_BINLOC=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
 endif
 
-# Linux kernel configuration file
-# Has to be set by the target/device
-# LINUX26_KCONFIG=$(BR2_BOARD_PATH)/linux26.config
-
 # File name for the Linux kernel binary
 LINUX26_KERNEL=linux-kernel-$(LINUX26_VERSION)-$(KERNEL_ARCH)
 
@@ -52,10 +67,10 @@
 
 # kernel patches
 LINUX26_PATCH_DIR=$(BR2_BOARD_PATH)/kernel-patches/
-
+__LINUX26_NO_PIC=-fPIC -fpic -DPIC
 LINUX26_MAKE_FLAGS = HOSTCC="$(HOSTCC)" HOSTCFLAGS=$(HOSTCFLAGS) \
 	ARCH=$(KERNEL_ARCH) \
-	CFLAGS_KERNEL="$(TARGET_CFLAGS)" \
+	CFLAGS_KERNEL="$(filter-out $(__LINUX26_NO_PIC),$(TARGET_CFLAGS))" \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE=$(KERNEL_CROSS)
 
