From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Aug 2015 02:13:07 +0200
Subject: [Buildroot] [PATCH] package/wf111: remove package
Message-ID: <1440202387-7291-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package requires registration before it can be downloaded, which
means downloads can not be automated. As far as I could see, that's the
only package we have in that case.

It installs a kernel module, but it is not possible to check whether it
also builds it or just installs a blob. It seems however that there are
source files in that module:
    http://lists.busybox.net/pipermail/buildroot/2015-February/119752.html

But since we can't download without registration, it's impossible to
check if using the kernel-module infra would work.

We also have no license for it.

This package does not belong to Buildroot. Remove it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Antoine T?nart <antoine.tenart@free-electrons.com>

---
I'd be happy to withdraw that patch if the archive was publicly availble
and could be downloaded without manual intervention (i.e. bypass
registration with a direct link?).
---
 Config.in.legacy        |  3 +++
 package/Config.in       |  1 -
 package/wf111/Config.in | 36 ------------------------------------
 package/wf111/wf111.mk  | 34 ----------------------------------
 4 files changed, 3 insertions(+), 71 deletions(-)
 delete mode 100644 package/wf111/Config.in
 delete mode 100644 package/wf111/wf111.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 3b77b34..316ffd0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,9 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_WF111
+	bool "wf111 package removed"
+
 config BR2_PACKAGE_KODI_PVR_ADDONS
 	bool "Kodi PVR addon was split"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index c32c989..a37ab21 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -436,7 +436,6 @@ endif
 	source "package/usbmount/Config.in"
 	source "package/usbutils/Config.in"
 	source "package/w_scan/Config.in"
-	source "package/wf111/Config.in"
 	source "package/wipe/Config.in"
 	source "package/xorriso/Config.in"
 endmenu
diff --git a/package/wf111/Config.in b/package/wf111/Config.in
deleted file mode 100644
index d2ba440..0000000
--- a/package/wf111/Config.in
+++ /dev/null
@@ -1,36 +0,0 @@
-config BR2_PACKAGE_WF111
-	bool "wf111"
-	depends on BR2_LINUX_KERNEL
-	depends on BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV7A || BR2_i386
-	# Binary tools are distributed alongside the driver, and are
-	# dynamically linked against the glibc.
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	help
-	  BlueGiga WF111 WiFi driver and utilities.
-
-	  Warning: CONFIG_WIRELESS_EXT and CONFIG_WEXT_PRIV must be
-	  selected in the Linux kernel configuration. These are blind
-	  options (i.e. not selectable directly) so they cannot be
-	  enabled by a change in linux/linux.mk. There are two choices
-	  to enable these options:
-	  - By making them non blind, with a "WF111 support" configuration
-	    entry that selects them, for example.
-	  - By enabling another random WiFi driver that select them.
-
-	  http://www.bluegiga.com/en-US/products/wifi-modules/wf111-wifi-module/
-
-if BR2_PACKAGE_WF111
-
-config BR2_PACKAGE_WF111_TARBALL_PATH
-	string "Local tarball location"
-	help
-	  The WF111 tarball can be retrieved on the BlueGiga website
-	  after registration. This option specifies the path where the
-	  tarball is locally saved.
-
-endif
-
-comment "wf111 needs an (e)glibc toolchain"
-	depends on BR2_LINUX_KERNEL
-	depends on BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV7A || BR2_i386
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/wf111/wf111.mk b/package/wf111/wf111.mk
deleted file mode 100644
index 479d665..0000000
--- a/package/wf111/wf111.mk
+++ /dev/null
@@ -1,34 +0,0 @@
-################################################################################
-#
-# wf111
-#
-################################################################################
-
-WF111_VERSION = 5.2.2
-WF111_SITE_METHOD = file
-WF111_SITE = $(call qstrip,$(BR2_PACKAGE_WF111_TARBALL_PATH))
-WF111_DEPENDENCIES = linux
-
-ifeq ($(BR2_PACKAGE_WF111)$(call qstrip,$(BR2_PACKAGE_WF111_TARBALL_PATH)),y)
-$(error No tarball location specified, check BR2_PACKAGE_WF111_TARBALL_PATH)
-endif
-
-ifeq ($(BR2_ARM_CPU_ARMV7A),y)
-WF111_SOURCE = wf111-linux-driver_5.2.2-r1_armv7-a.tar.gz
-else ifeq ($(BR2_ARM_CPU_ARMV5),y)
-WF111_SOURCE = wf111-linux-driver_5.2.2-r1_armv5t.tar.gz
-else ifeq ($(BR2_i386),y)
-WF111_SOURCE = wf111-linux-driver_5.2.2-r1_x86.tar.gz
-endif
-
-define WF111_BUILD_CMDS
-	$(MAKE) -C $(@D) PWD=$(@D) \
-		$(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) \
-		install_static
-endef
-
-define WF111_INSTALL_TARGET_CMDS
-	cp -dpfr $(@D)/output/* $(TARGET_DIR)
-endef
-
-$(eval $(generic-package))
-- 
1.9.1
