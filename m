From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 22:38:20 +0100
Subject: [Buildroot] [git commit] v4l2grab: new package
Message-ID: <20151218213853.30CC3826C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eda3c0570831efa9fed83a92aa751eae91777fcb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - remove dependency on musl, since libv4l can now be built without
   musl
 - add missing Config.in comment for the toolchain dependencies
 - add hash file.
 - rework commit log.
 - expand Config.in help text.
 - depend on jpeg and not libjpeg, as noticed by Arnout.
 - fix LICENCE_FILE -> LICENSE_FILES typo.]

Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |  1 +
 package/v4l2grab/Config.in     | 20 ++++++++++++++++++++
 package/v4l2grab/v4l2grab.hash |  2 ++
 package/v4l2grab/v4l2grab.mk   | 15 +++++++++++++++
 4 files changed, 38 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 9f63a7a..a0f44fb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -40,6 +40,7 @@ menu "Audio and video applications"
 	source "package/tstools/Config.in"
 	source "package/twolame/Config.in"
 	source "package/upmpdcli/Config.in"
+	source "package/v4l2grab/Config.in"
 	source "package/vlc/Config.in"
 	source "package/vorbis-tools/Config.in"
 	source "package/wavpack/Config.in"
diff --git a/package/v4l2grab/Config.in b/package/v4l2grab/Config.in
new file mode 100644
index 0000000..ec3a7a8
--- /dev/null
+++ b/package/v4l2grab/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_V4L2GRAB
+	bool "v4l2grab"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libv4l
+	depends on BR2_USE_MMU # libv4l
+	depends on !BR2_STATIC_LIBS # libv4l
+	depends on BR2_INSTALL_LIBSTDCPP # libv4l
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libv4l
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBV4L
+	help
+	  Utility for grabbing JPEGs form V4L2 devices. This tool is
+	  similar to v4l2grab available from libv4l contrib directory,
+	  but provides additional features such as JPEG output.
+
+	  http://www.twam.info/software/v4l2grab-grabbing-jpegs-from-v4l2-devices
+
+comment "v4l2grab needs a toolchain w/ threads, dynamic library, C++ and headers >= 3.0"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/v4l2grab/v4l2grab.hash b/package/v4l2grab/v4l2grab.hash
new file mode 100644
index 0000000..fc09f58
--- /dev/null
+++ b/package/v4l2grab/v4l2grab.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 568d51512107226dab1ac809ab1ed4d544ce3f8f505b62c3b2177fb643c8157b v4l2grab-0abed72532bee02e545a1924b6883c839d50febf.tar.gz
diff --git a/package/v4l2grab/v4l2grab.mk b/package/v4l2grab/v4l2grab.mk
new file mode 100644
index 0000000..500f0df
--- /dev/null
+++ b/package/v4l2grab/v4l2grab.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# v4l2grab
+#
+################################################################################
+
+V4L2GRAB_VERSION = 0abed72532bee02e545a1924b6883c839d50febf
+V4L2GRAB_SITE = $(call github,twam,v4l2grab,$(V4L2GRAB_VERSION))
+V4L2GRAB_LICENSE = GPLv2+
+V4L2GRAB_LICENSE_FILES = LICENSE.md
+# Fetched from github, no pre-generated configure script provided
+V4L2GRAB_AUTORECONF = YES
+V4L2GRAB_DEPENDENCIES = jpeg libv4l
+
+$(eval $(autotools-package))
