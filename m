From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Dec 2010 18:25:20 +0100
Subject: [Buildroot] [PATCH 1/7] imagemagick: add patch to fix libxml2 issue
	and remove useless patch
In-Reply-To: <cover.1293038710.git.thomas.petazzoni@free-electrons.com>
References: <cover.1293038710.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8f23282ed90aabed67682d1f85470571c5ea056d.1293038710.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch imagemagick-6.6.4-add-errno-h-if-argz-h-does-not-exist.patch
was not applied anymore due to a difference in the version number, and
it didn't prevent imagemagick to be built. It was introduced several
years ago together with the ImageMagick package itself, so presumably
it is no longer needed.

The new patch allows ImageMagick to use the correct xml2-config script
to get the proper location for XML2 headers and libraries. Otherwise,
-I/usr/include/libxml2 is found in the compile flags.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../imagemagick-6.6.4-8-use-xml2-config.patch      |   31 ++++++++++++++++++++
 ....6.4-add-errno-h-if-argz-h-does-not-exist.patch |   11 -------
 package/imagemagick/imagemagick.mk                 |    2 +
 3 files changed, 33 insertions(+), 11 deletions(-)
 create mode 100644 package/imagemagick/imagemagick-6.6.4-8-use-xml2-config.patch
 delete mode 100644 package/imagemagick/imagemagick-6.6.4-add-errno-h-if-argz-h-does-not-exist.patch

diff --git a/package/imagemagick/imagemagick-6.6.4-8-use-xml2-config.patch b/package/imagemagick/imagemagick-6.6.4-8-use-xml2-config.patch
new file mode 100644
index 0000000..bff4c73
--- /dev/null
+++ b/package/imagemagick/imagemagick-6.6.4-8-use-xml2-config.patch
@@ -0,0 +1,31 @@
+Use the detected xml2-config script
+
+The AC_CHECK_PROG() macro allows to find the location of a particular
+program. In ImageMagick, it is used to find the location of
+xml2-config, and fills it into the xml2_config
+variable. Unfortunately, the check just below hardcodes `xml2-config
+--prefix`, without using the variable, which defeats the whole purpose
+of having AC_CHECK_PROG().
+
+So, let's use the ${xml2_config} variable instead. This allows to fix
+cross-compilation issues when a non-standard xml2-config location
+needs to be specified.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: imagemagick-6.6.4-8/configure.ac
+===================================================================
+--- imagemagick-6.6.4-8.orig/configure.ac
++++ imagemagick-6.6.4-8/configure.ac
+@@ -2549,7 +2549,7 @@
+         # Debian installs libxml headers under /usr/include/libxml2/libxml with
+         # the shared library installed under /usr/lib, whereas the package
+         # installs itself under $prefix/libxml and $prefix/lib.
+-        xml2_prefix=`xml2-config --prefix`
++        xml2_prefix=`${xml2_config} --prefix`
+         if test -d "${xml2_prefix}/include/libxml2"; then
+             CPPFLAGS="$CPPFLAGS -I${xml2_prefix}/include/libxml2"
+         fi
diff --git a/package/imagemagick/imagemagick-6.6.4-add-errno-h-if-argz-h-does-not-exist.patch b/package/imagemagick/imagemagick-6.6.4-add-errno-h-if-argz-h-does-not-exist.patch
deleted file mode 100644
index 66a6747..0000000
--- a/package/imagemagick/imagemagick-6.6.4-add-errno-h-if-argz-h-does-not-exist.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/configure	2010-09-26 17:05:45.000000000 -0700
-+++ b/configure	2010-09-30 23:47:09.000000000 -0700
-@@ -20354,6 +20354,8 @@ done
- 
- ac_fn_c_check_type "$LINENO" "error_t" "ac_cv_type_error_t" "#if defined(HAVE_ARGZ_H)
- #  include <argz.h>
-+#else
-+#  include <errno.h>
- #endif
- "
- if test "x$ac_cv_type_error_t" = xyes; then :
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 30158e0..aecf7ae 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -9,6 +9,7 @@ IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
 IMAGEMAGICK_SITE = ftp://ftp.imagemagick.org/pub/ImageMagick
 IMAGEMAGICK_LIBTOOL_PATCH = NO
 IMAGEMAGICK_INSTALL_STAGING = YES
+IMAGEMAGICK_AUTORECONF = YES
 
 ifeq ($(BR2_LARGEFILE),y)
 IMAGEMAGICK_CONF_ENV = ac_cv_sys_file_offset_bits=64
@@ -66,6 +67,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 IMAGEMAGICK_CONF_OPT += --with-xml
+IMAGEMAGICK_CONF_ENV += ac_cv_prog_xml2_config=$(STAGING_DIR)/usr/bin/xml2-config
 IMAGEMAGICK_DEPENDENCIES += libxml2
 else
 IMAGEMAGICK_CONF_OPT += --without-xml
-- 
1.7.0.4
