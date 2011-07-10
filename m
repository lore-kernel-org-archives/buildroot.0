From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Jul 2011 22:11:09 +0200
Subject: [Buildroot] [git commit] uboot-mkimage: new package
Message-ID: <20110710201144.6B98F8A422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5e0d46138fbba1197f4f9cef4b96c7b87f42a5a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mkimage for the host is now built by a package, so that
boot/u-boot/u-boot.mk is no longer responsible for doing this. It
makes things a lot easier to handle, as linux/linux.mk now simply
depends on host-uboot-mkimage.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../uboot-mkimage-2011.03-drop-configh.patch       |    0
 package/uboot-mkimage/uboot-mkimage.mk             |   16 ++++++++++++++++
 2 files changed, 16 insertions(+), 0 deletions(-)
 rename boot/u-boot/u-boot-2011.03-drop-configh.patch => package/uboot-mkimage/uboot-mkimage-2011.03-drop-configh.patch (100%)
 create mode 100644 package/uboot-mkimage/uboot-mkimage.mk

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
1.7.3.4
