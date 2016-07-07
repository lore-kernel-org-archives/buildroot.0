From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  7 Jul 2016 23:25:33 +0200
Subject: [Buildroot] [PATCH v3 4/6] package/kodi: Add suboption to control
	unrar support
In-Reply-To: <1467926735-29733-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467926735-29733-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1467926735-29733-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: rebased series, no changes to this patch
v2: rebased series, no changes to this patch

 package/kodi/Config.in | 6 ++++++
 package/kodi/kodi.mk   | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 7c8ada0..4e80763 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -180,6 +180,12 @@ config BR2_PACKAGE_KODI_MYSQL
 	help
 	  Enable MySQL support
 
+config BR2_PACKAGE_KODI_NONFREE
+	bool "nonfree"
+	help
+	  Enable components with non-compliant licenses.
+	  This option currently only controls support for RAR archives.
+
 config BR2_PACKAGE_KODI_RTMPDUMP
 	bool "rtmp"
 	select BR2_PACKAGE_RTMPDUMP
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 0d98180..4960f72 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -86,6 +86,14 @@ else
 KODI_CONF_OPTS += --disable-mysql
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_NONFREE),y)
+KODI_CONF_OPTS += --enable-non-free
+KODI_LICENSE := $(KODI_LICENSE), unrar
+KODI_LICENSE_FILES += lib/UnrarXLib/license.txt
+else
+KODI_CONF_OPTS += --disable-non-free
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 KODI_DEPENDENCIES += rpi-userland
 KODI_CONF_OPTS += --with-platform=raspberry-pi --enable-player=omxplayer
-- 
2.8.1
