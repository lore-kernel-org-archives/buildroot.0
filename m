From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Oct 2014 09:41:57 -0300
Subject: [Buildroot] [PATCH] imagemagick: bump to version 6.8.9-9
Message-ID: <1414413717-15205-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash file.
And drop autoreconf/patch, it's is finally upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../imagemagick-01-use-xml2-config.patch           | 31 ----------------------
 package/imagemagick/imagemagick.hash               |  2 ++
 package/imagemagick/imagemagick.mk                 |  3 +--
 3 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 package/imagemagick/imagemagick-01-use-xml2-config.patch
 create mode 100644 package/imagemagick/imagemagick.hash

diff --git a/package/imagemagick/imagemagick-01-use-xml2-config.patch b/package/imagemagick/imagemagick-01-use-xml2-config.patch
deleted file mode 100644
index bff4c73..0000000
--- a/package/imagemagick/imagemagick-01-use-xml2-config.patch
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
diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
new file mode 100644
index 0000000..e67e059
--- /dev/null
+++ b/package/imagemagick/imagemagick.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	a4cccc70179ff2c67550e063cdcb2e62907338ef3e68b45bb1c41931e515b3eb	ImageMagick-6.8.9-9.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 88d1196..a1296d4 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.8.9-8
+IMAGEMAGICK_VERSION = 6.8.9-9
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
@@ -14,7 +14,6 @@ IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
 
 IMAGEMAGICK_INSTALL_STAGING = YES
-IMAGEMAGICK_AUTORECONF = YES
 IMAGEMAGICK_CONFIG_SCRIPTS = \
 	$(addsuffix -config,Magick MagickCore MagickWand Wand)
 
-- 
2.0.4
