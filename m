From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 29 May 2014 14:26:32 +0200
Subject: [Buildroot] [PATCH 1/2] package/webkit: Fix detection of egl
	headers provided by rpi-userland
In-Reply-To: <1401366393-5815-1-git-send-email-bernd.kuhls@t-online.de>
References: <1401366393-5815-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1401366393-5815-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

quote from webkit/config.log:
/home/br2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/interface/vcos/vcos_types.h:38:33:
fatal error: vcos_platform_types.h: No such file or directory

Package rpi-userland provides this header file, but in a non-default directory,
therefore use pkg-config to add the appropriate flags.

Fixes
http://autobuild.buildroot.net/results/bc0/bc0f9114f9dacf68a510f1e01f2dc3661c34f536/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/webkit/webkit.mk |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 6b04ccd..1f40736 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -35,8 +35,9 @@ WEBKIT_PRE_CONFIGURE_HOOKS += DISABLE_INDEXED_DATABASE
 # Give explicit path to icu-config, and silence gazillions of warnings
 # with recent gcc versions.
 WEBKIT_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config \
-	CFLAGS="$(TARGET_CFLAGS) -Wno-cast-align -Wno-sign-compare" \
-	CXXFLAGS="$(TARGET_CXXFLAGS) -Wno-cast-align -Wno-sign-compare" \
+	CFLAGS="$(TARGET_CFLAGS) $(WEBKIT_EGLFLAGS) -Wno-cast-align -Wno-sign-compare" \
+	CPPFLAGS="$(TARGET_CPPFLAGS) $(WEBKIT_EGLFLAGS)" \
+	CXXFLAGS="$(TARGET_CXXFLAGS) $(WEBKIT_EGLFLAGS) -Wno-cast-align -Wno-sign-compare" \
 	AR_FLAGS="cru"
 
 WEBKIT_CONF_OPT += \
@@ -55,6 +56,7 @@ WEBKIT_DEPENDENCIES += xlib_libXt
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
 WEBKIT_CONF_OPT += --enable-gles2
 WEBKIT_DEPENDENCIES += libegl libgles
+WEBKIT_EGLFLAGS = $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
 else
 WEBKIT_CONF_OPT += --disable-gles2
 endif
-- 
1.7.10.4
