From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  2 Feb 2017 08:27:29 +0100
Subject: [Buildroot] [PATCH 11/38] package/kodi: move rtmp support to new
	addon kodi-inputstream-rtmp
In-Reply-To: <20170202072756.6624-1-bernd.kuhls@t-online.de>
References: <20170202072756.6624-1-bernd.kuhls@t-online.de>
Message-ID: <20170202072756.6624-11-bernd.kuhls@t-online.de>
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
index 20445b8a1..7dd9189ee 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -262,6 +262,13 @@ config BR2_GDB_VERSION_7_9
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_PACKAGE_KODI_RTMPDUMP
+	bool "kodi rtmp"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_INPUTSTREAM_RTMP
+	help
+	  Internal rtmp support was moved to addon kodi-inputstream-rtmp
+
 config BR2_PACKAGE_PHP_SAPI_CLI_CGI
 	bool "PHP CGI and CLI options are now seperate"
 	select BR2_PACKAGE_PHP_SAPI_CLI
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 842e0b6a3..84319b91a 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -177,13 +177,6 @@ config BR2_PACKAGE_KODI_NONFREE
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
index 9fe559c1e..a035cb74c 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -186,13 +186,6 @@ else
 KODI_CONF_OPTS += --disable-nfs
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
 KODI_CONF_OPTS += --enable-libbluray
-- 
2.11.0
