From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Apr 2019 18:57:57 +0200
Subject: [Buildroot] [PATCH 1/4] package/squeezelite: bump to version
 71c012ad9ba102feb95823b7b9dc17e5305689c7
Message-ID: <20190406165800.4493-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch site to https://github.com/ralph-irving/squeezelite
- Remove all patches (already in version)
- Update hash of license file (new author added:
  https://github.com/ralph-irving/squeezelite/commit/b8e5cd2d94fd280b8e858dd52ba05a7c6b07a514)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ile-allow-passing-CFLAGS-and-LDFLAGS.patch | 54 ---------------
 ...utput_alsa-use-mallopt-only-on-glibc.patch | 34 ----------
 .../0003-Replace-deprecated-FFmpeg-API.patch  | 65 -------------------
 .../0004-Fix-FTBFS-with-FFmpeg-4.0.patch      | 31 ---------
 package/squeezelite/Config.in                 |  2 +-
 package/squeezelite/squeezelite.hash          |  4 +-
 package/squeezelite/squeezelite.mk            |  4 +-
 7 files changed, 5 insertions(+), 189 deletions(-)
 delete mode 100644 package/squeezelite/0001-Makefile-allow-passing-CFLAGS-and-LDFLAGS.patch
 delete mode 100644 package/squeezelite/0002-output_alsa-use-mallopt-only-on-glibc.patch
 delete mode 100644 package/squeezelite/0003-Replace-deprecated-FFmpeg-API.patch
 delete mode 100644 package/squeezelite/0004-Fix-FTBFS-with-FFmpeg-4.0.patch

diff --git a/package/squeezelite/0001-Makefile-allow-passing-CFLAGS-and-LDFLAGS.patch b/package/squeezelite/0001-Makefile-allow-passing-CFLAGS-and-LDFLAGS.patch
deleted file mode 100644
index 2f002a80bc..0000000000
--- a/package/squeezelite/0001-Makefile-allow-passing-CFLAGS-and-LDFLAGS.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From a0f2e79d1373967dac9f3df4c500a71cd1b96b2b Mon Sep 17 00:00:00 2001
-From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
-Date: Sun, 7 Feb 2016 18:04:53 +0100
-Subject: [PATCH] Makefile: allow passing CFLAGS and LDFLAGS
-
-This patch is applied to squeezelite Makefile to add override
-directive for CFLAGS and LDFLAGS assignment.
-This enables adding flags to CFLAGS and LDFLAGS in Makefile.
-
-Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
----
- Makefile | 12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index dca2abd..286c725 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,4 +1,6 @@
- # Cross compile support - create a Makefile which defines these three variables and then includes this Makefile...
-+override CFLAGS += $(OPTS)
-+override LDFLAGS += -lasound -lpthread -lm -lrt
- CFLAGS  ?= -Wall -fPIC -O2 $(OPTS)
- LDFLAGS ?= -lasound -lpthread -lm -lrt
- EXECUTABLE ?= squeezelite
-@@ -52,20 +54,20 @@ endif
- 
- # add optional link options
- ifneq (,$(findstring $(OPT_LINKALL), $(CFLAGS)))
--	LDFLAGS += $(LINKALL)
-+	override LDFLAGS += $(LINKALL)
- ifneq (,$(findstring $(OPT_FF), $(CFLAGS)))
--	LDFLAGS += $(LINKALL_FF)
-+	override LDFLAGS += $(LINKALL_FF)
- endif
- ifneq (,$(findstring $(OPT_RESAMPLE), $(CFLAGS)))
--	LDFLAGS += $(LINKALL_RESAMPLE)
-+	override LDFLAGS += $(LINKALL_RESAMPLE)
- endif
- ifneq (,$(findstring $(OPT_IR), $(CFLAGS)))
--	LDFLAGS += $(LINKALL_IR)
-+	override LDFLAGS += $(LINKALL_IR)
- endif
- else
- # if not LINKALL and linux add LINK_LINUX
- ifeq ($(UNAME), Linux)
--	LDFLAGS += $(LINK_LINUX)
-+	override LDFLAGS += $(LINK_LINUX)
- endif
- endif
- 
--- 
-2.6.4
-
diff --git a/package/squeezelite/0002-output_alsa-use-mallopt-only-on-glibc.patch b/package/squeezelite/0002-output_alsa-use-mallopt-only-on-glibc.patch
deleted file mode 100644
index 6962b7b8fd..0000000000
--- a/package/squeezelite/0002-output_alsa-use-mallopt-only-on-glibc.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 903922a7bcf06e04d9830b47bba6d65ed37304c1 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 7 Feb 2016 18:05:56 +0100
-Subject: [PATCH] output_alsa: use mallopt() only on glibc
-
-The musl C library does not provide the glibc specific mallopt()
-functionality, so use it only when __GLIBC__ is defined.
-
-uClibc pretends to be glibc by defining __GLIBC__, but it implements
-mallopt(), so it works fine.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- output_alsa.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/output_alsa.c b/output_alsa.c
-index aa01560..44c9fc7 100644
---- a/output_alsa.c
-+++ b/output_alsa.c
-@@ -862,8 +862,10 @@ void output_init_alsa(log_level level, const char *device, unsigned output_buf_s
- 		LOG_INFO("memory locked");
- 	}
- 
-+#ifdef __GLIBC__
- 	mallopt(M_TRIM_THRESHOLD, -1);
- 	mallopt(M_MMAP_MAX, 0);
-+#endif
- 
- 	touch_memory(silencebuf, MAX_SILENCE_FRAMES * BYTES_PER_FRAME);
- 	touch_memory(outputbuf->buf, outputbuf->size);
--- 
-2.6.4
-
diff --git a/package/squeezelite/0003-Replace-deprecated-FFmpeg-API.patch b/package/squeezelite/0003-Replace-deprecated-FFmpeg-API.patch
deleted file mode 100644
index 74d8f1be55..0000000000
--- a/package/squeezelite/0003-Replace-deprecated-FFmpeg-API.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From cce6a0378ac319b87d2545d73f593d440bf686f5 Mon Sep 17 00:00:00 2001
-From: Andreas Cadhalpun <Andreas.Cadhalpun@googlemail.com>
-Date: Sat, 18 Aug 2018 13:25:23 +0200
-Subject: [PATCH] Replace deprecated FFmpeg API
-
-Fixes compilation with ffmpeg >= 2.9.
-
-Downloaded from Debian:
-https://sources.debian.org/src/squeezelite/1.8-4.1/debian/patches/ffmpeg_2.9.patch/
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- ffmpeg.c | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/ffmpeg.c b/ffmpeg.c
-index 279f31d..bc9136c 100644
---- a/ffmpeg.c
-+++ b/ffmpeg.c
-@@ -52,8 +52,8 @@ struct ff_s {
- 	unsigned (* avcodec_version)(void);
- 	AVCodec * (* avcodec_find_decoder)(int);
- 	int attribute_align_arg (* avcodec_open2)(AVCodecContext *, const AVCodec *, AVDictionary **);
--	AVFrame * (* avcodec_alloc_frame)(void);
--	void (* avcodec_free_frame)(AVFrame **);
-+	AVFrame * (* av_frame_alloc)(void);
-+	void (* av_frame_free)(AVFrame **);
- 	int attribute_align_arg (* avcodec_decode_audio4)(AVCodecContext *, AVFrame *, int *, const AVPacket *);
- 	// ffmpeg symbols to be dynamically loaded from libavformat
- 	unsigned (* avformat_version)(void);
-@@ -324,7 +324,7 @@ static decode_state ff_decode(void) {
- 
- 		AVCODEC(ff, open2, ff->codecC, codec, NULL);
- 
--		ff->frame = AVCODEC(ff, alloc_frame);
-+		ff->frame = AV(ff, frame_alloc);
- 
- 		ff->avpkt = AV(ff, malloc, sizeof(AVPacket));
- 		if (ff->avpkt == NULL) {
-@@ -520,9 +520,9 @@ static void _free_ff_data(void) {
- 	if (ff->frame) {
- 		// ffmpeg version dependant free function
- #if !LINKALL
--		ff->avcodec_free_frame ? AVCODEC(ff, free_frame, &ff->frame) : AV(ff, freep, &ff->frame);
-+		ff->av_frame_free ? AV(ff, frame_free, &ff->frame) : AV(ff, freep, &ff->frame);
- #elif LIBAVCODEC_VERSION_INT >= AV_VERSION_INT(54,28,0)
--		AVCODEC(ff, free_frame, &ff->frame);
-+		AV(ff, frame_free, &ff->frame);
- #else
- 		AV(ff, freep, &ff->frame);
- #endif
-@@ -607,8 +607,8 @@ static bool load_ff() {
- 	ff->avcodec_version = dlsym(handle_codec, "avcodec_version");
- 	ff->avcodec_find_decoder = dlsym(handle_codec, "avcodec_find_decoder");
- 	ff->avcodec_open2 = dlsym(handle_codec, "avcodec_open2");
--	ff->avcodec_alloc_frame = dlsym(handle_codec, "avcodec_alloc_frame");
--	ff->avcodec_free_frame = dlsym(handle_codec, "avcodec_free_frame");
-+	ff->av_frame_alloc = dlsym(handle_codec, "av_frame_alloc");
-+	ff->av_frame_free = dlsym(handle_codec, "av_frame_free");
- 	ff->avcodec_decode_audio4 = dlsym(handle_codec, "avcodec_decode_audio4");
- 	ff->av_init_packet = dlsym(handle_codec, "av_init_packet");
- 	ff->av_free_packet = dlsym(handle_codec, "av_free_packet");
--- 
-2.18.0
-
diff --git a/package/squeezelite/0004-Fix-FTBFS-with-FFmpeg-4.0.patch b/package/squeezelite/0004-Fix-FTBFS-with-FFmpeg-4.0.patch
deleted file mode 100644
index 25a5db3cae..0000000000
--- a/package/squeezelite/0004-Fix-FTBFS-with-FFmpeg-4.0.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 4ad37284447e768d641768c7c8a69c4640c83181 Mon Sep 17 00:00:00 2001
-From: James Cowgill <jcowgill@debian.org>
-Date: Sat, 18 Aug 2018 13:26:59 +0200
-Subject: [PATCH] Fix FTBFS with FFmpeg 4.0
-
-Bug-Debian: https://bugs.debian.org/888335
-
-Downloaded from Debian:
-https://sources.debian.org/src/squeezelite/1.8-4.1/debian/patches/ffmpeg4.0.patch/
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- ffmpeg.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ffmpeg.c b/ffmpeg.c
-index bc9136c..d51b08e 100644
---- a/ffmpeg.c
-+++ b/ffmpeg.c
-@@ -264,7 +264,7 @@ static decode_state ff_decode(void) {
- 		ff->mmsh_bytes_left = ff->mmsh_bytes_pad = ff->mmsh_packet_len = 0;
- 
- 		if (!ff->readbuf) {
--			ff->readbuf = AV(ff, malloc, READ_SIZE +  FF_INPUT_BUFFER_PADDING_SIZE);
-+			ff->readbuf = AV(ff, malloc, READ_SIZE +  AV_INPUT_BUFFER_PADDING_SIZE);
- 		}
- 
- 		avio = AVIO(ff, alloc_context, ff->readbuf, READ_SIZE, 0, NULL, _read_data, NULL, NULL);
--- 
-2.18.0
-
diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
index 63b9183026..57f55ffc8c 100644
--- a/package/squeezelite/Config.in
+++ b/package/squeezelite/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_SQUEEZELITE
 	help
 	  Logitech Media Server client
 
-	  https://code.google.com/p/squeezelite/
+	  https://github.com/ralph-irving/squeezelite/
 
 if BR2_PACKAGE_SQUEEZELITE
 
diff --git a/package/squeezelite/squeezelite.hash b/package/squeezelite/squeezelite.hash
index d56f5da665..0b21d861b9 100644
--- a/package/squeezelite/squeezelite.hash
+++ b/package/squeezelite/squeezelite.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 0c844e7714d3f15325629c59ee75e6309763116e61a6b73486b502e2e5cce5fd squeezelite-v1.8.tar.gz
-sha256 3e4379e1f34b8c5da00e545cfe94369b94a57745902c5d12be43b6332c34c04e LICENSE.txt
+sha256 7f0342f4943d3c3498d930060f5a1e8d63ccb7282b9c21f964926e310449d592 squeezelite-71c012ad9ba102feb95823b7b9dc17e5305689c7.tar.gz
+sha256 dc01c3da33fea11ed918f9e437b88baa59c70401aab0dad747e33dd9e8035706 LICENSE.txt
diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
index 3b23b103c6..012b5304ab 100644
--- a/package/squeezelite/squeezelite.mk
+++ b/package/squeezelite/squeezelite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQUEEZELITE_VERSION = v1.8
-SQUEEZELITE_SITE = $(call github,robadenshi,squeezelite,$(SQUEEZELITE_VERSION))
+SQUEEZELITE_VERSION = 71c012ad9ba102feb95823b7b9dc17e5305689c7
+SQUEEZELITE_SITE = $(call github,ralph-irving,squeezelite,$(SQUEEZELITE_VERSION))
 SQUEEZELITE_LICENSE = GPL-3.0
 SQUEEZELITE_LICENSE_FILES = LICENSE.txt
 SQUEEZELITE_DEPENDENCIES = alsa-lib flac libmad libvorbis faad2 mpg123
-- 
2.20.1
