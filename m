From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 18:18:53 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] package/rpi-firmware:
	install missing library
Message-ID: <20170719204800.5F2827FF4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b586eb9ad9261a188679c9d4cc98a088170ba5db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

The vcdbg utility is linked to a few libraries, which so far were all
provided by the rpi-userland package.

But a not-so-recent bump of rpi-firmware pulled in a vcdbg that is
linked to an additional library, which is not privided by rpi-userland,
so we must install it.

Reported-by: cluelessperson on #buildroot
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit a3da7980eb4744248b0f83e07cfdb42ae82ccf6f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 134fceb..2c5832c 100644
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
 
