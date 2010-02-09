From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Feb 2010 11:40:47 +0100
Subject: [Buildroot] [git commit master] rdesktop: convert to
	Makefile.autotools.in format
Message-ID: <20100209104124.287E277735@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5d4aeeda7e66680ee4903ce8dafa9fc026ef8960
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And also adapt X depency. Rdesktop only needs libX11/Xt, and long term
we should be able to use the X stuff without having a X server on the
target.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    4 +-
 package/rdesktop/Config.in   |    2 +
 package/rdesktop/rdesktop.mk |   61 ++++++-----------------------------------
 3 files changed, 13 insertions(+), 54 deletions(-)

diff --git a/CHANGES b/CHANGES
index 506ba73..3809ac4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,8 +10,8 @@
 	e2fsprogs, gstreamer, gperf, gst-plugins-bad, gvfs, fbdump, flex, hal,
 	iptables, iw, jpeg, kismet, libfuse, libglib2, libpcap, libungif,
 	libxml2, libxslt, lighttpd, mesa, mpg123, mtd-utils, newt, nbd, neon,
-	netstat-nat, openvpn, pcre, php, qt, readline, rpm, sawman, sdl,
-	sdl_ttf, sqlite, sshfs, tremor, u-boot, usb_modeswitch, usbutils,
+	netstat-nat, openvpn, pcre, php, qt, rdesktop, readline, rpm, sawman,
+	sdl, sdl_ttf, sqlite, sshfs, tremor, u-boot, usb_modeswitch, usbutils,
 	webkit, wpa_supplicant, xfsprogs, zlib
 
 	Removed package: openswan
diff --git a/package/rdesktop/Config.in b/package/rdesktop/Config.in
index 9ec6f8a..c0abe27 100644
--- a/package/rdesktop/Config.in
+++ b/package/rdesktop/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_RDESKTOP
 	bool "rdesktop"
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXT
 	depends on BR2_PACKAGE_XORG7
 	help
 	  rdesktop is an open source client for Windows NT Terminal
diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index c683c22..e241210 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -4,55 +4,12 @@
 #
 #############################################################
 
-RDESKTOP_VERSION=1.5.0
-RDESKTOP_SOURCE=rdesktop-$(RDESKTOP_VERSION).tar.gz
-RDESKTOP_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/rdesktop/
-RDESKTOP_DIR=$(BUILD_DIR)/rdesktop-$(RDESKTOP_VERSION)
-RDESKTOP_CAT:=$(ZCAT)
-
-$(DL_DIR)/$(RDESKTOP_SOURCE):
-	$(call DOWNLOAD,$(RDESKTOP_SITE),$(RDESKTOP_SOURCE))
-
-$(RDESKTOP_DIR)/.unpacked: $(DL_DIR)/$(RDESKTOP_SOURCE)
-	$(RDESKTOP_CAT) $(DL_DIR)/$(RDESKTOP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(RDESKTOP_DIR) package/rdesktop/ \*.patch*
-	touch $(RDESKTOP_DIR)/.unpacked
-
-$(RDESKTOP_DIR)/.configured: $(RDESKTOP_DIR)/.unpacked
-	(cd $(RDESKTOP_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--with-openssl=$(STAGING_DIR)/usr \
-		--sysconfdir=/etc \
-	)
-	touch $(RDESKTOP_DIR)/.configured
-
-$(RDESKTOP_DIR)/rdesktop: $(RDESKTOP_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(RDESKTOP_DIR)
-
-$(TARGET_DIR)/usr/bin/rdesktop: $(RDESKTOP_DIR)/rdesktop
-	cp $^ $@
-
-rdesktop: openssl xserver_xorg-server $(TARGET_DIR)/usr/bin/rdesktop
-
-rdesktop-source: $(DL_DIR)/$(RDESKTOP_SOURCE)
-
-rdesktop-clean:
-	-$(MAKE) -C $(RDESKTOP_DIR) clean
-	rm -f $(TARGET_DIR)/usr/bin/rdesktop
-
-rdesktop-dirclean:
-	rm -rf $(RDESKTOP_DIR) $(RDESKTOP_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_RDESKTOP),y)
-TARGETS+=rdesktop
-endif
+RDESKTOP_VERSION = 1.5.0
+RDESKTOP_SOURCE = rdesktop-$(RDESKTOP_VERSION).tar.gz
+RDESKTOP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/rdesktop/
+# no install-strip / install-exec
+RDESKTOP_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+RDESKTOP_DEPENDENCIES = openssl xlib_libX11 xlib_libXt
+RDESKTOP_CONF_OPT = --with-openssl=$(STAGING_DIR)/usr
+
+$(eval $(call AUTOTARGETS,package,rdesktop))
-- 
1.6.3.3
