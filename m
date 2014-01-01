From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Wed, 1 Jan 2014 21:42:49 +0100
Subject: [Buildroot] [PATCH 1/1] minidlna: bump version to 1.1.1
Message-ID: <BLU0-SMTP1245369C4049BDF785E78C9D9C80@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 .../minidlna-0001-fix-genconfig-script.patch       |   95 --------------------
 package/minidlna/minidlna-0002-fix-Makefile.patch  |   20 -----
 .../minidlna-0003-fix-missing-include.patch        |   19 ----
 .../minidlna-0004-fix-libavformat-use.patch        |   20 -----
 package/minidlna/minidlna.mk                       |   45 +---------
 5 files changed, 4 insertions(+), 195 deletions(-)
 delete mode 100644 package/minidlna/minidlna-0001-fix-genconfig-script.patch
 delete mode 100644 package/minidlna/minidlna-0002-fix-Makefile.patch
 delete mode 100644 package/minidlna/minidlna-0003-fix-missing-include.patch
 delete mode 100644 package/minidlna/minidlna-0004-fix-libavformat-use.patch

diff --git a/package/minidlna/minidlna-0001-fix-genconfig-script.patch b/package/minidlna/minidlna-0001-fix-genconfig-script.patch
deleted file mode 100644
index 9a7b4e0..0000000
--- a/package/minidlna/minidlna-0001-fix-genconfig-script.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-Fix the genconfig.sh script, which has a hard-coded host prefix.
-
-N.B. The upstream CVS HEAD has been converted to GNU autotools, but a
-tarball has not yet been released. When the next release tarball is made
-available, this patch can be removed.
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-
-diff -Nurp a/genconfig.sh b/genconfig.sh
---- a/genconfig.sh	2012-01-21 00:34:13.000000000 +0000
-+++ b/genconfig.sh	2013-05-04 21:05:12.025002800 +0100
-@@ -27,6 +27,8 @@ CONFIGMACRO="__CONFIG_H__"
- DB_PATH="/tmp/minidlna"
- # Log path
- LOG_PATH="${DB_PATH}"
-+# Host prefix
-+PREFIX=${PREFIX:-/usr}
- 
- # detecting the OS name and version
- OS_NAME=`uname -s`
-@@ -40,22 +42,22 @@ ${RM} ${CONFIGFILE}
- 
- # Detect if there are missing headers
- # NOTE: This check only works with a normal distro
--[ ! -e "/usr/include/sqlite3.h" ] && MISSING="libsqlite3 $MISSING"
--[ ! -e "/usr/include/jpeglib.h" ] && MISSING="libjpeg $MISSING"
--[ ! -e "/usr/include/libexif/exif-loader.h" ] && MISSING="libexif $MISSING"
--[ ! -e "/usr/include/id3tag.h" ] && MISSING="libid3tag $MISSING"
--[ ! -e "/usr/include/ogg/ogg.h" ] && MISSING="libogg $MISSING"
--[ ! -e "/usr/include/vorbis/codec.h" ] && MISSING="libvorbis $MISSING"
--[ ! -e "/usr/include/FLAC/metadata.h" ] && MISSING="libflac $MISSING"
--[ ! -e "/usr/include/ffmpeg/avutil.h" -a \
--  ! -e "/usr/include/libavutil/avutil.h" -a \
--  ! -e "/usr/include/ffmpeg/libavutil/avutil.h" ] && MISSING="libavutil $MISSING"
--[ ! -e "/usr/include/ffmpeg/avformat.h" -a \
--  ! -e "/usr/include/libavformat/avformat.h" -a \
--  ! -e "/usr/include/ffmpeg/libavformat/avformat.h" ] && MISSING="libavformat $MISSING"
--[ ! -e "/usr/include/ffmpeg/avcodec.h" -a \
--  ! -e "/usr/include/libavcodec/avcodec.h" -a \
--  ! -e "/usr/include/ffmpeg/libavcodec/avcodec.h" ] && MISSING="libavcodec $MISSING"
-+[ ! -e "$PREFIX/include/sqlite3.h" ] && MISSING="libsqlite3 $MISSING"
-+[ ! -e "$PREFIX/include/jpeglib.h" ] && MISSING="libjpeg $MISSING"
-+[ ! -e "$PREFIX/include/libexif/exif-loader.h" ] && MISSING="libexif $MISSING"
-+[ ! -e "$PREFIX/include/id3tag.h" ] && MISSING="libid3tag $MISSING"
-+[ ! -e "$PREFIX/include/ogg/ogg.h" ] && MISSING="libogg $MISSING"
-+[ ! -e "$PREFIX/include/vorbis/codec.h" ] && MISSING="libvorbis $MISSING"
-+[ ! -e "$PREFIX/include/FLAC/metadata.h" ] && MISSING="libflac $MISSING"
-+[ ! -e "$PREFIX/include/ffmpeg/avutil.h" -a \
-+  ! -e "$PREFIX/include/libavutil/avutil.h" -a \
-+  ! -e "$PREFIX/include/ffmpeg/libavutil/avutil.h" ] && MISSING="libavutil $MISSING"
-+[ ! -e "$PREFIX/include/ffmpeg/avformat.h" -a \
-+  ! -e "$PREFIX/include/libavformat/avformat.h" -a \
-+  ! -e "$PREFIX/include/ffmpeg/libavformat/avformat.h" ] && MISSING="libavformat $MISSING"
-+[ ! -e "$PREFIX/include/ffmpeg/avcodec.h" -a \
-+  ! -e "$PREFIX/include/libavcodec/avcodec.h" -a \
-+  ! -e "$PREFIX/include/ffmpeg/libavcodec/avcodec.h" ] && MISSING="libavcodec $MISSING"
- if [ -n "$MISSING" ]; then
- 	echo -e "\nERROR!  Cannot continue."
- 	echo -e "The following required libraries are either missing, or are missing development headers:\n"
-@@ -88,7 +90,7 @@ case $OS_NAME in
- 		OS_URL=http://www.openbsd.org/
- 		;;
- 	FreeBSD)
--		VER=`grep '#define __FreeBSD_version' /usr/include/sys/param.h | awk '{print $3}'`
-+		VER=`grep '#define __FreeBSD_version' $PREFIX/include/sys/param.h | awk '{print $3}'`
- 		if [ $VER -ge 700049 ]; then
- 			echo "#define PFRULE_INOUT_COUNTS" >> ${CONFIGFILE}
- 		fi
-@@ -175,7 +177,7 @@ echo "#define USE_DAEMON" >> ${CONFIGFIL
- echo "" >> ${CONFIGFILE}
- 
- echo "/* Enable if the system inotify.h exists.  Otherwise our own inotify.h will be used. */" >> ${CONFIGFILE}
--if [ -f /usr/include/sys/inotify.h ]; then
-+if [ -f $PREFIX/include/sys/inotify.h ]; then
- echo "#define HAVE_INOTIFY_H" >> ${CONFIGFILE}
- else
- echo "/*#define HAVE_INOTIFY_H*/" >> ${CONFIGFILE}
-@@ -183,7 +185,7 @@ fi
- echo "" >> ${CONFIGFILE}
- 
- echo "/* Enable if the system iconv.h exists.  ID3 tag reading in various character sets will not work properly otherwise. */" >> ${CONFIGFILE}
--if [ -f /usr/include/iconv.h ]; then
-+if [ -f $PREFIX/include/iconv.h ]; then
- echo "#define HAVE_ICONV_H" >> ${CONFIGFILE}
- else
- echo -e "\nWARNING!!  Iconv support not found.  ID3 tag reading may not work."
-@@ -192,7 +194,7 @@ fi
- echo "" >> ${CONFIGFILE}
- 
- echo "/* Enable if the system libintl.h exists for NLS support. */" >> ${CONFIGFILE}
--if [ -f /usr/include/libintl.h ]; then
-+if [ -f $PREFIX/include/libintl.h ]; then
- echo "#define ENABLE_NLS" >> ${CONFIGFILE}
- else
- echo "/*#define ENABLE_NLS*/" >> ${CONFIGFILE}
diff --git a/package/minidlna/minidlna-0002-fix-Makefile.patch b/package/minidlna/minidlna-0002-fix-Makefile.patch
deleted file mode 100644
index 7d9867d..0000000
--- a/package/minidlna/minidlna-0002-fix-Makefile.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Fix the Makefile.
-
-N.B. The upstream CVS HEAD has been converted to GNU autotools, but a
-tarball has not yet been released. When the next release tarball is made
-available, this patch can be removed.
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-
-diff -Nurp a/Makefile b/Makefile
---- a/Makefile	2012-01-17 22:49:01.000000000 +0000
-+++ b/Makefile	2013-05-04 22:29:19.947073948 +0100
-@@ -64,7 +64,7 @@ install-conf:
- 	$(INSTALL) -d $(ETCINSTALLDIR)
- 	$(INSTALL) --mode=0644 minidlna.conf $(ETCINSTALLDIR)
- 
--minidlna:	$(BASEOBJS) $(LNXOBJS) $(LIBS)
-+minidlna:	$(BASEOBJS) $(LNXOBJS)
- 	@echo Linking $@
- 	@$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(BASEOBJS) $(LNXOBJS) $(LIBS)
- 
diff --git a/package/minidlna/minidlna-0003-fix-missing-include.patch b/package/minidlna/minidlna-0003-fix-missing-include.patch
deleted file mode 100644
index 124b0da..0000000
--- a/package/minidlna/minidlna-0003-fix-missing-include.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Fix a missing header include, required for S_ISVTX et al.
-
-N.B. This change is in the upstream CVS HEAD, but is not in the latest
-released tarball. When the next release tarball is made available, this
-patch can be removed.
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-
-diff -Nurp a/minidlna.c b/minidlna.c
---- a/minidlna.c	2012-05-08 01:10:42.000000000 +0100
-+++ b/minidlna.c	2013-05-04 21:28:35.372717737 +0100
-@@ -57,6 +57,7 @@
- #include <arpa/inet.h>
- #include <fcntl.h>
- #include <sys/file.h>
-+#include <sys/stat.h>
- #include <sys/time.h>
- #include <time.h>
- #include <signal.h>
diff --git a/package/minidlna/minidlna-0004-fix-libavformat-use.patch b/package/minidlna/minidlna-0004-fix-libavformat-use.patch
deleted file mode 100644
index a51262d..0000000
--- a/package/minidlna/minidlna-0004-fix-libavformat-use.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Work around a broken test for libavformat version.
-
-N.B. This change is in the upstream CVS HEAD, but is not in the latest
-released tarball. When the next release tarball is made available, this
-patch can be removed.
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-
-diff -Nurp a/metadata.c b/metadata.c
---- a/metadata.c	2012-06-29 22:11:29.000000000 +0100
-+++ b/metadata.c	2013-05-04 22:22:47.128202396 +0100
-@@ -110,7 +110,7 @@ lav_open(AVFormatContext **ctx, const ch
- static inline void
- lav_close(AVFormatContext *ctx)
- {
--#if LIBAVFORMAT_VERSION_INT >= ((53<<16)+(2<<8)+0)
-+#if LIBAVFORMAT_VERSION_INT >= ((53<<16)+(17<<8)+0)
- 	avformat_close_input(&ctx);
- #else
- 	av_close_input_file(ctx);
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 85ad018..eb1623b 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIDLNA_VERSION = 1.0.26
+MINIDLNA_VERSION = 1.1.1
 MINIDLNA_SITE = http://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
 MINIDLNA_LICENSE = GPLv2 BSD-3c
 MINIDLNA_LICENSE_FILES = LICENCE LICENCE.miniupnpd
@@ -13,44 +13,7 @@ MINIDLNA_DEPENDENCIES = \
 	ffmpeg flac libvorbis libogg libid3tag libexif libjpeg sqlite \
 	host-xutil_makedepend
 
-MINIDLNA_CFLAGS=$(TARGET_CFLAGS) \
-	-I"$(STAGING_DIR)/usr/include/libavutil" \
-	-I"$(STAGING_DIR)/usr/include/libavcodec" \
-	-I"$(STAGING_DIR)/usr/include/libavformat"
+MINIDLNA_CONF_OPT = \
+	--disable-static
 
-MINIDLNA_COMMON_LIBS = \
-	-lpthread -lexif -ljpeg -lsqlite3 -lavformat -lavutil -lavcodec \
-	-lid3tag -lFLAC -logg -lvorbis
-
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-MINIDLNA_DEPENDENCIES += gettext
-# we need to link with libintl
-MINIDLNA_COMMON_LIBS += -lintl
-endif
-
-ifeq ($(BR2_PACKAGE_LIBICONV),y)
-MINIDLNA_DEPENDENCIES += libiconv
-MINIDLNA_COMMON_LIBS += -liconv
-endif
-
-MINIDLNA_MAKE_OPTS += LIBS='$(MINIDLNA_COMMON_LIBS)'
-
-# genconfig.sh uses absolute paths to find libav, so help it out
-define MINIDLNA_BUILD_CMDS
-	PREFIX=$(STAGING_DIR)/usr \
-		$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(MINIDLNA_CFLAGS)" -C $(@D) depend
-	$(SED) '/HAVE_LIBAV/d' $(@D)/config.h
-	echo "#define HAVE_LIBAVUTIL_AVUTIL_H 1" >>$(@D)/config.h
-	echo "#define HAVE_LIBAVFORMAT_AVFORMAT_H 1" >>$(@D)/config.h
-	echo "#define HAVE_LIBAVCODEC_AVCODEC_H 1" >>$(@D)/config.h
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(MINIDLNA_CFLAGS)" $(MINIDLNA_MAKE_OPTS) -C $(@D) all
-endef
-
-define MINIDLNA_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		-C $(@D) DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
1.7.9.5
