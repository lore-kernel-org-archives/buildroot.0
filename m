From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 18:21:53 +0100
Subject: [Buildroot] [git commit] jpeg: rework jpeg-turbo simd support
	handling
Message-ID: <20161211172617.432DB80741@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c5ff61a6aa1b81ee1ca4e54f16fe97a8f56aeac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preperation for adding more architectures to the jpeg-turbo simd
handling, introduce a hidden BR2_PACKAGE_JPEG_SIMDS_SUPPORT symbol and use
that to enable simd support and default to jpeg-turbo, instead of open
coding it in both places.

While we are at it, reword the help text to be more useful.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jpeg-turbo/jpeg-turbo.mk | 2 +-
 package/jpeg/Config.in           | 9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index c3de04a..e2b7e63 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -15,7 +15,7 @@ JPEG_TURBO_DEPENDENCIES = host-pkgconf
 
 JPEG_TURBO_CONF_OPTS = --with-jpeg8
 
-ifeq ($(BR2_X86_CPU_HAS_MMX)$(BR2_ARM_CPU_HAS_NEON),y)
+ifeq ($(BR2_PACKAGE_JPEG_SIMD_SUPPORT),y)
 JPEG_TURBO_CONF_OPTS += --with-simd
 # x86 simd support needs nasm
 JPEG_TURBO_DEPENDENCIES += $(if $(BR2_X86_CPU_HAS_MMX),host-nasm)
diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index f337aeb..170e58c 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -3,13 +3,18 @@ config BR2_PACKAGE_JPEG
 	help
 	  Select the desired JPEG library provider.
 
+# jpeg-turbo has simd support for some architectures
+config BR2_PACKAGE_JPEG_SIMD_SUPPORT
+       bool
+       default y if BR2_X86_CPU_HAS_MMX || BR2_ARM_CPU_HAS_NEON
+
 if BR2_PACKAGE_JPEG
 
 choice
 	prompt "jpeg variant"
-	default BR2_PACKAGE_JPEG_TURBO if (BR2_X86_CPU_HAS_MMX || BR2_ARM_CPU_HAS_NEON)
+	default BR2_PACKAGE_JPEG_TURBO if BR2_PACKAGE_JPEG_SIMD_SUPPORT
 	help
-	  Select the older stable version, or the newer developer version
+	  Select the normal libjpeg or libjpeg-turbo.
 
 config BR2_PACKAGE_LIBJPEG
 	bool "jpeg"
