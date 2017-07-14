From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Jul 2017 00:09:36 +0200
Subject: [Buildroot] [PATCH] package/rpi-firmware: install missing library
Message-ID: <20170714220936.25212-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The vcdbg utility is linked to a few libraries, which so far were all
provided by the rpi-userland package.

But a not-so-recent bump of rpi-firmware pulled in a vcdbg that is
linked to an additional library, which is not privided by rpi-userland,
so we must install it.

Reported-by: cluelessperson on #buildroot
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/rpi-firmware/rpi-firmware.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 134fcebb57..2c5832c963 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -31,6 +31,8 @@ ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
 define RPI_FIRMWARE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0700 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/bin/vcdbg \
 		$(TARGET_DIR)/usr/sbin/vcdbg
+	$(INSTALL) -D -m 0644 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libelftoolchain.so \
+		$(TARGET_DIR)/usr/lib/libelftoolchain.so
 endef
 endif # INSTALL_VCDBG
 
-- 
2.11.0
