From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Dec 2016 22:37:47 +0100
Subject: [Buildroot] [PATCH 3/3] [RFC] package/busybox: gneerate permissions
	for enabeld applets
In-Reply-To: <cover.1481665059.git.yann.morin.1998@free.fr>
References: <cover.1481665059.git.yann.morin.1998@free.fr>
Message-ID: <6d7c0fcf8647fa6e554e32e0370baec848b9ddef.1481665059.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DO NOT COMMIT THIS.

This is jsut an example how to use FOO_PERMISSIONS_FILE.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index f4a241d..9c1f2e8 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -60,9 +60,24 @@ BUSYBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG_FRAG
 BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
 BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
+BUSYBOX_PERMISSIONS_FILE = $(@D)/busybox.permissions
+define BUSYBOX_GEN_PERMISSIONS
+	for app in `grep -r -e "APPLET.*BB_SUID_REQUIRE\|APPLET.*BB_SUID_MAYBE" $(@D)/include/applets.h \
+		| sed -e 's/,.*//' -e 's/.*(//'`; \
+	do \
+		temp=`grep -w $${app} $(@D)/busybox.links`; \
+		if [ -n "$${temp}" ]; then \
+			echo "$${temp} f 4755 0  0 - - - - -"
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
