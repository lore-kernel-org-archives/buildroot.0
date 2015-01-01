From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 17:36:23 +0100
Subject: [Buildroot] [git commit] imagemagick: needs thread support
Message-ID: <20150101163739.14A8B8080C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0319d627620dbdb26e08245c8a1a7a01aa9a010e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The no thread support in imagemagick is broken since the last
bump. Since supporting non-threaded configurations is not that
important, let's simply make imagemagick depend on thread support.

Fixes:

  http://autobuild.buildroot.org/results/4e6/4e6d0bbe120579ab4a54960ee794e8cf64b99e80/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/Config.in |    5 +++++
 package/php-imagick/Config.in |    6 ++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/imagemagick/Config.in b/package/imagemagick/Config.in
index 1bd04a9..0bd4df2 100644
--- a/package/imagemagick/Config.in
+++ b/package/imagemagick/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IMAGEMAGICK
 	bool "imagemagick"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  ImageMagick(R) is a software suite to create, edit, and compose
 	  bitmap images. It can read, convert and write images in a variety of
@@ -11,3 +12,7 @@ config BR2_PACKAGE_IMAGEMAGICK
 	  lines, polygons, ellipses and B??zier curves.
 
 	  http://www.imagemagick.org/
+
+comment "imagemagick needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/php-imagick/Config.in b/package/php-imagick/Config.in
index a5e32a5..f759eea 100644
--- a/package/php-imagick/Config.in
+++ b/package/php-imagick/Config.in
@@ -2,8 +2,14 @@ config BR2_PACKAGE_PHP_IMAGICK
 	bool "php-imagick"
 	depends on BR2_PACKAGE_PHP
 	depends on BR2_USE_MMU # imagemagick
+	depends on BR2_TOOLCHAIN_HAS_THREADS # imagemagick
 	select BR2_PACKAGE_IMAGEMAGICK
 	help
 	  PHP wrapper to the ImageMagick library.
 
 	  http://pecl.php.net/package/imagick
+
+comment "php-imagemagick needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_PHP
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
