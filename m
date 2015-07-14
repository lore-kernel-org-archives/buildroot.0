From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 10:30:30 +0200
Subject: [Buildroot] [git commit] boot/at91boostrap3: check for config file
	before calling kconfig-package
Message-ID: <20150714083402.EE563819C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e94388c57546aa8eff1f7c3cb29ddde052e0b4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If we check that the user provides a config file after we call to the
kconfig-package infra, the error message we get is the one for the
kconfig-package infra, not the custom error message we want to show to
the user.

So, only call kconfig-package after we do the check.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap3/at91bootstrap3.mk |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

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
