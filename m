From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Dec 2012 00:03:32 +0100
Subject: [Buildroot] [git commit] package: add selection between libjpeg and
	jpeg-turbo
Message-ID: <20121213230621.1EDA49A1F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21dd3e777b5b9eb40c6e0fe9fadcf0c7fcc63901
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduce a virtual 'jpeg' package, which pulls in either libjpeg or
jpeg-turbo depending on a choice selection.

Rename jpeg package to libjpeg so we can reuse 'jpeg' for the virtual
package, making the change transparent to existing users and all the
packages using libjpeg.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 -
 package/jpeg-turbo/Config.in |    9 ---------
 package/jpeg/Config.in       |   27 +++++++++++++++++++++++++++
 package/jpeg/jpeg.mk         |   15 +++------------
 package/libjpeg/libjpeg.mk   |   19 +++++++++++++++++++
 5 files changed, 49 insertions(+), 22 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7358d93..cad1221 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -391,7 +391,6 @@ source "package/gtk2-engines/Config.in"
 source "package/gtk2-themes/Config.in"
 source "package/imlib2/Config.in"
 source "package/jpeg/Config.in"
-source "package/jpeg-turbo/Config.in"
 source "package/libart/Config.in"
 source "package/libdmtx/Config.in"
 source "package/libdrm/Config.in"
diff --git a/package/jpeg-turbo/Config.in b/package/jpeg-turbo/Config.in
deleted file mode 100644
index 19765b0..0000000
--- a/package/jpeg-turbo/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_JPEG_TURBO
-	bool "jpeg-turbo"
-	help
-	  Libjpeg-turbo is a derivative of libjpeg that uses SIMD
-	  instructions (MMX, SSE2, NEON) to accelerate baseline JPEG
-	  compression and decompression on x86, x86-64, and ARM
-	  systems.
-
-	  http://www.libjpeg-turbo.org
diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index 36d73c5..9508faf 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -1,6 +1,33 @@
 config BR2_PACKAGE_JPEG
+	bool "jpeg support"
+	help
+	  Select the desired JPEG library provider.
+
+if BR2_PACKAGE_JPEG
+
+choice
+	prompt "jpeg variant"
+	default BR2_PACKAGE_JPEG_TURBO if (BR2_X86_CPU_HAS_MMX || BR2_ARM_CPU_HAS_NEON)
+	help
+	  Select the older stable version, or the newer developer version
+
+config BR2_PACKAGE_LIBJPEG
 	bool "jpeg"
 	help
 	  The ubiquitous C library for manipulating JPEG images.
 
 	  http://www.ijg.org/
+
+config BR2_PACKAGE_JPEG_TURBO
+	bool "jpeg-turbo"
+	help
+	  Libjpeg-turbo is a derivative of libjpeg that uses SIMD
+	  instructions (MMX, SSE2, NEON) to accelerate baseline JPEG
+	  compression and decompression on x86, x86-64, and ARM
+	  systems.
+
+	  http://www.libjpeg-turbo.org
+
+endchoice
+
+endif
diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index d7ef25a..9f40e6f 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -1,18 +1,9 @@
 #############################################################
 #
-# jpeg (libraries needed by some apps)
+# jpeg
 #
 #############################################################
-JPEG_VERSION = 8d
-JPEG_SITE = http://www.ijg.org/files/
-JPEG_SOURCE = jpegsrc.v$(JPEG_VERSION).tar.gz
-JPEG_INSTALL_STAGING = YES
 
-define JPEG_REMOVE_USELESS_TOOLS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtrans rdjpgcom wrjpgcom)
-endef
+jpeg: $(if $(BR2_PACKAGE_JPEG_TURBO),jpeg-turbo,libjpeg)
 
-JPEG_POST_INSTALL_TARGET_HOOKS += JPEG_REMOVE_USELESS_TOOLS
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+host-jpeg: host-libjpeg
diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
new file mode 100644
index 0000000..0df2b3a
--- /dev/null
+++ b/package/libjpeg/libjpeg.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# libjpeg (libraries needed by some apps)
+#
+#############################################################
+
+LIBJPEG_VERSION = 8d
+LIBJPEG_SITE = http://www.ijg.org/files/
+LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
+LIBJPEG_INSTALL_STAGING = YES
+
+define LIBJPEG_REMOVE_USELESS_TOOLS
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtrans rdjpgcom wrjpgcom)
+endef
+
+LIBJPEG_POST_INSTALL_TARGET_HOOKS += LIBJPEG_REMOVE_USELESS_TOOLS
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
