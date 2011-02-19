From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Feb 2011 20:46:50 +0100
Subject: [Buildroot] [git commit master 1/1] mpd: add option for ffmpeg
	support
Message-ID: <20110219194955.0676E8F5DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=833724e1b15a708a04a7912204bf0d2dfdc2254b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For all the special file formats supported by ffmpeg.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpd/Config.in |   11 +++++++++++
 package/multimedia/mpd/mpd.mk    |    7 +++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index e418d32..2b3bacf 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -144,6 +144,17 @@ config BR2_PACKAGE_MPD_WAVPACK
 	  Enable wavpack input support.
 	  Select this if you want to play back WV files.
 
+config BR2_PACKAGE_MPD_FFMPEG
+	bool "ffmpeg"
+	select BR2_PACKAGE_FFMPEG
+	depends on BR2_LARGEFILE
+	help
+	  Enable ffmpeg input support.
+	  Select this if you want to play back files supported by ffmpeg.
+
+comment "ffmpeg support requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
+
 endif
 
 comment "mpd requires a toolchain with C++ and WCHAR support"
diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index 728feaa..3653152 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -107,6 +107,13 @@ else
 MPD_CONF_OPT += --disable-wavpack
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_FFMPEG),y)
+MPD_DEPENDENCIES += ffmpeg
+MPD_CONF_OPT += --enable-ffmpeg
+else
+MPD_CONF_OPT += --disable-ffmpeg
+endif
+
 define MPD_INSTALL_EXTRA_FILES
 	@if [ ! -f $(TARGET_DIR)/etc/mpd.conf ]; then \
 		$(INSTALL) -D package/multimedia/mpd/mpd.conf \
-- 
1.7.3.4
