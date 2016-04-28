From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Apr 2016 08:20:45 -0300
Subject: [Buildroot] [PATCH] mpv: fix wayland deps
Message-ID: <1461842445-15685-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The wayland backend requires libxkbcommon, so when wayland is available
select it to avoid build failure and obscure dependencies. Fixes:
http://autobuild.buildroot.net/results/ed2/ed2660361c9720e48dd5959f2711fd7f14031b0d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpv/Config.in | 2 ++
 package/mpv/mpv.mk    | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 0f5aa97..36617e5 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_MPV
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_ZLIB
+	# Select xkbcommon for wayland to avoid being misterious
+	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
 	help
 	  mpv is a fork of mplayer2 and MPlayer. It shares some features
 	  with the former projects while introducing many more.
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 0032eb5..605e891 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -187,7 +187,7 @@ endif
 # wayland support
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MPV_CONF_OPTS += --enable-wayland
-MPV_DEPENDENCIES += wayland
+MPV_DEPENDENCIES += libxkbcommon wayland
 else
 MPV_CONF_OPTS += --disable-wayland
 endif
-- 
2.7.3
