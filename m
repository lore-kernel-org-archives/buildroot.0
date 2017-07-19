From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jul 2017 00:02:29 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] xvisor: fix build on
	AArch64
Message-ID: <20170720055507.05E7481EB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f887589e3ecc92b73a991f5dd52e7bafab302e2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Xvisor was failing to build on AArch64 with:

package/xvisor/xvisor.mk:60: *** No Xvisor defconfig name specified, check your BR2_PACKAGE_XVISOR_DEFCONFIG setting.  Stop.

The first problem is that the Config.in file had a typo: it was using
BR2_AARCH64 instead of BR2_aarch64, and therefore the
BR2_PACKAGE_XVISOR_DEFCONFIG variable had no value.

Once this is fixed, another problem occurs: the ARCH variable needs to
be specified as "arm" for XVisor, for both ARM and AArch64. Therefore,
a XVISOR_ARCH variable is introduced, which is calculated according to
the Buildroot configuration options. Only x86-64, arm and aarch64 are
supported by Xvisor currently, so it remains simple.

Fixes:

  http://autobuild.buildroot.net/results/1719a63ff257f13634a06a14327abfb327984101/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 117fd5dfbc756c4f2b4aef97fc2b568528c66df7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xvisor/Config.in |  2 +-
 package/xvisor/xvisor.mk | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/xvisor/Config.in b/package/xvisor/Config.in
index 996d37a..44bd461 100644
--- a/package/xvisor/Config.in
+++ b/package/xvisor/Config.in
@@ -36,7 +36,7 @@ config BR2_PACKAGE_XVISOR_DEFCONFIG
 	default "generic-v5" if BR2_ARM_CPU_ARMV5
 	default "generic-v6" if BR2_ARM_CPU_ARMV6
 	default "generic-v7" if BR2_ARM_CPU_ARMV7A
-	default "generic-v8" if BR2_AARCH64
+	default "generic-v8" if BR2_aarch64
 	default "x86_64_generic" if BR2_x86_64
 	help
 	  Name of the Xvisor defconfig file to use, without the
diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index a9a5dbf..17edc2c 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -26,8 +26,16 @@ XVISOR_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE))
 endif
 XVISOR_KCONFIG_EDITORS = menuconfig
 
+ifeq ($(BR2_x86_64),y)
+XVISOR_ARCH = x86
+else ifeq ($(BR2_arm)$(BR2_aarch64),y)
+XVISOR_ARCH = arm
+else
+$(error "Architecture not supported by XVisor")
+endif
+
 XVISOR_MAKE_ENV = \
-	ARCH=$(if $(BR2_x86_64),x86,$(BR2_ARCH)) \
+	ARCH=$(XVISOR_ARCH) \
 	CROSS_COMPILE=$(TARGET_CROSS)
 
 XVISOR_MAKE_OPTS = $(if $(VERBOSE),VERBOSE=1)
