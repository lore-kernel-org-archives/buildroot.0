From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 10:37:43 +0200
Subject: [Buildroot] [PATCH v7 23/31] package/kodi: libxslt is an optional
	package
In-Reply-To: <20170429083751.19625-1-bernd.kuhls@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
Message-ID: <20170429083751.19625-24-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After this commit
https://github.com/xbmc/xbmc/commit/bad3902b4a2538a433f858c97b2cf91c44c7feff
libxslt, together with libxml2, are an optional package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 2 --
 package/kodi/kodi.mk   | 9 +++++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 5dd0d06bf9..5dd41652a2 100644
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
index 3a10a524e3..3a8f08d449 100644
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
@@ -185,6 +183,13 @@ else
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
-- 
2.11.0
