From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  8 Feb 2016 19:52:00 -0300
Subject: [Buildroot] [PATCH] webkitgtk24: fix building with rpi egl/gles
Message-ID: <1454971920-18533-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It needs special handling for the additional include fixes. Fixes:
http://autobuild.buildroot.net/results/083/083ce94b1ac61a60aa16906336612af59e32b18b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/webkitgtk24/webkitgtk24.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/webkitgtk24/webkitgtk24.mk b/package/webkitgtk24/webkitgtk24.mk
index 8a831d9..07927ac 100644
--- a/package/webkitgtk24/webkitgtk24.mk
+++ b/package/webkitgtk24/webkitgtk24.mk
@@ -69,6 +69,13 @@ WEBKITGTK24_CONF_OPTS += \
 	--enable-webgl \
 	--disable-glx
 WEBKITGTK24_DEPENDENCIES += libegl libgles
+# RPi EGL/GLES needs special handling
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+WEBKITGTK24_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) \
+	-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
+        -I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux" \
+	LIBS="-lvcos -lvchostif"
+endif
 # No GL
 else
 WEBKITGTK24_CONF_OPTS += \
-- 
2.4.10
