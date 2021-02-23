From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2021 13:49:21 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: also install into
 images for early loading support
Message-ID: <20210308072135.42F568893D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af49734349ca06f88ed4c17e456fc385ebee2012
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some drivers request their firmware very early when built into the kernel,
even before the initramfs is mounted - So the only way to provide firmware
for those drivers is to include them directly in the kernel with the
CONFIG_EXTRA_FIRMWARE option.

An example of this is the uC firmware for modern Intel GPUs.

Conceptually you can point CONFIG_EXTRA_FIRMWARE to
${TARGET_DIR}/lib/firmware, but then you cannot remove the firmware from the
initramfs and pay the size cost twice (inside the kernel + in initramfs), so
instead also install linux-firmware to the images dir, similar to how we do
it for intel-microcode.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 8defedd309..5e92b0446e 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -7,6 +7,7 @@
 LINUX_FIRMWARE_VERSION = 20201022
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
+LINUX_FIRMWARE_INSTALL_IMAGES = YES
 
 LINUX_FIRMWARE_CPE_ID_VENDOR = kernel
 
@@ -691,4 +692,8 @@ define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
 	$(call LINUX_FIRMWARE_INSTALL_FW, $(TARGET_DIR)/lib/firmware)
 endef
 
+define LINUX_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(call LINUX_FIRMWARE_INSTALL_FW, $(BINARIES_DIR))
+endef
+
 $(eval $(generic-package))
