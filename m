From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 17:19:46 +0100
Subject: [Buildroot] [git commit] fswebcam: new package
Message-ID: <20131228162200.EEBF39C221@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=161e8fa58e4f2bd66b4bacec962b417500293906
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - use the autotools-package infrastructure, since the package uses an
   autoconf configure script.
 - remove uninstall and clean commands since those are no longer
   supported by Buildroot.
 - rewrap the help text.
 - order alphabetically the package in package/Config.in]

Signed-off-by: Lucas De Marchi <lucas.de.marchi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/fswebcam/Config.in   |   16 ++++++++++++++++
 package/fswebcam/fswebcam.mk |   14 ++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 43a8ed5..429b519 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -164,6 +164,7 @@ endmenu
 menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
+source "package/fswebcam/Config.in"
 source "package/gnuplot/Config.in"
 source "package/jhead/Config.in"
 source "package/rrdtool/Config.in"
diff --git a/package/fswebcam/Config.in b/package/fswebcam/Config.in
new file mode 100644
index 0000000..7724639
--- /dev/null
+++ b/package/fswebcam/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_FSWEBCAM
+	bool "fswebcam"
+	select BR2_PACKAGE_GD
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBPNG
+	help
+	  fswebcam is a neat and simple webcam app. It captures images
+	  from a V4L1/V4L2 compatible device or file, averages them to
+	  reduce noise and draws a caption using the GD Graphics
+	  Library which also handles compressing the image to PNG or
+	  JPEG. The resulting image is saved to a file or sent to
+	  stdio where it can be piped to something like ncftpput or
+	  scp.
+
+	  http://www.firestorm.cx/fswebcam/
diff --git a/package/fswebcam/fswebcam.mk b/package/fswebcam/fswebcam.mk
new file mode 100644
index 0000000..2275fb5
--- /dev/null
+++ b/package/fswebcam/fswebcam.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# fswebcam
+#
+################################################################################
+
+FSWEBCAM_VERSION = 20110717
+FSWEBCAM_SITE = http://www.firestorm.cx/fswebcam/files/
+FSWEBCAM_LICENSE = GPLv2
+FSWEBCAM_LICENSE_FILES = LICENSE
+
+FSWEBCAM_DEPENDENCIES += freetype jpeg libpng gd
+
+$(eval $(autotools-package))
