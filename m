From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:07:43 +0200
Subject: [Buildroot] [PATCH 09/31] mplayer: use BR2_ARM_CPU_ARM* options
In-Reply-To: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413749285-1108-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/Config.in  | 3 +--
 package/mplayer/mplayer.mk | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 8b5d05e..dbd6cdb 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -4,8 +4,7 @@ config BR2_PACKAGE_MPLAYER
 	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
 			|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
 	# Broken support for <ARMv5
-	depends on !(BR2_arm920t || BR2_arm920t || BR2_arm922t || BR2_fa526 \
-		|| BR2_strongarm)
+	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV4T
 	depends on BR2_LARGEFILE
 	help
 	  MPlayer is a movie player which runs on many systems and supports
diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 0c216d7..98013c0 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -105,11 +105,11 @@ MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBX11),xlib_libX11)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBXV),xlib_libXv)
 
 # ARM optimizations
-ifeq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),armv5te)
+ifeq ($(BR2_ARM_CPU_ARMV5TE),y)
 MPLAYER_CONF_OPTS += --enable-armv5te
 endif
 
-ifeq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),armv6j)
+ifeq ($(BR2_ARM_CPU_ARMV6J),y)
 MPLAYER_CONF_OPTS += --enable-armv6
 endif
 
-- 
2.0.0
