From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  9 Feb 2016 10:17:57 -0300
Subject: [Buildroot] [PATCH v2] webkitgtk24: fix building with rpi egl/gles
Message-ID: <1455023877-10821-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some egl/gles binary-only implementations need some extra help in the
form of additional include directories, like rpi-userland. Fixes:

http://autobuild.buildroot.net/results/083/083ce94b1ac61a60aa16906336612af59e32b18b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
v2: Use pkg-config

 package/webkitgtk24/webkitgtk24.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/webkitgtk24/webkitgtk24.mk b/package/webkitgtk24/webkitgtk24.mk
index 8a831d9..8556f4e 100644
--- a/package/webkitgtk24/webkitgtk24.mk
+++ b/package/webkitgtk24/webkitgtk24.mk
@@ -13,8 +13,8 @@ WEBKITGTK24_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2
 WEBKITGTK24_DEPENDENCIES = host-ruby host-flex host-bison host-gperf \
-	enchant harfbuzz icu jpeg libcurl libgtk2 libsecret libsoup \
-	libxml2 libxslt sqlite webp
+	host-pkgconf enchant harfbuzz icu jpeg libcurl libgtk2 \
+	libsecret libsoup libxml2 libxslt sqlite webp
 
 WEBKITGTK24_DEPENDENCIES += \
 	$(if $(BR_PACKAGE_XLIB_LIBXCOMPOSITE),xlib_libXcomposite) \
@@ -69,6 +69,10 @@ WEBKITGTK24_CONF_OPTS += \
 	--enable-webgl \
 	--disable-glx
 WEBKITGTK24_DEPENDENCIES += libegl libgles
+# Some EGL/GLES implementations needs extra help (eg. rpi-userland)
+WEBKITGTK24_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) \
+	`$(PKG_CONFIG_HOST_BINARY) --cflags egl` \
+	`$(PKG_CONFIG_HOST_BINARY) --clfags glesv2`"
 # No GL
 else
 WEBKITGTK24_CONF_OPTS += \
-- 
2.4.10
