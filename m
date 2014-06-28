From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Jun 2014 22:38:54 -0300
Subject: [Buildroot] [PATCH 3/3] sox: new package
In-Reply-To: <1403919534-28847-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403919534-28847-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403919534-28847-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like ImageMagick, but for audio files.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                 |  1 +
 package/sox/Config.in             | 10 ++++
 package/sox/sox-0001-uclibc.patch | 26 +++++++++++
 package/sox/sox.mk                | 98 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 135 insertions(+)
 create mode 100644 package/sox/Config.in
 create mode 100644 package/sox/sox-0001-uclibc.patch
 create mode 100644 package/sox/sox.mk

diff --git a/package/Config.in b/package/Config.in
index 51cf204..4889c33 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -23,6 +23,7 @@ menu "Audio and video applications"
 	source "package/on2-8170-libs/Config.in"
 	source "package/opus-tools/Config.in"
 	source "package/pulseaudio/Config.in"
+	source "package/sox/Config.in"
 	source "package/tidsp-binaries/Config.in"
 	source "package/tstools/Config.in"
 	source "package/twolame/Config.in"
diff --git a/package/sox/Config.in b/package/sox/Config.in
new file mode 100644
index 0000000..57585d7
--- /dev/null
+++ b/package/sox/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SOX
+	bool "sox"
+	help
+	  SoX is a cross-platform (Windows, Linux, MacOS X, etc.) command line
+	  utility that can convert various formats of computer audio files
+	  in to other formats.
+	  It can also apply various effects to these sound files, and, as an
+	  added bonus, SoX can play and record audio files on most platforms.
+
+	  http://sox.sourceforge.net/
diff --git a/package/sox/sox-0001-uclibc.patch b/package/sox/sox-0001-uclibc.patch
new file mode 100644
index 0000000..5c118fa
--- /dev/null
+++ b/package/sox/sox-0001-uclibc.patch
@@ -0,0 +1,26 @@
+Make SoX support uclibc-based toolchains, from:
+http://sourceforge.net/p/sox/bugs/179/
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+Index: sox-14.4.1/src/formats.c
+===================================================================
+--- sox-14.4.1.orig/src/formats.c
++++ sox-14.4.1/src/formats.c
+@@ -409,7 +409,7 @@ static void UNUSED rewind_pipe(FILE * fp
+ #if defined _FSTDIO || defined _NEWLIB_VERSION || defined __APPLE__
+   fp->_p -= PIPE_AUTO_DETECT_SIZE;
+   fp->_r += PIPE_AUTO_DETECT_SIZE;
+-#elif defined __GLIBC__
++#elif defined __GLIBC__ && ! defined __UCLIBC__
+   fp->_IO_read_ptr = fp->_IO_read_base;
+ #elif defined _MSC_VER || defined _WIN32 || defined _WIN64 || defined _ISO_STDIO_ISO_H
+   fp->_ptr = fp->_base;
+@@ -417,7 +417,6 @@ static void UNUSED rewind_pipe(FILE * fp
+   /* To fix this #error, either simply remove the #error line and live without
+    * file-type detection with pipes, or add support for your compiler in the
+    * lines above.  Test with cat monkey.wav | ./sox --info - */
+-  #error FIX NEEDED HERE
+   #define NO_REWIND_PIPE
+   (void)fp;
+ #endif
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
new file mode 100644
index 0000000..508faf7
--- /dev/null
+++ b/package/sox/sox.mk
@@ -0,0 +1,98 @@
+################################################################################
+#
+# sox
+#
+################################################################################
+
+SOX_VERSION = 14.4.1
+SOX_SITE = http://downloads.sourceforge.net/project/sox/sox/$(SOX_VERSION)
+SOX_DEPENDENCIES = host-pkgconf
+SOX_CONF_OPT = --with-distro="Buildroot" --without-ffmpeg --disable-gomp
+SOX_LICENSE = GPLv2+ (sox binary), LGPLv2.1+ (libraries)
+SOX_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
+SOX_DEPENDENCIES += alsa-lib
+else
+SOX_CONF_OPT += --without-alsa
+endif
+
+ifeq ($(BR2_PACKAGE_FILE),y)
+SOX_DEPENDENCIES += file
+else
+SOX_CONF_OPT += --without-magic
+endif
+
+ifeq ($(BR2_PACKAGE_FLAC),y)
+SOX_DEPENDENCIES += flac
+else
+SOX_CONF_OPT += --without-flac
+endif
+
+ifeq ($(BR2_PACKAGE_LAME),y)
+SOX_DEPENDENCIES += lame
+else
+SOX_CONF_OPT += --without-lame
+endif
+
+ifeq ($(BR2_PACKAGE_LIBAO),y)
+SOX_DEPENDENCIES += libao
+else
+SOX_CONF_OPT += --without-ao
+endif
+
+ifeq ($(BR2_PACKAGE_LIBID3TAG),y)
+SOX_DEPENDENCIES += libid3tag
+else
+SOX_CONF_OPT += --without-id3tag
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMAD),y)
+SOX_DEPENDENCIES += libmad
+else
+SOX_CONF_OPT += --without-mad
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+SOX_DEPENDENCIES += libpng
+else
+SOX_CONF_OPT += --without-png
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+SOX_DEPENDENCIES += libsndfile
+else
+SOX_CONF_OPT += --without-sndfile
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+SOX_DEPENDENCIES += libvorbis
+else
+SOX_CONF_OPT += --without-oggvorbis
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCORE_AMR),y)
+SOX_DEPENDENCIES += opencore-amr
+else
+SOX_CONF_OPT += --without-amrwb --without-amrnb
+endif
+
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+SOX_DEPENDENCIES += pulseaudio
+else
+SOX_CONF_OPT += --without-pulseaudio
+endif
+
+ifeq ($(BR2_PACKAGE_TWOLAME),y)
+SOX_DEPENDENCIES += twolame
+else
+SOX_CONF_OPT += --without-twolame
+endif
+
+ifeq ($(BR2_PACKAGE_WAVPACK),y)
+SOX_DEPENDENCIES += wavpack
+else
+SOX_CONF_OPT += --without-wavpack
+endif
+
+$(eval $(autotools-package))
-- 
1.8.5.5
