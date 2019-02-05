From: Louis-Paul Cordier <lpdev@cordier.org>
Date: Tue,  5 Feb 2019 19:19:43 +0100
Subject: [Buildroot] [PATCH v3 1/4] package/intel-mediadriver: new package
In-Reply-To: <20190205181946.14496-1-lpdev@cordier.org>
References: <20190205181946.14496-1-lpdev@cordier.org>
Message-ID: <20190205181946.14496-2-lpdev@cordier.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
---
v2 -> v3: (feedback Thomas Petazzoni)
- Fix commit title.
- Update DEVELOPERS file.
- Replicate dependencies of selected packages.
- Fix blank line.
- Add hash for LICENSE file.
- Update from 18.3.0 to 18.4.0.
- Fix package license.
- Various fixes in makefile.

v1 -> v2: (feedback Baruch Siach)
- Let default install target.

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/intel-mediadriver/Config.in           | 21 +++++++++++++
 .../intel-mediadriver/intel-mediadriver.hash  |  3 ++
 .../intel-mediadriver/intel-mediadriver.mk    | 30 +++++++++++++++++++
 5 files changed, 56 insertions(+)
 create mode 100644 package/intel-mediadriver/Config.in
 create mode 100644 package/intel-mediadriver/intel-mediadriver.hash
 create mode 100644 package/intel-mediadriver/intel-mediadriver.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 59e1f32ba9..266bd4edc9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1265,6 +1265,7 @@ F:	package/ti-sgx-um/
 
 N:	Louis-Paul Cordier <lpdev@cordier.org>
 F:	package/intel-gmmlib/
+F:	package/intel-mediadriver/
 
 N:	Luca Ceresoli <luca@lucaceresoli.net>
 F:	board/olimex/a20_olinuxino/
diff --git a/package/Config.in b/package/Config.in
index bca61f14ed..ffedf37562 100644
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
index 0000000000..7dd80fbfc7
--- /dev/null
+++ b/package/intel-mediadriver/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_INTEL_MEDIADRIVER
+	bool "intel-mediadriver"
+	depends on BR2_x86_64
+	depends on !BR2_STATIC_LIBS # mesa3D/libva
+	depends on BR2_INSTALL_LIBSTDCPP # mesa3D
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3D
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libva/libdrm/libpthread-stubs
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3D
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_INTEL_GMMLIB
+	select BR2_PACKAGE_LIBPCIACCESS
+	select BR2_PACKAGE_LIBVA
+	select BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  The Intel(R) Media Driver for VAAPI is a new VA-API (Video
+	  Acceleration API) user mode driver supporting hardware
+	  accelerated decoding, encoding, and video post processing for
+	  GEN based graphics hardware.
+
+	  https://github.com/intel/media-driver
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
new file mode 100644
index 0000000000..095f57603d
--- /dev/null
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 57a5c0d4dc7e34d7940d23346bbdee2b6cdfbfa81d64f5b77506da8b4298df43  intel-media-18.4.0.tar.gz
+sha256 74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
new file mode 100644
index 0000000000..2bc22e9b41
--- /dev/null
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# intel-mediadriver
+#
+################################################################################
+
+# based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
+
+INTEL_MEDIADRIVER_VERSION = 18.4.0
+INTEL_MEDIADRIVER_SITE = http://github.com/intel/media-driver/archive
+INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
+INTEL_MEDIADRIVER_LICENSE = MIT,BSD-3-Clause
+INTEL_MEDIADRIVER_LICENSE_FILES = LICENSE.md
+
+INTEL_MEDIADRIVER_DEPENDENCIES = \
+	intel-gmmlib \
+	libpciaccess \
+	libva \
+	mesa3d \
+	xlib_libX11
+
+INTEL_MEDIADRIVER_SUPPORTS_IN_SOURCE_BUILD = NO
+
+INTEL_MEDIADRIVER_CONF_OPTS = -DMEDIA_VERSION="2.0.0"\
+	-DBUILD_ALONG_WITH_CMRTLIB=1 \
+	-DINSTALL_DRIVERS_SYSCONF=OFF \
+	-DMEDIA_RUN_TEST_SUITE=OFF \
+	-DRUN_TEST_SUITE=OFF
+
+$(eval $(cmake-package))
-- 
2.20.1
