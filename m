From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 23 Mar 2017 18:28:34 +0100
Subject: [Buildroot] [PATCH v4 13/39] package/kodi: move rtmp support to new
	addon kodi-inputstream-rtmp
In-Reply-To: <20170323172900.25458-1-bernd.kuhls@t-online.de>
References: <20170323172900.25458-1-bernd.kuhls@t-online.de>
Message-ID: <20170323172900.25458-14-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rtmp support was moved from Kodi to an addon:
https://github.com/xbmc/xbmc/commit/d04f43a4eb6f920cc42a28627b580f17e2be1bb5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy       | 7 +++++++
 package/kodi/Config.in | 7 -------
 package/kodi/kodi.mk   | 7 -------
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4e14a9809..cabef5c08 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
+config BR2_PACKAGE_KODI_RTMPDUMP
+	bool "kodi rtmp"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_INPUTSTREAM_RTMP
+	help
+	  Internal rtmp support was moved to addon kodi-inputstream-rtmp
+
 config BR2_PACKAGE_SYSTEMD_KDBUS
 	bool "systemd-kdbus has been removed"
 	select BR2_LEGACY
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 692d0192b..372d0af43 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -178,13 +178,6 @@ config BR2_PACKAGE_KODI_NONFREE
 	  Enable components with non-free licenses. This option
 	  currently only controls support for RAR archives.
 
-config BR2_PACKAGE_KODI_RTMPDUMP
-	bool "rtmp"
-	select BR2_PACKAGE_RTMPDUMP
-	help
-	  Enable RTMP input support.
-	  Select this if you want to play back rtmp stream.
-
 config BR2_PACKAGE_KODI_LIBSHAIRPLAY
 	bool "shairport"
 	select BR2_PACKAGE_LIBSHAIRPLAY
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 92f534ed8..16a4a3444 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -233,13 +233,6 @@ else
 KODI_CONF_OPTS += -DENABLE_NFS=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_KODI_RTMPDUMP),y)
-KODI_DEPENDENCIES += rtmpdump
-KODI_CONF_OPTS += --enable-rtmp
-else
-KODI_CONF_OPTS += --disable-rtmp
-endif
-
 ifeq ($(BR2_PACKAGE_KODI_LIBBLURAY),y)
 KODI_DEPENDENCIES += libbluray
 KODI_CONF_OPTS += -DENABLE_BLURAY=ON
-- 
2.11.0
