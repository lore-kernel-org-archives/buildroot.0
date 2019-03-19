From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Tue, 19 Mar 2019 11:03:26 +0000
Subject: [Buildroot] [RFC PATCH] package/libcamera: Add libcamera package
Message-ID: <20190319110326.15153-1-kieran.bingham@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  http://libcamera.org/

Cameras are complex devices that need heavy hardware image processing
operations. Control of the processing is based on advanced algorithms
that must run on a programmable processor. This has traditionally been
implemented in a dedicated MCU in the camera, but in embedded devices
algorithms have been moved to the main CPU to save cost. Blurring the
boundary between camera devices and Linux often left the user with no
other option than a vendor-specific closed-source solution.

To address this problem the Linux media community has very recently
started collaboration with the industry to develop a camera stack that
will be open-source-friendly while still protecting vendor core IP.
libcamera was born out of that collaboration and will offer modern
camera support to Linux-based systems, including traditional Linux
distributions, ChromeOS and Android.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
We do not yet have an official 'release', so I'm sending this as an
early RFC, with
  LIBCAMERA_VERSION = origin/master
and no .hash file.

Is this still suitable to go in and be updated when we have a tagged
release later?


 DEVELOPERS                     |  3 +++
 package/Config.in              |  1 +
 package/libcamera/Config.in    | 11 +++++++++++
 package/libcamera/libcamera.mk | 13 +++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/libcamera/Config.in
 create mode 100644 package/libcamera/libcamera.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c91325e28486..5bcdf208a62b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1260,6 +1260,9 @@ F:	package/ramsmp/
 N:	Kevin Joly <kevin.joly@sensefly.com>
 F:	package/libgphoto2/
 
+N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
+F:	package/libcamera/
+
 N:	Koen Martens <gmc@sonologic.nl>
 F:	package/capnproto/
 F:	package/linuxconsoletools/
diff --git a/package/Config.in b/package/Config.in
index b5321aeb49c9..a9d25e58b202 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1472,6 +1472,7 @@ menu "Multimedia"
 	source "package/libass/Config.in"
 	source "package/libbdplus/Config.in"
 	source "package/libbluray/Config.in"
+	source "package/libcamera/Config.in"
 	source "package/libdcadec/Config.in"
 	source "package/libdvbcsa/Config.in"
 	source "package/libdvbpsi/Config.in"
diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
new file mode 100644
index 000000000000..c80f58c00f17
--- /dev/null
+++ b/package/libcamera/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBCAMERA
+	bool "libcamera"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_PACKAGE_HAS_UDEV
+	help
+	  libcamera provides a software stack to support complex devices that
+	  need heavy hardware image processing operations.
+
+	  http://www.libcamera.org/
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
new file mode 100644
index 000000000000..4d908c7a3645
--- /dev/null
+++ b/package/libcamera/libcamera.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libcamera
+#
+################################################################################
+
+LIBCAMERA_VERSION = origin/master
+LIBCAMERA_SITE = git://linuxtv.org/libcamera.git
+LIBCAMERA_SITE_METHOD = git
+LIBCAMERA_DEPENDENCIES = udev
+LIBCAMERA_LICENSE = LGPL-2.0+
+
+$(eval $(meson-package))
-- 
2.19.1
