From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jul 2016 14:31:08 +0200
Subject: [Buildroot] [git commit] package/kodi: add optional support for
	libvdpau
Message-ID: <20160717123353.BF87F81D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aab1690637755d638101ddd490a858f4a9e447c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: drop select of libX11 and libXext, since the libvdpau package
already selects them.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 10 ++++++++++
 package/kodi/kodi.mk   |  8 +++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 9a5baa8..afb834e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -236,6 +236,16 @@ config BR2_PACKAGE_KODI_LIBVA
 	help
 	  Enable libva support.
 
+config BR2_PACKAGE_KODI_LIBVDPAU
+	bool "vdpau"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBVDPAU
+	help
+	  Enable libvdpau support.
+
+comment "libvdpau support needs X.org"
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
