From: Pieter De Gendt <pieter.degendt@gmail.com>
Date: Fri,  8 Aug 2014 10:14:22 +0200
Subject: [Buildroot] [PATCH 1/1] MPD: Add jack output support option
Message-ID: <1407485662-1712-1-git-send-email-pieter.degendt@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
---
 package/mpd/Config.in |   11 +++++++++++
 package/mpd/mpd.mk    |    5 +++++
 2 files changed, 16 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index f5f5b34..efe1abd 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -52,6 +52,17 @@ config BR2_PACKAGE_MPD_PULSEAUDIO
 comment "pulseaudio support needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
 
+config BR2_PACKAGE_MPD_JACK2
+	bool "jack2"
+	depends on BR2_LARGEFILE # libsndfile
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+	select BR2_PACKAGE_JACK2
+	help
+	  Enable jack output support.
+
 config BR2_PACKAGE_MPD_BZIP2
 	bool "bzip2"
 	select BR2_PACKAGE_BZIP2
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index e2ee760..4ac5eea 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -40,6 +40,11 @@ MPD_DEPENDENCIES += pulseaudio
 MPD_CONF_OPT += --enable-pulse
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_JACK2),y)
+MPD_DEPENDENCIES += jack2
+MPD_CONF_OPT += --enable-jack
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_BZIP2),y)
 MPD_DEPENDENCIES += bzip2
 MPD_CONF_OPT += --enable-bzip2
-- 
1.7.9.5
