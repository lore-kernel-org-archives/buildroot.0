From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 22:25:04 +0200
Subject: [Buildroot] [git commit] boot/uboot: Set MAKE_ENV for kconfig build
 system
Message-ID: <20180905202921.AE42A8287F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e749a6f30a7b102da65f6101f89fa1a2228833e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

U-Boot fails to build in a GitLab CI context because the kconfig-package
build stage is unable to find bison or flex even though they are
installed in HOST_DIR.

To fix this, set UBOOT_MAKE_ENV so that UBOOT_KCONFIG_MAKE uses the
correct PATH.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/uboot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index bddafe234d..a19cb72458 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -449,6 +449,7 @@ endif # BR2_TARGET_UBOOT && BR_BUILDING
 ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
 $(eval $(generic-package))
 else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
+UBOOT_MAKE_ENV = $(TARGET_MAKE_ENV)
 UBOOT_KCONFIG_DEPENDENCIES = \
 	$(BR2_BISON_HOST_DEPENDENCY) \
 	$(BR2_FLEX_HOST_DEPENDENCY)
