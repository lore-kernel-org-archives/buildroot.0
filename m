From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 May 2011 22:23:08 +0200
Subject: [Buildroot] [PATCH 17/26] uboot-mkimage: new package
In-Reply-To: <cover.1306782275.git.thomas.petazzoni@free-electrons.com>
References: <cover.1306782275.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c16e5e602ea2e6ea2791c7ae0f8f553e34e1b140.1306782275.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mkimage for the host is now built by a package, so that
boot/u-boot/u-boot.mk is no longer responsible for doing this. It
makes things a lot easier to handle, as linux/linux.mk now simply
depends on host-uboot-mkimage.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk                                     |    2 +-
 .../uboot-mkimage-2011.03-drop-configh.patch       |    0
 package/uboot-mkimage/uboot-mkimage.mk             |   16 ++++++++++++++++
 3 files changed, 17 insertions(+), 1 deletions(-)
 rename boot/u-boot/u-boot-2011.03-drop-configh.patch => package/uboot-mkimage/uboot-mkimage-2011.03-drop-configh.patch (100%)
 create mode 100644 package/uboot-mkimage/uboot-mkimage.mk

diff --git a/linux/linux.mk b/linux/linux.mk
index d142ab2..a59a237 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -40,7 +40,7 @@ LINUX26_IMAGE_NAME=vmImage
 else
 LINUX26_IMAGE_NAME=uImage
 endif
-LINUX26_DEPENDENCIES+=$(MKIMAGE)
+LINUX26_DEPENDENCIES+=host-uboot-mkimage
 else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
 LINUX26_IMAGE_NAME=bzImage
 else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
diff --git a/boot/u-boot/u-boot-2011.03-drop-configh.patch b/package/uboot-mkimage/uboot-mkimage-2011.03-drop-configh.patch
similarity index 100%
rename from boot/u-boot/u-boot-2011.03-drop-configh.patch
rename to package/uboot-mkimage/uboot-mkimage-2011.03-drop-configh.patch
diff --git a/package/uboot-mkimage/uboot-mkimage.mk b/package/uboot-mkimage/uboot-mkimage.mk
new file mode 100644
index 0000000..055348c
--- /dev/null
+++ b/package/uboot-mkimage/uboot-mkimage.mk
@@ -0,0 +1,16 @@
+UBOOT_MKIMAGE_VERSION = 2011.03
+UBOOT_MKIMAGE_SOURCE  = u-boot-$(UBOOT_MKIMAGE_VERSION).tar.bz2
+UBOOT_MKIMAGE_SITE    = ftp://ftp.denx.de/pub/u-boot
+
+define HOST_UBOOT_MKIMAGE_BUILD_CMDS
+	$(MAKE) -C $(@D) 			\
+		CROSS_COMPILE="$(TARGET_CROSS)" \
+		ARCH=$(U_BOOT_ARCH) 		\
+		tools
+endef
+
+define HOST_UBOOT_MKIMAGE_INSTALL_CMDS
+	install -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/usr/bin
+endef
+
+$(eval $(call GENTARGETS,package,uboot-mkimage,host))
-- 
1.7.1
