From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sun, 10 Jun 2018 10:03:16 -0400
Subject: [Buildroot] [PATCH] libusb: add an option to compile examples
Message-ID: <20180610140316.7125-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/libusb/Config.in |  7 +++++++
 package/libusb/libusb.mk | 11 +++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/libusb/Config.in b/package/libusb/Config.in
index 5238588aa8..d31a717fdf 100644
--- a/package/libusb/Config.in
+++ b/package/libusb/Config.in
@@ -6,5 +6,12 @@ config BR2_PACKAGE_LIBUSB
 
 	  http://libusb.info/
 
+if BR2_PACKAGE_LIBUSB
+
+config BR2_PACKAGE_LIBUSB_EXAMPLES
+	bool "build libusb examples"
+
+endif
+
 comment "libusb needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index aee3622f8d..89ec91bb42 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -25,5 +25,16 @@ else
 LIBUSB_CONF_OPTS += --disable-udev
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUSB_EXAMPLES),y)
+LIBUSB_CONF_OPTS += --enable-examples-build
+define LIBUSB_INSTALL_TARGET_EXAMPLES
+	for example in listdevs xusb fxload hotplugtest testlibusb dpfp dpfp_threaded sam3u_benchmark ; do \
+		[ -x $(@D)/examples/$${example} ] || continue; \
+		cp -dpfr $(@D)/examples/$${example} $(TARGET_DIR)/usr/bin; \
+	done
+endef
+LIBUSB_POST_INSTALL_TARGET_HOOKS += LIBUSB_INSTALL_TARGET_EXAMPLES
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.17.1
