From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon,  8 Dec 2014 23:44:54 +0100
Subject: [Buildroot] [PATCH 6/6] package/mpd: enable OSS support
In-Reply-To: <1418078694-26331-1-git-send-email-jkrause@posteo.de>
References: <1418078694-26331-1-git-send-email-jkrause@posteo.de>
Message-ID: <1418078694-26331-6-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for the OSS (Open Sound System).

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/mpd/Config.in | 5 +++++
 package/mpd/mpd.mk    | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 57ed434..50f9ad0 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -241,6 +241,11 @@ comment "jack support needs a toolchain w/ largefile"
 	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_LARGEFILE
 
+config BR2_PACKAGE_MPD_OSS
+	bool "oss"
+	help
+	  Enable OSS (Open Sound System) output support.
+
 config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
 	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 85bbe8b..132ad44 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -175,6 +175,12 @@ else
 MPD_CONF_OPTS += --disable-opus
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_OSS),y)
+MPD_CONF_OPTS += --enable-oss
+else
+MPD_CONF_OPTS += --disable-oss
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_PULSEAUDIO),y)
 MPD_DEPENDENCIES += pulseaudio
 MPD_CONF_OPTS += --enable-pulse
-- 
2.1.3
