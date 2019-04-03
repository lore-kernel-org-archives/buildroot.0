From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 22:51:45 +0200
Subject: [Buildroot] [git commit] package/libcamera: new package
Message-ID: <20190403204846.0E74C81056@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25be066a653435773f39c838391789c67ac17852
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

The project has not made an official release as of yet, so we're
using the latest sha1 from master

We utilise C++ 11 but we mandate GCC5+ due to a bug [0] in earlier
versions which result in compile failures on our code base.

[0] Bug 54316 - [C++11] move constructor for stringstream
    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54316

Documentation and Tests are disabled from the build.

With the following added to libcamera.config:

  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
  BR2_PACKAGE_LIBCAMERA=y

./utils/test-pkg -c libcamera.config -p libcamera
                             br-arm-full [1/6]: SKIPPED
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: SKIPPED

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas:
 - add missing Config.in comment
 - remove empty newline at end of hash file
 - adjust indentation of upstream URL in Config.in help text]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/libcamera/Config.in      | 17 +++++++++++++++++
 package/libcamera/libcamera.hash |  3 +++
 package/libcamera/libcamera.mk   | 18 ++++++++++++++++++
 5 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 36e3ab20c8..8c6d5f9959 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1268,6 +1268,9 @@ F:	package/ramsmp/
 N:	Kevin Joly <kevin.joly@sensefly.com>
 F:	package/libgphoto2/
 
+N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
+F:	package/libcamera/
+
 N:	Koen Martens <gmc@sonologic.nl>
 F:	package/capnproto/
 F:	package/linuxconsoletools/
diff --git a/package/Config.in b/package/Config.in
index e5a93dba1f..5c42fb141d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1480,6 +1480,7 @@ menu "Multimedia"
 	source "package/libass/Config.in"
 	source "package/libbdplus/Config.in"
 	source "package/libbluray/Config.in"
+	source "package/libcamera/Config.in"
 	source "package/libdcadec/Config.in"
 	source "package/libdvbcsa/Config.in"
 	source "package/libdvbpsi/Config.in"
diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
new file mode 100644
index 0000000000..0b3540a657
--- /dev/null
+++ b/package/libcamera/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBCAMERA
+	bool "libcamera"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# C++11 + https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54316
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on BR2_PACKAGE_HAS_UDEV
+	help
+	  libcamera provides a software stack to support
+	  complex devices that need heavy hardware image
+	  processing operations.
+
+	  http://www.libcamera.org/
+
+comment "libcamera needs udev and a toolchain w/ C++, threads, gcc >= 5"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_PACKAGE_HAS_UDEV
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
new file mode 100644
index 0000000000..5ad345f29f
--- /dev/null
+++ b/package/libcamera/libcamera.hash
@@ -0,0 +1,3 @@
+sha256 2c01dc76d98ef257660f8ef3f4f17f042e112b5eca6b364ad615220c96fbd066  libcamera-d5ca33f6c7b0cd1ca20ec5dc7131aeedf1503080.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licenses/gnu-gpl-2.0.txt
+sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  licenses/gnu-lgpl-2.1.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
new file mode 100644
index 0000000000..08cbb98020
--- /dev/null
+++ b/package/libcamera/libcamera.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libcamera
+#
+################################################################################
+
+LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
+LIBCAMERA_VERSION = d5ca33f6c7b0cd1ca20ec5dc7131aeedf1503080
+LIBCAMERA_SITE_METHOD = git
+LIBCAMERA_DEPENDENCIES = udev
+LIBCAMERA_CONF_OPTS = -Dtests=false -Ddocumentation=false
+LIBCAMERA_INSTALL_STAGING = yes
+LIBCAMERA_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (utils)
+LIBCAMERA_LICENSE_FILES = \
+	licenses/gnu-gpl-2.0.txt \
+	licenses/gnu-lgpl-2.1.txt
+
+$(eval $(meson-package))
