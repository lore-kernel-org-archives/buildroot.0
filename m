From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 11 Jul 2016 20:09:01 +0200
Subject: [Buildroot] [PATCH v5 7/8] package/kodi: add optional support for
	libvdpau
In-Reply-To: <1468260542-7194-1-git-send-email-bernd.kuhls@t-online.de>
References: <1468260542-7194-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1468260542-7194-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v5: fixed typo in comment dependency
v4: no changes
v3: new patch

 package/kodi/Config.in | 12 ++++++++++++
 package/kodi/kodi.mk   |  8 +++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 25378da..59a94d7 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -236,6 +236,18 @@ config BR2_PACKAGE_KODI_LIBVA
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
+	depends on !BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_KODI_UPNP
 	bool "upnp"
 	help
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index e291947..9f21bf2 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -74,7 +74,6 @@ KODI_CONF_OPTS +=  \
 	--disable-joystick \
 	--disable-openmax \
 	--disable-pulse \
-	--disable-vdpau \
 	--disable-vtbdecoder \
 	--enable-optimizations
 
@@ -243,6 +242,13 @@ else
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
