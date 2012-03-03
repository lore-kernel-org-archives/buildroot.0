From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Mar 2012 22:56:23 +0100
Subject: [Buildroot] [git commit] imagemagick: bump version,
	fix build with zlib
Message-ID: <20120303215643.D4AFB90C3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb54983fdf8f822e6a1000d5622bf6e13f7c259f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recent zlib bump broke imagemagick. This has been fixed upstream
in 6.7.5, but the xml2-config fix is still not upstream and 6.7.5
needs autoconf 2.67 to autoreconf (and we have 2.65), so we cannot
easily use that.

Instead move to the most recent version using autoconf 2.64 and
backport the fix from imagemagick svn. At the same time also
ensure zlib+bzip2 support is picked up if enabled.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../imagemagick-6.6.4-8-use-xml2-config.patch      |   31 ---
 package/imagemagick/imagemagick-zlib-fix.patch     |  227 ++++++++++++++++++++
 package/imagemagick/imagemagick.mk                 |   24 ++-
 3 files changed, 247 insertions(+), 35 deletions(-)

diff --git a/package/imagemagick/imagemagick-6.6.4-8-use-xml2-config.patch b/package/imagemagick/imagemagick-6.6.4-8-use-xml2-config.patch
deleted file mode 100644
index bff4c73..0000000
--- a/package/imagemagick/imagemagick-6.6.4-8-use-xml2-config.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Use the detected xml2-config script
-
-The AC_CHECK_PROG() macro allows to find the location of a particular
-program. In ImageMagick, it is used to find the location of
-xml2-config, and fills it into the xml2_config
-variable. Unfortunately, the check just below hardcodes `xml2-config
---prefix`, without using the variable, which defeats the whole purpose
-of having AC_CHECK_PROG().
-
-So, let's use the ${xml2_config} variable instead. This allows to fix
-cross-compilation issues when a non-standard xml2-config location
-needs to be specified.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: imagemagick-6.6.4-8/configure.ac
-===================================================================
---- imagemagick-6.6.4-8.orig/configure.ac
-+++ imagemagick-6.6.4-8/configure.ac
-@@ -2549,7 +2549,7 @@
-         # Debian installs libxml headers under /usr/include/libxml2/libxml with
-         # the shared library installed under /usr/lib, whereas the package
-         # installs itself under $prefix/libxml and $prefix/lib.
--        xml2_prefix=`xml2-config --prefix`
-+        xml2_prefix=`${xml2_config} --prefix`
-         if test -d "${xml2_prefix}/include/libxml2"; then
-             CPPFLAGS="$CPPFLAGS -I${xml2_prefix}/include/libxml2"
-         fi
diff --git a/package/imagemagick/imagemagick-zlib-fix.patch b/package/imagemagick/imagemagick-zlib-fix.patch
new file mode 100644
index 0000000..1a147af
--- /dev/null
+++ b/package/imagemagick/imagemagick-zlib-fix.patch
@@ -0,0 +1,227 @@
+[PATCH] Fix build with recent versions of zlib
+
+From upstream:
+r6633 + r6636 @ https://www.imagemagick.org/subversion/ImageMagick
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ magick/blob.c |   68 ++++++++++++++++++++++++++++++++++------------------------
+ 1 file changed, 40 insertions(+), 28 deletions(-)
+
+Index: ImageMagick-6.7.2-10/magick/blob.c
+===================================================================
+--- ImageMagick-6.7.2-10.orig/magick/blob.c
++++ ImageMagick-6.7.2-10/magick/blob.c
+@@ -120,8 +120,20 @@
+   StreamType
+     type;
+ 
+-  FILE
+-    *file;
++  union {
++    FILE
++      *file;
++
++#if defined(MAGICKCORE_ZLIB_DELEGATE)
++    gzFile
++      gzfile;
++#endif
++
++#if defined(MAGICKCORE_BZLIB_DELEGATE)
++    BZFILE
++      *bzfile;
++#endif
++  };
+ 
+   struct stat
+     properties;
+@@ -505,14 +517,14 @@
+     case ZipStream:
+     {
+ #if defined(MAGICKCORE_ZLIB_DELEGATE)
+-      (void) gzerror(image->blob->file,&status);
++      (void) gzerror(image->blob->gzfile,&status);
+ #endif
+       break;
+     }
+     case BZipStream:
+     {
+ #if defined(MAGICKCORE_BZLIB_DELEGATE)
+-      (void) BZ2_bzerror((BZFILE *) image->blob->file,&status);
++      (void) BZ2_bzerror(image->blob->bzfile,&status);
+ #endif
+       break;
+     }
+@@ -546,14 +558,14 @@
+     case ZipStream:
+     {
+ #if defined(MAGICKCORE_ZLIB_DELEGATE)
+-      status=gzclose(image->blob->file);
++      status=gzclose(image->blob->gzfile);
+ #endif
+       break;
+     }
+     case BZipStream:
+     {
+ #if defined(MAGICKCORE_BZLIB_DELEGATE)
+-      BZ2_bzclose((BZFILE *) image->blob->file);
++      BZ2_bzclose(image->blob->bzfile);
+ #endif
+       break;
+     }
+@@ -843,7 +855,7 @@
+         status;
+ 
+       status=0;
+-      (void) BZ2_bzerror((BZFILE *) image->blob->file,&status);
++      (void) BZ2_bzerror(image->blob->bzfile,&status);
+       image->blob->eof=status == BZ_UNEXPECTED_EOF ? MagickTrue : MagickFalse;
+ #endif
+       break;
+@@ -2486,8 +2498,8 @@
+                 ((int) magick[2] == 0x08))
+               {
+                 (void) fclose(image->blob->file);
+-                image->blob->file=(FILE *) gzopen(filename,type);
+-                if (image->blob->file != (FILE *) NULL)
++                image->blob->gzfile=gzopen(filename,type);
++                if (image->blob->gzfile != (gzFile) NULL)
+                   image->blob->type=ZipStream;
+                }
+ #endif
+@@ -2495,8 +2507,8 @@
+             if (strncmp((char *) magick,"BZh",3) == 0)
+               {
+                 (void) fclose(image->blob->file);
+-                image->blob->file=(FILE *) BZ2_bzopen(filename,type);
+-                if (image->blob->file != (FILE *) NULL)
++                image->blob->bzfile=BZ2_bzopen(filename,type);
++                if (image->blob->bzfile != (BZFILE *) NULL)
+                   image->blob->type=BZipStream;
+               }
+ #endif
+@@ -2555,8 +2567,8 @@
+           {
+             if (mode == WriteBinaryBlobMode)
+               type="wb";
+-            image->blob->file=(FILE *) gzopen(filename,type);
+-            if (image->blob->file != (FILE *) NULL)
++            image->blob->gzfile=gzopen(filename,type);
++            if (image->blob->gzfile != (gzFile) NULL)
+               image->blob->type=ZipStream;
+           }
+         else
+@@ -2564,8 +2576,8 @@
+ #if defined(MAGICKCORE_BZLIB_DELEGATE)
+           if (LocaleCompare(extension,".bz2") == 0)
+             {
+-              image->blob->file=(FILE *) BZ2_bzopen(filename,type);
+-              if (image->blob->file != (FILE *) NULL)
++              image->blob->bzfile=BZ2_bzopen(filename,type);
++              if (image->blob->bzfile != (BZFILE *) NULL)
+                 image->blob->type=BZipStream;
+             }
+           else
+@@ -2771,12 +2783,12 @@
+       {
+         default:
+         {
+-          count=(ssize_t) gzread(image->blob->file,q,(unsigned int) length);
++          count=(ssize_t) gzread(image->blob->gzfile,q,(unsigned int) length);
+           break;
+         }
+         case 2:
+         {
+-          c=gzgetc(image->blob->file);
++          c=gzgetc(image->blob->gzfile);
+           if (c == EOF)
+             break;
+           *q++=(unsigned char) c;
+@@ -2784,7 +2796,7 @@
+         }
+         case 1:
+         {
+-          c=gzgetc(image->blob->file);
++          c=gzgetc(image->blob->gzfile);
+           if (c == EOF)
+             break;
+           *q++=(unsigned char) c;
+@@ -2799,7 +2811,7 @@
+     case BZipStream:
+     {
+ #if defined(MAGICKCORE_BZLIB_DELEGATE)
+-      count=(ssize_t) BZ2_bzread((BZFILE *) image->blob->file,q,(int) length);
++      count=(ssize_t) BZ2_bzread(image->blob->bzfile,q,(int) length);
+ #endif
+       break;
+     }
+@@ -3527,7 +3539,7 @@
+     case ZipStream:
+     {
+ #if defined(MAGICKCORE_ZLIB_DELEGATE)
+-      if (gzseek(image->blob->file,(off_t) offset,whence) < 0)
++      if (gzseek(image->blob->gzfile,(off_t) offset,whence) < 0)
+         return(-1);
+ #endif
+       image->blob->offset=TellBlob(image);
+@@ -3791,14 +3803,14 @@
+     case ZipStream:
+     {
+ #if defined(MAGICKCORE_ZLIB_DELEGATE)
+-      status=gzflush(image->blob->file,Z_SYNC_FLUSH);
++      status=gzflush(image->blob->gzfile,Z_SYNC_FLUSH);
+ #endif
+       break;
+     }
+     case BZipStream:
+     {
+ #if defined(MAGICKCORE_BZLIB_DELEGATE)
+-      status=BZ2_bzflush((BZFILE *) image->blob->file);
++      status=BZ2_bzflush(image->blob->bzfile);
+ #endif
+       break;
+     }
+@@ -3865,7 +3877,7 @@
+     case ZipStream:
+     {
+ #if defined(MAGICKCORE_ZLIB_DELEGATE)
+-      offset=(MagickOffsetType) gztell(image->blob->file);
++      offset=(MagickOffsetType) gztell(image->blob->gzfile);
+ #endif
+       break;
+     }
+@@ -4014,20 +4026,20 @@
+       {
+         default:
+         {
+-          count=(ssize_t) gzwrite(image->blob->file,(void *) data,
++          count=(ssize_t) gzwrite(image->blob->gzfile,(void *) data,
+             (unsigned int) length);
+           break;
+         }
+         case 2:
+         {
+-          c=gzputc(image->blob->file,(int) *p++);
++          c=gzputc(image->blob->gzfile,(int) *p++);
+           if (c == EOF)
+             break;
+           count++;
+         }
+         case 1:
+         {
+-          c=gzputc(image->blob->file,(int) *p++);
++          c=gzputc(image->blob->gzfile,(int) *p++);
+           if (c == EOF)
+             break;
+           count++;
+@@ -4041,8 +4053,8 @@
+     case BZipStream:
+     {
+ #if defined(MAGICKCORE_BZLIB_DELEGATE)
+-      count=(ssize_t) BZ2_bzwrite((BZFILE *) image->blob->file,(void *) data,
+-        (int) length);
++      count=(ssize_t) BZ2_bzwrite(image->blob->bzfile,(void *) data,(int)
++        length);
+ #endif
+       break;
+     }
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index b2a65e1..602b7a5 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,10 +4,10 @@
 #
 #############################################################
 
-IMAGEMAGICK_MAJOR = 6.6.7
-IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-6
+IMAGEMAGICK_MAJOR = 6.7.2
+IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-10
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
-IMAGEMAGICK_SITE = ftp://ftp.imagemagick.org/pub/ImageMagick
+IMAGEMAGICK_SITE = ftp://ftp.imagemagick.org/pub/ImageMagick/legacy
 IMAGEMAGICK_INSTALL_STAGING = YES
 IMAGEMAGICK_AUTORECONF = YES
 
@@ -30,6 +30,8 @@ IMAGEMAGICK_CONF_OPT = --program-transform-name='s,,,' \
 		--without-fpx \
 		--without-x
 
+IMAGEMAGICK_DEPENDENCIES = host-pkg-config
+
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 IMAGEMAGICK_CONF_OPT += --with-fontconfig
 IMAGEMAGICK_DEPENDENCIES += fontconfig
@@ -67,7 +69,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 IMAGEMAGICK_CONF_OPT += --with-xml
-IMAGEMAGICK_CONF_ENV += ac_cv_prog_xml2_config=$(STAGING_DIR)/usr/bin/xml2-config
+IMAGEMAGICK_CONF_ENV += ac_cv_path_xml2_config=$(STAGING_DIR)/usr/bin/xml2-config
 IMAGEMAGICK_DEPENDENCIES += libxml2
 else
 IMAGEMAGICK_CONF_OPT += --without-xml
@@ -89,6 +91,20 @@ else
 IMAGEMAGICK_CONF_OPT += --without-fftw
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+IMAGEMAGICK_CONF_OPT += --with-zlib
+IMAGEMAGICK_DEPENDENCIES += zlib
+else
+IMAGEMAGICK_CONF_OPT += --without-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+IMAGEMAGICK_CONF_OPT += --with-bzlib
+IMAGEMAGICK_DEPENDENCIES += bzip2
+else
+IMAGEMAGICK_CONF_OPT += --without-bzip2
+endif
+
 define IMAGEMAGICK_REMOVE_CONFIG_SCRIPTS
 	$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,	\
 		   $(addsuffix -config,			\
