From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 29 Apr 2019 21:45:33 +0200
Subject: [Buildroot] [DRAFT v1 6/7] package/gst1-vaapi: convert to meson
 build
In-Reply-To: <20190429194534.25743-1-ps.report@gmx.net>
References: <20190429194534.25743-1-ps.report@gmx.net>
Message-ID: <20190429194534.25743-7-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index bb9a4fd77f..a7ba41f6c2 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -18,16 +18,19 @@ GST1_VAAPI_DEPENDENCIES += \
 	libdrm

 GST1_VAAPI_CONF_OPTS += \
-	--disable-x11 \
-	--disable-glx \
-	--disable-wayland \
-	--disable-egl \
-	--disable-gtk-doc-html
+	-Dgtk_doc=disabled
+	-Dexamples=disabled
+
+GST1_VAAPI_CONF_OPTS += \
+	-Dwith_x11=no \
+	-Dwith_glx=no \
+	-Dwith_wayland=no \
+	-Dwith_egl=no

 ifeq ($(BR2_PACKAGE_GST1_VAAPI_ENCODERS),y)
-GST1_VAAPI_CONF_OPTS += --enable-encoders
+GST1_VAAPI_CONF_OPTS += -Dwith_encoders=yes
 else
-GST1_VAAPI_CONF_OPTS += --disable-encoders
+GST1_VAAPI_CONF_OPTS += -Dwith_encoders=no
 endif

-$(eval $(autotools-package))
+$(eval $(meson-package))
--
2.21.0
