From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 10:44:12 +0100
Subject: [Buildroot] [git commit] package/vlc: bump version to 3.0.6
Message-ID: <20190127095108.6A0D083BE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bff8a0c9c6ba95d6fb150e9733ae09de221deb04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch 0006, removed patch 0008 which is included in upstream
release version, renumbered remaining patches.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0006-Don-t-assume-strerror_l-is-available.patch |   3 +-
 ...2.patch => 0008-Add-support-for-freerdp2.patch} |   0
 ...p-148-build-support-and-fix-10bit-support.patch | 213 ---------------------
 ...-also-use-AC_PATH_PROG-to-check-for-wayl.patch} |   0
 package/vlc/vlc.hash                               |  12 +-
 package/vlc/vlc.mk                                 |   2 +-
 6 files changed, 9 insertions(+), 221 deletions(-)

diff --git a/package/vlc/0006-Don-t-assume-strerror_l-is-available.patch b/package/vlc/0006-Don-t-assume-strerror_l-is-available.patch
index 685befa6e4..6775086553 100644
--- a/package/vlc/0006-Don-t-assume-strerror_l-is-available.patch
+++ b/package/vlc/0006-Don-t-assume-strerror_l-is-available.patch
@@ -11,6 +11,7 @@ Fix compile error
 Code for #else condition was taken from
 http://patches.osdyson.org/patch/series/view/vlc/2.2.0~rc2-1+dyson2/dyson.patch
 
+[Bernd: rebased for vlc-3.0.6]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  configure.ac      | 2 +-
@@ -27,7 +28,7 @@ index dfb4c1c329..bfe43512a2 100644
  dnl Check for usual libc functions
 -AC_CHECK_FUNCS([accept4 daemon fcntl flock fstatvfs fork getenv getpwuid_r isatty lstat memalign mkostemp mmap newlocale open_memstream openat pipe2 pread posix_fadvise posix_madvise posix_memalign setlocale stricmp strnicmp strptime uselocale])
 +AC_CHECK_FUNCS([accept4 daemon fcntl flock fstatvfs fork getenv getpwuid_r isatty lstat memalign mkostemp mmap newlocale open_memstream openat pipe2 pread posix_fadvise posix_madvise posix_memalign setlocale strerror_l stricmp strnicmp strptime uselocale])
- AC_REPLACE_FUNCS([aligned_alloc atof atoll dirfd fdopendir ffsll flockfile fsync getdelim getpid lldiv memrchr nrand48 poll recvmsg rewind sendmsg setenv strcasecmp strcasestr strdup strlcpy strndup strnlen strnstr strsep strtof strtok_r strtoll swab tdestroy tfind timegm timespec_get strverscmp pathconf])
+ AC_REPLACE_FUNCS([aligned_alloc atof atoll dirfd fdopendir ffsll flockfile fsync getdelim getpid lfind lldiv memrchr nrand48 poll recvmsg rewind sendmsg setenv strcasecmp strcasestr strdup strlcpy strndup strnlen strnstr strsep strtof strtok_r strtoll swab tdestroy tfind timegm timespec_get strverscmp pathconf])
  AC_REPLACE_FUNCS([gettimeofday])
  AC_CHECK_FUNC(fdatasync,,
 diff --git a/src/posix/error.c b/src/posix/error.c
diff --git a/package/vlc/0009-Add-support-for-freerdp2.patch b/package/vlc/0008-Add-support-for-freerdp2.patch
similarity index 100%
rename from package/vlc/0009-Add-support-for-freerdp2.patch
rename to package/vlc/0008-Add-support-for-freerdp2.patch
diff --git a/package/vlc/0008-x264-drop-148-build-support-and-fix-10bit-support.patch b/package/vlc/0008-x264-drop-148-build-support-and-fix-10bit-support.patch
deleted file mode 100644
index 102ac7b655..0000000000
--- a/package/vlc/0008-x264-drop-148-build-support-and-fix-10bit-support.patch
+++ /dev/null
@@ -1,213 +0,0 @@
-From dd37405dc527c5653f512966263284e7e18b7f9f Mon Sep 17 00:00:00 2001
-From: Ilkka Ollakka <ileoo@videolan.org>
-Date: Sat, 24 Mar 2018 11:23:33 +0200
-Subject: [PATCH] x264: drop <148 build support and fix 10bit support
-
-x264: drop <148 build support and fix 10bit support
-
-Drop old #if as 148 is not that recent anymore.
-
-fixes #19581
-
-Downloaded from upstream commit
-http://git.videolan.org/?p=vlc.git;a=commitdiff;h=a8953ba707cca1f2de372ca24513296bcfcdaaa8
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- modules/codec/x264.c | 65 ++++++++--------------------------------------------
- 1 file changed, 10 insertions(+), 55 deletions(-)
-
-diff --git a/modules/codec/x264.c b/modules/codec/x264.c
-index e02048f075..bcf3c89a10 100644
---- a/modules/codec/x264.c
-+++ b/modules/codec/x264.c
-@@ -84,13 +84,7 @@ static void x264_log( void *, int i_level, const char *psz, va_list );
-     "I-frames, but do not start a new GOP." )
- 
- #define OPENGOP_TEXT N_("Use recovery points to close GOPs")
--#if X264_BUILD < 115
--#define OPENGOP_LONGTEXT N_("none: use closed GOPs only\n"\
--    "normal: use standard open GOPs\n" \
--    "bluray: use Blu-ray compatible open GOPs" )
--#else
- #define OPENGOP_LONGTEXT N_("use open GOP, for bluray compatibility use also bluray-compat option")
--#endif
- 
- #define BLURAY_TEXT N_("Enable compatibility hacks for Blu-ray support")
- #define BLURAY_LONGTEXT N_("Enable hacks for Blu-ray support, this doesn't enforce every aspect of Blu-ray compatibility\n" \
-@@ -469,16 +463,10 @@ vlc_module_begin ()
-     add_integer( SOUT_CFG_PREFIX "min-keyint", 25, MIN_KEYINT_TEXT,
-                  MIN_KEYINT_LONGTEXT, true )
- 
--#if X264_BUILD >= 102 && X264_BUILD <= 114
--    add_string( SOUT_CFG_PREFIX "opengop", "none", OPENGOP_TEXT,
--               OPENGOP_LONGTEXT, true )
--        change_string_list( x264_open_gop_names, x264_open_gop_names )
--#elif X264_BUILD > 114
-     add_bool( SOUT_CFG_PREFIX "opengop", false, OPENGOP_TEXT,
-                OPENGOP_LONGTEXT, true )
-     add_bool( SOUT_CFG_PREFIX "bluray-compat", false, BLURAY_TEXT,
-                BLURAY_LONGTEXT, true )
--#endif
- 
-     add_integer( SOUT_CFG_PREFIX "scenecut", 40, SCENE_TEXT,
-                  SCENE_LONGTEXT, true )
-@@ -498,13 +486,8 @@ vlc_module_begin ()
-                  B_BIAS_LONGTEXT, true )
-         change_integer_range( -100, 100 )
- 
--#if X264_BUILD >= 87
-     add_string( SOUT_CFG_PREFIX "bpyramid", "normal", BPYRAMID_TEXT,
-               BPYRAMID_LONGTEXT, true )
--#else
--    add_string( SOUT_CFG_PREFIX "bpyramid", "none", BPYRAMID_TEXT,
--              BPYRAMID_LONGTEXT, true )
--#endif
-         change_string_list( bpyramid_list, bpyramid_list )
- 
-     add_bool( SOUT_CFG_PREFIX "cabac", true, CABAC_TEXT, CABAC_LONGTEXT,
-@@ -541,22 +524,18 @@ vlc_module_begin ()
-     add_bool( SOUT_CFG_PREFIX "interlaced", false, INTERLACED_TEXT, INTERLACED_LONGTEXT,
-               true )
- 
--#if X264_BUILD >= 111
-     add_integer( SOUT_CFG_PREFIX "frame-packing", -1, FRAMEPACKING_TEXT, FRAMEPACKING_LONGTEXT, true )
-         change_integer_list( framepacking_list, framepacking_list_text )
-         change_integer_range( -1, 6)
--#endif
- 
-     add_integer( SOUT_CFG_PREFIX "slices", 0, SLICE_COUNT, SLICE_COUNT_LONGTEXT, true )
-     add_integer( SOUT_CFG_PREFIX "slice-max-size", 0, SLICE_MAX_SIZE, SLICE_MAX_SIZE_LONGTEXT, true )
-     add_integer( SOUT_CFG_PREFIX "slice-max-mbs", 0, SLICE_MAX_MBS, SLICE_MAX_MBS_LONGTEXT, true )
- 
--#if X264_BUILD >= 89
-     add_string( SOUT_CFG_PREFIX "hrd", "none", HRD_TEXT, HRD_TEXT, true )
-         vlc_config_set (VLC_CONFIG_LIST,
-             (sizeof(x264_nal_hrd_names) / sizeof (char*)) - 1,
-             x264_nal_hrd_names, x264_nal_hrd_names);
--#endif
- 
- 
- /* Ratecontrol */
-@@ -842,20 +821,14 @@ static int  Open ( vlc_object_t *p_this )
-     fullrange |= p_enc->fmt_in.video.b_color_range_full;
-     p_enc->fmt_in.i_codec = fullrange ? VLC_CODEC_J420 : VLC_CODEC_I420;
-     p_sys->i_colorspace = X264_CSP_I420;
--#if X264_BUILD >= 118
-     char *psz_profile = var_GetString( p_enc, SOUT_CFG_PREFIX "profile" );
--    if( psz_profile )
--    {
--        const int mask = x264_bit_depth > 8 ? X264_CSP_HIGH_DEPTH : 0;
--
--
- # ifdef MODULE_NAME_IS_x26410b
--        if( mask == 0)
--        {
--            msg_Err( p_enc, "Only high bit depth encoding supported, bit depth:%d", x264_bit_depth);
--            return VLC_EGENERIC;
--        }
-+    const int mask = X264_CSP_HIGH_DEPTH;
-+# else
-+    const int mask = 0;
- # endif
-+    if( psz_profile )
-+    {
- 
-         if( !strcmp( psz_profile, "high10" ) )
-         {
-@@ -878,7 +851,6 @@ static int  Open ( vlc_object_t *p_this )
-             msg_Err( p_enc, "Only high-profiles and 10-bit are supported");
-             return VLC_EGENERIC;
-         }
--
- # endif
-     }
- # ifdef MODULE_NAME_IS_x26410b
-@@ -889,7 +861,6 @@ static int  Open ( vlc_object_t *p_this )
-     }
- # endif
-     free( psz_profile );
--#endif //X264_BUILD
- 
-     p_enc->pf_encode_video = Encode;
-     p_enc->pf_encode_audio = NULL;
-@@ -912,6 +883,10 @@ static int  Open ( vlc_object_t *p_this )
- #else
-     x264_param_default( &p_sys->param );
-     x264_param_default_preset( &p_sys->param, psz_preset, psz_tune );
-+# if X264_BUILD > 152
-+    if( mask )
-+        p_sys->param.i_bitdepth = 10;
-+# endif
- #endif
-     free( psz_preset );
-     free( psz_tune );
-@@ -1089,10 +1064,8 @@ static int  Open ( vlc_object_t *p_this )
-     if( fabs( var_GetFloat( p_enc, SOUT_CFG_PREFIX "aq-strength" ) - 1.0) > 0.005 )
-        p_sys->param.rc.f_aq_strength = var_GetFloat( p_enc, SOUT_CFG_PREFIX "aq-strength" );
- 
--#if X264_BUILD >= 111
-     if( var_GetInteger( p_enc, SOUT_CFG_PREFIX "frame-packing" ) > -1 )
-        p_sys->param.i_frame_packing = var_GetInteger( p_enc, SOUT_CFG_PREFIX "frame-packing" );
--#endif
- 
-     if( var_GetBool( p_enc, SOUT_CFG_PREFIX "verbose" ) )
-         p_sys->param.i_log_level = X264_LOG_DEBUG;
-@@ -1108,26 +1081,14 @@ static int  Open ( vlc_object_t *p_this )
- 
-     i_val = var_GetInteger( p_enc, SOUT_CFG_PREFIX "keyint" );
-     if( i_val > 0 && i_val != 250 ) p_sys->param.i_keyint_max = i_val;
--#if X264_BUILD >= 102
-     if( i_val == -1 ) p_sys->param.i_keyint_max = X264_KEYINT_MAX_INFINITE;
--#endif
- 
-     i_val = var_GetInteger( p_enc, SOUT_CFG_PREFIX "min-keyint" );
-     if( i_val > 0 && i_val != 25 ) p_sys->param.i_keyint_min = i_val;
- 
--#if X264_BUILD >= 102 && X264_BUILD <= 114
--    psz_val = var_GetString( p_enc, SOUT_CFG_PREFIX "opengop" );
--    if( !strcmp( psz_val, "none" ) )
--        p_sys->param.i_open_gop = X264_OPEN_GOP_NONE;
--    else if( !strcmp( psz_val, "normal" ) )
--        p_sys->param.i_open_gop = X264_OPEN_GOP_NORMAL;
--    else if( !strcmp( psz_val, "bluray" ) )
--        p_sys->param.i_open_gop = X264_OPEN_GOP_BLURAY;
--    free( psz_val );
--#elif X264_BUILD >= 115
-     p_sys->param.b_open_gop = var_GetBool( p_enc, SOUT_CFG_PREFIX "opengop" );
-     p_sys->param.b_bluray_compat = var_GetBool( p_enc, SOUT_CFG_PREFIX "bluray-compat" );
--#endif
-+
-     i_val = var_GetInteger( p_enc, SOUT_CFG_PREFIX "bframes" );
-     if( i_val >= 0 && i_val <= 16 && i_val != 3 )
-         p_sys->param.i_bframe = i_val;
-@@ -1165,14 +1126,12 @@ static int  Open ( vlc_object_t *p_this )
-     if( i_val >= 1 && i_val != 7 )
-         p_sys->param.analyse.i_subpel_refine = i_val;
- 
--#if X264_BUILD >= 89
-     psz_val = var_GetString( p_enc, SOUT_CFG_PREFIX "hrd");
-     if( !strcmp( psz_val, "vbr" ) )
-         p_sys->param.i_nal_hrd = X264_NAL_HRD_VBR;
-     else if( !strcmp( psz_val, "cbr" ) )
-         p_sys->param.i_nal_hrd = X264_NAL_HRD_CBR;
-     free( psz_val );
--#endif
- 
-     //TODO: psz_val == NULL ?
-     psz_val = var_GetString( p_enc, SOUT_CFG_PREFIX "me" );
-@@ -1531,11 +1490,7 @@ static block_t *Encode( encoder_t *p_enc, picture_t *p_pict )
-     int i_nal=0, i_out=0, i=0;
- 
-     /* init pic */
--#if X264_BUILD >= 98
-     x264_picture_init( &pic );
--#else
--    memset( &pic, 0, sizeof( x264_picture_t ) );
--#endif
-     if( likely(p_pict) ) {
-        pic.i_pts = p_pict->date;
-        pic.img.i_csp = p_sys->i_colorspace;
--- 
-2.14.4
-
diff --git a/package/vlc/0010-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch b/package/vlc/0009-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
similarity index 100%
rename from package/vlc/0010-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
rename to package/vlc/0009-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index af1d936f13..e2c5fecfad 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,9 +1,9 @@
-# From http://download.videolan.org/pub/videolan/vlc/3.0.4/vlc-3.0.4.tar.xz.sha256
-sha256 01f3db3790714038c01f5e23c709e31ecd6f1c046ac93d19e1dde38b3fc05a9e vlc-3.0.4.tar.xz
-# From http://download.videolan.org/pub/videolan/vlc/3.0.4/vlc-3.0.4.tar.xz.sha1
-sha1 218603f05ab5f30de0cc87b0ccceb57bb1efcfa4 vlc-3.0.4.tar.xz
-# From http://download.videolan.org/pub/videolan/vlc/3.0.4/vlc-3.0.4.tar.xz.md5
-md5 f5e49a0fb9594ab8debf934a710e92f1 vlc-3.0.4.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/3.0.6/vlc-3.0.6.tar.xz.sha256
+sha256 18c16d4be0f34861d0aa51fbd274fb87f0cab3b7119757ead93f3db3a1f27ed3 vlc-3.0.6.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/3.0.6/vlc-3.0.6.tar.xz.sha1
+sha1 b35168c1811b07844d861311bd0f2194f4bb82ac vlc-3.0.6.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/3.0.6/vlc-3.0.6.tar.xz.md5
+md5 4ff71d262e070fd19f86a1c3542c7b4e vlc-3.0.6.tar.xz
 # Locally computed
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 73f84d5eb2..8dbaf86a08 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.4
+VLC_VERSION = 3.0.6
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
