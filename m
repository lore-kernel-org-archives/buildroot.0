From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Feb 2021 19:40:48 +0100
Subject: [Buildroot] [PATCH-NEXT 3/4] package/linux-firmware: also install
 into images for early loading support
In-Reply-To: <20210212184049.13202-1-peter@korsgaard.com>
References: <20210212184049.13202-1-peter@korsgaard.com>
Message-ID: <20210212184049.13202-4-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some drivers request their firmware very early when built into the kernel,
even before the initramfs is mounted - So the only way to provide firmware
for those drivers is to include them directly in the kernel with the
CONFIG_EXTRA_FIRMWARE option.

An example of this is the uC firmware for modern Intel GPUs.

Conceptually you can point CONFIG_EXTRA_FIRMWARE to
${TARGET_DIR}/lib/firmware, but then you cannot remove the firmware from the
initramfs and pay the size twice (inside the kernel + in initramfs), so
instead also install linux-firmware to the image dir, similar to how we do
it for intel-microcode.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index b6549ad371..a08d9ccfda 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -7,6 +7,7 @@
 LINUX_FIRMWARE_VERSION = 20201022
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
+LINUX_FIRMWARE_INSTALL_IMAGES = YES
 
 LINUX_FIRMWARE_CPE_ID_VENDOR = kernel
 
@@ -704,4 +705,11 @@ define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
 	$(call LINUX_FIRMWARE_CREATE_SYMLINKS,$(TARGET_DIR)/lib/firmware)
 endef
 
+define LINUX_FIRMWARE_INSTALL_IMAGES_CMDS
+	mkdir -p $(BINARIES_DIR)
+	$(call LINUX_FIRMWARE_INSTALL_FILES,$(BINARIES_DIR))
+	$(call LINUX_FIRMWARE_INSTALL_DIRS,$(BINARIES_DIR))
+	$(call LINUX_FIRMWARE_CREATE_SYMLINKS,$(BINARIES_DIR))
+endef
+
 $(eval $(generic-package))
-- 
2.20.1
