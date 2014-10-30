From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 23:10:06 +0100
Subject: [Buildroot] [git commit] mpd: add jack output support option
Message-ID: <20141030221037.90DE5B23C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f8180d42506d04124320f2af31e8ed71d8a6d36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: reworked patch on top of the latest master.]

Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/Config.in |   12 ++++++++++++
 package/mpd/mpd.mk    |    7 +++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index ac9ca95..1d38b1a 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -229,6 +229,18 @@ config BR2_PACKAGE_MPD_AO
 	help
 	  Enable libao output support.
 
+config BR2_PACKAGE_MPD_JACK2
+	bool "jack2"
+	depends on BR2_LARGEFILE # jack2 -> libsndfile
+	depends on BR2_ARCH_HAS_ATOMICS
+	select BR2_PACKAGE_JACK2
+	help
+	  Enable jack output support.
+
+comment "jack support needs a toolchain w/ largefile"
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_LARGEFILE
+
 config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
 	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index d7b912b..6d2918d 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -92,6 +92,13 @@ else
 MPD_CONF_OPTS += --disable-flac
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_JACK2),y)
+MPD_DEPENDENCIES += jack2
+MPD_CONF_OPTS += --enable-jack
+else
+MPD_CONF_OPTS += --disable-jack
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_LAME),y)
 MPD_DEPENDENCIES += lame
 MPD_CONF_OPTS += --enable-lame-encoder
