From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 13 Sep 2011 19:19:32 +0200
Subject: [Buildroot] [PATCH 1/2] omap-u-boot-utils: add new package
Message-ID: <1315934373-16561-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 boot/Config.in                                 |    1 +
 boot/omap-u-boot-utils/Config.in               |    7 ++++++
 package/omap-u-boot-utils/omap-u-boot-utils.mk |   25 ++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 boot/omap-u-boot-utils/Config.in
 create mode 100644 package/omap-u-boot-utils/omap-u-boot-utils.mk

diff --git a/boot/Config.in b/boot/Config.in
index 2a97695..7e5a52d 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -7,6 +7,7 @@ source "boot/uboot/Config.in"
 source "boot/at91bootstrap/Config.in"
 source "boot/at91dataflashboot/Config.in"
 source "boot/xloader/Config.in"
+source "boot/omap-u-boot-utils/Config.in"
 
 endmenu
 
diff --git a/boot/omap-u-boot-utils/Config.in b/boot/omap-u-boot-utils/Config.in
new file mode 100644
index 0000000..3e4567c
--- /dev/null
+++ b/boot/omap-u-boot-utils/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS
+	bool "omap-u-boot-utils"
+	help
+	  U-Boot Utilities for Texas Instrument's OMAP platforms.
+	  Say Y if you want these utilities on the development host.
+
+	  https://github.com/nmenon/omap-u-boot-utils
diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.mk b/package/omap-u-boot-utils/omap-u-boot-utils.mk
new file mode 100644
index 0000000..dc5b22c
--- /dev/null
+++ b/package/omap-u-boot-utils/omap-u-boot-utils.mk
@@ -0,0 +1,25 @@
+#############################################################
+#
+# omap-u-boot-utils
+#
+#############################################################
+
+OMAP_U_BOOT_UTILS_VERSION = d086cb5c0
+OMAP_U_BOOT_UTILS_SOURCE = omap-u-boot-utils-$(OMAP_U_BOOT_UTILS_VERSION).tar.gz
+OMAP_U_BOOT_UTILS_SITE = git://github.com/nmenon/omap-u-boot-utils.git
+OMAP_U_BOOT_UTILS_SITE_METHOD = git
+
+OMAP_U_BOOT_UTILS_TARGETS = gpsign pserial tagger ucmd ukermit
+
+define HOST_OMAP_U_BOOT_UTILS_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define HOST_OMAP_U_BOOT_UTILS_INSTALL_CMDS
+	for f in ${OMAP_U_BOOT_UTILS_TARGETS} ; do \
+		[ -f ${HOST_DIR}/usr/bin/$$f ] || \
+		  install -m 755 -D $(@D)/$$f ${HOST_DIR}/usr/bin/$$f ; \
+	done
+endef
+
+$(eval $(call GENTARGETS,package,omap-u-boot-utils,host))
-- 
1.7.4.1
