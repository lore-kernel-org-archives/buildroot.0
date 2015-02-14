From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 22:02:29 +0100
Subject: [Buildroot] [git commit] mplayer: fix compilation with new versions
	of libgif
Message-ID: <20150214210234.1091D8045D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f87f3d139637410b0c418926795883509490d9af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mplayer fails to compile with the following error message:

libmpdemux/demux_gif.c: In function 'demux_open_gif':
libmpdemux/demux_gif.c:260:3: error: too few arguments to function
'DGifOpen'
   gif = DGifOpen(demuxer->stream, my_read_gif);

Backport an upstream patch to support newer versions of libgif in
mplayer. Unfortunately this patch is incomplete and mplayer stills
failing to compile with a new error message:

libvo/vo_gif89a.c: In function 'uninit':
libvo/vo_gif89a.c:374:3: error: too few arguments to function
'EGifCloseFile'
   EGifCloseFile(new_gif); // also frees gif storage space.

So I have written a new patch and submitted it upstream to finally fix
the problem.

Upstream commit:

  https://github.com/pigoz/mplayer-svn/commit/a0ddaef5457e222dade386901bf448c5e3ac7b89

New submitted patch:

  https://lists.mplayerhq.hu/pipermail/mplayer-dev-eng/2015-February/072848.html

Fixes:

  http://autobuild.buildroot.net/results/a51/a510a0ab2cb827bb91b4fdec43055f2bfda239b1/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0005-Support-newer-GIFLIB-versions.patch       |  268 ++++++++++++++++++++
 .../0006-Support-newer-GIFLIB-versions-part2.patch |   44 ++++
 2 files changed, 312 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/0005-Support-newer-GIFLIB-versions.patch b/package/mplayer/0005-Support-newer-GIFLIB-versions.patch
new file mode 100644
index 0000000..a439489
--- /dev/null
+++ b/package/mplayer/0005-Support-newer-GIFLIB-versions.patch
@@ -0,0 +1,268 @@
+Support newer GIFLIB versions
+
+This is an adapted upstream patch. This patch is incomplete so a new
+patch needs to be added after this one.
+
+Upstream commit:
+
+   https://github.com/pigoz/mplayer-svn/commit/a0ddaef5457e222dade386901bf448c5e3ac7b89
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From a0ddaef5457e222dade386901bf448c5e3ac7b89 Mon Sep 17 00:00:00 2001
+From: al <al@b3059339-0415-0410-9bf9-f77b7e298cf2>
+Date: Sat, 27 Jul 2013 21:16:06 +0000
+Subject: [PATCH] Support newer GIFLIB versions
+
+Work with GIFLIB version >= 4.2
+
+Several functions have been renamed or changed in signature.
+
+GIFLIB is used by vo gif89a and demuxer gif.
+
+Note about GIFLIB Version 4.2:
+It does not work with vanilla GIFLIB 4.2 but it works with
+versions that have re-added quantize support like e.g. the
+package from arch linux.
+
+Note about GIFLIB Version 5:
+The newly added GCB functions use size_t but the necessary
+standard headers are not included in gif_lib.h . To workaround
+this:
+
+* configure: use statement_check_broken to include stdlib.h
+* vo gif89: include gif_lib.h after stdlib.h
+* demuxer gif: no workaround needed,
+               gif_lib.h is already included after stdlib.h
+
+
+
+git-svn-id: svn://svn.mplayerhq.hu/mplayer/trunk at 36367 b3059339-0415-0410-9bf9-f77b7e298cf2
+---
+ configure              |    1 +
+ libmpdemux/demux_gif.c |   44 +++++++++++++++++++++++++++++++++++---------
+ libvo/vo_gif89a.c      |   35 ++++++++++++++++++++++++-----------
+ 3 files changed, 61 insertions(+), 21 deletions(-)
+
+diff --git a/configure b/configure
+index e9152a8..4cd378d 100755
+--- a/configure
++++ b/configure
+@@ -4938,6 +4938,7 @@ if test "$_gif" = auto ; then
+   _gif=no
+   for ld_gif in "-lungif" "-lgif" ; do
+     statement_check gif_lib.h 'QuantizeBuffer(0, 0, 0, 0, 0, 0, 0, 0)' $ld_gif && _gif=yes && break
++    statement_check_broken stdlib.h gif_lib.h 'GifQuantizeBuffer(0, 0, 0, 0, 0, 0, 0, 0)' $ld_gif && _gif=yes && break
+   done
+ fi
+ 
+ 
+diff --git a/libmpdemux/demux_gif.c b/libmpdemux/demux_gif.c
+index 804ce8c..0a11322 100644
+--- a/libmpdemux/demux_gif.c
++++ b/libmpdemux/demux_gif.c
+@@ -45,6 +45,32 @@ typedef struct {
+ 
+ #define GIF_SIGNATURE (('G' << 16) | ('I' << 8) | 'F')
+ 
++#if defined GIFLIB_MAJOR && GIFLIB_MAJOR >= 5
++#define DGifOpen(a, b) DGifOpen(a, b, NULL)
++#define DGifOpenFileHandle(a) DGifOpenFileHandle(a, NULL)
++#define GifError() (gif ? gif->Error : 0)
++#define GifErrorString() GifErrorString(gif->Error)
++#endif
++
++/* >= 4.2 prior GIFLIB did not have MAJOR/MINOR defines */
++#if defined GIFLIB_MAJOR && GIFLIB_MAJOR >= 4
++static void print_gif_error(GifFileType *gif)
++{
++  int err = GifError();
++  char *err_str = GifErrorString();
++
++  if (err_str)
++    mp_msg(MSGT_DEMUX, MSGL_ERR, "\n[gif] GIF-LIB error: %s.\n", err_str);
++  else
++    mp_msg(MSGT_DEMUX, MSGL_ERR, "\n[gif] GIF-LIB undefined error %d.\n", err);
++}
++#else
++static void print_gif_error(GifFileType *gif)
++{
++  PrintGifError();
++}
++#endif
++
+ #ifndef CONFIG_GIF_TVT_HACK
+ // not supported by certain versions of the library
+ static int my_read_gif(GifFileType *gif, uint8_t *buf, int len)
+@@ -94,14 +120,14 @@ static int demux_gif_fill_buffer(demuxer_t *demuxer, demux_stream_t *ds)
+ 
+   while (type != IMAGE_DESC_RECORD_TYPE) {
+     if (DGifGetRecordType(gif, &type) == GIF_ERROR) {
+-      PrintGifError();
++      print_gif_error(priv->gif);
+       return 0; // oops
+     }
+     if (type == TERMINATE_RECORD_TYPE)
+       return 0; // eof
+     if (type == SCREEN_DESC_RECORD_TYPE) {
+       if (DGifGetScreenDesc(gif) == GIF_ERROR) {
+-        PrintGifError();
++        print_gif_error(priv->gif);
+         return 0; // oops
+       }
+     }
+@@ -109,7 +135,7 @@ static int demux_gif_fill_buffer(demuxer_t *demuxer, demux_stream_t *ds)
+       int code;
+       unsigned char *p = NULL;
+       if (DGifGetExtension(gif, &code, &p) == GIF_ERROR) {
+-        PrintGifError();
++        print_gif_error(priv->gif);
+         return 0; // oops
+       }
+       if (code == 0xF9) {
+@@ -138,7 +164,7 @@ static int demux_gif_fill_buffer(demuxer_t *demuxer, demux_stream_t *ds)
+ 	  comments[length] = 0;
+ 	  printf("%s", comments);
+           if (DGifGetExtensionNext(gif, &p) == GIF_ERROR) {
+-            PrintGifError();
++            print_gif_error(priv->gif);
+             return 0; // oops
+           }
+ 	}
+@@ -146,7 +172,7 @@ static int demux_gif_fill_buffer(demuxer_t *demuxer, demux_stream_t *ds)
+       }
+       while (p != NULL) {
+         if (DGifGetExtensionNext(gif, &p) == GIF_ERROR) {
+-          PrintGifError();
++          print_gif_error(priv->gif);
+           return 0; // oops
+         }
+       }
+@@ -154,7 +180,7 @@ static int demux_gif_fill_buffer(demuxer_t *demuxer, demux_stream_t *ds)
+   }
+ 
+   if (DGifGetImageDesc(gif) == GIF_ERROR) {
+-    PrintGifError();
++    print_gif_error(priv->gif);
+     return 0; // oops
+   }
+ 
+@@ -167,7 +193,7 @@ static int demux_gif_fill_buffer(demuxer_t *demuxer, demux_stream_t *ds)
+     memset(dp->buffer, gif->SBackGroundColor, priv->w * priv->h);
+ 
+   if (DGifGetLine(gif, buf, len) == GIF_ERROR) {
+-    PrintGifError();
++    print_gif_error(priv->gif);
+     free(buf);
+     free_demux_packet(dp);
+     return 0; // oops
+@@ -261,7 +287,7 @@ static demuxer_t* demux_open_gif(demuxer_t* demuxer)
+   gif = DGifOpen(demuxer->stream, my_read_gif);
+ #endif
+   if (!gif) {
+-    PrintGifError();
++    print_gif_error(NULL);
+     free(priv);
+     return NULL;
+   }
+@@ -303,7 +329,7 @@ static void demux_close_gif(demuxer_t* demuxer)
+   gif_priv_t *priv = demuxer->priv;
+   if (!priv) return;
+   if (priv->gif && DGifCloseFile(priv->gif) == GIF_ERROR)
+-    PrintGifError();
++    print_gif_error(priv->gif);
+   free(priv->refimg);
+   free(priv);
+ }
+diff --git a/libvo/vo_gif89a.c b/libvo/vo_gif89a.c
+index b808f81..160291a 100644
+--- a/libvo/vo_gif89a.c
++++ b/libvo/vo_gif89a.c
+@@ -44,13 +44,13 @@
+  * entire argument being interpretted as the filename.
+  */
+ 
+-#include <gif_lib.h>
+-
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <unistd.h>
+ 
++#include <gif_lib.h>
++
+ #include "config.h"
+ #include "subopt-helper.h"
+ #include "video_out.h"
+@@ -69,6 +69,12 @@ static const vo_info_t info = {
+ 
+ const LIBVO_EXTERN(gif89a)
+ 
++#if defined GIFLIB_MAJOR && GIFLIB_MAJOR >= 5
++#define EGifOpenFileName(a, b) EGifOpenFileName(a, b, NULL)
++#define MakeMapObject GifMakeMapObject
++#define FreeMapObject GifFreeMapObject
++#define QuantizeBuffer GifQuantizeBuffer
++#endif
+ 
+ // how many frames per second we are aiming for during output.
+ static float target_fps;
+@@ -156,7 +162,7 @@ static int config(uint32_t s_width, uint32_t s_height, uint32_t d_width,
+ 		uint32_t d_height, uint32_t flags, char *title,
+ 		uint32_t format)
+ {
+-#ifdef CONFIG_GIF_4
++#if defined CONFIG_GIF_4 || GIFLIB_MAJOR >= 5
+ 	// these are control blocks for the gif looping extension.
+ 	char LB1[] = "NETSCAPE2.0";
+ 	char LB2[] = { 1, 0, 0 };
+@@ -185,23 +191,25 @@ static int config(uint32_t s_width, uint32_t s_height, uint32_t d_width,
+ 		return 1;
+ 	}
+ 
++	new_gif = EGifOpenFileName(gif_filename, 0);
++	if (new_gif == NULL) {
++		mp_msg(MSGT_VO, MSGL_ERR, "GIF89a: error opening file \"%s\" for output.\n", gif_filename);
++		return 1;
++	}
++
++#if defined GIFLIB_MAJOR && GIFLIB_MAJOR >= 5
++	EGifSetGifVersion(new_gif, 1);
++#elif defined CONFIG_GIF_4
+ 	// the EGifSetGifVersion line causes segfaults in certain
+ 	// earlier versions of libungif.  i don't know exactly which,
+ 	// but certainly in all those before v4.  if you have problems,
+ 	// you need to upgrade your gif library.
+-#ifdef CONFIG_GIF_4
+ 	EGifSetGifVersion("89a");
+ #else
+ 	mp_msg(MSGT_VO, MSGL_ERR, "GIF89a: Your version of libungif needs to be upgraded.\n");
+ 	mp_msg(MSGT_VO, MSGL_ERR, "GIF89a: Some functionality has been disabled.\n");
+ #endif
+ 
+-	new_gif = EGifOpenFileName(gif_filename, 0);
+-	if (new_gif == NULL) {
+-		mp_msg(MSGT_VO, MSGL_ERR, "GIF89a: error opening file \"%s\" for output.\n", gif_filename);
+-		return 1;
+-	}
+-
+ 	slice_data = malloc(img_width * img_height * 3);
+ 	if (slice_data == NULL) {
+ 		mp_msg(MSGT_VO, MSGL_ERR, "GIF89a: malloc failed.\n");
+@@ -231,7 +239,12 @@ static int config(uint32_t s_width, uint32_t s_height, uint32_t d_width,
+ 
+ 	// set the initial width and height info.
+ 	EGifPutScreenDesc(new_gif, s_width, s_height, 256, 0, reduce_cmap);
+-#ifdef CONFIG_GIF_4
++#if defined GIFLIB_MAJOR && GIFLIB_MAJOR >= 5
++	EGifPutExtensionLeader(new_gif, 0xFF);
++	EGifPutExtensionBlock(new_gif, 11, LB1);
++	EGifPutExtensionBlock(new_gif, 3, LB2);
++	EGifPutExtensionTrailer(new_gif);
++#elif defined CONFIG_GIF_4
+ 	// version 3 of libungif does not support multiple control blocks.
+ 	// looping requires multiple control blocks.
+ 	// therefore, looping is only enabled for v4 and up.
+-- 
+1.7.1
+
diff --git a/package/mplayer/0006-Support-newer-GIFLIB-versions-part2.patch b/package/mplayer/0006-Support-newer-GIFLIB-versions-part2.patch
new file mode 100644
index 0000000..271dce8
--- /dev/null
+++ b/package/mplayer/0006-Support-newer-GIFLIB-versions-part2.patch
@@ -0,0 +1,44 @@
+Support newer GIFLIB versions - Part 2
+
+Adding another patch to fix the problem with new versions of libgif.
+This patch has been sent upstream:
+
+  https://lists.mplayerhq.hu/pipermail/mplayer-dev-eng/2015-February/072848.html
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+Support newer GIFLIB versions - Part 2
+
+This patch is necessary because the previous upstream patch is
+incomplete. Without this one, MPlayer will fail to compile displaying
+an error message like this one:
+
+libvo/vo_gif89a.c: In function 'uninit':
+libvo/vo_gif89a.c:374:3: error: too few arguments to function 'EGifCloseFile'
+   EGifCloseFile(new_gif); // also frees gif storage space.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+
+diff -rup a/libmpdemux/demux_gif.c b/libmpdemux/demux_gif.c
+--- a/libmpdemux/demux_gif.c	2015-02-13 15:39:56.582310414 +0000
++++ b/libmpdemux/demux_gif.c	2015-02-13 15:48:06.396837922 +0000
+@@ -48,6 +48,7 @@ typedef struct {
+ #if defined GIFLIB_MAJOR && GIFLIB_MAJOR >= 5
+ #define DGifOpen(a, b) DGifOpen(a, b, NULL)
+ #define DGifOpenFileHandle(a) DGifOpenFileHandle(a, NULL)
++#define DGifCloseFile(a) DGifCloseFile(a, NULL)
+ #define GifError() (gif ? gif->Error : 0)
+ #define GifErrorString() GifErrorString(gif->Error)
+ #endif
+diff -rup a/libvo/vo_gif89a.c b/libvo/vo_gif89a.c
+--- a/libvo/vo_gif89a.c	2015-02-13 15:39:56.631311186 +0000
++++ b/libvo/vo_gif89a.c	2015-02-13 15:45:25.392168294 +0000
+@@ -71,6 +71,7 @@ const LIBVO_EXTERN(gif89a)
+ 
+ #if defined GIFLIB_MAJOR && GIFLIB_MAJOR >= 5
+ #define EGifOpenFileName(a, b) EGifOpenFileName(a, b, NULL)
++#define EGifCloseFile(a) EGifCloseFile(a, NULL)
+ #define MakeMapObject GifMakeMapObject
+ #define FreeMapObject GifFreeMapObject
+ #define QuantizeBuffer GifQuantizeBuffer
