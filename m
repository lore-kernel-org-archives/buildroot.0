From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Jul 2013 22:21:31 +0200
Subject: [Buildroot] [git commit] ocrad: new package
Message-ID: <20130708202428.A47EF99ABA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87165354216ebd8a377ec083072c97bd0f83296e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GNU Ocrad is an OCR (Optical Character Recognition) program
based on a feature extraction method.
It reads images in pbm (bitmap), pgm (greyscale) or ppm (color) formats
and produces text in byte (8-bit) or UTF-8 formats.

[Peter: fixup whitespace, install into STAGING_DIR, use make install, BR2_GNU_MIRROR]
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/ocrad/Config.in |   14 ++++++++++++++
 package/ocrad/ocrad.mk  |   31 +++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ca698bd..3186bb7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -132,6 +132,7 @@ source "package/fb-test-app/Config.in"
 source "package/imagemagick/Config.in"
 source "package/linux-fusion/Config.in"
 source "package/lite/Config.in"
+source "package/ocrad/Config.in"
 source "package/sawman/Config.in"
 source "package/sdl/Config.in"
 source "package/sdl_image/Config.in"
diff --git a/package/ocrad/Config.in b/package/ocrad/Config.in
new file mode 100644
index 0000000..0fa5660
--- /dev/null
+++ b/package/ocrad/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_OCRAD
+	bool "ocrad"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  GNU Ocrad is an OCR (Optical Character Recognition) program
+	  based on a feature extraction method.
+	  It reads images in pbm (bitmap), pgm (greyscale) or
+	  ppm (color) formats and produces text in byte (8-bit) or
+	  UTF-8 formats.
+
+	  http://www.gnu.org/software/ocrad/
+
+comment "ocrad needs a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
new file mode 100644
index 0000000..8a038e2
--- /dev/null
+++ b/package/ocrad/ocrad.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# ocrad
+#
+################################################################################
+
+OCRAD_VERSION = 0.21
+OCRAD_SITE = $(BR2_GNU_MIRROR)/ocrad
+OCRAD_LICENSE = GPLv3+
+OCRAD_LICENSE_FILES = COPYING
+OCRAD_INSTALL_STAGING = YES
+
+# This is not a true autotools package.
+define OCRAD_CONFIGURE_CMDS
+	cd $(@D) && \
+	./configure --prefix=/usr --sysconfdir=/etc $(TARGET_CONFIGURE_OPTS)
+endef
+
+define OCRAD_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define OCRAD_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+define OCRAD_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
