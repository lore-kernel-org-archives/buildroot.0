From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 10:38:40 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] uboot-tools: fix dtc
 invocation
Message-ID: <20171227094030.200B480FB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88e28df3af8e5edd3f974d678a4ddb1e76713871
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

Since uboot 2017.09 path to dtc will be configured via Kconfig. As BR
skips this step for uboot-tools building one has to provide
CONFIG_MKIMAGE_DTC_PATH=dtc on the build command line. Otherwise
mkimage will not be able to create FIT images, i.e.:

mkimage -f kernel-fit.its kernel-fit.itb

will fail with very weird errors.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 21ab88c4171ff9efa8a364bd8015c7d46628f9ec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uboot-tools/uboot-tools.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index c936575..97b8501 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -22,7 +22,7 @@ UBOOT_TOOLS_MAKE_OPTS = CROSS_COMPILE="$(TARGET_CROSS)" \
 	STRIP=$(TARGET_STRIP)
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),y)
-UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y
+UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y CONFIG_MKIMAGE_DTC_PATH=dtc
 UBOOT_TOOLS_DEPENDENCIES += dtc
 endif
 
@@ -85,7 +85,7 @@ HOST_UBOOT_TOOLS_MAKE_OPTS = HOSTCC="$(HOSTCC)" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),y)
-HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y
+HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y CONFIG_MKIMAGE_DTC_PATH=dtc
 HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc
 endif
 
