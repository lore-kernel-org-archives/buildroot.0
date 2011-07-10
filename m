From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Jul 2011 22:11:09 +0200
Subject: [Buildroot] [git commit] uboot-mkimage: add target support
Message-ID: <20110710201144.E0D358A422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bd40fcec77c8977730013e84538221a5cc32f910
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                      |    1 +
 package/uboot-mkimage/Config.in        |    7 +++++++
 package/uboot-mkimage/uboot-mkimage.mk |   14 ++++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/uboot-mkimage/Config.in

diff --git a/package/Config.in b/package/Config.in
index 09aa76a..9a73998 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -206,6 +206,7 @@ source "package/sredird/Config.in"
 source "package/sshfs/Config.in"
 source "package/statserial/Config.in"
 source "package/sysstat/Config.in"
+source "package/uboot-mkimage/Config.in"
 source "package/udev/Config.in"
 source "package/usb_modeswitch/Config.in"
 source "package/usbmount/Config.in"
diff --git a/package/uboot-mkimage/Config.in b/package/uboot-mkimage/Config.in
new file mode 100644
index 0000000..e1dec53
--- /dev/null
+++ b/package/uboot-mkimage/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_UBOOT_MKIMAGE
+	bool "uboot-mkimage"
+	help
+	  The mkimage tool from Das U-Boot bootloader, which allows
+	  generation of U-Boot images in various formats.
+
+	  http://www.denx.de/wiki/U-Boot/WebHome
diff --git a/package/uboot-mkimage/uboot-mkimage.mk b/package/uboot-mkimage/uboot-mkimage.mk
index b8f2ee5..d8a8fbb 100644
--- a/package/uboot-mkimage/uboot-mkimage.mk
+++ b/package/uboot-mkimage/uboot-mkimage.mk
@@ -2,6 +2,19 @@ UBOOT_MKIMAGE_VERSION = 2011.03
 UBOOT_MKIMAGE_SOURCE  = u-boot-$(UBOOT_MKIMAGE_VERSION).tar.bz2
 UBOOT_MKIMAGE_SITE    = ftp://ftp.denx.de/pub/u-boot
 
+define UBOOT_MKIMAGE_BUILD_CMDS
+	$(MAKE) -C $(@D) 			\
+		HOSTCC="$(TARGET_CC)"		\
+		HOSTCFLAGS="$(TARGET_CFLAGS)"	\
+		HOSTLDFLAGS="$(TARGET_LDFLAGS)"	\
+		HOSTSTRIP=true			\
+		tools
+endef
+
+define UBOOT_MKIMAGE_INSTALL_CMDS
+	install -m 0755 -D $(@D)/tools/mkimage $(TARGET_DIR)/usr/bin
+endef
+
 define HOST_UBOOT_MKIMAGE_BUILD_CMDS
 	$(MAKE) -C $(@D) 			\
 		HOSTCC="$(HOSTCC)"		\
@@ -14,4 +27,5 @@ define HOST_UBOOT_MKIMAGE_INSTALL_CMDS
 	install -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/usr/bin
 endef
 
+$(eval $(call GENTARGETS,package,uboot-mkimage))
 $(eval $(call GENTARGETS,package,uboot-mkimage,host))
-- 
1.7.3.4
