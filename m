From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 22:33:59 +0200
Subject: [Buildroot] [git commit] vlc: switch to proper Git formatted patches
Message-ID: <20180501203840.56E568B1A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0fb1b8053201e9da0c6ab8e5c6c633c7acb9dde9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

VLC uses Git as its version control system, so it makes sense to use
Git formatted patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-building-of-statically-linked-vlc-binary.patch |  40 +++++
 package/vlc/0001-vlc-static.patch                  |  24 ---
 ...ac-add-check-for-libgcrypt-config-program.patch |   9 +-
 .../0003-automake-add-subdir-objects-option.patch  |  18 ++-
 ...mplicit-function-declaration-compile-fla.patch} |  20 ++-
 ...de-the-name-of-the-vorbis-and-ogg-librar.patch} |  17 +-
 ...-assume-X11-is-available-when-Qt5-is-used.patch |  28 ++++
 package/vlc/0006-qt-x11.patch                      |  16 --
 ...007-Don-t-assume-strerror_l-is-available.patch} |  30 +++-
 ...-code-and-add-required-realtime-library-.patch} |   8 +-
 ...3.0.patch => 0009-Changes-for-ffmpeg-3.0.patch} | 178 ++++++++++++---------
 ...> 0010-Fix-build-when-using-C99-and-C-11.patch} |  13 +-
 ...t.patch => 0011-compat-fix-static_assert.patch} |  18 ++-
 .../0012-Fix-build-with-libupnp-above-1.6.23.patch |   4 +-
 ...-148-build-support-and-fix-10bit-support.patch} |  37 +++--
 15 files changed, 292 insertions(+), 168 deletions(-)

diff --git a/package/vlc/0001-Disable-building-of-statically-linked-vlc-binary.patch b/package/vlc/0001-Disable-building-of-statically-linked-vlc-binary.patch
new file mode 100644
index 0000000000..4caa170b02
--- /dev/null
+++ b/package/vlc/0001-Disable-building-of-statically-linked-vlc-binary.patch
@@ -0,0 +1,40 @@
+From 0b701c37d8a409904ea80fb6b74f096d1f28cc84 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Tue, 1 May 2018 22:27:21 +0200
+Subject: [PATCH] Disable building of statically linked vlc binary
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Makefile.am     | 2 +-
+ bin/Makefile.am | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index febdc63fe4..dca6354ec9 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -933,7 +933,7 @@ libvlc: libvlccore
+ 	cd lib && $(MAKE) $(AM_MAKEFLAGS) libvlc.la
+ 
+ core: libvlc vlc$(EXEEXT)
+-	cd bin && $(MAKE) $(AM_MAKEFLAGS) vlc$(EXEEXT) vlc-static$(EXEEXT)
++	cd bin && $(MAKE) $(AM_MAKEFLAGS) vlc$(EXEEXT)
+ 
+ doc:
+ 	cd doc && $(MAKE) $(AM_MAKEFLAGS) doc
+diff --git a/bin/Makefile.am b/bin/Makefile.am
+index 869ac561dc..5e48b70d0a 100644
+--- a/bin/Makefile.am
++++ b/bin/Makefile.am
+@@ -1,7 +1,7 @@
+ # Building vlc
+ #
+ bin_PROGRAMS = vlc
+-noinst_PROGRAMS = vlc-static
++noinst_PROGRAMS =
+ noinst_DATA =
+ vlclib_PROGRAMS = vlc-cache-gen
+ EXTRA_PROGRAMS = vlc-wrapper
+-- 
+2.14.3
+
diff --git a/package/vlc/0001-vlc-static.patch b/package/vlc/0001-vlc-static.patch
deleted file mode 100644
index f9aa079a4c..0000000000
--- a/package/vlc/0001-vlc-static.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -uNr vlc-2.1.5.org/bin/Makefile.am vlc-2.1.5/bin/Makefile.am
---- vlc-2.1.5.org/bin/Makefile.am	2013-12-03 10:12:34.000000000 +0100
-+++ vlc-2.1.5/bin/Makefile.am	2014-08-03 12:30:06.722154518 +0200
-@@ -1,7 +1,7 @@
- # Building vlc
- #
- bin_PROGRAMS = vlc
--noinst_PROGRAMS = vlc-static
-+noinst_PROGRAMS =
- noinst_DATA =
- vlclib_PROGRAMS = vlc-cache-gen
- EXTRA_PROGRAMS = vlc-wrapper
-diff -uNr vlc-2.1.5.org/Makefile.am vlc-2.1.5/Makefile.am
---- vlc-2.1.5.org/Makefile.am	2014-02-14 18:40:50.000000000 +0100
-+++ vlc-2.1.5/Makefile.am	2014-08-03 12:29:52.059010766 +0200
-@@ -932,7 +932,7 @@
- 	cd lib && $(MAKE) $(AM_MAKEFLAGS) libvlc.la
- 
- core: libvlc vlc$(EXEEXT)
--	cd bin && $(MAKE) $(AM_MAKEFLAGS) vlc$(EXEEXT) vlc-static$(EXEEXT)
-+	cd bin && $(MAKE) $(AM_MAKEFLAGS) vlc$(EXEEXT)
- 
- doc:
- 	cd doc && $(MAKE) $(AM_MAKEFLAGS) doc
diff --git a/package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch b/package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch
index e9a7315317..c1cb2fa10e 100644
--- a/package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch
+++ b/package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch
@@ -1,4 +1,4 @@
-From 88bf3313850bc7f0e6db21daee2b8d8e607b7bb4 Mon Sep 17 00:00:00 2001
+From c0fb6c7662d7b514f20cbb92ab0b2e535cd3bb49 Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Sat, 8 Feb 2014 14:33:27 +0100
 Subject: [PATCH] configure.ac: add check for libgcrypt-config program
@@ -16,10 +16,10 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
  1 file changed, 5 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 02fb8aa..5a2267b 100644
+index b49281cd77..b3841ea77b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4020,16 +4020,17 @@
+@@ -4056,16 +4056,17 @@ dnl
  AC_ARG_ENABLE(libgcrypt,
    [  --disable-libgcrypt     gcrypt support (default enabled)])
  AS_IF([test "${enable_libgcrypt}" != "no"], [
@@ -41,3 +41,6 @@ index 02fb8aa..5a2267b 100644
    ], [
      AC_MSG_ERROR([libgcrypt version 1.1.94 or higher not found. Install libgcrypt or pass --disable-libgcrypt.])
    ], [#include <gcrypt.h>]
+-- 
+2.14.3
+
diff --git a/package/vlc/0003-automake-add-subdir-objects-option.patch b/package/vlc/0003-automake-add-subdir-objects-option.patch
index cea6a38fea..877114a273 100644
--- a/package/vlc/0003-automake-add-subdir-objects-option.patch
+++ b/package/vlc/0003-automake-add-subdir-objects-option.patch
@@ -1,4 +1,7 @@
-automake: add subdir-objects option
+From 7663c856db10274d8dfbf7fb4299d3f76e5847a8 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Tue, 1 May 2018 22:28:52 +0200
+Subject: [PATCH] automake: add subdir-objects option
 
 Our version of automake warns if this option is enabled and source files
 in subdirectories are used.
@@ -7,10 +10,14 @@ It doesn't really seems to have a noticable effect on the build, but it
 does remove a lot of annoying warnings.
 
 Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff -Nrup vlc-2.1.2.orig/configure.ac vlc-2.1.2/configure.ac
---- vlc-2.1.2.orig/configure.ac	2014-02-27 00:22:19.512944952 +0100
-+++ vlc-2.1.2/configure.ac	2014-02-27 00:24:21.360940651 +0100
+diff --git a/configure.ac b/configure.ac
+index b3841ea77b..9a37656ddd 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -24,7 +24,7 @@ AC_CANONICAL_BUILD
  AC_CANONICAL_HOST
  AC_PRESERVE_HELP_ORDER
@@ -20,3 +27,6 @@ diff -Nrup vlc-2.1.2.orig/configure.ac vlc-2.1.2/configure.ac
  AC_CONFIG_HEADERS([config.h])
  
  # Disable with "./configure --disable-silent-rules" or "make V=1"
+-- 
+2.14.3
+
diff --git a/package/vlc/0004-implicit-function-declaration.patch b/package/vlc/0004-Drop-error-implicit-function-declaration-compile-fla.patch
similarity index 63%
rename from package/vlc/0004-implicit-function-declaration.patch
rename to package/vlc/0004-Drop-error-implicit-function-declaration-compile-fla.patch
index 515453d1db..62666b3dae 100644
--- a/package/vlc/0004-implicit-function-declaration.patch
+++ b/package/vlc/0004-Drop-error-implicit-function-declaration-compile-fla.patch
@@ -1,3 +1,8 @@
+From d4806743a059ec6720b5c29e7345390978614fc9 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Tue, 1 May 2018 22:29:29 +0200
+Subject: [PATCH] Drop error-implicit-function-declaration compile flag
+
 Fix compile warning being treated as error:
 
 codec/svg.c: In function 'DecodeBlock':
@@ -5,11 +10,15 @@ codec/svg.c:240:5: error: implicit declaration of function 'rsvg_handle_render_c
 cc1: some warnings being treated as errors
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff -uNr vlc-2.2.1.org/configure.ac vlc-2.2.1/configure.ac
---- vlc-2.2.1.org/configure.ac	2015-04-13 09:57:54.000000000 +0200
-+++ vlc-2.2.1/configure.ac	2015-04-24 20:54:35.349039010 +0200
-@@ -864,7 +864,7 @@
+diff --git a/configure.ac b/configure.ac
+index 9a37656ddd..b14ba46797 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -867,7 +867,7 @@ dnl
  dnl  Compiler warnings
  dnl
  
@@ -18,3 +27,6 @@ diff -uNr vlc-2.2.1.org/configure.ac vlc-2.2.1/configure.ac
  RDC_PROG_CC_FLAGS([-pipe])
  AC_LANG_PUSH([C++])
  RDC_PROG_CXX_WFLAGS([all extra sign-compare undef pointer-arith volatile-register-var])
+-- 
+2.14.3
+
diff --git a/package/vlc/0005-libvorbisidec.patch b/package/vlc/0005-Don-t-hardcode-the-name-of-the-vorbis-and-ogg-librar.patch
similarity index 54%
rename from package/vlc/0005-libvorbisidec.patch
rename to package/vlc/0005-Don-t-hardcode-the-name-of-the-vorbis-and-ogg-librar.patch
index 155e069499..bd8231cd03 100644
--- a/package/vlc/0005-libvorbisidec.patch
+++ b/package/vlc/0005-Don-t-hardcode-the-name-of-the-vorbis-and-ogg-librar.patch
@@ -1,13 +1,23 @@
-Fixes linking error with tremor due to wrong library name
+From 418e5e692a1f975d41eab3bd15895b2ba0a7eee1 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Tue, 1 May 2018 22:30:09 +0200
+Subject: [PATCH] Don't hardcode the name of the vorbis and ogg libraries
+
+Fixes linking error with tremor due to wrong library name.
 
 Downloaded from Gentoo package
 https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/media-video/vlc/files/vlc-2.1.0-fix-libtremor-libs.patch?view=markup
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ modules/codec/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/modules/codec/Makefile.am b/modules/codec/Makefile.am
+index bc39a4facc..c5cd2fb7f9 100644
 --- a/modules/codec/Makefile.am
 +++ b/modules/codec/Makefile.am
-@@ -215,7 +215,7 @@
+@@ -234,7 +234,7 @@ codec_LTLIBRARIES += $(LTLIBtheora)
  libtremor_plugin_la_SOURCES = codec/vorbis.c
  libtremor_plugin_la_CPPFLAGS = $(AM_CPPFLAGS) -DMODULE_NAME_IS_tremor
  libtremor_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(codecdir)'
@@ -16,3 +26,6 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  EXTRA_LTLIBRARIES += libtremor_plugin.la
  codec_LTLIBRARIES += $(LTLIBtremor)
  
+-- 
+2.14.3
+
diff --git a/package/vlc/0006-Don-t-assume-X11-is-available-when-Qt5-is-used.patch b/package/vlc/0006-Don-t-assume-X11-is-available-when-Qt5-is-used.patch
new file mode 100644
index 0000000000..0a07dd735d
--- /dev/null
+++ b/package/vlc/0006-Don-t-assume-X11-is-available-when-Qt5-is-used.patch
@@ -0,0 +1,28 @@
+From f87ef7f97e7e35cc1c922d5a3ff2a2275da7c22e Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Tue, 1 May 2018 22:30:39 +0200
+Subject: [PATCH] Don't assume X11 is available when Qt5 is used
+
+libX11 is an optional dependency for the qt4 module.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ modules/gui/qt4/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/gui/qt4/Makefile.am b/modules/gui/qt4/Makefile.am
+index 1a564cf1ea..4d12501eb7 100644
+--- a/modules/gui/qt4/Makefile.am
++++ b/modules/gui/qt4/Makefile.am
+@@ -22,7 +22,7 @@ else
+ if HAVE_WIN32
+ libqt4_plugin_la_LIBADD += -lole32 -lcomctl32 -luuid
+ else
+-libqt4_plugin_la_LIBADD += $(X_LIBS) $(X_PRE_LIB) -lX11
++libqt4_plugin_la_LIBADD += $(X_LIBS) $(X_PRE_LIB)
+ endif
+ endif
+ if HAVE_DARWIN
+-- 
+2.14.3
+
diff --git a/package/vlc/0006-qt-x11.patch b/package/vlc/0006-qt-x11.patch
deleted file mode 100644
index 316a31fd8f..0000000000
--- a/package/vlc/0006-qt-x11.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-libX11 is an optional dependency for the qt4 module
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr vlc-2.2.1.org/modules/gui/qt4/Makefile.am vlc-2.2.1/modules/gui/qt4/Makefile.am
---- vlc-2.2.1.org/modules/gui/qt4/Makefile.am	2014-11-29 12:34:15.000000000 +0100
-+++ vlc-2.2.1/modules/gui/qt4/Makefile.am	2015-04-27 18:53:36.968611490 +0200
-@@ -22,7 +22,7 @@
- if HAVE_WIN32
- libqt4_plugin_la_LIBADD += -lole32 -lcomctl32 -luuid
- else
--libqt4_plugin_la_LIBADD += $(X_LIBS) $(X_PRE_LIB) -lX11
-+libqt4_plugin_la_LIBADD += $(X_LIBS) $(X_PRE_LIB)
- endif
- endif
- if HAVE_DARWIN
diff --git a/package/vlc/0007-strerror.patch b/package/vlc/0007-Don-t-assume-strerror_l-is-available.patch
similarity index 68%
rename from package/vlc/0007-strerror.patch
rename to package/vlc/0007-Don-t-assume-strerror_l-is-available.patch
index e9f3141168..e587b05d27 100644
--- a/package/vlc/0007-strerror.patch
+++ b/package/vlc/0007-Don-t-assume-strerror_l-is-available.patch
@@ -1,3 +1,8 @@
+From 02a0cf3635eab8b10a5a47a56aa905d925f669a8 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Tue, 1 May 2018 22:31:23 +0200
+Subject: [PATCH] Don't assume strerror_l() is available
+
 Fix compile error
 
   CCLD     vlc
@@ -7,11 +12,16 @@ Code for #else condition was taken from
 http://patches.osdyson.org/patch/series/view/vlc/2.2.0~rc2-1+dyson2/dyson.patch
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac      | 2 +-
+ src/posix/error.c | 4 ++++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
 
-diff -uNr vlc-2.2.1.org/configure.ac vlc-2.2.1/configure.ac
---- vlc-2.2.1.org/configure.ac	2015-04-13 09:57:54.000000000 +0200
-+++ vlc-2.2.1/configure.ac	2015-05-02 16:13:22.800448380 +0200
-@@ -534,7 +534,7 @@
+diff --git a/configure.ac b/configure.ac
+index b14ba46797..15cb4edcfd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -537,7 +537,7 @@ need_libc=false
  
  dnl Check for usual libc functions
  AC_CHECK_DECLS([nanosleep],,,[#include <time.h>])
@@ -20,9 +30,10 @@ diff -uNr vlc-2.2.1.org/configure.ac vlc-2.2.1/configure.ac
  AC_REPLACE_FUNCS([atof atoll dirfd fdopendir flockfile fsync getdelim getpid gmtime_r lldiv localtime_r nrand48 poll posix_memalign rewind setenv strcasecmp strcasestr strdup strlcpy strndup strnlen strsep strtof strtok_r strtoll swab tdestroy strverscmp])
  AC_CHECK_FUNCS(fdatasync,,
    [AC_DEFINE(fdatasync, fsync, [Alias fdatasync() to fsync() if missing.])
-diff -uNr vlc-2.2.1.org/src/posix/error.c vlc-2.2.1/src/posix/error.c
---- vlc-2.2.1.org/src/posix/error.c	2014-08-14 09:20:04.000000000 +0200
-+++ vlc-2.2.1/src/posix/error.c	2015-05-02 16:25:24.075378369 +0200
+diff --git a/src/posix/error.c b/src/posix/error.c
+index db51004601..b4aa6fb3ca 100644
+--- a/src/posix/error.c
++++ b/src/posix/error.c
 @@ -31,6 +31,7 @@
  
  static const char *vlc_strerror_l(int errnum, const char *lname)
@@ -31,7 +42,7 @@ diff -uNr vlc-2.2.1.org/src/posix/error.c vlc-2.2.1/src/posix/error.c
      int saved_errno = errno;
      locale_t loc = newlocale(LC_MESSAGES_MASK, lname, (locale_t)0);
  
-@@ -51,6 +52,9 @@
+@@ -51,6 +52,9 @@ static const char *vlc_strerror_l(int errnum, const char *lname)
      const char *buf = strerror_l(errnum, loc);
  
      freelocale(loc);
@@ -41,3 +52,6 @@ diff -uNr vlc-2.2.1.org/src/posix/error.c vlc-2.2.1/src/posix/error.c
      return buf;
  }
  
+-- 
+2.14.3
+
diff --git a/package/vlc/0008-fix-fallback-code-and-add-required-realtime-library.patch b/package/vlc/0008-fix-fallback-code-and-add-required-realtime-library-.patch
similarity index 87%
rename from package/vlc/0008-fix-fallback-code-and-add-required-realtime-library.patch
rename to package/vlc/0008-fix-fallback-code-and-add-required-realtime-library-.patch
index 43f197acfc..d9f4241309 100644
--- a/package/vlc/0008-fix-fallback-code-and-add-required-realtime-library.patch
+++ b/package/vlc/0008-fix-fallback-code-and-add-required-realtime-library-.patch
@@ -1,4 +1,4 @@
-From 381bcb7cb03bb602351a323daf3b69b2d4f45e77 Mon Sep 17 00:00:00 2001
+From b5d4edd81bcb685cbea61b01d54afa1fe200b7d2 Mon Sep 17 00:00:00 2001
 From: Waldemar Brodkorb <wbx@openadk.org>
 Date: Fri, 26 Aug 2016 15:11:25 +0200
 Subject: [PATCH] fix fallback code and add required realtime library to link
@@ -11,7 +11,7 @@ Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
  2 files changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index cb1de25..018c11c 100644
+index 15cb4edcfd..16e44a8c61 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -121,6 +121,7 @@ case "${host_os}" in
@@ -23,7 +23,7 @@ index cb1de25..018c11c 100644
    bsdi*)
      SYS=bsdi
 diff --git a/src/posix/thread.c b/src/posix/thread.c
-index 07fa71e..8b8595f 100644
+index 07fa71eb3e..8b8595fcb8 100644
 --- a/src/posix/thread.c
 +++ b/src/posix/thread.c
 @@ -85,7 +85,7 @@ static clockid_t vlc_clock_id;
@@ -36,5 +36,5 @@ index 07fa71e..8b8595f 100644
      assert (val != 0);
      vlc_clock_id = (val < 0) ? CLOCK_REALTIME : CLOCK_MONOTONIC;
 -- 
-2.1.4
+2.14.3
 
diff --git a/package/vlc/0009-ffmpeg-3.0.patch b/package/vlc/0009-Changes-for-ffmpeg-3.0.patch
similarity index 77%
rename from package/vlc/0009-ffmpeg-3.0.patch
rename to package/vlc/0009-Changes-for-ffmpeg-3.0.patch
index 892c625c94..a765a0a6c4 100644
--- a/package/vlc/0009-ffmpeg-3.0.patch
+++ b/package/vlc/0009-Changes-for-ffmpeg-3.0.patch
@@ -1,13 +1,26 @@
-Changes for ffmpeg 3.0
+From 960c98831ca75b08168530f1c74af07901e01963 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Tue, 1 May 2018 22:32:02 +0200
+Subject: [PATCH] Changes for ffmpeg 3.0
 
 This file is a copy of debian/patches/04_ffmpeg-3.0.diff, to be found in
 http://www.deb-multimedia.org/pool/main/v/vlc-dmo/vlc-dmo_2.2.4.orig.tar.gz
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac                    | 14 +++++++-------
+ modules/codec/avcodec/audio.c   |  2 +-
+ modules/codec/avcodec/encoder.c | 20 ++++++++++----------
+ modules/codec/avcodec/vaapi.c   |  2 +-
+ modules/codec/avcodec/video.c   | 14 +++++++-------
+ modules/demux/avformat/demux.c  | 10 +++++-----
+ 6 files changed, 31 insertions(+), 31 deletions(-)
 
+diff --git a/configure.ac b/configure.ac
+index 16e44a8c61..6886b2b872 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2324,7 +2324,7 @@ AC_ARG_ENABLE(avcodec,
+@@ -2319,7 +2319,7 @@ AC_ARG_ENABLE(avcodec,
  AS_IF([test "${enable_avcodec}" != "no"], [
    PKG_CHECK_MODULES(AVCODEC,[libavcodec >= 53.34.0 libavutil >= 51.22.0], [
      PKG_CHECK_EXISTS([libavutil < 55],, [
@@ -16,7 +29,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
      ])
      VLC_SAVE_FLAGS
      CPPFLAGS="${CPPFLAGS} ${AVCODEC_CFLAGS}"
-@@ -2334,7 +2334,7 @@ AS_IF([test "${enable_avcodec}" != "no"]
+@@ -2329,7 +2329,7 @@ AS_IF([test "${enable_avcodec}" != "no"], [
      VLC_RESTORE_FLAGS
      have_avcodec="yes"
    ],[
@@ -25,7 +38,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
    ])
  ], [
    have_avcodec="no"
-@@ -2383,7 +2383,7 @@ AS_IF([test "${have_vaapi}" = "yes" -a "
+@@ -2378,7 +2378,7 @@ AS_IF([test "${have_vaapi}" = "yes" -a "${have_avcodec}" = "yes"], [
    case "${avfork}" in
      ffmpeg)
        PKG_CHECK_EXISTS([libavcodec >= 57.10.100], [
@@ -34,7 +47,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
        ])
        ;;
    esac
-@@ -2417,7 +2417,7 @@ AS_IF([test "${enable_dxva2}" != "no"],
+@@ -2412,7 +2412,7 @@ AS_IF([test "${enable_dxva2}" != "no"], [
      case "${avfork}" in
        ffmpeg)
          PKG_CHECK_EXISTS([libavcodec >= 57.10.100], [
@@ -43,7 +56,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
          ])
          ;;
      esac
-@@ -2509,7 +2509,7 @@ AS_IF([test "${enable_avformat}" != "no"
+@@ -2504,7 +2504,7 @@ AS_IF([test "${enable_avformat}" != "no"], [
        ])
        VLC_RESTORE_FLAGS
      ],[
@@ -52,7 +65,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
    ])
  ])
  AM_CONDITIONAL([HAVE_AVFORMAT], [test "${enable_avformat}" != "no"])
-@@ -2538,7 +2538,7 @@ then
+@@ -2533,7 +2533,7 @@ then
        ])
        VLC_RESTORE_FLAGS
      ],[
@@ -61,7 +74,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
    ])
  fi
  
-@@ -3181,7 +3181,7 @@ AS_IF([test "${have_vdpau}" = "yes" -a "
+@@ -3176,7 +3176,7 @@ AS_IF([test "${have_vdpau}" = "yes" -a "${have_avcodec}" = "yes"], [
      libav) av_vdpau_ver="55.26.0" ;;
      ffmpeg) av_vdpau_ver="55.42.100"
        PKG_CHECK_EXISTS([libavcodec >= 57.10.100], [
@@ -70,6 +83,8 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
        ])
        ;;
    esac
+diff --git a/modules/codec/avcodec/audio.c b/modules/codec/avcodec/audio.c
+index 7068499d82..b5347ac896 100644
 --- a/modules/codec/avcodec/audio.c
 +++ b/modules/codec/avcodec/audio.c
 @@ -39,7 +39,7 @@
@@ -81,57 +96,8 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  
  #include "avcodec.h"
  
---- a/modules/codec/avcodec/video.c
-+++ b/modules/codec/avcodec/video.c
-@@ -108,8 +108,8 @@ static int lavc_GetFrame(struct AVCodecC
- static int  ffmpeg_GetFrameBuf    ( struct AVCodecContext *, AVFrame * );
- static void ffmpeg_ReleaseFrameBuf( struct AVCodecContext *, AVFrame * );
- #endif
--static enum PixelFormat ffmpeg_GetFormat( AVCodecContext *,
--                                          const enum PixelFormat * );
-+static enum AVPixelFormat ffmpeg_GetFormat( AVCodecContext *,
-+                                          const enum AVPixelFormat * );
- 
- static uint32_t ffmpeg_CodecTag( vlc_fourcc_t fcc )
- {
-@@ -234,7 +234,7 @@ int InitVideoDec( decoder_t *p_dec, AVCo
-     p_sys->p_codec = p_codec;
-     p_sys->i_codec_id = i_codec_id;
-     p_sys->psz_namecodec = psz_namecodec;
--    p_sys->p_ff_pic = avcodec_alloc_frame();
-+    p_sys->p_ff_pic = av_frame_alloc();
-     p_sys->b_delayed_open = true;
-     p_sys->p_va = NULL;
-     vlc_sem_init( &p_sys->sem_mt, 0 );
-@@ -446,7 +446,7 @@ int InitVideoDec( decoder_t *p_dec, AVCo
-     if( ffmpeg_OpenCodec( p_dec ) < 0 )
-     {
-         msg_Err( p_dec, "cannot open codec (%s)", p_sys->psz_namecodec );
--        avcodec_free_frame( &p_sys->p_ff_pic );
-+        av_frame_free( &p_sys->p_ff_pic );
-         vlc_sem_destroy( &p_sys->sem_mt );
-         free( p_sys );
-         return VLC_EGENERIC;
-@@ -826,7 +826,7 @@ void EndVideoDec( decoder_t *p_dec )
-     wait_mt( p_sys );
- 
-     if( p_sys->p_ff_pic )
--        avcodec_free_frame( &p_sys->p_ff_pic );
-+        av_frame_free( &p_sys->p_ff_pic );
- 
-     if( p_sys->p_va )
-         vlc_va_Delete( p_sys->p_va );
-@@ -1313,8 +1313,8 @@ static void ffmpeg_ReleaseFrameBuf( stru
- }
- #endif
- 
--static enum PixelFormat ffmpeg_GetFormat( AVCodecContext *p_context,
--                                          const enum PixelFormat *pi_fmt )
-+static enum AVPixelFormat ffmpeg_GetFormat( AVCodecContext *p_context,
-+                                          const enum AVPixelFormat *pi_fmt )
- {
-     decoder_t *p_dec = p_context->opaque;
-     decoder_sys_t *p_sys = p_dec->p_sys;
+diff --git a/modules/codec/avcodec/encoder.c b/modules/codec/avcodec/encoder.c
+index 457078a06f..2bfc0c05f2 100644
 --- a/modules/codec/avcodec/encoder.c
 +++ b/modules/codec/avcodec/encoder.c
 @@ -41,7 +41,7 @@
@@ -170,7 +136,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
      if( !p_sys->frame )
      {
          goto error;
-@@ -1048,7 +1048,7 @@ static void vlc_av_packet_Release(block_
+@@ -1048,7 +1048,7 @@ static void vlc_av_packet_Release(block_t *block)
  {
      vlc_av_packet_t *b = (void *) block;
  
@@ -179,7 +145,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
      free(b);
  }
  
-@@ -1088,7 +1088,7 @@ static block_t *EncodeVideo( encoder_t *
+@@ -1088,7 +1088,7 @@ static block_t *EncodeVideo( encoder_t *p_enc, picture_t *p_pict )
      AVFrame *frame = NULL;
      if( likely(p_pict) ) {
          frame = p_sys->frame;
@@ -188,7 +154,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
          for( i_plane = 0; i_plane < p_pict->i_planes; i_plane++ )
          {
              p_sys->frame->data[i_plane] = p_pict->p[i_plane].p_pixels;
-@@ -1188,7 +1188,7 @@ static block_t *EncodeVideo( encoder_t *
+@@ -1188,7 +1188,7 @@ static block_t *EncodeVideo( encoder_t *p_enc, picture_t *p_pict )
              av_pkt.duration / p_sys->p_context->time_base.den, p_sys->p_context );
      if( unlikely(p_block == NULL) )
      {
@@ -197,7 +163,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
          return NULL;
      }
  
-@@ -1329,7 +1329,7 @@ static block_t *handle_delay_buffer( enc
+@@ -1329,7 +1329,7 @@ static block_t *handle_delay_buffer( encoder_t *p_enc, encoder_sys_t *p_sys, int
      //How much we need to copy from new packet
      const int leftover = leftover_samples * p_sys->p_context->channels * p_sys->i_sample_bytes;
  
@@ -206,7 +172,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
      p_sys->frame->format     = p_sys->p_context->sample_fmt;
      p_sys->frame->nb_samples = leftover_samples + p_sys->i_samples_delay;
  
-@@ -1451,7 +1451,7 @@ static block_t *EncodeAudio( encoder_t *
+@@ -1451,7 +1451,7 @@ static block_t *EncodeAudio( encoder_t *p_enc, block_t *p_aout_buf )
      while( ( p_aout_buf->i_nb_samples >= p_sys->i_frame_size ) ||
             ( p_sys->b_variable && p_aout_buf->i_nb_samples ) )
      {
@@ -215,7 +181,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
          if( p_sys->b_variable )
              p_sys->frame->nb_samples = p_aout_buf->i_nb_samples;
          else
-@@ -1514,7 +1514,7 @@ void CloseEncoder( vlc_object_t *p_this
+@@ -1514,7 +1514,7 @@ void CloseEncoder( vlc_object_t *p_this )
      encoder_t *p_enc = (encoder_t *)p_this;
      encoder_sys_t *p_sys = p_enc->p_sys;
  
@@ -224,6 +190,74 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
      av_freep( &p_sys->frame );
  
      vlc_avcodec_lock();
+diff --git a/modules/codec/avcodec/vaapi.c b/modules/codec/avcodec/vaapi.c
+index 1d8f7fa97b..d9643d061c 100644
+--- a/modules/codec/avcodec/vaapi.c
++++ b/modules/codec/avcodec/vaapi.c
+@@ -595,7 +595,7 @@ static int Create( vlc_va_t *p_va, AVCodecContext *ctx,
+         return err;
+ 
+     /* Only VLD supported */
+-    p_va->pix_fmt = PIX_FMT_VAAPI_VLD;
++    p_va->pix_fmt = AV_PIX_FMT_VAAPI_VLD;
+     p_va->setup = Setup;
+     p_va->get = Get;
+     p_va->release = Release;
+diff --git a/modules/codec/avcodec/video.c b/modules/codec/avcodec/video.c
+index ce5254423e..fd72d8d8e2 100644
+--- a/modules/codec/avcodec/video.c
++++ b/modules/codec/avcodec/video.c
+@@ -108,8 +108,8 @@ static int lavc_GetFrame(struct AVCodecContext *, AVFrame *, int);
+ static int  ffmpeg_GetFrameBuf    ( struct AVCodecContext *, AVFrame * );
+ static void ffmpeg_ReleaseFrameBuf( struct AVCodecContext *, AVFrame * );
+ #endif
+-static enum PixelFormat ffmpeg_GetFormat( AVCodecContext *,
+-                                          const enum PixelFormat * );
++static enum AVPixelFormat ffmpeg_GetFormat( AVCodecContext *,
++                                          const enum AVPixelFormat * );
+ 
+ static uint32_t ffmpeg_CodecTag( vlc_fourcc_t fcc )
+ {
+@@ -236,7 +236,7 @@ int InitVideoDec( decoder_t *p_dec, AVCodecContext *p_context,
+     p_sys->p_codec = p_codec;
+     p_sys->i_codec_id = i_codec_id;
+     p_sys->psz_namecodec = psz_namecodec;
+-    p_sys->p_ff_pic = avcodec_alloc_frame();
++    p_sys->p_ff_pic = av_frame_alloc();
+     p_sys->b_delayed_open = true;
+     p_sys->p_va = NULL;
+     vlc_sem_init( &p_sys->sem_mt, 0 );
+@@ -448,7 +448,7 @@ int InitVideoDec( decoder_t *p_dec, AVCodecContext *p_context,
+     if( ffmpeg_OpenCodec( p_dec ) < 0 )
+     {
+         msg_Err( p_dec, "cannot open codec (%s)", p_sys->psz_namecodec );
+-        avcodec_free_frame( &p_sys->p_ff_pic );
++        av_frame_free( &p_sys->p_ff_pic );
+         vlc_sem_destroy( &p_sys->sem_mt );
+         free( p_sys );
+         return VLC_EGENERIC;
+@@ -849,7 +849,7 @@ void EndVideoDec( decoder_t *p_dec )
+     wait_mt( p_sys );
+ 
+     if( p_sys->p_ff_pic )
+-        avcodec_free_frame( &p_sys->p_ff_pic );
++        av_frame_free( &p_sys->p_ff_pic );
+ 
+     if( p_sys->p_va )
+         vlc_va_Delete( p_sys->p_va );
+@@ -1336,8 +1336,8 @@ static void ffmpeg_ReleaseFrameBuf( struct AVCodecContext *p_context,
+ }
+ #endif
+ 
+-static enum PixelFormat ffmpeg_GetFormat( AVCodecContext *p_context,
+-                                          const enum PixelFormat *pi_fmt )
++static enum AVPixelFormat ffmpeg_GetFormat( AVCodecContext *p_context,
++                                          const enum AVPixelFormat *pi_fmt )
+ {
+     decoder_t *p_dec = p_context->opaque;
+     decoder_sys_t *p_sys = p_dec->p_sys;
+diff --git a/modules/demux/avformat/demux.c b/modules/demux/avformat/demux.c
+index a99bdfa5b7..4e27d07d36 100644
 --- a/modules/demux/avformat/demux.c
 +++ b/modules/demux/avformat/demux.c
 @@ -734,14 +734,14 @@ static int Demux( demux_t *p_demux )
@@ -270,14 +304,6 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
      return 1;
  }
  
---- a/modules/codec/avcodec/vaapi.c
-+++ b/modules/codec/avcodec/vaapi.c
-@@ -595,7 +595,7 @@ static int Create( vlc_va_t *p_va, AVCod
-         return err;
- 
-     /* Only VLD supported */
--    p_va->pix_fmt = PIX_FMT_VAAPI_VLD;
-+    p_va->pix_fmt = AV_PIX_FMT_VAAPI_VLD;
-     p_va->setup = Setup;
-     p_va->get = Get;
-     p_va->release = Release;
+-- 
+2.14.3
+
diff --git a/package/vlc/0010-static-assert.patch b/package/vlc/0010-Fix-build-when-using-C99-and-C-11.patch
similarity index 69%
rename from package/vlc/0010-static-assert.patch
rename to package/vlc/0010-Fix-build-when-using-C99-and-C-11.patch
index 87fd56bda2..8f12f5325e 100644
--- a/package/vlc/0010-static-assert.patch
+++ b/package/vlc/0010-Fix-build-when-using-C99-and-C-11.patch
@@ -1,7 +1,7 @@
+From 55e3ac26c1238df4c85877c32763a02c00da1345 Mon Sep 17 00:00:00 2001
 From: Thomas Guillem <thomas@gllm.fr>
-Date: Thu, 30 Apr 2015 13:29:50 +0000 (+0200)
-Subject: Fix build when using C99 and C++11
-X-Git-Url: http://git.videolan.org/?p=vlc.git;a=commitdiff_plain;h=51ce6cdaf598754e617900994c1943c6cba6d604
+Date: Thu, 30 Apr 2015 13:29:50 +0200
+Subject: [PATCH] Fix build when using C99 and C++11
 
 Fix build when using C99 and C++11
 
@@ -9,9 +9,11 @@ Indeed, C99 doesn't have static_assert and C++11 has it.
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
+ include/vlc_fixups.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/include/vlc_fixups.h b/include/vlc_fixups.h
-index b949d24..ee168d7 100644
+index 997f600d6a..0d4fcd0c8d 100644
 --- a/include/vlc_fixups.h
 +++ b/include/vlc_fixups.h
 @@ -239,7 +239,7 @@ static inline locale_t newlocale(int mask, const char * locale, locale_t base)
@@ -23,3 +25,6 @@ index b949d24..ee168d7 100644
  # define _Static_assert(x, s) ((void) sizeof (struct { unsigned:-!(x); }))
  # define static_assert _Static_assert
  #endif
+-- 
+2.14.3
+
diff --git a/package/vlc/0011-static-assert.patch b/package/vlc/0011-compat-fix-static_assert.patch
similarity index 65%
rename from package/vlc/0011-static-assert.patch
rename to package/vlc/0011-compat-fix-static_assert.patch
index 3ce23e1384..7ad2414e46 100644
--- a/package/vlc/0011-static-assert.patch
+++ b/package/vlc/0011-compat-fix-static_assert.patch
@@ -1,7 +1,10 @@
+From 6b9c7e7595f8e36d3b221bedb623fa5334f62ce0 Mon Sep 17 00:00:00 2001
 From: Thomas Guillem <thomas@gllm.fr>
-Date: Mon, 14 Dec 2015 09:08:25 +0000 (+0100)
-Subject: compat: fix static_assert
-X-Git-Url: http://git.videolan.org/?p=vlc.git;a=commitdiff_plain;h=6faf9066670db6e0d241ead6a3926b2d9cc6a041
+Date: Mon, 14 Dec 2015 09:08:25 +0100
+Subject: [PATCH] compat: fix static_assert
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 compat: fix static_assert
 
@@ -10,12 +13,14 @@ It was not possible to use it outside of functions.
 Signed-off-by: R??mi Denis-Courmont <remi@remlab.net>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
+ include/vlc_fixups.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/include/vlc_fixups.h b/include/vlc_fixups.h
-index 213d3f3..bd798d0 100644
+index 0d4fcd0c8d..0990915e5f 100644
 --- a/include/vlc_fixups.h
 +++ b/include/vlc_fixups.h
-@@ -273,7 +273,9 @@ static inline locale_t newlocale(int mask, const char * locale, locale_t base)
+@@ -240,7 +240,9 @@ static inline locale_t newlocale(int mask, const char * locale, locale_t base)
  #endif
  
  #if !defined (HAVE_STATIC_ASSERT) && !defined(__cpp_static_assert)
@@ -26,3 +31,6 @@ index 213d3f3..bd798d0 100644
  # define static_assert _Static_assert
  #endif
  
+-- 
+2.14.3
+
diff --git a/package/vlc/0012-Fix-build-with-libupnp-above-1.6.23.patch b/package/vlc/0012-Fix-build-with-libupnp-above-1.6.23.patch
index 8490cbdaa2..58ae02e35c 100644
--- a/package/vlc/0012-Fix-build-with-libupnp-above-1.6.23.patch
+++ b/package/vlc/0012-Fix-build-with-libupnp-above-1.6.23.patch
@@ -1,4 +1,4 @@
-From 0c8d631f4f9fa24f1bbd56a4dbe9d6f1e2360685 Mon Sep 17 00:00:00 2001
+From 7ce9c408aea03da5787d952747df3be687c92da1 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sun, 17 Dec 2017 12:26:33 +0100
 Subject: [PATCH] Fix build with libupnp above 1.6.23
@@ -60,5 +60,5 @@ index 23fe4db9ab..c369a04da6 100644
  class Container;
  
 -- 
-2.14.1
+2.14.3
 
diff --git a/package/vlc/0013-x264.patch b/package/vlc/0013-x264-drop-148-build-support-and-fix-10bit-support.patch
similarity index 86%
rename from package/vlc/0013-x264.patch
rename to package/vlc/0013-x264-drop-148-build-support-and-fix-10bit-support.patch
index a19887ac63..b9e3272fd4 100644
--- a/package/vlc/0013-x264.patch
+++ b/package/vlc/0013-x264-drop-148-build-support-and-fix-10bit-support.patch
@@ -1,7 +1,7 @@
+From 5d003fa5df276b62efe82329ef9ce2fd30a34f46 Mon Sep 17 00:00:00 2001
 From: Ilkka Ollakka <ileoo@videolan.org>
-Date: Sat, 24 Mar 2018 11:23:33 +0000 (+0200)
-Subject: x264: drop <148 build support and fix 10bit support
-X-Git-Url: http://git.videolan.org/?p=vlc.git;a=commitdiff_plain;h=a8953ba707cca1f2de372ca24513296bcfcdaaa8
+Date: Sat, 24 Mar 2018 11:23:33 +0200
+Subject: [PATCH] x264: drop <148 build support and fix 10bit support
 
 x264: drop <148 build support and fix 10bit support
 
@@ -14,12 +14,14 @@ http://git.videolan.org/?p=vlc.git;a=commitdiff;h=a8953ba707cca1f2de372ca2451329
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
+ modules/codec/x264.c | 65 ++++++++--------------------------------------------
+ 1 file changed, 10 insertions(+), 55 deletions(-)
 
 diff --git a/modules/codec/x264.c b/modules/codec/x264.c
-index e02048f075..bcf3c89a10 100644
+index be5d0006de..96a4b08524 100644
 --- a/modules/codec/x264.c
 +++ b/modules/codec/x264.c
-@@ -84,13 +84,7 @@ static void x264_log( void *, int i_level, const char *psz, va_list );
+@@ -83,13 +83,7 @@ static void x264_log( void *, int i_level, const char *psz, va_list );
      "I-frames, but do not start a new GOP." )
  
  #define OPENGOP_TEXT N_("Use recovery points to close GOPs")
@@ -33,7 +35,7 @@ index e02048f075..bcf3c89a10 100644
  
  #define BLURAY_TEXT N_("Enable compatibility hacks for Blu-ray support")
  #define BLURAY_LONGTEXT N_("Enable hacks for Blu-ray support, this doesn't enforce every aspect of Blu-ray compatibility\n" \
-@@ -469,16 +463,10 @@ vlc_module_begin ()
+@@ -471,16 +465,10 @@ vlc_module_begin ()
      add_integer( SOUT_CFG_PREFIX "min-keyint", 25, MIN_KEYINT_TEXT,
                   MIN_KEYINT_LONGTEXT, true )
  
@@ -50,7 +52,7 @@ index e02048f075..bcf3c89a10 100644
  
      add_integer( SOUT_CFG_PREFIX "scenecut", 40, SCENE_TEXT,
                   SCENE_LONGTEXT, true )
-@@ -498,13 +486,8 @@ vlc_module_begin ()
+@@ -500,13 +488,8 @@ vlc_module_begin ()
                   B_BIAS_LONGTEXT, true )
          change_integer_range( -100, 100 )
  
@@ -64,7 +66,7 @@ index e02048f075..bcf3c89a10 100644
          change_string_list( bpyramid_list, bpyramid_list )
  
      add_bool( SOUT_CFG_PREFIX "cabac", true, CABAC_TEXT, CABAC_LONGTEXT,
-@@ -541,22 +524,18 @@ vlc_module_begin ()
+@@ -543,22 +526,18 @@ vlc_module_begin ()
      add_bool( SOUT_CFG_PREFIX "interlaced", false, INTERLACED_TEXT, INTERLACED_LONGTEXT,
                true )
  
@@ -87,7 +89,7 @@ index e02048f075..bcf3c89a10 100644
  
  
  /* Ratecontrol */
-@@ -842,20 +821,14 @@ static int  Open ( vlc_object_t *p_this )
+@@ -843,20 +822,14 @@ static int  Open ( vlc_object_t *p_this )
      fullrange = var_GetBool( p_enc, SOUT_CFG_PREFIX "fullrange" );
      p_enc->fmt_in.i_codec = fullrange ? VLC_CODEC_J420 : VLC_CODEC_I420;
      p_sys->i_colorspace = X264_CSP_I420;
@@ -113,7 +115,7 @@ index e02048f075..bcf3c89a10 100644
  
          if( !strcmp( psz_profile, "high10" ) )
          {
-@@ -878,7 +851,6 @@ static int  Open ( vlc_object_t *p_this )
+@@ -879,7 +852,6 @@ static int  Open ( vlc_object_t *p_this )
              msg_Err( p_enc, "Only high-profiles and 10-bit are supported");
              return VLC_EGENERIC;
          }
@@ -121,7 +123,7 @@ index e02048f075..bcf3c89a10 100644
  # endif
      }
  # ifdef MODULE_NAME_IS_x26410b
-@@ -889,7 +861,6 @@ static int  Open ( vlc_object_t *p_this )
+@@ -890,7 +862,6 @@ static int  Open ( vlc_object_t *p_this )
      }
  # endif
      free( psz_profile );
@@ -129,7 +131,7 @@ index e02048f075..bcf3c89a10 100644
  
      p_enc->pf_encode_video = Encode;
      p_enc->pf_encode_audio = NULL;
-@@ -912,6 +883,10 @@ static int  Open ( vlc_object_t *p_this )
+@@ -913,6 +884,10 @@ static int  Open ( vlc_object_t *p_this )
  #else
      x264_param_default( &p_sys->param );
      x264_param_default_preset( &p_sys->param, psz_preset, psz_tune );
@@ -140,7 +142,7 @@ index e02048f075..bcf3c89a10 100644
  #endif
      free( psz_preset );
      free( psz_tune );
-@@ -1089,10 +1064,8 @@ static int  Open ( vlc_object_t *p_this )
+@@ -1045,10 +1020,8 @@ static int  Open ( vlc_object_t *p_this )
      if( fabs( var_GetFloat( p_enc, SOUT_CFG_PREFIX "aq-strength" ) - 1.0) > 0.005 )
         p_sys->param.rc.f_aq_strength = var_GetFloat( p_enc, SOUT_CFG_PREFIX "aq-strength" );
  
@@ -151,7 +153,7 @@ index e02048f075..bcf3c89a10 100644
  
      if( var_GetBool( p_enc, SOUT_CFG_PREFIX "verbose" ) )
          p_sys->param.i_log_level = X264_LOG_DEBUG;
-@@ -1108,26 +1081,14 @@ static int  Open ( vlc_object_t *p_this )
+@@ -1064,26 +1037,14 @@ static int  Open ( vlc_object_t *p_this )
  
      i_val = var_GetInteger( p_enc, SOUT_CFG_PREFIX "keyint" );
      if( i_val > 0 && i_val != 250 ) p_sys->param.i_keyint_max = i_val;
@@ -179,7 +181,7 @@ index e02048f075..bcf3c89a10 100644
      i_val = var_GetInteger( p_enc, SOUT_CFG_PREFIX "bframes" );
      if( i_val >= 0 && i_val <= 16 && i_val != 3 )
          p_sys->param.i_bframe = i_val;
-@@ -1165,14 +1126,12 @@ static int  Open ( vlc_object_t *p_this )
+@@ -1121,14 +1082,12 @@ static int  Open ( vlc_object_t *p_this )
      if( i_val >= 1 && i_val != 7 )
          p_sys->param.analyse.i_subpel_refine = i_val;
  
@@ -194,7 +196,7 @@ index e02048f075..bcf3c89a10 100644
  
      //TODO: psz_val == NULL ?
      psz_val = var_GetString( p_enc, SOUT_CFG_PREFIX "me" );
-@@ -1531,11 +1490,7 @@ static block_t *Encode( encoder_t *p_enc, picture_t *p_pict )
+@@ -1486,11 +1445,7 @@ static block_t *Encode( encoder_t *p_enc, picture_t *p_pict )
      int i_nal=0, i_out=0, i=0;
  
      /* init pic */
@@ -206,3 +208,6 @@ index e02048f075..bcf3c89a10 100644
      if( likely(p_pict) ) {
         pic.i_pts = p_pict->date;
         pic.img.i_csp = p_sys->i_colorspace;
+-- 
+2.14.3
+
