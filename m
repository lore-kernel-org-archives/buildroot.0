From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 16 Oct 2018 17:09:09 +0200
Subject: [Buildroot] [PATCH 1/1] vlc: fix build with libvorbis and tremor
Message-ID: <20181016150909.27272-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 550c42509c203891c47d934b058a19c2fa490973 "package/vlc: fix
linking with tremor" fixed build with BR2_PACKAGE_TREMOR and without
BR2_PACKAGE_LIBVORBIS. However, it breaks build if BR2_PACKAGE_TREMOR
and BR2_PACKAGE_LIBVORBIS are both enabled.
Indeed, by overiding VORBIS_LIBS by -lvorbisidec, link of
codec/.libs/libvorbis_plugin_la-vorbis.o with -lvorbis
failed because VORBIS_LIBS is normally used to save "-logg
-lvorbis -lvorbisenc":
PKG_ENABLE_MODULES_VLC([VORBIS], [], [ogg vorbis >= 1.1 vorbisenc >= 1.1], [Vorbis decoder and encoder], [auto])

So replace fourth patch by an upstreamable patch which uses pkg-config
to set TREMOR_LIBS if tremor is found instead of "hacking" VORBIS_LIBS

Fixes:
 - http://autobuild.buildroot.org/results/85a7bb1996b78dee037d5900b124cbdf5b66a6ac

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...he-name-of-the-vorbis-and-ogg-librar.patch | 31 ------------
 ...ld-use-pkg-config-to-get-tremor-libs.patch | 50 +++++++++++++++++++
 package/vlc/vlc.mk                            |  1 -
 3 files changed, 50 insertions(+), 32 deletions(-)
 delete mode 100644 package/vlc/0004-Don-t-hardcode-the-name-of-the-vorbis-and-ogg-librar.patch
 create mode 100644 package/vlc/0004-build-use-pkg-config-to-get-tremor-libs.patch

diff --git a/package/vlc/0004-Don-t-hardcode-the-name-of-the-vorbis-and-ogg-librar.patch b/package/vlc/0004-Don-t-hardcode-the-name-of-the-vorbis-and-ogg-librar.patch
deleted file mode 100644
index a5352b7498..0000000000
--- a/package/vlc/0004-Don-t-hardcode-the-name-of-the-vorbis-and-ogg-librar.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 6515c423f9e6b8b607678a260a16db2684d88a4e Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Tue, 1 May 2018 22:30:09 +0200
-Subject: [PATCH] Don't hardcode the name of the vorbis and ogg libraries
-
-Fixes linking error with tremor due to wrong library name.
-
-Downloaded from Gentoo package
-https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/media-video/vlc/files/vlc-2.1.0-fix-libtremor-libs.patch?view=markup
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- modules/codec/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules/codec/Makefile.am b/modules/codec/Makefile.am
-index 10132a92f3..2fb52a586e 100644
---- a/modules/codec/Makefile.am
-+++ b/modules/codec/Makefile.am
-@@ -324,7 +324,7 @@ codec_LTLIBRARIES += $(LTLIBdaala)
- libtremor_plugin_la_SOURCES = codec/vorbis.c
- libtremor_plugin_la_CPPFLAGS = $(AM_CPPFLAGS) -DMODULE_NAME_IS_tremor
- libtremor_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(codecdir)'
--libtremor_plugin_la_LIBADD = -lvorbisdec -logg
-+libtremor_plugin_la_LIBADD = $(VORBIS_LIBS) $(OGG_LIBS)
- EXTRA_LTLIBRARIES += libtremor_plugin.la
- codec_LTLIBRARIES += $(LTLIBtremor)
- 
--- 
-2.14.4
-
diff --git a/package/vlc/0004-build-use-pkg-config-to-get-tremor-libs.patch b/package/vlc/0004-build-use-pkg-config-to-get-tremor-libs.patch
new file mode 100644
index 0000000000..652718b013
--- /dev/null
+++ b/package/vlc/0004-build-use-pkg-config-to-get-tremor-libs.patch
@@ -0,0 +1,50 @@
+From fb257e1e204c30436b3509ea3fa9f7c5fe131dc1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 16 Oct 2018 14:25:20 +0200
+Subject: [PATCH] build: use pkg-config to get tremor libs
+
+Use PKG_ENABLE_MODULES_VLC to enable tremor based on availability of
+ogg and vorbisidec
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac              | 9 +--------
+ modules/codec/Makefile.am | 2 +-
+ 2 files changed, 2 insertions(+), 9 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0d3222e00f..b506d735f2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2710,14 +2710,7 @@ PKG_ENABLE_MODULES_VLC([VORBIS], [], [ogg vorbis >= 1.1 vorbisenc >= 1.1], [Vorb
+ dnl
+ dnl  Tremor plugin
+ dnl
+-AC_ARG_ENABLE(tremor,
+-  [  --enable-tremor         Tremor decoder support (default disabled)])
+-if test "${enable_tremor}" = "yes"
+-then
+-  AC_CHECK_HEADERS(tremor/ivorbiscodec.h, [
+-    VLC_ADD_PLUGIN([tremor])
+-   ],[])
+-fi
++PKG_ENABLE_MODULES_VLC([TREMOR], [], [vorbisidec ogg], [Tremor decoder support], [disabled])
+ 
+ dnl
+ dnl  Speex plugins
+diff --git a/modules/codec/Makefile.am b/modules/codec/Makefile.am
+index 075ee2a0e9..637b1d45a6 100644
+--- a/modules/codec/Makefile.am
++++ b/modules/codec/Makefile.am
+@@ -318,7 +318,7 @@ codec_LTLIBRARIES += $(LTLIBdaala)
+ libtremor_plugin_la_SOURCES = codec/vorbis.c
+ libtremor_plugin_la_CPPFLAGS = $(AM_CPPFLAGS) -DMODULE_NAME_IS_tremor
+ libtremor_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(codecdir)'
+-libtremor_plugin_la_LIBADD = -lvorbisdec -logg
++libtremor_plugin_la_LIBADD = $(TREMOR_LIBS)
+ EXTRA_LTLIBRARIES += libtremor_plugin.la
+ codec_LTLIBRARIES += $(LTLIBtremor)
+ 
+-- 
+2.17.1
+
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 4d2e5f26c2..73f84d5eb2 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -512,7 +512,6 @@ VLC_CONF_OPTS += --disable-taglib
 endif
 
 ifeq ($(BR2_PACKAGE_TREMOR),y)
-VLC_CONF_ENV += VORBIS_LIBS="-lvorbisidec"
 VLC_CONF_OPTS += --enable-tremor
 VLC_DEPENDENCIES += tremor
 else
-- 
2.17.1
