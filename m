From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  7 Jul 2016 23:25:34 +0200
Subject: [Buildroot] [PATCH v3 5/6] package/kodi: add optional support for
	libvdpau
In-Reply-To: <1467926735-29733-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467926735-29733-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1467926735-29733-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: new patch

 package/kodi/Config.in | 12 ++++++++++++
 package/kodi/kodi.mk   |  8 +++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 4e80763..2925402 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -239,6 +239,18 @@ config BR2_PACKAGE_KODI_LIBVA
 	help
 	  Enable libva support.
 
+config BR2_PACKAGE_KODI_LIBVDPAU
+	bool "vdpau"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBVDPAU
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	help
+	  Enable libvdpau support.
+
+comment "libvdpau needs X.org"
+	depends on BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_KODI_UPNP
 	bool "upnp"
 	help
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 4960f72..bf320c9 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -74,7 +74,6 @@ KODI_CONF_OPTS +=  \
 	--disable-joystick \
 	--disable-openmax \
 	--disable-pulse \
-	--disable-vdpau \
 	--disable-vtbdecoder \
 	--enable-optimizations
 
@@ -236,6 +235,13 @@ else
 KODI_CONF_OPTS += --disable-vaapi
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_LIBVDPAU),y)
+KODI_DEPENDENCIES += libvdpau
+KODI_CONF_OPTS += --enable-vdpau
+else
+KODI_CONF_OPTS += --disable-vdpau
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_UPNP),y)
 KODI_CONF_OPTS += --enable-upnp
 else
-- 
2.8.1
