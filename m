From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 12:03:39 +0200
Subject: [Buildroot] [git commit] package/kodi: libxslt is an optional
	package
Message-ID: <20170429101427.35A2B827B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf9bfd065ba3fab328fd041ca040f2bf134fecf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After this commit
https://github.com/xbmc/xbmc/commit/bad3902b4a2538a433f858c97b2cf91c44c7feff
libxslt, together with libxml2, are an optional package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 2 --
 package/kodi/kodi.mk   | 9 +++++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index e8efd72..cd58cf2 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -64,8 +64,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_KODI_GL_EGL
 	select BR2_PACKAGE_LIBPLIST
 	select BR2_PACKAGE_LIBSAMPLERATE
-	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 7341cc3..4c7a2e8 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -33,8 +33,6 @@ KODI_DEPENDENCIES = \
 	libfribidi \
 	libplist \
 	libsamplerate \
-	libxml2 \
-	libxslt \
 	lzo \
 	ncurses \
 	openssl \
@@ -183,6 +181,13 @@ else
 KODI_CONF_OPTS += -DENABLE_CAP=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXML2)$(BR2_PACKAGE_LIBXSLT),yy)
+KODI_CONF_OPTS += -DENABLE_XSLT=ON
+KODI_DEPENDENCIES += libxml2 libxslt
+else
+KODI_CONF_OPTS += -DENABLE_XSLT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_BLUEZ),y)
 KODI_CONF_OPTS += -DENABLE_BLUETOOTH=ON
 KODI_DEPENDENCIES += bluez5_utils
