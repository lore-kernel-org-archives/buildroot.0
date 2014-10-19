From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 18:54:28 +0200
Subject: [Buildroot] [RFC/PATCH v4 04/12] package/kodi: Bump version to
	14.0a4-Helix
In-Reply-To: <1413737676-25455-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413737676-25455-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413737676-25455-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- delete kodi-0002-mathutil.patch, committed upstream
- delete kodi-0003-dbus.patch, committed upstream
- add dependency to ffmpeg, xbmc does not deliver its own ffmpeg anymore
- remove dependency to flac & lame, audio encoders have been seperated from kodi

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in                   |    4 +-
 package/kodi/kodi-0002-mathutil.patch    |  213 ------------------------------
 package/kodi/kodi-0002-remove-flac.patch |   43 ++++++
 package/kodi/kodi-0003-dbus.patch        |   46 -------
 package/kodi/kodi.mk                     |   26 +---
 5 files changed, 51 insertions(+), 281 deletions(-)
 delete mode 100644 package/kodi/kodi-0002-mathutil.patch
 create mode 100644 package/kodi/kodi-0002-remove-flac.patch
 delete mode 100644 package/kodi/kodi-0003-dbus.patch

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 3f14a75..2dcd8b3 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -35,7 +35,9 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_FLAC
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_GPL
+	select BR2_PACKAGE_FFMPEG_POSTPROC # postproc depends on GPL
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JASPER
diff --git a/package/kodi/kodi-0002-mathutil.patch b/package/kodi/kodi-0002-mathutil.patch
deleted file mode 100644
index 33f91eb..0000000
--- a/package/kodi/kodi-0002-mathutil.patch
+++ /dev/null
@@ -1,213 +0,0 @@
-Taken from upstream PR: https://github.com/xbmc/xbmc/pull/3760
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-
-From 7388e8be7cd5e78100532ebf0dba15dccb7b03f8 Mon Sep 17 00:00:00 2001
-From: Ben Avison <bavison@riscosopen.org>
-Date: Tue, 3 Dec 2013 15:51:39 +0000
-Subject: [PATCH] Faster and simpler portable implementation of
- MathUtils::round_int().
-
-Much as I like a bit of inline assembler, I have also removed the ARM versions
-of MathUtils::truncate_int() and MathUtils::round_int(). The former was just
-how any sane compiler should have assembled a cast from double to signed int
-anyway. The latter was a much too complicated way to achieve the desired
-effect, and was switched out in most ARM builds anyway in favour of the old
-portable implementation that used floor().
-
-Verified that MathUtils::test() still passes, and that GCC is now able to
-inline MathUtils::round_int(), where it didn't previously.
-
-I tested on a Raspberry Pi with the default theme, displaying the front page
-with the RSS ticker enabled. This saturates the CPU, so I'm measuring the
-improvement using the debug window's FPS figure. This patch improves this from
-~50.8 FPS to ~52.6 FPS.
----
- xbmc/utils/MathUtils.h | 129 +++++++++++++++++++++++--------------------------
- 1 file changed, 61 insertions(+), 68 deletions(-)
-
-diff --git a/xbmc/utils/MathUtils.h b/xbmc/utils/MathUtils.h
-index 96af9f4..0dae77d 100644
---- a/xbmc/utils/MathUtils.h
-+++ b/xbmc/utils/MathUtils.h
-@@ -34,17 +34,13 @@
- 
- #if defined(__ppc__) || \
-     defined(__powerpc__) || \
--   (defined(TARGET_DARWIN_IOS) && defined(__llvm__)) || \
--   (defined(TARGET_ANDROID) && defined(__arm__)) || \
--    defined(TARGET_RASPBERRY_PI)
-+    defined(__arm__)
-   #define DISABLE_MATHUTILS_ASM_ROUND_INT
- #endif
- 
- #if defined(__ppc__) || \
-     defined(__powerpc__) || \
--   (defined(TARGET_DARWIN) && defined(__llvm__)) || \
--   (defined(TARGET_ANDROID) && defined(__arm__)) || \
--    defined(TARGET_RASPBERRY_PI)
-+    defined(__arm__)
-   #define DISABLE_MATHUTILS_ASM_TRUNCATE_INT
- #endif
- 
-@@ -73,60 +69,63 @@
-   {
-     assert(x > static_cast<double>(INT_MIN / 2) - 1.0);
-     assert(x < static_cast<double>(INT_MAX / 2) + 1.0);
--    const float round_to_nearest = 0.5f;
--    int i;
- 
- #if defined(DISABLE_MATHUTILS_ASM_ROUND_INT)
--    i = floor(x + round_to_nearest);
--
--#elif defined(__arm__)
--    // From 'ARM-v7-M Architecture Reference Manual' page A7-569:
--    //  "The floating-point to integer operation (vcvt) [normally] uses the Round towards Zero rounding mode"
--    // Because of this...we must use some less-than-straightforward logic to perform this operation without
--    //  changing the rounding mode flags
--
--    /* The assembly below implements the following logic:
--     if (x < 0)
--       inc = -0.5f
--     else
--       inc = 0.5f
--     int_val = trunc(x+inc);
--     err = x - int_val;
--     if (err == 0.5f)
--       int_val++;
--     return int_val;
--    */
-+    /* This implementation warrants some further explanation.
-+     *
-+     * First, a couple of notes on rounding:
-+     * 1) C casts from float/double to integer round towards zero.
-+     * 2) Float/double additions are rounded according to the normal rules,
-+     *    in other words: on some architectures, it's fixed at compile-time,
-+     *    and on others it can be set using fesetround()). The following
-+     *    analysis assumes round-to-nearest with ties rounding to even. This
-+     *    is a fairly sensible choice, and is the default with ARM VFP.
-+     *
-+     * What this function wants is round-to-nearest with ties rounding to
-+     * +infinity. This isn't an IEEE rounding mode, even if we could guarantee
-+     * that all architectures supported fesetround(), which they don't. Instead,
-+     * this adds an offset of 2147483648.5 (= 0x80000000.8p0), then casts to
-+     * an unsigned int (crucially, all possible inputs are now in a range where
-+     * round to zero acts the same as round to -infinity) and then subtracts
-+     * 0x80000000 in the integer domain. The 0.5 component of the offset
-+     * converts what is effectively a round down into a round to nearest, with
-+     * ties rounding up, as desired.
-+     *
-+     * There is a catch, that because there is a double rounding, there is a
-+     * small region where the input falls just *below* a tie, where the addition
-+     * of the offset causes a round *up* to an exact integer, due to the finite
-+     * level of precision available in floating point. You need to be aware of
-+     * this when calling this function, although@present it is not believed
-+     * that XBMC ever attempts to round numbers in this window.
-+     *
-+     * It is worth proving the size of the affected window. Recall that double
-+     * precision employs a mantissa of 52 bits.
-+     * 1) For all inputs -0.5 <= x <= INT_MAX
-+     *    Once the offset is applied, the most significant binary digit in the
-+     *    floating-point representation is +2^31.
-+     *    At this magnitude, the smallest step representable in double precision
-+     *    is 2^31 / 2^52 = 0.000000476837158203125
-+     *    So the size of the range which is rounded up due to the addition is
-+     *    half the size of this step, or 0.0000002384185791015625
-+     *
-+     * 2) For all inputs INT_MIN/2 < x < -0.5
-+     *    Once the offset is applied, the most significant binary digit in the
-+     *    floating-point representation is +2^30.
-+     *    At this magnitude, the smallest step representable in double precision
-+     *    is 2^30 / 2^52 = 0.0000002384185791015625
-+     *    So the size of the range which is rounded up due to the addition is
-+     *    half the size of this step, or 0.00000011920928955078125
-+     *
-+     * 3) For all inputs INT_MIN <= x <= INT_MIN/2
-+     *    The representation once the offset is applied has equal or greater
-+     *    precision than the input, so the addition does not cause rounding.
-+     */
-+    return ((unsigned int) (x + 0x80000000.8p0)) - 0x80000000;
- 
--    __asm__ __volatile__ (
--#if defined(__ARM_PCS_VFP)
--      "fconstd d1,#%G[rnd_val]     \n\t" // Copy round_to_nearest into a working register (d1 = 0.5)
- #else
--      "vmov.F64 d1,%[rnd_val]      \n\t"
--#endif
--      "fcmpezd %P[value]           \n\t" // Check value against zero (value == 0?)
--      "fmstat                      \n\t" // Copy the floating-point status flags into the general-purpose status flags
--      "it mi                       \n\t"
--      "vnegmi.F64 d1, d1           \n\t" // if N-flag is set, negate round_to_nearest (if (value < 0) d1 = -1 * d1)
--      "vadd.F64 d1,%P[value],d1    \n\t" // Add round_to_nearest to value, store result in working register (d1 += value)
--      "vcvt.S32.F64 s3,d1          \n\t" // Truncate(round towards zero) (s3 = (int)d1)
--      "vmov %[result],s3           \n\t" // Store the integer result in a general-purpose register (result = s3)
--      "vcvt.F64.S32 d1,s3          \n\t" // Convert back to floating-point (d1 = (double)s3)
--      "vsub.F64 d1,%P[value],d1    \n\t" // Calculate the error (d1 = value - d1)
--#if defined(__ARM_PCS_VFP)
--      "fconstd d2,#%G[rnd_val]     \n\t" // d2 = 0.5;
--#else
--      "vmov.F64 d2,%[rnd_val]      \n\t"
--#endif
--      "fcmped d1, d2               \n\t" // (d1 == 0.5?)
--      "fmstat                      \n\t" // Copy the floating-point status flags into the general-purpose status flags
--      "it eq                       \n\t"
--      "addeq %[result],#1          \n\t" // (if (d1 == d2) result++;)
--      : [result] "=r"(i)                                  // Outputs
--      : [rnd_val] "Dv" (round_to_nearest), [value] "w"(x) // Inputs
--      : "d1", "d2", "s3"                                  // Clobbers
--    );
--
--#elif defined(__SSE2__)
-+    const float round_to_nearest = 0.5f;
-+    int i;
-+#if defined(__SSE2__)
-     const float round_dn_to_nearest = 0.4999999f;
-     i = (x > 0) ? _mm_cvttsd_si32(_mm_set_sd(x + round_to_nearest)) : _mm_cvttsd_si32(_mm_set_sd(x - round_dn_to_nearest));
- 
-@@ -150,8 +149,8 @@
-     );
- 
- #endif
--
-     return i;
-+#endif
-   }
- 
-   /*! \brief Truncate to nearest integer.
-@@ -165,20 +164,13 @@
-   {
-     assert(x > static_cast<double>(INT_MIN / 2) - 1.0);
-     assert(x < static_cast<double>(INT_MAX / 2) + 1.0);
--    int i;
- 
- #if defined(DISABLE_MATHUTILS_ASM_TRUNCATE_INT)
--    return i = (int)x;
--
--#elif defined(__arm__)
--    __asm__ __volatile__ (
--      "vcvt.S32.F64 %[result],%P[value]   \n\t" // Truncate(round towards zero) and store the result
--      : [result] "=w"(i)                        // Outputs
--      : [value] "w"(x)                          // Inputs
--    );
--    return i;
-+    return x;
- 
--#elif defined(TARGET_WINDOWS)
-+#else
-+    int i;
-+#if defined(TARGET_WINDOWS)
-     const float round_towards_m_i = -0.5f;
-     __asm
-     {
-@@ -204,6 +196,7 @@
-     if (x < 0)
-       i = -i;
-     return (i);
-+#endif
-   }
- 
-   inline int64_t abs(int64_t a)
--- 
-1.9.1
-
diff --git a/package/kodi/kodi-0002-remove-flac.patch b/package/kodi/kodi-0002-remove-flac.patch
new file mode 100644
index 0000000..a17d705
--- /dev/null
+++ b/package/kodi/kodi-0002-remove-flac.patch
@@ -0,0 +1,43 @@
+Patch backported from upstream git master
+https://github.com/xbmc/xbmc/commit/049e8b91f68ae1c1afb2b1acba9531aa9827867d
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From 049e8b91f68ae1c1afb2b1acba9531aa9827867d Mon Sep 17 00:00:00 2001
+From: Stefan Saraev <stefan@saraev.ca>
+Date: Fri, 17 Oct 2014 20:54:18 +0300
+Subject: [PATCH] [configure] libflac is not a hard dependency now
+
+---
+ configure.in | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 9b423ce..06cec26 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1060,7 +1060,6 @@ AC_CHECK_HEADER([jpeglib.h],,        AC_MSG_ERROR($missing_library))
+ AC_CHECK_HEADER([ogg/ogg.h],,        AC_MSG_ERROR($missing_library))
+ AC_CHECK_HEADER([vorbis/vorbisfile.h],, AC_MSG_ERROR($missing_library))
+ AC_CHECK_HEADER([libmodplug/modplug.h],, AC_MSG_ERROR($missing_library))
+-AC_CHECK_HEADER([FLAC/stream_decoder.h],, AC_MSG_ERROR($missing_library))
+ 
+ AC_CHECK_HEADER([curl/curl.h],, AC_MSG_ERROR($missing_library))
+ XB_FIND_SONAME([CURL], [curl])
+@@ -1228,7 +1227,6 @@ fi
+ fi
+ 
+ XB_FIND_SONAME([OGG],         [ogg])
+-XB_FIND_SONAME([FLAC],        [FLAC])
+ XB_FIND_SONAME([VORBIS],      [vorbis])
+ XB_FIND_SONAME([VORBISFILE],  [vorbisfile])
+ XB_FIND_SONAME([MODPLUG],     [modplug])
+@@ -2552,7 +2550,6 @@ AC_SUBST(OUTPUT_FILES)
+ AC_SUBST(HAVE_XBMC_NONFREE)
+ AC_SUBST(USE_ASAP_CODEC)
+ AC_SUBST(LIBCURL_BASENAME)
+-AC_SUBST(LIBFLAC_BASENAME)
+ AC_SUBST(LIBVORBISFILE_BASENAME)
+ AC_SUBST(LIBMODPLUG_BASENAME)
+ AC_SUBST(LIBOGG_BASENAME)
diff --git a/package/kodi/kodi-0003-dbus.patch b/package/kodi/kodi-0003-dbus.patch
deleted file mode 100644
index 3b63b23..0000000
--- a/package/kodi/kodi-0003-dbus.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-build: make D-Bus configurable
-
-Patch accepted upstream:
-https://github.com/xbmc/xbmc/commit/630f930d4c9c33230e9ff7df24f93afb3f05881f
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr xbmc-13.2-Gotham.org/configure.in xbmc-13.2-Gotham/configure.in
---- xbmc-13.2-Gotham.org/configure.in	2014-08-17 15:19:05.000000000 +0200
-+++ xbmc-13.2-Gotham/configure.in	2014-09-02 20:55:06.932442467 +0200
-@@ -129,6 +129,7 @@
- goom_enabled="== GOOM enabled. =="
- goom_disabled="== GOOM disabled. =="
- alsa_disabled="== ALSA support disabled. =="
-+dbus_disabled="== DBUS support disabled. =="
- rsxs_enabled="== RSXS enabled. =="
- rsxs_disabled="== RSXS disabled. =="
- fishbmc_enabled="== FishBMC enabled. =="
-@@ -369,6 +370,12 @@
-   [use_alsa=$enableval],
-   [use_alsa=yes])
- 
-+AC_ARG_ENABLE([dbus],
-+  [AS_HELP_STRING([--disable-dbus],
-+  [disable DBUS support])],
-+  [use_dbus=$enableval],
-+  [use_dbus=yes])
-+
- AC_ARG_ENABLE([pulse],
-   [AS_HELP_STRING([--enable-pulse],
-   [enable PulseAudio support (default is auto)])],
-@@ -1253,10 +1260,14 @@
-     [INCLUDES="$INCLUDES $ALSA_CFLAGS"; LIBS="$LIBS $ALSA_LIBS"; use_alsa=yes],
-     AC_MSG_NOTICE($alsa_not_found); use_alsa=no)
- fi
-+if test "x$use_dbus" != "xno"; then
-   PKG_CHECK_MODULES([DBUS],    [dbus-1],
-     [INCLUDES="$INCLUDES $DBUS_CFLAGS"; LIBS="$LIBS $DBUS_LIBS"; use_dbus=yes]; \
-     AC_DEFINE([HAVE_DBUS],[1],["Define to 1 if dbus is installed"]),
-     AC_MSG_NOTICE($missing_library); use_dbus=no)
-+else
-+  AC_MSG_NOTICE($dbus_disabled)
-+fi
-   if test "x$use_sdl" != "xno"; then
-     PKG_CHECK_MODULES([SDL],   [sdl],
-       [INCLUDES="$INCLUDES $SDL_CFLAGS"; LIBS="$LIBS $SDL_LIBS"],
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 6e1cbca..2ca98c4 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VERSION = 13.2-Gotham
+KODI_VERSION = 14.0a4-Helix
 KODI_SOURCE = $(KODI_VERSION).tar.gz
 KODI_SITE = https://github.com/xbmc/xbmc/archive
 KODI_LICENSE = GPLv2
@@ -13,22 +13,13 @@ KODI_LICENSE_FILES = LICENSE.GPL
 # called TexturePacker. It is responsible to take all the images used in the
 # GUI and pack them in a blob.
 # http://wiki.xbmc.org/index.php?title=TexturePacker
-KODI_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-lzo host-sdl_image host-swig
-KODI_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
+KODI_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-lzo \
+	host-nasm host-sdl_image host-swig
+KODI_DEPENDENCIES += boost bzip2 expat ffmpeg fontconfig freetype jasper jpeg \
 	libass libcdio libcurl libfribidi libgcrypt libmad libmodplug libmpeg2 \
 	libogg libplist libpng libsamplerate libungif libvorbis libxml2 libxslt lzo ncurses \
 	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
 
-# kodi at i386 depends on nasm
-KODI_DEPENDENCIES += $(if $(BR2_i386),host-nasm)
-
-# ffmpeg depends on yasm on MMX archs
-# kodi configure passes $(BR2_ARCH) to ffmpeg configure which adds
-# yasm as dependency for x86_64, even if BR2_x86_generic=y
-ifneq ($(BR2_X86_CPU_HAS_MMX)$(BR2_x86_64),)
-KODI_DEPENDENCIES += host-yasm
-endif
-
 KODI_CONF_ENV = \
 	PYTHON_VERSION="$(PYTHON_VERSION_MAJOR)" \
 	PYTHON_LDFLAGS="-lpython$(PYTHON_VERSION_MAJOR) -lpthread -ldl -lutil -lm" \
@@ -40,7 +31,7 @@ KODI_CONF_ENV = \
 	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
 
 KODI_CONF_OPTS +=  \
-	--with-arch=$(BR2_ARCH) \
+	--with-ffmpeg=shared \
 	--disable-crystalhd \
 	--disable-dvdcss \
 	--disable-hal \
@@ -77,13 +68,6 @@ else
 KODI_CONF_OPTS += --disable-alsa
 endif
 
-ifeq ($(BR2_PACKAGE_LAME),y)
-KODI_DEPENDENCIES += lame
-KODI_CONF_OPTS += --enable-libmp3lame
-else
-KODI_CONF_OPTS += --disable-libmp3lame
-endif
-
 # quote from kodi/configure.in: "GLES overwrites GL if both set to yes."
 # we choose the opposite because opengl offers more features, like libva support
 ifeq ($(BR2_PACKAGE_KODI_GL),y)
-- 
1.7.10.4
