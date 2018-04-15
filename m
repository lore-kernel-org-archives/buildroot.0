From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 22:22:45 +0200
Subject: [Buildroot] [PATCH] linux-firmware: support paths with subdirs in
 LINUX_FIRMWARE_DIRS
Message-ID: <20180415202245.8720-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following commit cdb7876f63a253254b86637aaac8b255a426b60a
("linux-firmware: add Qualcomm video accelerator and GPU firmware
options"), LINUX_FIRMWARE_DIRS can now contain entries with subdirs,
such as "qcom/venus-1.8". Such entries are currently not supported by
the logic in LINUX_FIRMWARE_INSTALL_DIRS.

Indeed the current logic consists in:

 - Removing the destination directory
 - Copying to the destination directory

Unfortunately, the last step fails if a component of the path leading
to the destination directory does not exist. To overcome this, we
simply add the appropriate mkdir before the copy.

Fixes:

  http://autobuild.buildroot.net/results/54cbca90742faf486e59d95b95a0b0494e47b385/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index efe5cdd7dd..11231613e9 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -499,6 +499,7 @@ ifneq ($(LINUX_FIRMWARE_DIRS),)
 define LINUX_FIRMWARE_INSTALL_DIRS
 	$(foreach d,$(LINUX_FIRMWARE_DIRS), \
 		rm -rf $(TARGET_DIR)/lib/firmware/$(d); \
+		mkdir -p $(dir $(TARGET_DIR)/lib/firmware/$(d)); \
 		cp -a $(@D)/$(d) $(TARGET_DIR)/lib/firmware/$(d)$(sep))
 endef
 endif
-- 
2.14.3
