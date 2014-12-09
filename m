From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 19:50:20 +0100
Subject: [Buildroot] [git commit] package/mpd: add option to enable or
	disable OSS support
Message-ID: <20141209185101.8426F80057@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25c083b4475756b557910b7c5233f8ae2efdee2b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, the OSS support is enabled, which may not necessarily be
useful on most Linux systems that use ALSA.

[Thomas: tweak commit title and log.]

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/Config.in |    5 +++++
 package/mpd/mpd.mk    |    6 ++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index db77ddf..0e115f6 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -245,6 +245,11 @@ comment "jack support needs a toolchain w/ largefile"
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
