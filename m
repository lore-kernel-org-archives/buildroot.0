From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 13 Dec 2012 23:25:53 +0100
Subject: [Buildroot] [git commit] jpeg-turbo: new package
Message-ID: <20121213230620.CB3BA9A1F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39348d803bda0c0f33805b06d302669293e4d38a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Various cleanups/fixes/simplifications]
Signed-off-by: Murat Demirten <mdemirten@yh.com.tr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                |    1 +
 package/jpeg-turbo/Config.in     |    9 +++++++++
 package/jpeg-turbo/jpeg-turbo.mk |   27 +++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index cad1221..7358d93 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -391,6 +391,7 @@ source "package/gtk2-engines/Config.in"
 source "package/gtk2-themes/Config.in"
 source "package/imlib2/Config.in"
 source "package/jpeg/Config.in"
+source "package/jpeg-turbo/Config.in"
 source "package/libart/Config.in"
 source "package/libdmtx/Config.in"
 source "package/libdrm/Config.in"
diff --git a/package/jpeg-turbo/Config.in b/package/jpeg-turbo/Config.in
new file mode 100644
index 0000000..19765b0
--- /dev/null
+++ b/package/jpeg-turbo/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_JPEG_TURBO
+	bool "jpeg-turbo"
+	help
+	  Libjpeg-turbo is a derivative of libjpeg that uses SIMD
+	  instructions (MMX, SSE2, NEON) to accelerate baseline JPEG
+	  compression and decompression on x86, x86-64, and ARM
+	  systems.
+
+	  http://www.libjpeg-turbo.org
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
new file mode 100644
index 0000000..19a0292
--- /dev/null
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# jpeg-turbo
+#
+#############################################################
+
+JPEG_TURBO_VERSION = 1.2.1
+JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
+JPEG_TURBO_SITE = http://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
+JPEG_TURBO_INSTALL_STAGING = YES
+JPEG_TURBO_CONF_OPT = --with-jpeg8
+
+ifeq ($(BR2_X86_CPU_HAS_MMX)$(BR2_ARM_CPU_HAS_NEON),y)
+JPEG_TURBO_CONF_OPT += --with-simd
+# x86 simd support needs nasm
+JPEG_TURBO_DEPENDENCIES += $(if $(BR2_X86_CPU_HAS_MMX),host-nasm)
+else
+JPEG_TURBO_CONF_OPT += --without-simd
+endif
+
+define JPEG_TURBO_REMOVE_USELESS_TOOLS
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtrans rdjpgcom tjbench wrjpgcom)
+endef
+
+JPEG_TURBO_POST_INSTALL_TARGET_HOOKS += JPEG_TURBO_REMOVE_USELESS_TOOLS
+
+$(eval $(autotools-package))
