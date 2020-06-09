From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  9 Jun 2020 23:06:34 +0200
Subject: [Buildroot] [PATCH v1] package/libcamera: bump version to 8823461
Message-ID: <20200609210634.15653-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add host dependencies: openssl, pkgconf, pyhton3-pyyaml
- add dependencies: boost, gnutls
- changed from mandatory to optional dependency: udev
- add optional dependencies: gstreamer1/gst1-plugins-base,
  qt5base, tiff
- update license info (Apache-2.0 omitted - aplies only for android code)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libcamera/Config.in      | 12 ++++----
 package/libcamera/libcamera.hash | 15 ++++++++--
 package/libcamera/libcamera.mk   | 48 +++++++++++++++++++++++++++-----
 3 files changed, 60 insertions(+), 15 deletions(-)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 0b3540a657..5253c14cf1 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -2,9 +2,11 @@ config BR2_PACKAGE_LIBCAMERA
 	bool "libcamera"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# C++11 + https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54316
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	depends on !BR2_STATIC_LIBS # gnutls
+	depends on BR2_USE_WCHAR # boost, gnutls
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_GNUTLS
 	help
 	  libcamera provides a software stack to support
 	  complex devices that need heavy hardware image
@@ -12,6 +14,6 @@ config BR2_PACKAGE_LIBCAMERA
 
 	  http://www.libcamera.org/
 
-comment "libcamera needs udev and a toolchain w/ C++, threads, gcc >= 5"
+comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 5"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_PACKAGE_HAS_UDEV
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 6f721d87ee..48c90587d3 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,3 +1,12 @@
-sha256 cbaa7e06059717f71b57f9c20135c86d5f121d9aab10bfc20513ba5d04478756  libcamera-448393f77ec9e37cb807e8e8d35c1a4877d253d4.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licenses/gnu-gpl-2.0.txt
-sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  licenses/gnu-lgpl-2.1.txt
+sha256  a7ee893f16f789b5b4c7ffdf3346b887f21b3ead91a544e6a25a9c798f5f3e67  libcamera-8823461d80ad64b972bc6d568c47aba50bed26a4.tar.gz
+
+# license files
+sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
+sha256  e11af671c491efac2f94c1d752bea92f4308ca2450c7d11e582e4b48c40e4de1  LICENSES/BSD-3-Clause.txt
+sha256  6a573fb2f9082662978cf21fb153096df0a1981deaea7dbc10a11046fe005d9f  LICENSES/CC0-1.0.txt
+sha256  ec3732087acf8c52429a020d6bba362ff578705bdb53365a21744485ec15b0e6  LICENSES/CC-BY-SA-4.0.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  606aa26338f69ce178f1cbc648b7574aec4b5bbaeb20f4df36ff49010cb8fbbd  LICENSES/GPL-2.0-or-later.txt
+sha256  1ccf09bf2f598308df4bed9cd8e9657dc5cd0973d2800318f2e241486e2edf3f  LICENSES/LGPL-2.1-or-later.txt
+sha256  3f9e477523febab58de8b716ccfbcf02e6ef1c8e7728953905e8558637abe2a9  LICENSES/Linux-syscall-note.txt
+sha256  8f25018489d6fe0dec34a352314c38dc146247b7de65735790f4398a92afa84b  LICENSES/MIT.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index d209a38df3..d24ea7221d 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,14 +5,48 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = 448393f77ec9e37cb807e8e8d35c1a4877d253d4
+LIBCAMERA_VERSION = 8823461d80ad64b972bc6d568c47aba50bed26a4
 LIBCAMERA_SITE_METHOD = git
-LIBCAMERA_DEPENDENCIES = udev
-LIBCAMERA_CONF_OPTS = -Dtest=false -Ddocumentation=false
+LIBCAMERA_DEPENDENCIES = \
+	host-openssl \
+	host-pkgconf \
+	host-python3-pyyaml \
+	boost \
+	gnutls
+LIBCAMERA_CONF_OPTS = \
+	-Dandroid=false \
+	-Ddocumentation=false \
+	-Dtest=false \
+	-Dv4l2=false
 LIBCAMERA_INSTALL_STAGING = yes
-LIBCAMERA_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (utils)
-LIBCAMERA_LICENSE_FILES = \
-	licenses/gnu-gpl-2.0.txt \
-	licenses/gnu-lgpl-2.1.txt
+LIBCAMERA_LICENSE = \
+	LGPL-2.1+ (library), \
+	GPL-2.0+ (utils), \
+	MIT (qcam/assets/feathericons), \
+	BSD-2-Clause (raspberrypi), \
+	GPL-2.0 with Linux-syscall-note or BSD-3-Clause (linux kernel headers), \
+	CC0-1.0 (meson build system), \
+	CC-BY-SA-4.0 (doc)
+
+# gstreamer-video-1.0, gstreamer-allocators-1.0
+ifeq ($(BR2_PACKAGE_GSTREAMER1)$(BR2_PACKAGE_GST1_PLUGINS_BASE),yy)
+LIBCAMERA_CONF_OPTS += -Dgstreamer=enabled
+LIBCAMERA_DEPENDENCIES += gstreamer1 gst1-plugins-base
+endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
+LIBCAMERA_DEPENDENCIES += qt5base
+ifeq ($(BR2_PACKAGE_QT5TOOLS)$(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS),yy)
+LIBCAMERA_DEPENDENCIES += qt5tools
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+LIBCAMERA_DEPENDENCIES += tiff
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+LIBCAMERA_DEPENDENCIES += udev
+endif
 
 $(eval $(meson-package))
-- 
2.26.2
