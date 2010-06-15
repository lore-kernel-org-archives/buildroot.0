From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Jun 2010 08:52:17 +0200
Subject: [Buildroot] [git commit master 1/1] ffmpeg: add user-defined
	configure parameters
Message-ID: <20100615065458.6734B80E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5db7204c80454fe5211c1f7df5490c36b9470af3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #401

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                             |    3 ++-
 package/multimedia/ffmpeg/Config.in |    7 +++++++
 package/multimedia/ffmpeg/ffmpeg.mk |    2 ++
 3 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index f0822d5..ac9e744 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,7 +7,7 @@
 
 	New GTK-based configurator, usable using 'make gconfig'.
 
-	New packages: cgilua, copas, coxpcall, luafilesystem,
+	New packages: cgilua, copas, coxpcall, ffmpeg, luafilesystem,
 	luasocket, rings, wsapi, xavante
 
 	Updated/fixed packages: busybox, cdrkit, file, gawk,
@@ -19,6 +19,7 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#401:  new package: ffmpeg
 	#1753: lmbench: convert to generic package infrastructure
 	#1771: Fakeroot and the target/generic/device_table.txt create bad...
 	#1807: LZMA 4.32.7, Required header file(s) are missing
diff --git a/package/multimedia/ffmpeg/Config.in b/package/multimedia/ffmpeg/Config.in
index c9fdd54..fb6591b 100644
--- a/package/multimedia/ffmpeg/Config.in
+++ b/package/multimedia/ffmpeg/Config.in
@@ -135,4 +135,11 @@ config BR2_PACKAGE_FFMPEG_OUTDEVS
 	bool "Enable output devices"
 	default y
 
+config BR2_PACKAGE_FFMPEG_EXTRACONF
+	string "Additional parameters for ./configure"
+	default ""
+	help
+	 Extra parameters that will be appended to FFmpeg's
+	 ./configure commandline.
+
 endif
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index eea76f7..81984f1 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -114,6 +114,8 @@ else
 FFMPEG_CONF_OPT += --disable-zlib
 endif
 
+FFMPEG_CONF_OPT += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
+
 # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
 define FFMPEG_CONFIGURE_CMDS
 	(cd $(FFMPEG_SRCDIR) && rm -rf config.cache && \
-- 
1.7.1
