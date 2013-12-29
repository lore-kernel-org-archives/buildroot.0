From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 18:33:46 +0100
Subject: [Buildroot] [PATCHv2 2/4] fs/iso9660: add Grub splashscreen support
In-Reply-To: <1388338428-19833-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388338428-19833-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1388338428-19833-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When Grub is built with splashscreen support, copy the splashscreen
image to the ISO9660 filesystem. Otherwise, disable the splashscreen
in the grub menu.lst file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/iso9660.mk |  5 +++++
 fs/iso9660/menu.lst   | 11 ++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 56e87bb..0260d41 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -16,6 +16,11 @@ $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
 	mkdir -p $(ISO9660_TARGET_DIR)/boot/grub
 	cp $(GRUB_DIR)/stage2/stage2_eltorito $(ISO9660_TARGET_DIR)/boot/grub/
 	cp $(ISO9660_BOOT_MENU) $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
+ifeq ($(BR2_TARGET_GRUB_SPLASH),)
+	$(SED) '/splashimage/d' $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
+else
+	cp boot/grub/splash.xpm.gz $(ISO9660_TARGET_DIR)/
+endif
 	cp $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 	$(SED) '/initrd/d'  $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
diff --git a/fs/iso9660/menu.lst b/fs/iso9660/menu.lst
index ed7836a..c0bbff6 100644
--- a/fs/iso9660/menu.lst
+++ b/fs/iso9660/menu.lst
@@ -1,6 +1,15 @@
 default		0
 timeout		10
-color cyan/blue white/blue
+
+# Used when no splashimage is used
+color 		cyan/blue white/blue
+
+# Gets enabled/disabled depending on Grub support for splashimage
+splashimage	/splash.xpm.gz
+
+# Used when a splashimage is enabled
+foreground 	000000
+background 	cccccc
 
 title		Buildroot ISO9660 image
 kernel		/kernel
-- 
1.8.3.2
