From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 16:43:10 +0100
Subject: [Buildroot] [git commit] rpi-firmware: unbreak _INSTALL_VCDBG logic
Message-ID: <20160315154657.640A8801E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41276ae12aefb8a3e69df365aa2240d29ddca776
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d16b32a401 (package/rpi-firmware: add option to install vcdbg) added
a sub option to install the vcdbg tool, but the commit unfortunately
contained two errors:

- The package sets _INSTALL_TARGET = NO, so the _TARGET_CMDS are never used
- The install command used -d (handle arguments as directories) instead of
  -D (create needed directories)

Fix these issues.

Cc: yann.morin.1998 at free.fr
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 2cc7969..291da3a 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -8,7 +8,6 @@ RPI_FIRMWARE_VERSION = 8b4e5482b52e6fb438dddc0d88ba0ba8d44af54b
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-RPI_FIRMWARE_INSTALL_TARGET = NO
 RPI_FIRMWARE_INSTALL_IMAGES = YES
 
 RPI_FIRMWARE_DEPENDENCIES += host-rpi-firmware
@@ -32,7 +31,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
 define RPI_FIRMWARE_INSTALL_TARGET_CMDS
-	$(INSTALL) -d -m 0700 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/bin/vcdbg \
+	$(INSTALL) -D -m 0700 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/bin/vcdbg \
 		$(TARGET_DIR)/usr/sbin/vcdbg
 endef
 endif # INSTALL_VCDBG
