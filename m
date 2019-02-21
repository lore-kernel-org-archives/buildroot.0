From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 11:36:40 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] jpeg-turbo: fix static
 build
Message-ID: <20190221104037.48E6C8106A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cf24dcdc8abc33a2cb7f409a7955fcf26cfc54d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Set ENABLE_STATIC and ENABLE_SHARED depending on
BR2_PACKAGE_STATIC_LIBS, BR2_SHARED_SHARED_STATIC_LIBS and
BR2_SHARED_SHARED_LIBS

Fixes:
 - http://autobuild.buildroot.net/results/7e1500405a0f102dd6a48ef9337ffe4d7de73df3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ce359b1b4abb0cd9b2dace9a9c65204e5c36ea9a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg-turbo/jpeg-turbo.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 0fe2fcda72..1807cc294e 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -15,6 +15,14 @@ JPEG_TURBO_DEPENDENCIES = host-pkgconf
 
 JPEG_TURBO_CONF_OPTS = -DWITH_JPEG8=ON
 
+ifeq ($(BR2_STATIC_LIBS),y)
+JPEG_TURBO_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+JPEG_TURBO_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+JPEG_TURBO_CONF_OPTS += -DENABLE_STATIC=OFF -DENABLE_SHARED=ON
+endif
+
 ifeq ($(BR2_PACKAGE_JPEG_SIMD_SUPPORT),y)
 JPEG_TURBO_CONF_OPTS += -DWITH_SIMD=ON
 # x86 simd support needs nasm
