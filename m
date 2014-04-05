From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Apr 2014 17:21:40 +0200
Subject: [Buildroot] [PATCH 03/21] package/libopenmax: rename the _HAS and
	_PROVIDES variables
In-Reply-To: <cover.1396711074.git.yann.morin.1998@free.fr>
References: <cover.1396711074.git.yann.morin.1998@free.fr>
Message-ID: <132f40aa14041e49dbc99da8467c6eb788c7fce2.1396711074.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The basic rule for a package is to have its options named
after the package name. There is no reason this should not
also be the case for virtual packages.

Besides, this will allow us to switch libopenmax to use the
soon-to-be-introduced virtual-package infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Mike Zick <minimod@morethan.org>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bellagio/Config.in              | 4 ++--
 package/gstreamer1/gst-omx/Config.in    | 4 ++--
 package/opengl/libopenmax/Config.in     | 6 +++---
 package/opengl/libopenmax/libopenmax.mk | 4 ++--
 package/rpi-userland/Config.in          | 4 ++--
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/bellagio/Config.in b/package/bellagio/Config.in
index 2beb658..ee87e13 100644
--- a/package/bellagio/Config.in
+++ b/package/bellagio/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_BELLAGIO
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_PREFER_STATIC_LIB
-	select BR2_PACKAGE_HAS_OPENMAX
+	select BR2_PACKAGE_HAS_LIBOPENMAX
 	help
 	  Bellagio is an opensource implementation of the
 	  OpenMAX IL API.
@@ -19,7 +19,7 @@ config BR2_PACKAGE_BELLAGIO
 
 if BR2_PACKAGE_BELLAGIO
 
-config BR2_PACKAGE_PROVIDES_OPENMAX
+config BR2_PACKAGE_PROVIDES_LIBOPENMAX
 	default "bellagio"
 
 endif
diff --git a/package/gstreamer1/gst-omx/Config.in b/package/gstreamer1/gst-omx/Config.in
index 1d5b131..d2e4776 100644
--- a/package/gstreamer1/gst-omx/Config.in
+++ b/package/gstreamer1/gst-omx/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GST_OMX
 	bool "gst-omx"
-	depends on BR2_PACKAGE_HAS_OPENMAX
+	depends on BR2_PACKAGE_HAS_LIBOPENMAX
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	help
 	  GStreamer plug-in to use OpenMAX API.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_GST_OMX
 	  http://cgit.freedesktop.org/gstreamer/gst-omx
 
 comment "gst-omx requires a OpenMAX implementation"
-	depends on !BR2_PACKAGE_HAS_OPENMAX
+	depends on !BR2_PACKAGE_HAS_LIBOPENMAX
diff --git a/package/opengl/libopenmax/Config.in b/package/opengl/libopenmax/Config.in
index 105c53e..d50f2ce 100644
--- a/package/opengl/libopenmax/Config.in
+++ b/package/opengl/libopenmax/Config.in
@@ -1,6 +1,6 @@
-config BR2_PACKAGE_HAS_OPENMAX
+config BR2_PACKAGE_HAS_LIBOPENMAX
 	bool
 
-config BR2_PACKAGE_PROVIDES_OPENMAX
-	depends on BR2_PACKAGE_HAS_OPENMAX
+config BR2_PACKAGE_PROVIDES_LIBOPENMAX
+	depends on BR2_PACKAGE_HAS_LIBOPENMAX
 	string
diff --git a/package/opengl/libopenmax/libopenmax.mk b/package/opengl/libopenmax/libopenmax.mk
index a2bd23d..6cdeacd 100644
--- a/package/opengl/libopenmax/libopenmax.mk
+++ b/package/opengl/libopenmax/libopenmax.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 LIBOPENMAX_SOURCE =
-LIBOPENMAX_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENMAX))
+LIBOPENMAX_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_LIBOPENMAX))
 
-ifeq ($(BR2_PACKAGE_HAS_OPENMAX),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBOPENMAX),y)
 ifeq ($(LIBOPENMAX_DEPENDENCIES),)
 $(error No libopenmax implementation selected. Configuration error.)
 endif
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 4a82c9d..68ac1f6 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_RPI_USERLAND
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_OPENVG
-	select BR2_PACKAGE_HAS_OPENMAX
+	select BR2_PACKAGE_HAS_LIBOPENMAX
 	help
 	  Raspberry Pi Userland contains the necessary library to use the
 	  VideoCore driver.
@@ -28,7 +28,7 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 config BR2_PACKAGE_PROVIDES_OPENVG
 	default "rpi-userland"
 
-config BR2_PACKAGE_PROVIDES_OPENMAX
+config BR2_PACKAGE_PROVIDES_LIBOPENMAX
 	default "rpi-userland"
 
 endif
-- 
1.8.3.2
