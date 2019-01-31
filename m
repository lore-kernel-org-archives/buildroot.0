From: Louis-Paul Cordier <lpdev@cordier.org>
Date: Thu, 31 Jan 2019 13:15:22 +0100
Subject: [Buildroot] [PATCH v2 2/6] intel-mediadriver: new package.
In-Reply-To: <20190131121526.11816-1-lpdev@cordier.org>
References: <20190131121526.11816-1-lpdev@cordier.org>
Message-ID: <20190131121526.11816-3-lpdev@cordier.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
---
v2:
- Let default install target. (feedback Baruch Siach)
- Fix missing dependencies.
- Remove useless CMake options.

 package/Config.in                             |  1 +
 package/intel-mediadriver/Config.in           | 17 +++++++++++
 .../intel-mediadriver/intel-mediadriver.hash  |  2 ++
 .../intel-mediadriver/intel-mediadriver.mk    | 29 +++++++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 package/intel-mediadriver/Config.in
 create mode 100644 package/intel-mediadriver/intel-mediadriver.hash
 create mode 100644 package/intel-mediadriver/intel-mediadriver.mk

diff --git a/package/Config.in b/package/Config.in
index 9082ed9956..f80d5b69d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1266,6 +1266,7 @@ menu "Graphics"
 	source "package/ijs/Config.in"
 	source "package/imlib2/Config.in"
 	source "package/intel-gmmlib/Config.in"
+	source "package/intel-mediadriver/Config.in"
 	source "package/irrlicht/Config.in"
 	source "package/jasper/Config.in"
 	source "package/jpeg/Config.in"
diff --git a/package/intel-mediadriver/Config.in b/package/intel-mediadriver/Config.in
new file mode 100644
index 0000000000..ab44a65b91
--- /dev/null
+++ b/package/intel-mediadriver/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_INTEL_MEDIADRIVER
+	bool "intel-mediadriver"
+	depends on BR2_x86_64
+	select BR2_PACKAGE_INTEL_GMMLIB
+	select BR2_PACKAGE_LIBPCIACCESS
+	select BR2_PACKAGE_LIBVA
+	select BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_XLIB_LIBX11
+
+	help
+	  The Intel(R) Media Driver for VAAPI is a new VA-API (Video
+	  Acceleration API) user mode driver supporting hardware
+	  accelerated decoding, encoding, and video post processing for
+	  GEN based graphics hardware.
+
+comment "intel-mediadriver needs libx11"
+	  depends on !BR2_PACKAGE_XLIB_LIBX11
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
new file mode 100644
index 0000000000..9068b40e07
--- /dev/null
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 df9af1cc796b4123508aacaf19d040cc5d8c5742c05199f45c9a3905ed8d1b52  intel-media-18.3.0.tar.gz
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
new file mode 100644
index 0000000000..77a757f212
--- /dev/null
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# intel-mediadriver
+#
+################################################################################
+
+# based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
+
+INTEL_MEDIADRIVER_VERSION = 18.3.0
+INTEL_MEDIADRIVER_SITE = http://github.com/intel/media-driver/archive
+INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
+INTEL_MEDIADRIVER_LICENSE = MIT BSD-3-Clause
+INTEL_MEDIADRIVER_LICENSE_FILES = LICENSE.md
+
+INTEL_MEDIADRIVER_DEPENDENCIES += intel-gmmlib
+INTEL_MEDIADRIVER_DEPENDENCIES += libpciaccess
+INTEL_MEDIADRIVER_DEPENDENCIES += libva
+INTEL_MEDIADRIVER_DEPENDENCIES += mesa3d
+INTEL_MEDIADRIVER_DEPENDENCIES += xlib_libX11
+
+INTEL_MEDIADRIVER_SUPPORTS_IN_SOURCE_BUILD = NO
+
+INTEL_MEDIADRIVER_CONF_OPTS += -DMEDIA_VERSION="2.0.0"\
+	-DBUILD_ALONG_WITH_CMRTLIB=1 \
+	-DINSTALL_DRIVERS_SYSCONF=OFF \
+	-DMEDIA_RUN_TEST_SUITE=OFF \
+	-DRUN_TEST_SUITE=OFF
+
+$(eval $(cmake-package))
-- 
2.20.1
