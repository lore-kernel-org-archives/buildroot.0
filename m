From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Feb 2014 23:02:06 +0100
Subject: [Buildroot] [PATCH 06/10] package/libopenmax: convert to the
	virtual-package infrastructure
In-Reply-To: <cover.1393365231.git.yann.morin.1998@free.fr>
References: <cover.1393365231.git.yann.morin.1998@free.fr>
Message-ID: <e1c6fb5429e0260523841c892db451553958cdef.1393365231.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Mike Zick <minimod@morethan.org>
---
 package/bellagio/Config.in              |  4 ++--
 package/gstreamer1/gst-omx/Config.in    |  4 ++--
 package/opengl/libopenmax/Config.in     |  6 +++---
 package/opengl/libopenmax/libopenmax.mk | 12 +-----------
 package/rpi-userland/Config.in          |  4 ++--
 5 files changed, 10 insertions(+), 20 deletions(-)

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
index c4f1f71..bc2e7f8 100644
--- a/package/opengl/libopenmax/libopenmax.mk
+++ b/package/opengl/libopenmax/libopenmax.mk
@@ -4,14 +4,4 @@
 #
 ################################################################################
 
-LIBOPENMAX_SOURCE =
-LIBOPENMAX_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENMAX))
-
-ifeq ($(LIBOPENMAX_DEPENDENCIES),)
-define LIBOPENMAX_CONFIGURE_CMDS
-	echo "No libopenmax implementation selected. Configuration error."
-	exit 1
-endef
-endif
-
-$(eval $(generic-package))
+$(eval $(virtual-package))
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
