From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jan 2020 20:39:18 +0100
Subject: [Buildroot] [PATCH 1/2] package/glmark2: drm-glesv2 needs libdrm
Message-ID: <20200104193919.91589-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/58a/58a498fac83cbb55b252ab54cd8db04570bb5ec9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/glmark2/Config.in  | 3 +++
 package/glmark2/glmark2.mk | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
index 153eb3b0af..09cd51f2cf 100644
--- a/package/glmark2/Config.in
+++ b/package/glmark2/Config.in
@@ -7,7 +7,10 @@ config BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_HAS_UDEV
+	# libpthread-stubs -> libdrm
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
+	select BR2_PACKAGE_LIBDRM
 
 config BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GL
 	bool
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index 3d31003d06..7c75711829 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -11,7 +11,7 @@ GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
 GLMARK2_DEPENDENCIES = host-pkgconf jpeg libegl libpng
 
 ifeq ($(BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2),y)
-GLMARK2_DEPENDENCIES += libgles udev
+GLMARK2_DEPENDENCIES += libdrm libgles udev
 GLMARK2_FLAVORS += drm-glesv2
 endif
 
-- 
2.20.1
