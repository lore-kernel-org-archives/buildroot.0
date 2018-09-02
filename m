From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Sep 2018 22:53:05 +0200
Subject: [Buildroot] [git commit] jpeg-turbo: fix static build
Message-ID: <20180907111608.102E97FEB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce359b1b4abb0cd9b2dace9a9c65204e5c36ea9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set ENABLE_STATIC and ENABLE_SHARED depending on
BR2_PACKAGE_STATIC_LIBS, BR2_SHARED_SHARED_STATIC_LIBS and
BR2_SHARED_SHARED_LIBS

Fixes:
 - http://autobuild.buildroot.net/results/7e1500405a0f102dd6a48ef9337ffe4d7de73df3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
