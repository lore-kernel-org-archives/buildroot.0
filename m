From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed,  5 Sep 2018 13:22:36 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: Set MAKE_ENV for kconfig build
 system
Message-ID: <20180905122236.26364-1-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-Boot fails to build in a GitLab CI context because the kconfig-package
build stage is unable to find bison or flex even though they are
installed in HOST_DIR.

To fix this, set UBOOT_MAKE_ENV so that UBOOT_KCONFIG_MAKE uses the
correct PATH.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
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
-- 
2.11.0
