From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 21:54:32 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/vorbis-tools: add
 upstream security fixes for CVE-2014-96{38, 39, 40}
Message-ID: <20200310204256.2A63F90830@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61fa19d801736f0e50d5900a0405f67e31ad023f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerabilities:

- CVE-2014-9638: oggenc in vorbis-tools 1.4.0 allows remote attackers to
  cause a denial of service (divide-by-zero error and crash) via a WAV file
  with the number of channels set to zero.

- CVE-2014-9639: Integer overflow in oggenc in vorbis-tools 1.4.0 allows
  remote attackers to cause a denial of service (crash) via a crafted number
  of channels in a WAV file, which triggers an out-of-bounds memory access.

- CVE-2014-9640: oggenc/oggenc.c in vorbis-tools 1.4.0 allows remote
  attackers to cause a denial of service (out-of-bounds read) via a crafted
  raw file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fd43037c8c447b6761250b6dcbd4b7dfaa4d4425)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...date-count-of-channels-in-the-header-CVE-.patch | 88 ++++++++++++++++++++++
 ...crash-on-raw-file-close-reported-by-Hanno.patch | 55 ++++++++++++++
 2 files changed, 143 insertions(+)

diff --git a/package/vorbis-tools/0002-oggenc-validate-count-of-channels-in-the-header-CVE-.patch b/package/vorbis-tools/0002-oggenc-validate-count-of-channels-in-the-header-CVE-.patch
new file mode 100644
index 0000000000..0e9cae0613
--- /dev/null
+++ b/package/vorbis-tools/0002-oggenc-validate-count-of-channels-in-the-header-CVE-.patch
@@ -0,0 +1,88 @@
+From 3bbabc06c4b35c84f6747ed850213161aca568c7 Mon Sep 17 00:00:00 2001
+From: Petter Reinholdtsen <pere@debian.org>
+Date: Tue, 22 Sep 2015 15:14:06 +0200
+Subject: [PATCH] oggenc: validate count of channels in the header
+ (CVE-2014-9638 & CVE-2014-9639)
+
+Author: Kamil Dudka <kdudka@redhat.com>
+Origin: http://lists.xiph.org/pipermail/vorbis-dev/2015-February/020423.html
+Bug: https://trac.xiph.org/ticket/2136
+Bug: https://trac.xiph.org/ticket/2137
+Bug-Debian: https://bugs.debian.org/776086
+Forwarded: not-needed
+Reviewed-By: Petter Reinholdtsen <pere@hungry.com>
+Last-Update: 2015-09-22
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ oggenc/audio.c | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/oggenc/audio.c b/oggenc/audio.c
+index 4921fb9..535a704 100644
+--- a/oggenc/audio.c
++++ b/oggenc/audio.c
+@@ -13,6 +13,7 @@
+ #include <config.h>
+ #endif
+ 
++#include <limits.h>
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -251,6 +252,7 @@ int aiff_open(FILE *in, oe_enc_opt *opt, unsigned char *buf, int buflen)
+     aiff_fmt format;
+     aifffile *aiff = malloc(sizeof(aifffile));
+     int i;
++    long channels;
+ 
+     if(buf[11]=='C')
+         aifc=1;
+@@ -277,11 +279,16 @@ int aiff_open(FILE *in, oe_enc_opt *opt, unsigned char *buf, int buflen)
+         return 0;
+     }
+ 
+-    format.channels = READ_U16_BE(buffer);
++    format.channels = channels = READ_U16_BE(buffer);
+     format.totalframes = READ_U32_BE(buffer+2);
+     format.samplesize = READ_U16_BE(buffer+6);
+     format.rate = (int)read_IEEE80(buffer+8);
+ 
++    if(channels <= 0L || SHRT_MAX < channels)
++    {
++        fprintf(stderr, _("Warning: Unsupported count of channels in AIFF header\n"));
++        return 0;
++    }
+     aiff->bigendian = 1;
+ 
+     if(aifc)
+@@ -416,6 +423,7 @@ int wav_open(FILE *in, oe_enc_opt *opt, unsigned char *oldbuf, int buflen)
+     wav_fmt format;
+     wavfile *wav = malloc(sizeof(wavfile));
+     int i;
++    long channels;
+ 
+     /* Ok. At this point, we know we have a WAV file. Now we have to detect
+      * whether we support the subtype, and we have to find the actual data
+@@ -453,12 +461,18 @@ int wav_open(FILE *in, oe_enc_opt *opt, unsigned char *oldbuf, int buflen)
+     }
+ 
+     format.format =      READ_U16_LE(buf);
+-    format.channels =    READ_U16_LE(buf+2);
++    format.channels = channels = READ_U16_LE(buf+2);
+     format.samplerate =  READ_U32_LE(buf+4);
+     format.bytespersec = READ_U32_LE(buf+8);
+     format.align =       READ_U16_LE(buf+12);
+     format.samplesize =  READ_U16_LE(buf+14);
+ 
++    if(channels <= 0L || SHRT_MAX < channels)
++    {
++        fprintf(stderr, _("Warning: Unsupported count of channels in WAV header\n"));
++        return 0;
++    }
++
+     if(format.format == -2) /* WAVE_FORMAT_EXTENSIBLE */
+     {
+       if(len<40)
+-- 
+2.20.1
+
diff --git a/package/vorbis-tools/0003-oggenc-fix-crash-on-raw-file-close-reported-by-Hanno.patch b/package/vorbis-tools/0003-oggenc-fix-crash-on-raw-file-close-reported-by-Hanno.patch
new file mode 100644
index 0000000000..e245e1534c
--- /dev/null
+++ b/package/vorbis-tools/0003-oggenc-fix-crash-on-raw-file-close-reported-by-Hanno.patch
@@ -0,0 +1,55 @@
+From 514116d7bea89dad9f1deb7617b2277b5e9115cd Mon Sep 17 00:00:00 2001
+From: Gregory Maxwell <greg@xiph.org>
+Date: Wed, 16 Apr 2014 23:55:10 +0000
+Subject: [PATCH] oggenc: fix crash on raw file close, reported by Hanno in
+ issue #2009. pointer to a non-static struct was escaping its scope. Also fix
+ a C99-ism.
+
+svn path=/trunk/vorbis-tools/; revision=19117
+
+Fixes CVE-2014-9640
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ oggenc/oggenc.c   | 4 ++--
+ oggenc/skeleton.h | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/oggenc/oggenc.c b/oggenc/oggenc.c
+index 4a120f3..e7de0bb 100644
+--- a/oggenc/oggenc.c
++++ b/oggenc/oggenc.c
+@@ -97,6 +97,8 @@ int main(int argc, char **argv)
+               .3,-1,
+               0,0,0.f,
+               0, 0, 0, 0, 0};
++    input_format raw_format = {NULL, 0, raw_open, wav_close, "raw", 
++      N_("RAW file reader")};
+ 
+     int i;
+ 
+@@ -239,8 +241,6 @@ int main(int argc, char **argv)
+ 
+         if(opt.rawmode)
+         {
+-            input_format raw_format = {NULL, 0, raw_open, wav_close, "raw", 
+-                N_("RAW file reader")};
+ 
+             enc_opts.rate=opt.raw_samplerate;
+             enc_opts.channels=opt.raw_channels;
+diff --git a/oggenc/skeleton.h b/oggenc/skeleton.h
+index cf87dc2..168b8b6 100644
+--- a/oggenc/skeleton.h
++++ b/oggenc/skeleton.h
+@@ -41,7 +41,7 @@ typedef struct {
+     ogg_int64_t granule_rate_d;                            /* granule rate denominator */
+     ogg_int64_t start_granule;                             /* start granule value */
+     ogg_uint32_t preroll;                                   /* preroll */
+-    unsigned char granule_shift; // a 8-bit field           /* 1 byte value holding the granule shift */
++    unsigned char granule_shift;                            /* 1 byte value holding the granule shift */
+     char *message_header_fields;                            /* holds all the message header fields */
+     /* current total size of the message header fields, for realloc purpose, initially zero */
+     ogg_uint32_t current_header_size;
+-- 
+2.20.1
+
