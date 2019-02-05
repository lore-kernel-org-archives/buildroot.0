From: Louis-Paul Cordier <lpdev@cordier.org>
Date: Tue,  5 Feb 2019 19:19:44 +0100
Subject: [Buildroot] [PATCH v3 2/4] package/intel-mediasdk: new package
In-Reply-To: <20190205181946.14496-1-lpdev@cordier.org>
References: <20190205181946.14496-1-lpdev@cordier.org>
Message-ID: <20190205181946.14496-3-lpdev@cordier.org>
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
- Add project URL.
- Bump from 18.3.1 to 18.4.0.
- Various fixes in makefile.

v1 -> v2:
- Let default install target. (feedback Baruch Siach)
- Fix missing dependencies.
- Remove useless CMake options.

 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/intel-mediasdk/Config.in           | 15 +++++++++++++++
 package/intel-mediasdk/intel-mediasdk.hash |  3 +++
 package/intel-mediasdk/intel-mediasdk.mk   | 17 +++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/intel-mediasdk/Config.in
 create mode 100644 package/intel-mediasdk/intel-mediasdk.hash
 create mode 100644 package/intel-mediasdk/intel-mediasdk.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 266bd4edc9..4dfd68281a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1266,6 +1266,7 @@ F:	package/ti-sgx-um/
 N:	Louis-Paul Cordier <lpdev@cordier.org>
 F:	package/intel-gmmlib/
 F:	package/intel-mediadriver/
+F:	package/intel-mediasdk/
 
 N:	Luca Ceresoli <luca@lucaceresoli.net>
 F:	board/olimex/a20_olinuxino/
diff --git a/package/Config.in b/package/Config.in
index ffedf37562..2b6d668c03 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1267,6 +1267,7 @@ menu "Graphics"
 	source "package/imlib2/Config.in"
 	source "package/intel-gmmlib/Config.in"
 	source "package/intel-mediadriver/Config.in"
+	source "package/intel-mediasdk/Config.in"
 	source "package/irrlicht/Config.in"
 	source "package/jasper/Config.in"
 	source "package/jpeg/Config.in"
diff --git a/package/intel-mediasdk/Config.in b/package/intel-mediasdk/Config.in
new file mode 100644
index 0000000000..8a11d92cac
--- /dev/null
+++ b/package/intel-mediasdk/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_INTEL_MEDIASDK
+	bool "intel-mediasdk"
+	depends on BR2_x86_64
+	select BR2_PACKAGE_INTEL_MEDIADRIVER
+	help
+	  Intel(R) Media SDK provides an API to access
+	  hardware-accelerated video decode, encode and filtering on
+	  Intel? platforms with integrated graphics.
+
+	  Supported video encoders: HEVC, AVC, MPEG-2, JPEG
+	  Supported Video decoders: HEVC, AVC, VP8, MPEG-2, VC1, JPEG
+	  Supported video pre-processing filters: Color Conversion,
+	  Deinterlace, Denoise, Resize, Rotate, Composition
+
+	  http://mediasdk.intel.com/
diff --git a/package/intel-mediasdk/intel-mediasdk.hash b/package/intel-mediasdk/intel-mediasdk.hash
new file mode 100644
index 0000000000..2d2e36384f
--- /dev/null
+++ b/package/intel-mediasdk/intel-mediasdk.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 259d9b57df4fca316898b6dbe7b4d561ce42160fa953f36e2a4b357e86116bf9  intel-mediasdk-18.4.0.tar.gz
+sha256 dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
new file mode 100644
index 0000000000..611529390b
--- /dev/null
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# intel-mediasdk
+#
+################################################################################
+
+INTEL_MEDIASDK_VERSION = 18.4.0
+INTEL_MEDIASDK_SITE = http://github.com/Intel-Media-SDK/MediaSDK/archive
+INTEL_MEDIASDK_LICENSE = MIT
+INTEL_MEDIASDK_LICENSE_FILES = COPYING
+
+INTEL_MEDIASDK_INSTALL_STAGING = YES
+INTEL_MEDIASDK_DEPENDENCIES = intel-mediadriver
+
+INTEL_MEDIASDK_CONF_OPTS = -DMFX_INCLUDE="$(@D)/api/include"
+
+$(eval $(cmake-package))
-- 
2.20.1
