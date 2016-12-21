From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 21 Dec 2016 20:02:15 +0100
Subject: [Buildroot] [PATCH 3/3] [RFC] package/busybox: gneerate permissions
	for enabeld applets
In-Reply-To: <cover.1482346921.git.yann.morin.1998@free.fr>
References: <cover.1482346921.git.yann.morin.1998@free.fr>
Message-ID: <6fa811da3de50b45790aaeafbf81f2225761abf4.1482346921.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DO NOT COMMIT THIS.

This is just an example how to use FOO_PERMISSIONS_FILE. It's even
probably not 100% correct.

You need to enable BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES in Buildroot,
as well as CONFIG_BUILD_LIBBUSYBOX and CONFIG_FEATURE_INDIVIDUAL in
busybox.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/busybox/Config.in  |  3 +++
 package/busybox/busybox.mk | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 7ef3f0e..1e4c252 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -54,6 +54,9 @@ config BR2_PACKAGE_BUSYBOX_SELINUX
 	  crond, then individual binaries have to be enabled for the
 	  SELinux type transitions to occur properly.
 
+config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
+	bool "Install individual binaries"
+
 config BR2_PACKAGE_BUSYBOX_WATCHDOG
 	bool "Install the watchdog daemon startup script"
 	help
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 40fb4d9..c2a8ca0 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -60,9 +60,24 @@ BUSYBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG_FRAG
 BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
 BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
+BUSYBOX_PERMISSIONS_FILE = $(BUSYBOX_DIR)/busybox.permissions
+define BUSYBOX_GEN_PERMISSIONS
+	for app in `grep -r -e "APPLET.*BB_SUID_REQUIRE\|APPLET.*BB_SUID_MAYBE" $(@D)/include/applets.h \
+		| sed -e 's/,.*//' -e 's/.*(//'`; \
+	do \
+		temp=`grep -w $${app} $(@D)/busybox.links`; \
+		if [ -n "$${temp}" ]; then \
+			echo "$${temp} f 4755 0  0 - - - - -"; \
+		fi; \
+	done >$(BUSYBOX_PERMISSIONS_FILE)
+endef
+BUSYBOX_POST_INSTALL_TARGET_HOOKS += BUSYBOX_GEN_PERMISSIONS
+else
 define BUSYBOX_PERMISSIONS
 	/bin/busybox                     f 4755 0  0 - - - - -
 endef
+endif
 
 # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
-- 
2.7.4
