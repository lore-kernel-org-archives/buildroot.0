From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Sep 2016 00:18:27 +0200
Subject: [Buildroot] [git commit] mpd: add optional support for libshout
Message-ID: <20160831224016.CC4C2822E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd4f88dc5fc018324ed61b0319ab9ea6f35c9ff0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/Config.in | 6 ++++++
 package/mpd/mpd.mk    | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 2ea21fc..82bbd8d 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -262,6 +262,12 @@ comment "pulseaudio support needs a toolchain w/ dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS
 
+config BR2_PACKAGE_MPD_SHOUTCAST
+	bool "shoutcast"
+	select BR2_PACKAGE_LIBSHOUT
+	help
+	  Enable shoutcast streaming output support.
+
 comment "Miscellaneous plugins"
 
 config BR2_PACKAGE_MPD_AVAHI_SUPPORT
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 6e2cf8c..845b749 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -195,6 +195,13 @@ else
 MPD_CONF_OPTS += --disable-pulse
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_SHOUTCAST),y)
+MPD_DEPENDENCIES += libshout
+MPD_CONF_OPTS += --enable-shout
+else
+MPD_CONF_OPTS += --disable-shout
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_SOUNDCLOUD),y)
 MPD_DEPENDENCIES += yajl
 MPD_CONF_OPTS += --enable-soundcloud
