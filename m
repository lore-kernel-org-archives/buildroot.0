From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 6 Oct 2015 14:42:54 +0100
Subject: [Buildroot] [PATCH] mplayer: bump to version 1.2
Message-ID: <1444138974-30218-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump to version 1.2
- Update hash file.
- Remove no longer existent configure options:
  --disable-dvdread-internal, --disable-tremor-internal.
- Tweak 0001-disable-install-strip.patch.
- Remove 0002-fix-cc-parsing.patch. Upstreamed:
  https://github.com/pigoz/mplayer-svn/commit/0f3ddfe146b8b2c6fe9302017375ef6b30ffbe71
- Remove 0004-add-arc-support.patch. Upstreamed:
  https://github.com/pigoz/mplayer-svn/commit/3b8c5f22313a416b24dcc4e7facde0a886352a75
- Remove 0005-Support-newer-GIFLIB-versions.patch. Upstreamed:
  https://github.com/pigoz/mplayer-svn/commit/a0ddaef5457e222dade386901bf448c5e3ac7b89
- Remove 0006-Support-newer-GIFLIB-versions-part2.patch. Upstreamed:
  https://github.com/pigoz/mplayer-svn/commit/a43d259602723d92db1463b166739fb8d22c2d51
- Remove 0007-mplayer-enable-aarch64.patch. Upstreamed:
  https://github.com/pigoz/mplayer-svn/commit/1cceebf1fa0cc1b27429e937f1cfa61c406f9159
- Rename 0003-mpdemux-live555-async-interface.patch to
  0002-mpdemux-live555-async-interface.patch.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/mplayer/0001-disable-install-strip.patch   |   21 +-
 package/mplayer/0002-fix-cc-parsing.patch          |   22 --
 ... => 0002-mpdemux-live555-async-interface.patch} |    0
 package/mplayer/0004-add-arc-support.patch         |   13 -
 .../0005-Support-newer-GIFLIB-versions.patch       |  268 --------------------
 .../0006-Support-newer-GIFLIB-versions-part2.patch |   44 ----
 package/mplayer/0007-mplayer-enable-aarch64.patch  |   22 --
 package/mplayer/mplayer.hash                       |    8 +-
 package/mplayer/mplayer.mk                         |    5 +-
 9 files changed, 16 insertions(+), 387 deletions(-)
 delete mode 100644 package/mplayer/0002-fix-cc-parsing.patch
 rename package/mplayer/{0003-mpdemux-live555-async-interface.patch => 0002-mpdemux-live555-async-interface.patch} (100%)
 delete mode 100644 package/mplayer/0004-add-arc-support.patch
 delete mode 100644 package/mplayer/0005-Support-newer-GIFLIB-versions.patch
 delete mode 100644 package/mplayer/0006-Support-newer-GIFLIB-versions-part2.patch
 delete mode 100644 package/mplayer/0007-mplayer-enable-aarch64.patch

diff --git a/package/mplayer/0001-disable-install-strip.patch b/package/mplayer/0001-disable-install-strip.patch
index 644d292..1bd1dc0 100644
--- a/package/mplayer/0001-disable-install-strip.patch
+++ b/package/mplayer/0001-disable-install-strip.patch
@@ -4,21 +4,20 @@ Using the -s option of install does not work, as it uses the host
 strip instead of the cross strip. So, get rid of it, and let Buildroot
 handle the stripping.
 
+[Vincent: tweak patch for version 1.2]
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 
-Index: mplayer-32710/configure
-===================================================================
---- mplayer-32710.orig/configure
-+++ mplayer-32710/configure
-@@ -2519,7 +2519,7 @@
+diff -Nrua a/configure b/configure
+--- a/configure	2015-10-02 21:29:04.000000000 +0100
++++ b/configure	2015-10-06 13:28:37.245349592 +0100
+@@ -2780,7 +2780,7 @@
  
  
  # Checking for CFLAGS
 -_install_strip="-s"
 +_install_strip=
- if test "$_profile" != "" || test "$_debug" != "" ; then
-   CFLAGS="-O2 $_march $_mcpu $_pipe $_debug $_profile"
-   WARNFLAGS="-W -Wall"
+ if test -z "$CFLAGS" || test "$_profile" != "" || test "$_debug" != ""; then
+   if test "$cc_vendor" = "intel" ; then
+     CFLAGS="-O2 $_march $_mcpu $_pipe -fomit-frame-pointer"
diff --git a/package/mplayer/0002-fix-cc-parsing.patch b/package/mplayer/0002-fix-cc-parsing.patch
deleted file mode 100644
index a3ba03f..0000000
--- a/package/mplayer/0002-fix-cc-parsing.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-[PATCH] mplayer: fix --cc= parsing if the value contains equal signs (=)
-
-E.G. if -cc="$CROSS-gcc --sysroot=<SYSROOT>" is passed.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- configure |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: mplayer-32710/configure
-===================================================================
---- mplayer-32710.orig/configure
-+++ mplayer-32710/configure
-@@ -870,7 +870,7 @@
-     _target=$(echo $ac_option | cut -d '=' -f 2)
-     ;;
-   --cc=*)
--    _cc=$(echo $ac_option | cut -d '=' -f 2)
-+    _cc=$(echo $ac_option | cut -d '=' -f 2-)
-     ;;
-   --host-cc=*)
-     _host_cc=$(echo $ac_option | cut -d '=' -f 2)
diff --git a/package/mplayer/0003-mpdemux-live555-async-interface.patch b/package/mplayer/0002-mpdemux-live555-async-interface.patch
similarity index 100%
rename from package/mplayer/0003-mpdemux-live555-async-interface.patch
rename to package/mplayer/0002-mpdemux-live555-async-interface.patch
diff --git a/package/mplayer/0004-add-arc-support.patch b/package/mplayer/0004-add-arc-support.patch
deleted file mode 100644
index c14ef23..0000000
--- a/package/mplayer/0004-add-arc-support.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- mplayer-1.1/configure	2013-12-03 00:32:10.815571460 -0800
-+++ mplayer-1.1-arc/configure	2013-11-29 00:34:29.238297709 -0800
-@@ -2492,6 +2492,10 @@
-   generic)
-     arch='generic'
-     ;;
-+  arc)
-+    arch='arc'
-+    iproc='arc'
-+    ;;
- 
-   *)
-     echo "The architecture of your CPU ($host_arch) is not supported by this configure script"
diff --git a/package/mplayer/0005-Support-newer-GIFLIB-versions.patch b/package/mplayer/0005-Support-newer-GIFLIB-versions.patch
deleted file mode 100644
index a439489..0000000
--- a/package/mplayer/0005-Support-newer-GIFLIB-versions.patch
+++ /dev/null
@@ -1,268 +0,0 @@
-Support newer GIFLIB versions
-
-This is an adapted upstream patch. This patch is incomplete so a new
-patch needs to be added after this one.
-
-Upstream commit:
-
-   https://github.com/pigoz/mplayer-svn/commit/a0ddaef5457e222dade386901bf448c5e3ac7b89
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From a0ddaef5457e222dade386901bf448c5e3ac7b89 Mon Sep 17 00:00:00 2001
-From: al <al@b3059339-0415-0410-9bf9-f77b7e298cf2>
-Date: Sat, 27 Jul 2013 21:16:06 +0000
-Subject: [PATCH] Support newer GIFLIB versions
-
-Work with GIFLIB version >= 4.2
-
-Several functions have been renamed or changed in signature.
-
-GIFLIB is used by vo gif89a and demuxer gif.
-
-Note about GIFLIB Version 4.2:
-It does not work with vanilla GIFLIB 4.2 but it works with
-versions that have re-added quantize support like e.g. the
-package from arch linux.
-
-Note about GIFLIB Version 5:
-The newly added GCB functions use size_t but the necessary
-standard headers are not included in gif_lib.h . To workaround
-this:
-
-* configure: use statement_check_broken to include stdlib.h
-* vo gif89: include gif_lib.h after stdlib.h
-* demuxer gif: no workaround needed,
-               gif_lib.h is already included after stdlib.h
-
-
-
-git-svn-id: svn://svn.mplayerhq.hu/mplayer/trunk at 36367 b3059339-0415-0410-9bf9-f77b7e298cf2
----
- configure              |    1 +
- libmpdemux/demux_gif.c |   44 +++++++++++++++++++++++++++++++++++---------
- libvo/vo_gif89a.c      |   35 ++++++++++++++++++++++++-----------
- 3 files changed, 61 insertions(+), 21 deletions(-)
-
-diff --git a/configure b/configure
-index e9152a8..4cd378d 100755
---- a/configure
-+++ b/configure
-@@ -4938,6 +4938,7 @@ if test "$_gif" = auto ; then
-   _gif=no
-   for ld_gif in "-lungif" "-lgif" ; do
-     statement_check gif_lib.h 'QuantizeBuffer(0, 0, 0, 0, 0, 0, 0, 0)' $ld_gif && _gif=yes && break
-+    statement_check_broken stdlib.h gif_lib.h 'GifQuantizeBuffer(0, 0, 0, 0, 0, 0, 0, 0)' $ld_gif && _gif=yes && break
-   done
- fi
- 
- 
-diff --git a/libmpdemux/demux_gif.c b/libmpdemux/demux_gif.c
-index 804ce8c..0a11322 100644
---- a/libmpdemux/demux_gif.c
-+++ b/libmpdemux/demux_gif.c
-@@ -45,6 +45,32 @@ typedef struct {
- 
- #define GIF_SIGNATURE (('G' << 16) | ('I' << 8) | 'F')
- 
-+#if defined GIFLIB_MAJOR && GIFLIB_MAJOR >= 5
-+#define DGifOpen(a, b) DGifOpen(a, b, NULL)
-+#define DGifOpenFileHandle(a) DGifOpenFileHandle(a, NULL)
-+#define GifError() (gif ? gif->Error : 0)
-+#define GifErrorString() GifErrorString(gif->Error)
-+#endif
-+
-+/* >= 4.2 prior GIFLIB did not have MAJOR/MINOR defines */
-+#if defined GIFLIB_MAJOR && GIFLIB_MAJOR >= 4
-+static void print_gif_error(GifFileType *gif)
-+{
-+  int err = GifError();
-+  char *err_str = GifErrorString();
-+
-+  if (err_str)
-+    mp_msg(MSGT_DEMUX, MSGL_ERR, "\n[gif] GIF-LIB error: %s.\n", err_str);
-+  else
-+    mp_msg(MSGT_DEMUX, MSGL_ERR, "\n[gif] GIF-LIB undefined error %d.\n", err);
-+}
-+#else
-+static void print_gif_error(GifFileType *gif)
-+{
-+  PrintGifError();
-+}
-+#endif
-+
- #ifndef CONFIG_GIF_TVT_HACK
- // not supported by certain versions of the library
- static int my_read_gif(GifFileType *gif, uint8_t *buf, int len)
-@@ -94,14 +120,14 @@ static int demux_gif_fill_buffer(demuxer_t *demuxer, demux_stream_t *ds)
- 
-   while (type != IMAGE_DESC_RECORD_TYPE) {
-     if (DGifGetRecordType(gif, &type) == GIF_ERROR) {
--      PrintGifError();
-+      print_gif_error(priv->gif);
-       return 0; // oops
-     }
-     if (type == TERMINATE_RECORD_TYPE)
-       return 0; // eof
-     if (type == SCREEN_DESC_RECORD_TYPE) {
-       if (DGifGetScreenDesc(gif) == GIF_ERROR) {
--        PrintGifError();
-+        print_gif_error(priv->gif);
-         return 0; // oops
-       }
-     }
-@@ -109,7 +135,7 @@ static int demux_gif_fill_buffer(demuxer_t *demuxer, demux_stream_t *ds)
-       int code;
-       unsigned char *p = NULL;
-       if (DGifGetExtension(gif, &code, &p) == GIF_ERROR) {
--        PrintGifError();
-+        print_gif_error(priv->gif);
-         return 0; // oops
-       }
-       if (code == 0xF9) {
-@@ -138,7 +164,7 @@ static int demux_gif_fill_buffer(demuxer_t *demuxer, demux_stream_t *ds)
- 	  comments[length] = 0;
- 	  printf("%s", comments);
-           if (DGifGetExtensionNext(gif, &p) == GIF_ERROR) {
--            PrintGifError();
-+            print_gif_error(priv->gif);
-             return 0; // oops
-           }
- 	}
-@@ -146,7 +172,7 @@ static int demux_gif_fill_buffer(demuxer_t *demuxer, demux_stream_t *ds)
-       }
-       while (p != NULL) {
-         if (DGifGetExtensionNext(gif, &p) == GIF_ERROR) {
--          PrintGifError();
-+          print_gif_error(priv->gif);
-           return 0; // oops
-         }
-       }
-@@ -154,7 +180,7 @@ static int demux_gif_fill_buffer(demuxer_t *demuxer, demux_stream_t *ds)
-   }
- 
-   if (DGifGetImageDesc(gif) == GIF_ERROR) {
--    PrintGifError();
-+    print_gif_error(priv->gif);
-     return 0; // oops
-   }
- 
-@@ -167,7 +193,7 @@ static int demux_gif_fill_buffer(demuxer_t *demuxer, demux_stream_t *ds)
-     memset(dp->buffer, gif->SBackGroundColor, priv->w * priv->h);
- 
-   if (DGifGetLine(gif, buf, len) == GIF_ERROR) {
--    PrintGifError();
-+    print_gif_error(priv->gif);
-     free(buf);
-     free_demux_packet(dp);
-     return 0; // oops
-@@ -261,7 +287,7 @@ static demuxer_t* demux_open_gif(demuxer_t* demuxer)
-   gif = DGifOpen(demuxer->stream, my_read_gif);
- #endif
-   if (!gif) {
--    PrintGifError();
-+    print_gif_error(NULL);
-     free(priv);
-     return NULL;
-   }
-@@ -303,7 +329,7 @@ static void demux_close_gif(demuxer_t* demuxer)
-   gif_priv_t *priv = demuxer->priv;
-   if (!priv) return;
-   if (priv->gif && DGifCloseFile(priv->gif) == GIF_ERROR)
--    PrintGifError();
-+    print_gif_error(priv->gif);
-   free(priv->refimg);
-   free(priv);
- }
-diff --git a/libvo/vo_gif89a.c b/libvo/vo_gif89a.c
-index b808f81..160291a 100644
---- a/libvo/vo_gif89a.c
-+++ b/libvo/vo_gif89a.c
-@@ -44,13 +44,13 @@
-  * entire argument being interpretted as the filename.
-  */
- 
--#include <gif_lib.h>
--
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
- #include <unistd.h>
- 
-+#include <gif_lib.h>
-+
- #include "config.h"
- #include "subopt-helper.h"
- #include "video_out.h"
-@@ -69,6 +69,12 @@ static const vo_info_t info = {
- 
- const LIBVO_EXTERN(gif89a)
- 
-+#if defined GIFLIB_MAJOR && GIFLIB_MAJOR >= 5
-+#define EGifOpenFileName(a, b) EGifOpenFileName(a, b, NULL)
-+#define MakeMapObject GifMakeMapObject
-+#define FreeMapObject GifFreeMapObject
-+#define QuantizeBuffer GifQuantizeBuffer
-+#endif
- 
- // how many frames per second we are aiming for during output.
- static float target_fps;
-@@ -156,7 +162,7 @@ static int config(uint32_t s_width, uint32_t s_height, uint32_t d_width,
- 		uint32_t d_height, uint32_t flags, char *title,
- 		uint32_t format)
- {
--#ifdef CONFIG_GIF_4
-+#if defined CONFIG_GIF_4 || GIFLIB_MAJOR >= 5
- 	// these are control blocks for the gif looping extension.
- 	char LB1[] = "NETSCAPE2.0";
- 	char LB2[] = { 1, 0, 0 };
-@@ -185,23 +191,25 @@ static int config(uint32_t s_width, uint32_t s_height, uint32_t d_width,
- 		return 1;
- 	}
- 
-+	new_gif = EGifOpenFileName(gif_filename, 0);
-+	if (new_gif == NULL) {
-+		mp_msg(MSGT_VO, MSGL_ERR, "GIF89a: error opening file \"%s\" for output.\n", gif_filename);
-+		return 1;
-+	}
-+
-+#if defined GIFLIB_MAJOR && GIFLIB_MAJOR >= 5
-+	EGifSetGifVersion(new_gif, 1);
-+#elif defined CONFIG_GIF_4
- 	// the EGifSetGifVersion line causes segfaults in certain
- 	// earlier versions of libungif.  i don't know exactly which,
- 	// but certainly in all those before v4.  if you have problems,
- 	// you need to upgrade your gif library.
--#ifdef CONFIG_GIF_4
- 	EGifSetGifVersion("89a");
- #else
- 	mp_msg(MSGT_VO, MSGL_ERR, "GIF89a: Your version of libungif needs to be upgraded.\n");
- 	mp_msg(MSGT_VO, MSGL_ERR, "GIF89a: Some functionality has been disabled.\n");
- #endif
- 
--	new_gif = EGifOpenFileName(gif_filename, 0);
--	if (new_gif == NULL) {
--		mp_msg(MSGT_VO, MSGL_ERR, "GIF89a: error opening file \"%s\" for output.\n", gif_filename);
--		return 1;
--	}
--
- 	slice_data = malloc(img_width * img_height * 3);
- 	if (slice_data == NULL) {
- 		mp_msg(MSGT_VO, MSGL_ERR, "GIF89a: malloc failed.\n");
-@@ -231,7 +239,12 @@ static int config(uint32_t s_width, uint32_t s_height, uint32_t d_width,
- 
- 	// set the initial width and height info.
- 	EGifPutScreenDesc(new_gif, s_width, s_height, 256, 0, reduce_cmap);
--#ifdef CONFIG_GIF_4
-+#if defined GIFLIB_MAJOR && GIFLIB_MAJOR >= 5
-+	EGifPutExtensionLeader(new_gif, 0xFF);
-+	EGifPutExtensionBlock(new_gif, 11, LB1);
-+	EGifPutExtensionBlock(new_gif, 3, LB2);
-+	EGifPutExtensionTrailer(new_gif);
-+#elif defined CONFIG_GIF_4
- 	// version 3 of libungif does not support multiple control blocks.
- 	// looping requires multiple control blocks.
- 	// therefore, looping is only enabled for v4 and up.
--- 
-1.7.1
-
diff --git a/package/mplayer/0006-Support-newer-GIFLIB-versions-part2.patch b/package/mplayer/0006-Support-newer-GIFLIB-versions-part2.patch
deleted file mode 100644
index 271dce8..0000000
--- a/package/mplayer/0006-Support-newer-GIFLIB-versions-part2.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Support newer GIFLIB versions - Part 2
-
-Adding another patch to fix the problem with new versions of libgif.
-This patch has been sent upstream:
-
-  https://lists.mplayerhq.hu/pipermail/mplayer-dev-eng/2015-February/072848.html
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-Support newer GIFLIB versions - Part 2
-
-This patch is necessary because the previous upstream patch is
-incomplete. Without this one, MPlayer will fail to compile displaying
-an error message like this one:
-
-libvo/vo_gif89a.c: In function 'uninit':
-libvo/vo_gif89a.c:374:3: error: too few arguments to function 'EGifCloseFile'
-   EGifCloseFile(new_gif); // also frees gif storage space.
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
-
-diff -rup a/libmpdemux/demux_gif.c b/libmpdemux/demux_gif.c
---- a/libmpdemux/demux_gif.c	2015-02-13 15:39:56.582310414 +0000
-+++ b/libmpdemux/demux_gif.c	2015-02-13 15:48:06.396837922 +0000
-@@ -48,6 +48,7 @@ typedef struct {
- #if defined GIFLIB_MAJOR && GIFLIB_MAJOR >= 5
- #define DGifOpen(a, b) DGifOpen(a, b, NULL)
- #define DGifOpenFileHandle(a) DGifOpenFileHandle(a, NULL)
-+#define DGifCloseFile(a) DGifCloseFile(a, NULL)
- #define GifError() (gif ? gif->Error : 0)
- #define GifErrorString() GifErrorString(gif->Error)
- #endif
-diff -rup a/libvo/vo_gif89a.c b/libvo/vo_gif89a.c
---- a/libvo/vo_gif89a.c	2015-02-13 15:39:56.631311186 +0000
-+++ b/libvo/vo_gif89a.c	2015-02-13 15:45:25.392168294 +0000
-@@ -71,6 +71,7 @@ const LIBVO_EXTERN(gif89a)
- 
- #if defined GIFLIB_MAJOR && GIFLIB_MAJOR >= 5
- #define EGifOpenFileName(a, b) EGifOpenFileName(a, b, NULL)
-+#define EGifCloseFile(a) EGifCloseFile(a, NULL)
- #define MakeMapObject GifMakeMapObject
- #define FreeMapObject GifFreeMapObject
- #define QuantizeBuffer GifQuantizeBuffer
diff --git a/package/mplayer/0007-mplayer-enable-aarch64.patch b/package/mplayer/0007-mplayer-enable-aarch64.patch
deleted file mode 100644
index dc59f5f..0000000
--- a/package/mplayer/0007-mplayer-enable-aarch64.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Add support for ARM64 architecture
-
-This patch adds aarch64 as a supported architecture to the configure script.
-
-Signed-off-by: Joao Pinto <jpinto@synopsys.com>
----
-
---- b/configure	2015-09-15 17:30:46.187307557 +0100
-+++ a/configure	2015-09-15 17:31:11.729307537 +0100
-@@ -2496,6 +2496,10 @@
-     arch='arc'
-     iproc='arc'
-     ;;
-+  aarch64)
-+    arch='arm64'
-+    iproc='arm64'
-+    ;;
- 
-   *)
-     echo "The architecture of your CPU ($host_arch) is not supported by this configure script"
-
-
diff --git a/package/mplayer/mplayer.hash b/package/mplayer/mplayer.hash
index f1f9aca..49c5631 100644
--- a/package/mplayer/mplayer.hash
+++ b/package/mplayer/mplayer.hash
@@ -1,4 +1,4 @@
-# From http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.1.1.tar.xz.md5
-md5	39dd55f30eb5403f219a606e79a6648a	MPlayer-1.1.1.tar.xz
-# From http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.1.1.tar.xz.sha1
-sha1	ba2f3bd1442d04b17b0143680850273d928689c1	MPlayer-1.1.1.tar.xz
+# From http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.2.tar.xz.md5
+md5 58409fccb8ef33013fb780405405491f  MPlayer-1.2.tar.xz
+# From http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.2.tar.xz.sha1
+sha1 64fad840dfae466ab5ef3be2b6c74058892cd981  MPlayer-1.2.tar.xz
diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 5a46aa3..bab7ed7 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPLAYER_VERSION = 1.1.1
+MPLAYER_VERSION = 1.2
 MPLAYER_SOURCE = MPlayer-$(MPLAYER_VERSION).tar.xz
 MPLAYER_SITE = http://www.mplayerhq.hu/MPlayer/releases
 
@@ -107,7 +107,6 @@ MPLAYER_CONF_OPTS += --disable-libcdio
 ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
 MPLAYER_CONF_OPTS +=  \
 	--enable-dvdread \
-	--disable-dvdread-internal \
 	--with-dvdread-config=$(STAGING_DIR)/usr/bin/dvdread-config
 MPLAYER_DEPENDENCIES += libdvdread
 endif
@@ -160,7 +159,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_TREMOR),y)
 MPLAYER_DEPENDENCIES += tremor
-MPLAYER_CONF_OPTS += --disable-tremor-internal --enable-tremor
+MPLAYER_CONF_OPTS += --enable-tremor
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
-- 
1.7.1
