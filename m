From: Mauro Condarelli <mc5686@mclink.it>
Date: Sun,  8 Mar 2015 22:37:08 +0100
Subject: [Buildroot] [PATCH 2/3] Transformation of package 'at91bootstrap3'
	to KConfig style.
In-Reply-To: <1425850629-14725-1-git-send-email-mc5686@mclink.it>
References: <1425850629-14725-1-git-send-email-mc5686@mclink.it>
Message-ID: <1425850629-14725-2-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 boot/at91bootstrap3/at91bootstrap3.mk |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 098e7bf..37e1bdd 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -46,7 +46,14 @@ define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
 	cp $(@D)/binaries/*.bin $(BINARIES_DIR)
 endef
 
-$(eval $(generic-package))
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
+AT91BOOTSTRAP3_KCONFIG_FILE = $(call qstrip,$(AT91BOOTSTRAP3_DEFCONFIG))
+else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
+AT91BOOTSTRAP3_KCONFIG_FILE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE))
+endif
+AT91BOOTSTRAP3_KCONFIG_EDITORS = menuconfig xconfig gconfig
+AT91BOOTSTRAP3_KCONFIG_OPTS = $(AT91BOOTSTRAP3_MAKE_OPTS)
+$(eval $(kconfig-package))
 
 # Checks to give errors that the user can understand
 ifeq ($(filter source,$(MAKECMDGOALS)),)
-- 
1.7.10.4
