From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 23:25:36 +0200
Subject: [Buildroot] [git commit] package/squeezelite: fix build with FFmpeg
 4.0
Message-ID: <20180908212450.5E4368371D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45841bd443c0c360f8f205445f85bc607de1b219
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Git-formatted patch 0003.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ch => 0003-Replace-deprecated-FFmpeg-API.patch} | 26 +++++++++++-------
 .../0004-Fix-FTBFS-with-FFmpeg-4.0.patch           | 31 ++++++++++++++++++++++
 2 files changed, 48 insertions(+), 9 deletions(-)

diff --git a/package/squeezelite/0003-ffmpeg_2_9.patch b/package/squeezelite/0003-Replace-deprecated-FFmpeg-API.patch
similarity index 80%
rename from package/squeezelite/0003-ffmpeg_2_9.patch
rename to package/squeezelite/0003-Replace-deprecated-FFmpeg-API.patch
index f69b829b38..74d8f1be55 100644
--- a/package/squeezelite/0003-ffmpeg_2_9.patch
+++ b/package/squeezelite/0003-Replace-deprecated-FFmpeg-API.patch
@@ -1,17 +1,22 @@
-Fix compilation with ffmpeg >= 2.9
+From cce6a0378ac319b87d2545d73f593d440bf686f5 Mon Sep 17 00:00:00 2001
+From: Andreas Cadhalpun <Andreas.Cadhalpun@googlemail.com>
+Date: Sat, 18 Aug 2018 13:25:23 +0200
+Subject: [PATCH] Replace deprecated FFmpeg API
+
+Fixes compilation with ffmpeg >= 2.9.
 
 Downloaded from Debian:
-https://sources.debian.net/src/squeezelite/1.8-3/debian/patches/ffmpeg_2.9.patch/
+https://sources.debian.org/src/squeezelite/1.8-4.1/debian/patches/ffmpeg_2.9.patch/
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ ffmpeg.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
 
-
-Description: Replace deprecated FFmpeg API
-Author: Andreas Cadhalpun <Andreas.Cadhalpun@googlemail.com>
-Last-Update: <2015-11-02>
-
---- squeezelite-1.8.orig/ffmpeg.c
-+++ squeezelite-1.8/ffmpeg.c
+diff --git a/ffmpeg.c b/ffmpeg.c
+index 279f31d..bc9136c 100644
+--- a/ffmpeg.c
++++ b/ffmpeg.c
 @@ -52,8 +52,8 @@ struct ff_s {
  	unsigned (* avcodec_version)(void);
  	AVCodec * (* avcodec_find_decoder)(int);
@@ -55,3 +60,6 @@ Last-Update: <2015-11-02>
  	ff->avcodec_decode_audio4 = dlsym(handle_codec, "avcodec_decode_audio4");
  	ff->av_init_packet = dlsym(handle_codec, "av_init_packet");
  	ff->av_free_packet = dlsym(handle_codec, "av_free_packet");
+-- 
+2.18.0
+
diff --git a/package/squeezelite/0004-Fix-FTBFS-with-FFmpeg-4.0.patch b/package/squeezelite/0004-Fix-FTBFS-with-FFmpeg-4.0.patch
new file mode 100644
index 0000000000..25a5db3cae
--- /dev/null
+++ b/package/squeezelite/0004-Fix-FTBFS-with-FFmpeg-4.0.patch
@@ -0,0 +1,31 @@
+From 4ad37284447e768d641768c7c8a69c4640c83181 Mon Sep 17 00:00:00 2001
+From: James Cowgill <jcowgill@debian.org>
+Date: Sat, 18 Aug 2018 13:26:59 +0200
+Subject: [PATCH] Fix FTBFS with FFmpeg 4.0
+
+Bug-Debian: https://bugs.debian.org/888335
+
+Downloaded from Debian:
+https://sources.debian.org/src/squeezelite/1.8-4.1/debian/patches/ffmpeg4.0.patch/
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ ffmpeg.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ffmpeg.c b/ffmpeg.c
+index bc9136c..d51b08e 100644
+--- a/ffmpeg.c
++++ b/ffmpeg.c
+@@ -264,7 +264,7 @@ static decode_state ff_decode(void) {
+ 		ff->mmsh_bytes_left = ff->mmsh_bytes_pad = ff->mmsh_packet_len = 0;
+ 
+ 		if (!ff->readbuf) {
+-			ff->readbuf = AV(ff, malloc, READ_SIZE +  FF_INPUT_BUFFER_PADDING_SIZE);
++			ff->readbuf = AV(ff, malloc, READ_SIZE +  AV_INPUT_BUFFER_PADDING_SIZE);
+ 		}
+ 
+ 		avio = AVIO(ff, alloc_context, ff->readbuf, READ_SIZE, 0, NULL, _read_data, NULL, NULL);
+-- 
+2.18.0
+
