From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 Aug 2020 23:19:38 +0200
Subject: [Buildroot] [PATCH 2/4] package/mpd: add libmodplug optional
 dependency
In-Reply-To: <20200814211940.1598502-1-fontaine.fabrice@gmail.com>
References: <20200814211940.1598502-1-fontaine.fabrice@gmail.com>
Message-ID: <20200814211940.1598502-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libmodplug is an optional dependency since version 0.15.0 and
https://github.com/MusicPlayerDaemon/MPD/commit/d838a1ad24a9eaac44367e34506373b4b71e4ff0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpd/Config.in | 6 ++++++
 package/mpd/mpd.mk    | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index baaaa7f1ae..eb4c28617e 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -140,6 +140,12 @@ config BR2_PACKAGE_MPD_MAD
 	  Enable mad input support.
 	  Select this if you want to play back MP3 files.
 
+config BR2_PACKAGE_MPD_MODPLUG
+	bool "modplug"
+	select BR2_PACKAGE_LIBMODPLUG
+	help
+	  Enable Modplug decoder support.
+
 config BR2_PACKAGE_MPD_MPG123
 	bool "mpg123"
 	select BR2_PACKAGE_LIBID3TAG
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 51bc1719a7..5e66997b26 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -180,6 +180,13 @@ else
 MPD_CONF_OPTS += -Dmad=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_MODPLUG),y)
+MPD_DEPENDENCIES += libmodplug
+MPD_CONF_OPTS += -Dmodplug=enabled
+else
+MPD_CONF_OPTS += -Dmodplug=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_MPG123),y)
 MPD_DEPENDENCIES += libid3tag mpg123
 MPD_CONF_OPTS += -Dmpg123=enabled
-- 
2.27.0
