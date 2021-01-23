From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 23:45:30 +0100
Subject: [Buildroot] [git commit] package/vorbis-tools: bump to version 1.4.2
Message-ID: <20210123222631.1B081813B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3577b64c515d1b685f008f0da442ada0e8566a0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- opusfile is an optional dependency since version 1.4.1 and
  https://github.com/xiph/vorbis-tools/commit/4e7ab1ab09d26306e8ae7a8be36f93ff8c03bc92
- Drop all patches (already in version)

https://github.com/xiph/vorbis-tools/blob/v1.4.2/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...oggenc-Fix-large-alloca-on-bad-AIFF-input.patch | 37 ---------
 ...date-count-of-channels-in-the-header-CVE-.patch | 88 ----------------------
 ...crash-on-raw-file-close-reported-by-Hanno.patch | 55 --------------
 package/vorbis-tools/vorbis-tools.hash             |  2 +-
 package/vorbis-tools/vorbis-tools.mk               | 13 ++--
 5 files changed, 6 insertions(+), 189 deletions(-)

diff --git a/package/vorbis-tools/0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch b/package/vorbis-tools/0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch
deleted file mode 100644
index 6df67869e5..0000000000
--- a/package/vorbis-tools/0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Fix CVE-2015-6749 - invalid AIFF file causes alloca() buffer overflow.
-See https://trac.xiph.org/ticket/2212
-Status: upstream
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff --git a/oggenc/audio.c b/oggenc/audio.c
-index 477da8c..4921fb9 100644
---- a/oggenc/audio.c
-+++ b/oggenc/audio.c
-@@ -245,8 +245,8 @@ static int aiff_permute_matrix[6][6] =
- int aiff_open(FILE *in, oe_enc_opt *opt, unsigned char *buf, int buflen)
- {
-     int aifc; /* AIFC or AIFF? */
--    unsigned int len;
--    unsigned char *buffer;
-+    unsigned int len, readlen;
-+    unsigned char buffer[22];
-     unsigned char buf2[8];
-     aiff_fmt format;
-     aifffile *aiff = malloc(sizeof(aifffile));
-@@ -269,9 +269,9 @@ int aiff_open(FILE *in, oe_enc_opt *opt, unsigned char *buf, int buflen)
-         return 0; /* Weird common chunk */
-     }
- 
--    buffer = alloca(len);
--
--    if(fread(buffer,1,len,in) < len)
-+    readlen = len < sizeof(buffer) ? len : sizeof(buffer);
-+    if(fread(buffer,1,readlen,in) < readlen ||
-+       (len > readlen && !seek_forward(in, len-readlen)))
-     {
-         fprintf(stderr, _("Warning: Unexpected EOF in reading AIFF header\n"));
-         return 0;
--- 
-2.5.0
-
diff --git a/package/vorbis-tools/0002-oggenc-validate-count-of-channels-in-the-header-CVE-.patch b/package/vorbis-tools/0002-oggenc-validate-count-of-channels-in-the-header-CVE-.patch
deleted file mode 100644
index 0e9cae0613..0000000000
--- a/package/vorbis-tools/0002-oggenc-validate-count-of-channels-in-the-header-CVE-.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 3bbabc06c4b35c84f6747ed850213161aca568c7 Mon Sep 17 00:00:00 2001
-From: Petter Reinholdtsen <pere@debian.org>
-Date: Tue, 22 Sep 2015 15:14:06 +0200
-Subject: [PATCH] oggenc: validate count of channels in the header
- (CVE-2014-9638 & CVE-2014-9639)
-
-Author: Kamil Dudka <kdudka@redhat.com>
-Origin: http://lists.xiph.org/pipermail/vorbis-dev/2015-February/020423.html
-Bug: https://trac.xiph.org/ticket/2136
-Bug: https://trac.xiph.org/ticket/2137
-Bug-Debian: https://bugs.debian.org/776086
-Forwarded: not-needed
-Reviewed-By: Petter Reinholdtsen <pere@hungry.com>
-Last-Update: 2015-09-22
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- oggenc/audio.c | 18 ++++++++++++++++--
- 1 file changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/oggenc/audio.c b/oggenc/audio.c
-index 4921fb9..535a704 100644
---- a/oggenc/audio.c
-+++ b/oggenc/audio.c
-@@ -13,6 +13,7 @@
- #include <config.h>
- #endif
- 
-+#include <limits.h>
- #include <stdlib.h>
- #include <stdio.h>
- #include <string.h>
-@@ -251,6 +252,7 @@ int aiff_open(FILE *in, oe_enc_opt *opt, unsigned char *buf, int buflen)
-     aiff_fmt format;
-     aifffile *aiff = malloc(sizeof(aifffile));
-     int i;
-+    long channels;
- 
-     if(buf[11]=='C')
-         aifc=1;
-@@ -277,11 +279,16 @@ int aiff_open(FILE *in, oe_enc_opt *opt, unsigned char *buf, int buflen)
-         return 0;
-     }
- 
--    format.channels = READ_U16_BE(buffer);
-+    format.channels = channels = READ_U16_BE(buffer);
-     format.totalframes = READ_U32_BE(buffer+2);
-     format.samplesize = READ_U16_BE(buffer+6);
-     format.rate = (int)read_IEEE80(buffer+8);
- 
-+    if(channels <= 0L || SHRT_MAX < channels)
-+    {
-+        fprintf(stderr, _("Warning: Unsupported count of channels in AIFF header\n"));
-+        return 0;
-+    }
-     aiff->bigendian = 1;
- 
-     if(aifc)
-@@ -416,6 +423,7 @@ int wav_open(FILE *in, oe_enc_opt *opt, unsigned char *oldbuf, int buflen)
-     wav_fmt format;
-     wavfile *wav = malloc(sizeof(wavfile));
-     int i;
-+    long channels;
- 
-     /* Ok. At this point, we know we have a WAV file. Now we have to detect
-      * whether we support the subtype, and we have to find the actual data
-@@ -453,12 +461,18 @@ int wav_open(FILE *in, oe_enc_opt *opt, unsigned char *oldbuf, int buflen)
-     }
- 
-     format.format =      READ_U16_LE(buf);
--    format.channels =    READ_U16_LE(buf+2);
-+    format.channels = channels = READ_U16_LE(buf+2);
-     format.samplerate =  READ_U32_LE(buf+4);
-     format.bytespersec = READ_U32_LE(buf+8);
-     format.align =       READ_U16_LE(buf+12);
-     format.samplesize =  READ_U16_LE(buf+14);
- 
-+    if(channels <= 0L || SHRT_MAX < channels)
-+    {
-+        fprintf(stderr, _("Warning: Unsupported count of channels in WAV header\n"));
-+        return 0;
-+    }
-+
-     if(format.format == -2) /* WAVE_FORMAT_EXTENSIBLE */
-     {
-       if(len<40)
--- 
-2.20.1
-
diff --git a/package/vorbis-tools/0003-oggenc-fix-crash-on-raw-file-close-reported-by-Hanno.patch b/package/vorbis-tools/0003-oggenc-fix-crash-on-raw-file-close-reported-by-Hanno.patch
deleted file mode 100644
index e245e1534c..0000000000
--- a/package/vorbis-tools/0003-oggenc-fix-crash-on-raw-file-close-reported-by-Hanno.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 514116d7bea89dad9f1deb7617b2277b5e9115cd Mon Sep 17 00:00:00 2001
-From: Gregory Maxwell <greg@xiph.org>
-Date: Wed, 16 Apr 2014 23:55:10 +0000
-Subject: [PATCH] oggenc: fix crash on raw file close, reported by Hanno in
- issue #2009. pointer to a non-static struct was escaping its scope. Also fix
- a C99-ism.
-
-svn path=/trunk/vorbis-tools/; revision=19117
-
-Fixes CVE-2014-9640
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- oggenc/oggenc.c   | 4 ++--
- oggenc/skeleton.h | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/oggenc/oggenc.c b/oggenc/oggenc.c
-index 4a120f3..e7de0bb 100644
---- a/oggenc/oggenc.c
-+++ b/oggenc/oggenc.c
-@@ -97,6 +97,8 @@ int main(int argc, char **argv)
-               .3,-1,
-               0,0,0.f,
-               0, 0, 0, 0, 0};
-+    input_format raw_format = {NULL, 0, raw_open, wav_close, "raw", 
-+      N_("RAW file reader")};
- 
-     int i;
- 
-@@ -239,8 +241,6 @@ int main(int argc, char **argv)
- 
-         if(opt.rawmode)
-         {
--            input_format raw_format = {NULL, 0, raw_open, wav_close, "raw", 
--                N_("RAW file reader")};
- 
-             enc_opts.rate=opt.raw_samplerate;
-             enc_opts.channels=opt.raw_channels;
-diff --git a/oggenc/skeleton.h b/oggenc/skeleton.h
-index cf87dc2..168b8b6 100644
---- a/oggenc/skeleton.h
-+++ b/oggenc/skeleton.h
-@@ -41,7 +41,7 @@ typedef struct {
-     ogg_int64_t granule_rate_d;                            /* granule rate denominator */
-     ogg_int64_t start_granule;                             /* start granule value */
-     ogg_uint32_t preroll;                                   /* preroll */
--    unsigned char granule_shift; // a 8-bit field           /* 1 byte value holding the granule shift */
-+    unsigned char granule_shift;                            /* 1 byte value holding the granule shift */
-     char *message_header_fields;                            /* holds all the message header fields */
-     /* current total size of the message header fields, for realloc purpose, initially zero */
-     ogg_uint32_t current_header_size;
--- 
-2.20.1
-
diff --git a/package/vorbis-tools/vorbis-tools.hash b/package/vorbis-tools/vorbis-tools.hash
index 76122be13f..a4f463e466 100644
--- a/package/vorbis-tools/vorbis-tools.hash
+++ b/package/vorbis-tools/vorbis-tools.hash
@@ -1,4 +1,4 @@
 # From http://downloads.xiph.org/releases/vorbis/SHA256SUMS
-sha256  a389395baa43f8e5a796c99daf62397e435a7e73531c9f44d9084055a05d22bc  vorbis-tools-1.4.0.tar.gz
+sha256  db7774ec2bf2c939b139452183669be84fda5774d6400fc57fde37f77624f0b0  vorbis-tools-1.4.2.tar.gz
 # Locally computed
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/vorbis-tools/vorbis-tools.mk b/package/vorbis-tools/vorbis-tools.mk
index 49d7e26064..936d2d816c 100644
--- a/package/vorbis-tools/vorbis-tools.mk
+++ b/package/vorbis-tools/vorbis-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VORBIS_TOOLS_VERSION = 1.4.0
+VORBIS_TOOLS_VERSION = 1.4.2
 VORBIS_TOOLS_SITE = http://downloads.xiph.org/releases/vorbis
 VORBIS_TOOLS_LICENSE = GPL-2.0
 VORBIS_TOOLS_LICENSE_FILES = COPYING
@@ -12,13 +12,6 @@ VORBIS_TOOLS_CPE_ID_VENDOR = xiph
 VORBIS_TOOLS_DEPENDENCIES = libao libogg libvorbis libcurl
 VORBIS_TOOLS_CONF_OPTS = --program-transform-name=''
 
-# 0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch
-VORBIS_TOOLS_IGNORE_CVES += CVE-2015-6749
-# 0002-oggenc-validate-count-of-channels-in-the-header-CVE-.patch
-VORBIS_TOOLS_IGNORE_CVES += CVE-2014-9638 CVE-2014-9639
-# 0003-oggenc-fix-crash-on-raw-file-close-reported-by-Hanno.patch
-VORBIS_TOOLS_IGNORE_CVES += CVE-2014-9640
-
 # ogg123 calls math functions but forgets to link with libm
 VORBIS_TOOLS_CONF_ENV = LIBS=-lm
 
@@ -26,6 +19,10 @@ ifeq ($(BR2_PACKAGE_FLAC),y)
 VORBIS_TOOLS_DEPENDENCIES += flac
 endif
 
+ifeq ($(BR2_PACKAGE_OPUSFILE),y)
+VORBIS_TOOLS_DEPENDENCIES += opusfile
+endif
+
 ifeq ($(BR2_PACKAGE_SPEEX),y)
 VORBIS_TOOLS_DEPENDENCIES += speex
 endif
