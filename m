From: Adam Duskett <aduskett@gmail.com>
Date: Wed,  1 Feb 2017 08:18:54 -0500
Subject: [Buildroot] [PATCH 2/2] gst1-vaapi: add optional encoder support.
In-Reply-To: <20170201131854.3046-1-Adamduskett@outlook.com>
References: <20170201131854.3046-1-Adamduskett@outlook.com>
Message-ID: <20170201131854.3046-2-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/gstreamer1/gst1-vaapi/Config.in     | 7 +++++++
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk | 5 ++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-vaapi/Config.in b/package/gstreamer1/gst1-vaapi/Config.in
index 44461e3..e33e612 100644
--- a/package/gstreamer1/gst1-vaapi/Config.in
+++ b/package/gstreamer1/gst1-vaapi/Config.in
@@ -33,6 +33,13 @@ config BR2_PACKAGE_GST1_VAAPI
   	  
 	  https://cgit.freedesktop.org/gstreamer/gstreamer-vaapi
 
+if BR2_PACKAGE_GST1_VAAPI
+
+config BR2_PACKAGE_GST1_VAAPI_ENCODERS
+	bool "Build encoders"
+
+endif
+
 comment "gst1-vaapi needs udev /dev management and a toolchain w/ threads, dynamic library"
 	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 470d95f..966fe9b 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -18,11 +18,14 @@ GST1_VAAPI_DEPENDENCIES += \
 	libdrm
 	
 GST1_VAAPI_CONF_OPTS += \
-	--disable-encoders \
 	--disable-x11 \
 	--disable-glx \
 	--disable-wayland \
 	--disable-egl \
 	--disable-gtk-doc-html
 
+ifneq ($(BR2_PACKAGE_GST1_VAAPI_ENCODERS),y)
+	GST1_VAAPI_CONF_OPTS += --disable-encoders
+endif
+
 $(eval $(autotools-package))
-- 
2.9.3
