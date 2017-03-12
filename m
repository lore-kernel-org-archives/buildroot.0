From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 21:32:23 +0100
Subject: [Buildroot] [git commit] gst1-vaapi: add optional encoder support
Message-ID: <20170312203334.E632982489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5c7f009875683a2c310478f846ddeb12d862d0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
[Thomas: pass explicit --enable-encoders.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-vaapi/Config.in     | 7 +++++++
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk | 7 ++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-vaapi/Config.in b/package/gstreamer1/gst1-vaapi/Config.in
index 9a4d66c..0b8ae39 100644
--- a/package/gstreamer1/gst1-vaapi/Config.in
+++ b/package/gstreamer1/gst1-vaapi/Config.in
@@ -38,6 +38,13 @@ config BR2_PACKAGE_GST1_VAAPI
 
 	  https://cgit.freedesktop.org/gstreamer/gstreamer-vaapi
 
+if BR2_PACKAGE_GST1_VAAPI
+
+config BR2_PACKAGE_GST1_VAAPI_ENCODERS
+	bool "enable encoders"
+
+endif
+
 comment "gst1-vaapi needs udev /dev management and a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
 		!BR2_PACKAGE_HAS_UDEV
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 370e281..11ad4c4 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -18,11 +18,16 @@ GST1_VAAPI_DEPENDENCIES += \
 	libdrm
 
 GST1_VAAPI_CONF_OPTS += \
-	--disable-encoders \
 	--disable-x11 \
 	--disable-glx \
 	--disable-wayland \
 	--disable-egl \
 	--disable-gtk-doc-html
 
+ifeq ($(BR2_PACKAGE_GST1_VAAPI_ENCODERS),y)
+GST1_VAAPI_CONF_OPTS += --enable-encoders
+else
+GST1_VAAPI_CONF_OPTS += --disable-encoders
+endif
+
 $(eval $(autotools-package))
