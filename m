From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 23:49:17 +0200
Subject: [Buildroot] [git commit] package/mpd: add zziplib optional
 dependency
Message-ID: <20200818214248.ED9287F87A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdb80f0a89eebb36a0a1a99c3509fb0e2cfbce1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zziplib is an optional dependency since version 0.15.0 and
https://github.com/MusicPlayerDaemon/MPD/commit/e216e01ab3db0d9bea179b043276401d38bfd957

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
