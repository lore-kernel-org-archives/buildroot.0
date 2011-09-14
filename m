From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Sep 2011 14:56:15 +0200
Subject: [Buildroot] [PATCH 2 of 2 v2] Add xenomai real-time Framework to
	buildroot
In-Reply-To: <patchbomb.1316004973@localhost6.localdomain6>
References: <patchbomb.1316004973@localhost6.localdomain6>
Message-ID: <5dda8d37e2dd82f821ee.1316004975@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot Kernel:
  * Download Adeos patch and specify the path into buildroot
    menuconfig...
  * ..and take care of Linux kernel version supported by Xenomai.

Non-buildroot Kernel:
  * The User-space part of Xenomai can be built with an external
    real-time kernel.

Signed-off-by: Benoit Mauduit <benoit.mauduit@openwide.fr>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 linux/Config.ext.in                                  |  15 +++++++++++++++
 linux/linux-ext-xenomai.mk                           |  29 +++++++++++++++++++++++++++++
 package/Config.in                                    |   4 ++++
 package/xenomai/Config.in                            |  78 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 package/xenomai/README                               |  48 ++++++++++++++++++++++++++++++++++++++++++++++++
 package/xenomai/xenomai-do-not-install-devices.patch |  10 ++++++++++
 package/xenomai/xenomai.mk                           |  88 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/generic/device_table_dev.txt                  |   5 +++++
 8 files changed, 277 insertions(+), 0 deletions(-)
 create mode 100644 linux/linux-ext-xenomai.mk
 create mode 100644 package/xenomai/Config.in
 create mode 100644 package/xenomai/README
 create mode 100644 package/xenomai/xenomai-do-not-install-devices.patch
 create mode 100644 package/xenomai/xenomai.mk

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -1,3 +1,18 @@
 menu "Linux Kernel Extensions"
 
+# Xenomai
+config BR2_LINUX_KERNEL_EXT_XENOMAI
+	bool "Adeos/Xenomai Real-time patch"
+  select BR2_PACKAGE_XENOMAI
+	help
+	  Xenomai Kernel part.
+
+config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
+	depends on BR2_LINUX_KERNEL_EXT_XENOMAI
+	string "Path for Adeos patch file"
+	help
+	  Optionally, explicitly specify the Adeos patch to use.
+	  Download it at http://download.gna.org/adeos/patches/v2.6/$(ARCH)/
+	  and verify that your kernel version in buildroot matches.
+
 endmenu
diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
new file mode 100644
--- /dev/null
+++ b/linux/linux-ext-xenomai.mk
@@ -0,0 +1,29 @@
+##################################################
+# Linux Adeos/Xenomai extensions
+#
+# Patch the linux kernel with xenomai extension
+##################################################
+
+ifeq ($(BR2_LINUX_KERNEL_EXT_XENOMAI),y)
+# Add dependency to xenomai (user-space) which provide ksrc part
+LINUX_DEPENDENCIES += xenomai
+
+# Adeos patch version
+XENOMAI_ADEOS_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH))
+ifeq ($(XENOMAI_ADEOS_PATCH),)
+XENOMAI_ADEOS_OPT = --default
+else
+XENOMAI_ADEOS_OPT = --adeos=$(XENOMAI_ADEOS_PATCH)
+endif
+
+# Prepare kernel patch
+define XENOMAI_PREPARE_KERNEL
+	$(XENOMAI_DIR)/scripts/prepare-kernel.sh \
+		--linux=$(LINUX_DIR) \
+		--arch=$(BR2_ARCH) \
+		$(XENOMAI_ADEOS_OPT)
+endef
+
+LINUX_POST_EXTRACT_HOOKS += XENOMAI_PREPARE_KERNEL
+
+endif #BR2_LINUX_EXT_XENOMAI
diff --git a/package/Config.in b/package/Config.in
--- a/package/Config.in
+++ b/package/Config.in
@@ -487,6 +487,10 @@
 endif
 endmenu
 
+menu "Real-Time"
+source "package/xenomai/Config.in"
+endmenu
+
 menu "Shell and utilities"
 source "package/at/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
new file mode 100644
--- /dev/null
+++ b/package/xenomai/Config.in
@@ -0,0 +1,78 @@
+config BR2_PACKAGE_XENOMAI
+	bool "Xenomai Userspace"
+	help
+	  Real-Time Framework for Linux
+	  http://www.xenomai.org
+
+config BR2_PACKAGE_XENOMAI_VERSION
+	depends on BR2_PACKAGE_XENOMAI
+	string "Custom Xenomai version"
+	help
+	  Manualy select Xenomai Version.
+	  Take care of compatibility with the Linux kernel.
+
+# Manually select CPU (use it if not detected)
+config BR2_PACKAGE_XENOMAI_CPU_TYPE_MANUAL
+	bool "Manually Select Xenomai CPU"
+	depends on (BR2_PACKAGE_XENOMAI && BR2_arm)
+	help
+	  This option allows you to select Xenomai CPU in a list. Use it only
+	  if CPU is not auto-detected by Buildroot ! (i.e. your board is not
+	  described)
+
+choice
+	prompt "Xenomai ARM CPU type"
+	depends on BR2_PACKAGE_XENOMAI_CPU_TYPE_MANUAL
+	help
+	  Manually select CPU type for Xenomai.
+
+	config BR2_PACKAGE_XENOMAI_CPU_AT91RM9200
+		bool "Atmel AT91RM9200"
+
+	config BR2_PACKAGE_XENOMAI_CPU_AT91SAM926X
+		bool "Atmel AT91SAM926X"
+
+	config BR2_PACKAGE_XENOMAI_CPU_INTEGRATOR
+		bool "ARM Ltd. Integrator"
+
+	config BR2_PACKAGE_XENOMAI_CPU_IXP4XX
+		bool "Intel IXP4XX (XScale)"
+
+	config BR2_PACKAGE_XENOMAI_CPU_IMX
+		bool "Freescale i.MX (MX1/MXL)"
+
+	config BR2_PACKAGE_XENOMAI_CPU_IMX21
+		bool "Freescale i.MX21"
+
+	config BR2_PACKAGE_XENOMAI_CPU_MX2
+		bool "Freescale MXC/MX2"
+
+	config BR2_PACKAGE_XENOMAI_CPU_MX3
+		bool "Freescale MXC/MX3"
+
+	config BR2_PACKAGE_XENOMAI_CPU_SA1100
+		bool "StrongARM SA1100"
+
+	config BR2_PACKAGE_XENOMAI_CPU_S3C2410
+		bool "S3C2410"
+
+	config BR2_PACKAGE_XENOMAI_CPU_GENERIC_ARM
+		bool "Generic ARM"
+
+endchoice
+
+# Now set CPU type. We force manually selected type even if detected in case
+# user takes the risk.
+config BR2_PACKAGE_XENOMAI_CPU_TYPE
+	string
+	depends on BR2_PACKAGE_XENOMAI && BR2_arm
+	default "at91rm9200"  if BR2_PACKAGE_XENOMAI_CPU_AT91RM9200
+	default "at91sam926x" if BR2_PACKAGE_XENOMAI_CPU_AT91SAM926X
+	default "integrator"  if BR2_PACKAGE_XENOMAI_CPU_INTEGRATOR
+	default "ixp4xx"      if BR2_PACKAGE_XENOMAI_CPU_IXP4XX
+	default "generic"     if BR2_PACKAGE_XENOMAI_CPU_GENERIC_ARM
+	default "imx"         if BR2_PACKAGE_XENOMAI_CPU_IMX
+	default "imx21"       if BR2_PACKAGE_XENOMAI_CPU_IMX21
+	default "mx2"         if BR2_PACKAGE_XENOMAI_CPU_MX2
+	default "mx3"         if BR2_PACKAGE_XENOMAI_CPU_MX3
+	default "s3c2410"     if BR2_PACKAGE_XENOMAI_CPU_S3C2410
diff --git a/package/xenomai/README b/package/xenomai/README
new file mode 100644
--- /dev/null
+++ b/package/xenomai/README
@@ -0,0 +1,48 @@
+****************
+* Xenomai      *
+****************
+
+Xenomai comes with 2 parts : Kernel Part and User-space part.
+Kernel part patch Linux with ADEOS(i-pipe)
+(http://home.gna.org/adeos/) and some Xenomai kernel space stuff.
+
+From Adeos main site :
+"The purpose of Adeos is to provide a flexible environment for sharing
+hardware resources among multiple operating systems, or among multiple
+instances of a single OS."
+
+From Xenomai main site :
+"Xenomai is a real-time development framework cooperating with the
+Linux kernel, in order to provide a pervasive, interface-agnostic,
+hard real-time support to user-space applications, seamlessly
+integrated into the GNU/Linux environment."
+
+****************
+* Installation *
+****************
+
+* Buildroot Kernel: *
+  - Check that your version of Linux Kernel is supported by the
+    version of xenomai you choose.
+  - Download Adeos patch at
+    http://download.gna.org/adeos/patches/v2.6/$(ARCH)/, or if your
+    are sure, let the Xenomai 'prepare-kernel.sh' script do the work.
+  - Check the Xenomai Kernel option in Buildroot :
+     -> Kernel
+       -> Linux Kernel (BR2_LINUX_KERNEL [=y])
+         -> Linux Kernel Extensions
+            -> [*] Adeos/Xenomai Real-time patch
+     ..And add the path to Adeos patch. (or leave it empty if you let
+     xenomai script do the work)
+
+* Non-Buildroot Kernel AND Buildroot Kernel *
+  - Make sure your Kernel is patched with Xenomai
+  - Check the option in Buildroot menu :
+    -> Package Selection for the target
+       -> Real-time
+          -> [*] Xenomai Userspace
+  - You can download a custom version of Xenomai that fit with your
+  Kernel.
+  - If you use static /dev and the default device_table, Uncomment
+  Xenomai part in 'target/generic/device_table_dev.txt'. (rtheap,
+  rtscope and rtp[0-31])
diff --git a/package/xenomai/xenomai-do-not-install-devices.patch b/package/xenomai/xenomai-do-not-install-devices.patch
new file mode 100644
--- /dev/null
+++ b/package/xenomai/xenomai-do-not-install-devices.patch
@@ -0,0 +1,11 @@
+--- a/Makefile.in	2011-06-24 16:11:23.591449817 +0200
++++ b/Makefile.in	2011-06-24 16:20:29.638129633 +0200
+@@ -719,7 +719,7 @@
+ 	  $$sudo mknod -m 666 $(DESTDIR)/dev/rtheap c 10 254 ; \
+ 	fi
+ 
+-install-exec-local: devices
++install-exec-local:
+ 
+ install-user:
+ 	$(MAKE) SUDO=false install
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
new file mode 100644
--- /dev/null
+++ b/package/xenomai/xenomai.mk
@@ -0,0 +1,88 @@
+#############################################################
+# Xenomai
+# URL  : http://xenomai.org
+# NOTE : Real-Time Framework for Linux
+#
+#############################################################
+
+XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
+ifeq ($(XENOMAI_VERSION),)
+XENOMAI_VERSION = 2.5.6
+endif
+
+XENOMAI_SITE = http://download.gna.org/xenomai/stable/
+XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
+
+XENOMAI_INSTALL_STAGING = YES
+
+ifeq ($(BR2_arm),y)
+XENOMAI_CPU_TYPE = $(call qstrip,$(BR2_PACKAGE_XENOMAI_CPU_TYPE))
+# Set "generic" if not defined
+ifeq ($(XENOMAI_CPU_TYPE),)
+XENOMAI_CPU_TYPE = generic
+endif
+XENOMAI_EXTRA_CONFIGURE_OPTS += "--enable-$(BR2_ARCH)-mach=$(XENOMAI_CPU_TYPE)"
+endif #BR2_arm
+
+define XENOMAI_CONFIGURE_CMDS
+	(cd $(@D); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		CCFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
+		./configure \
+		$(XENOMAI_EXTRA_CONFIGURE_OPTS) \
+		--host=$(BR2_ARCH)-linux \
+		$(if $(shell grep "^CONFIG_SMP*=*y" \
+			$(LINUX_DIR)/.config ),--enable-smp,) \
+	)
+endef
+
+define XENOMAI_INSTALL_STAGING_CMDS
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
+endef
+
+define XENOMAI_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+	rm -rf $(TARGET_DIR)/usr/xenomai/share/doc
+	rm -rf $(TARGET_DIR)/usr/xenomai/include
+	# Make sure /etc/ld.so.conf exists
+	touch $(TARGET_DIR)/etc/ld.so.conf
+	# Add /usr/xenomai/lib only if it is not yet present
+	(grep "/usr/xenomai/lib" $(TARGET_DIR)/etc/ld.so.conf \
+		&>/dev/null) || (echo "/usr/xenomai/lib" >> $(TARGET_DIR)/etc/ld.so.conf)
+endef
+
+# If you use static /dev creation don't forget to update your
+#  device_table_dev.txt
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),y)
+XENOMAI_DEPENDENCIES += udev
+
+define XENOMAI_UDEV_HOOKS
+	if test -d $(TARGET_DIR)/etc/udev/rules.d ; then \
+		for f in $(@D)/ksrc/nucleus/udev/*.rules ; do \
+			cp $$f $(TARGET_DIR)/etc/udev/rules.d/ ; \
+		done ; \
+	fi;
+endef
+
+XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_UDEV_HOOKS
+endif # udev
+
+define XENOMAI_CLEAN_CMDS
+	-$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) clean
+endef
+
+define XENOMAI_UNINSTALL_TARGET_CMDS
+	if test -d $(TARGET_DIR)/etc/udev/rules.d ; then \
+		for f in $(@D)/ksrc/nucleus/udev/*.rules ; do \
+			rm -f $(TARGET_DIR)/etc/udev/rules.d/$$f ; \
+		done ; \
+	fi;
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
+endef
+
+define XENOMAI_UNINSTALL_STAGING_CMDS
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) uninstall
+endef
+
+$(eval $(call GENTARGETS,package,xenomai))
diff --git a/target/generic/device_table_dev.txt b/target/generic/device_table_dev.txt
--- a/target/generic/device_table_dev.txt
+++ b/target/generic/device_table_dev.txt
@@ -141,3 +141,8 @@
 
 # I2C device nodes
 /dev/i2c-	c	666	0	0	89	0	0	1	4
+
+# Xenomai
+#/dev/rtheap     c       666     0       0       10      254     0       0       -
+#/dev/rtscope    c       666     0       0       10      253     0       0       -
+#/dev/rtp        c       666     0       0       150     0       0       1       32
