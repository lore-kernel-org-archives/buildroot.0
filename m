From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 11:36:04 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] jpeg-turbo: bump to
 version 2.0.0
Message-ID: <20190221104037.4190F8106A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52c04dcf9cf5c65ff5f449cbcbf5d718246db6ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

- Move to cmake-infrastructure
- Update hash of license files: minor updates and clarifications

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5b354383ce7dc369edf212fec6776438b24a4b66)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg-turbo/jpeg-turbo.hash | 12 ++++++------
 package/jpeg-turbo/jpeg-turbo.mk   | 10 +++++-----
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index df1c053005..f0fc5396ef 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/libjpeg-turbo/files/1.5.3/
-sha1 87ebf4cab2bb27fcb8e7ccb18ec4eb680e1f2c2d  libjpeg-turbo-1.5.3.tar.gz
-md5 7c82f0f6a3130ec06b8a4d0b321cbca3  libjpeg-turbo-1.5.3.tar.gz
+# From https://sourceforge.net/projects/libjpeg-turbo/files/2.0.0/
+sha1 fe49aea935617748c21ecbe46c986d6c1b98f39b  libjpeg-turbo-2.0.0.tar.gz
+md5 b12a3fcf1d078db38410f27718a91b83  libjpeg-turbo-2.0.0.tar.gz
 # Locally computed
-sha256 b24890e2bb46e12e72a79f7e965f409f4e16466d00e1dd15d93d73ee6b592523  libjpeg-turbo-1.5.3.tar.gz
-sha256 5c08657eda60b7946a913ee22ac73603335a468a6aa95204506a1586a8d677ee  LICENSE.md
-sha256 53a3e3c299e08856964f4c5986e242c3695837b73c64625092f70c774e8af5d2  README.ijg
+sha256 778876105d0d316203c928fd2a0374c8c01f755d0a00b12a1c8934aeccff8868  libjpeg-turbo-2.0.0.tar.gz
+sha256 8412238c5ad95965cf3c3197791e9dea8b5fae505d133449e33ee2fa754fe61e  LICENSE.md
+sha256 82fece2bff2669c476495f0fe70096b154e8bc5b40916a64e99836d9a01c3110  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 2b5d876928..0fe2fcda72 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 1.5.3
+JPEG_TURBO_VERSION = 2.0.0
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
@@ -13,14 +13,14 @@ JPEG_TURBO_INSTALL_STAGING = YES
 JPEG_TURBO_PROVIDES = jpeg
 JPEG_TURBO_DEPENDENCIES = host-pkgconf
 
-JPEG_TURBO_CONF_OPTS = --with-jpeg8
+JPEG_TURBO_CONF_OPTS = -DWITH_JPEG8=ON
 
 ifeq ($(BR2_PACKAGE_JPEG_SIMD_SUPPORT),y)
-JPEG_TURBO_CONF_OPTS += --with-simd
+JPEG_TURBO_CONF_OPTS += -DWITH_SIMD=ON
 # x86 simd support needs nasm
 JPEG_TURBO_DEPENDENCIES += $(if $(BR2_X86_CPU_HAS_MMX),host-nasm)
 else
-JPEG_TURBO_CONF_OPTS += --without-simd
+JPEG_TURBO_CONF_OPTS += -DWITH_SIMD=OFF
 endif
 
 define JPEG_TURBO_REMOVE_USELESS_TOOLS
@@ -29,4 +29,4 @@ endef
 
 JPEG_TURBO_POST_INSTALL_TARGET_HOOKS += JPEG_TURBO_REMOVE_USELESS_TOOLS
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
