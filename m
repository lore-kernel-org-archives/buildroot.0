From: Steve Kenton <skenton@ou.edu>
Date: Mon, 27 Apr 2015 22:42:00 -0500
Subject: [Buildroot] [PATCH v1 1/1] vidstab: new package
Message-ID: <1430192520-16082-1-git-send-email-skenton@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

	  Vid.stab is a video image stabilization library
	  that can be used with ffmpeg --enable-libvidstab
	  and is acknowledged by the ffmpeg developers to
	  be superior to the built-in deshake filter. It
	  works best in a 2-pass configuration but 1-pass
	  is also available when needed/acceptable.

Signed-off-by: Steve Kenton <skenton@ou.edu>
---
I'm planning on using this with ffmpeg but that part is not
ready yet, however libvidstab.so is standalone if others are
interested in using it. It builds with uClibc,  ucLibc-ng,
musl and glibc with just C++ enabled. I know it's late in
the cycle so kick it down the road if you think it should
wait for the ffmpeg integration.

 package/Config.in          |  1 +
 package/vidstab/Config.in  | 20 ++++++++++++++++++++
 package/vidstab/vidstab.mk | 14 ++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/vidstab/Config.in
 create mode 100644 package/vidstab/vidstab.mk

diff --git a/package/Config.in b/package/Config.in
index 4e20e4d..99935d8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -802,6 +802,7 @@ menu "Graphics"
 	source "package/poppler/Config.in"
 	source "package/powervr/Config.in"
 	source "package/tiff/Config.in"
+	source "package/vidstab/Config.in"
 	source "package/wayland/Config.in"
 	source "package/webkit/Config.in"
 	source "package/webp/Config.in"
diff --git a/package/vidstab/Config.in b/package/vidstab/Config.in
new file mode 100644
index 0000000..d900d17
--- /dev/null
+++ b/package/vidstab/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_VIDSTAB
+	bool "vidstab"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Vid.stab is a video image stabilization library
+	  that can be used with ffmpeg --enable-libvidstab
+	  and is acknowledged by the ffmpeg developers to
+	  be superior to the built-in deshake filter. It
+	  works best in a 2-pass configuration but 1-pass
+	  is also available when needed/acceptable.
+
+	  Buildroot does not support packages with a '.'
+	  in their name, which explains why it is named
+	  vidstab and not vid.stab as might be expected.
+
+	  https://github.com/georgmartius/vid.stab
+
+comment "vidstab needs a toolschain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
diff --git a/package/vidstab/vidstab.mk b/package/vidstab/vidstab.mk
new file mode 100644
index 0000000..53fb420
--- /dev/null
+++ b/package/vidstab/vidstab.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# vidstab
+#
+################################################################################
+
+VIDSTAB_VERSION = 3b35b4ddeb595511593a862849e750c459b99cb8
+VIDSTAB_SITE = $(call github,georgmartius,vid.stab,$(VIDSTAB_VERSION))
+VIDSTAB_LICENSE = GPL
+VIDSTAB_LICENSE_FILES = LICENSE
+VIDSTAB_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
+
-- 
2.1.0
