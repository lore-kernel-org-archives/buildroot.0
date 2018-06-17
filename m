From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 15:07:52 +0200
Subject: [Buildroot] [git commit] libusb: add an option to compile examples
Message-ID: <20180617130607.5E72D88005@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b57b7a3571d14fec37ee8a73585bfb0ebd88c781
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
[Thomas:
 - use make loop instead of shell loop
 - use $(INSTALL) instead of cp.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libusb/Config.in |  7 +++++++
 package/libusb/libusb.mk | 10 ++++++++++
 2 files changed, 17 insertions(+)

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
index aee3622f8d..fe38a1d2d2 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -25,5 +25,15 @@ else
 LIBUSB_CONF_OPTS += --disable-udev
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUSB_EXAMPLES),y)
+LIBUSB_CONF_OPTS += --enable-examples-build
+define LIBUSB_INSTALL_TARGET_EXAMPLES
+	$(foreach example,listdevs xusb fxload hotplugtest testlibusb dpfp dpfp_threaded sam3u_benchmark,
+		$(INSTALL) -D -m0755 $(@D)/examples/$(example) $(TARGET_DIR)/usr/bin/$(example)
+	)
+endef
+LIBUSB_POST_INSTALL_TARGET_HOOKS += LIBUSB_INSTALL_TARGET_EXAMPLES
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
