From: Louis-Paul Cordier <lpdev@cordier.org>
Date: Thu, 31 Jan 2019 13:15:23 +0100
Subject: [Buildroot] [PATCH v2 3/6] intel-mediasdk: new package.
In-Reply-To: <20190131121526.11816-1-lpdev@cordier.org>
References: <20190131121526.11816-1-lpdev@cordier.org>
Message-ID: <20190131121526.11816-4-lpdev@cordier.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
---
v2:
- Let default install target. (feedback Baruch Siach).
- Let the install target of intel-mediadriver to generate proper 
env script.
- Find a better, shorter way to fix FindMFX issue.
- Remove useless dependencies.

 package/Config.in                          |  1 +
 package/intel-mediasdk/Config.in           | 13 +++++++++++++
 package/intel-mediasdk/intel-mediasdk.hash |  2 ++
 package/intel-mediasdk/intel-mediasdk.mk   | 17 +++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/intel-mediasdk/Config.in
 create mode 100644 package/intel-mediasdk/intel-mediasdk.hash
 create mode 100644 package/intel-mediasdk/intel-mediasdk.mk

diff --git a/package/Config.in b/package/Config.in
index f80d5b69d9..51d272df55 100644
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
index 0000000000..aa68d10f3b
--- /dev/null
+++ b/package/intel-mediasdk/Config.in
@@ -0,0 +1,13 @@
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
diff --git a/package/intel-mediasdk/intel-mediasdk.hash b/package/intel-mediasdk/intel-mediasdk.hash
new file mode 100644
index 0000000000..e7081ae7d2
--- /dev/null
+++ b/package/intel-mediasdk/intel-mediasdk.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 46f54f22e5a9cf41f1a6ab55346a0513ed02b2e99d41f9d178c6820d378922e3  intel-mediasdk-18.3.1.tar.gz
diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
new file mode 100644
index 0000000000..f57088d64f
--- /dev/null
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# intel-mediasdk
+#
+################################################################################
+
+INTEL_MEDIASDK_VERSION = 18.3.1
+INTEL_MEDIASDK_SITE = http://github.com/Intel-Media-SDK/MediaSDK/archive
+INTEL_MEDIASDK_LICENSE = MIT
+INTEL_MEDIASDK_LICENSE_FILES = COPYING
+
+INTEL_MEDIASDK_INSTALL_STAGING = YES
+INTEL_MEDIASDK_DEPENDENCIES += intel-mediadriver
+
+INTEL_MEDIASDK_CONF_OPTS += -DMFX_INCLUDE="$(@D)/api/include"
+
+$(eval $(cmake-package))
-- 
2.20.1
