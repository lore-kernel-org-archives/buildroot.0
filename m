From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 Aug 2020 23:19:39 +0200
Subject: [Buildroot] [PATCH 3/4] package/mpd: add zziplib optional dependency
In-Reply-To: <20200814211940.1598502-1-fontaine.fabrice@gmail.com>
References: <20200814211940.1598502-1-fontaine.fabrice@gmail.com>
Message-ID: <20200814211940.1598502-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zziplib is an optional dependency since version 0.15.0 and
https://github.com/MusicPlayerDaemon/MPD/commit/e216e01ab3db0d9bea179b043276401d38bfd957

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpd/Config.in | 6 ++++++
 package/mpd/mpd.mk    | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index eb4c28617e..f1f8d99465 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -34,6 +34,12 @@ config BR2_PACKAGE_MPD_SQLITE
 	  Enable sqlite database support.
 	  If you don't use sqlite it will use an ASCII database.
 
+config BR2_PACKAGE_MPD_ZZIP
+	bool "zzip"
+	select BR2_PACKAGE_ZZIPLIB
+	help
+	  Enable ZIP archive support.
+
 comment "Commercial services"
 
 config BR2_PACKAGE_MPD_QOBUZ
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 5e66997b26..566b105f61 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -317,6 +317,13 @@ else
 MPD_CONF_OPTS += -Dwavpack=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_ZZIP),y)
+MPD_DEPENDENCIES += zziplib
+MPD_CONF_OPTS += -Dzzip=enabled
+else
+MPD_CONF_OPTS += -Dzzip=disabled
+endif
+
 define MPD_INSTALL_EXTRA_FILES
 	$(INSTALL) -m 0644 -D package/mpd/mpd.conf $(TARGET_DIR)/etc/mpd.conf
 endef
-- 
2.27.0
