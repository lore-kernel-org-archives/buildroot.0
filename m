From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jul 2015 14:11:25 +0200
Subject: [Buildroot] [PATCH 3/7] boot/at91boostrap3: check for config file
	before calling kconfig-package
In-Reply-To: <cover.1436702899.git.yann.morin.1998@free.fr>
References: <cover.1436702899.git.yann.morin.1998@free.fr>
Message-ID: <0d7eebddc8cbebef8605a6b9a79f74ffea7221ad.1436702899.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If we check that the user provides a config file after we call to the
kconfig-package infra, the error message we get is the one for the
kconfig-package infra, not the custom error message we want to show to
the user.

So, only call kconfig-package after we do the check.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/at91bootstrap3/at91bootstrap3.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 1c68094..fa67ea6 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -49,10 +49,11 @@ endif
 AT91BOOTSTRAP3_KCONFIG_FILE = $(AT91BOOTSTRAP3_SOURCE_CONFIG)
 AT91BOOTSTRAP3_KCONFIG_EDITORS = menuconfig xconfig gconfig
 AT91BOOTSTRAP3_KCONFIG_OPTS = $(AT91BOOTSTRAP3_MAKE_OPTS)
-$(eval $(kconfig-package))
 
 # Checks to give errors that the user can understand
+# Must be before we call to kconfig-package
 ifeq ($(BR_BUILDING),y)
+
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
 ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG)),)
 $(error No at91bootstrap3 defconfig name specified, check your BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG setting)
@@ -74,4 +75,6 @@ $(error No custom at91bootstrap3 repository version specified. Check your BR2_TA
 endif
 endif
 
-endif
+endif # BR_BUILDING
+
+$(eval $(kconfig-package))
-- 
1.9.1
