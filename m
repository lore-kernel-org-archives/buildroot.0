From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Apr 2010 14:07:35 +0200
Subject: [Buildroot] [git commit master] pciutils: convert to the
	generic-tools infrastructure
Message-ID: <20100415120746.429178D9FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=78743709074bceeb66cdae94e7259c3b7480f94c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Brandstetter <thomas.brandstetter@me.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    6 +-
 package/pciutils/pciutils.mk |   96 ++++++++++++-----------------------------
 2 files changed, 31 insertions(+), 71 deletions(-)

diff --git a/CHANGES b/CHANGES
index ed23e5c..f4d412d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,9 +15,9 @@
 	Updated/fixed packages: busybox, dnsmasq, dosfstools,
 	e2fsprogs, fbv, freetype, iperf, iptables, iw, less,
 	libaio,libdrm, libgcrypt, libglib2, libpng, libxml2, matchbox,
-	mdadm, memstat, mesa3d, mtd-utils, nano, openssl, php, pixman,
-	pppd, pthread-stubs, qt, radvd, setserial, squashfs,
-	usb_modeswith, wget, xdriver_xf86-video-intel,
+	mdadm, memstat, mesa3d, mtd-utils, nano, openssl, pciutils,
+	php, pixman, pppd, pthread-stubs, qt, radvd, setserial,
+	squashfs, usb_modeswith, wget, xdriver_xf86-video-intel,
 	xkeyboard-config, xlib_libX11, xlib_libXfont,
 	xlib_libXfontcache, xlib_libXxf86misc, xlib_libpciaccess,
 	xproto_dri2proto, xproto_eviext, xproto_fontcacheproto,
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 7b19c5b..393162f 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -1,80 +1,40 @@
 #############################################################
 #
-# pciutils
+# PCIUTILS
 #
 #############################################################
-PCIUTILS_VERSION:=3.0.1
-PCIUTILS_SOURCE:=pciutils-$(PCIUTILS_VERSION).tar.gz
-PCIUTILS_CAT:=$(ZCAT)
-PCIUTILS_SITE:=ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
-PCIUTILS_DIR:=$(BUILD_DIR)/pciutils-$(PCIUTILS_VERSION)
-
-# Yet more targets...
-PCIIDS_SITE:=http://pciids.sourceforge.net/
-PCIIDS_SOURCE:=pci.ids.bz2
-PCIIDS_CAT:=$(BZCAT)
 
+PCIUTILS_VERSION = 3.1.7
+PCIUTILS_SITE = ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-PCIUTILS_HAVE_ZLIB=yes
-PCIIDS_FILE=pci.ids.gz
-PCIIDS_COMPRESSOR=gzip -9 -c
+	PCIUTILS_ZLIB=yes
 else
-PCIUTILS_HAVE_ZLIB=no
-PCIIDS_FILE=pci.ids
-PCIIDS_COMPRESSOR=cat
+	PCIUTILS_ZLIB=no
 endif
+PCIUTILS_DNS=no
+PCIUTILS_SHARED=yes
 
-$(DL_DIR)/$(PCIUTILS_SOURCE):
-	 $(call DOWNLOAD,$(PCIUTILS_SITE),$(PCIUTILS_SOURCE))
-
-$(DL_DIR)/$(PCIIDS_SOURCE):
-	$(call DOWNLOAD,$(PCIIDS_SITE),$(PCIIDS_SOURCE))
-
-$(PCIUTILS_DIR)/.unpacked: $(DL_DIR)/$(PCIUTILS_SOURCE) $(DL_DIR)/$(PCIIDS_SOURCE)
-	$(PCIUTILS_CAT) $(DL_DIR)/$(PCIUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(PCIIDS_CAT) $(DL_DIR)/$(PCIIDS_SOURCE) | $(PCIIDS_COMPRESSOR) > $(PCIUTILS_DIR)/$(PCIIDS_FILE)
-	toolchain/patch-kernel.sh $(PCIUTILS_DIR) package/pciutils pciutils-$(PCIUTILS_VERSION)\*.patch
-	#$(CONFIG_UPDATE) $(@D)
+define PCIUTILS_CONFIGURE_CMDS
 	$(SED) 's/uname -s/echo Linux/' \
 		-e 's/uname -r/echo $(LINUX_HEADERS_VERSION)/' \
 		$(PCIUTILS_DIR)/lib/configure
-	touch $@
-
-$(PCIUTILS_DIR)/.compiled: $(PCIUTILS_DIR)/.unpacked
-	$(MAKE1) CC="$(TARGET_CC)" OPT="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(PCIUTILS_DIR) \
-		SHAREDIR="/usr/share/misc" \
-		ZLIB=$(PCIUTILS_HAVE_ZLIB) \
-		HOST=$(KERNEL_ARCH)-linux \
-		PREFIX=/usr
-	touch $@
-
-$(TARGET_DIR)/sbin/lspci: $(PCIUTILS_DIR)/.compiled
-	$(INSTALL) $(PCIUTILS_DIR)/lspci $(TARGET_DIR)/sbin/lspci
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-$(TARGET_DIR)/sbin/setpci: $(PCIUTILS_DIR)/.compiled
-	$(INSTALL) $(PCIUTILS_DIR)/setpci $(TARGET_DIR)/sbin/setpci
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-$(TARGET_DIR)/usr/share/misc/$(PCIIDS_FILE): $(PCIUTILS_DIR)/.unpacked
-	$(INSTALL) -D $(PCIUTILS_DIR)/$(PCIIDS_FILE) $@
-
-pciutils: $(if $(BR2_PACKAGE_ZLIB),zlib) $(TARGET_DIR)/sbin/setpci $(TARGET_DIR)/sbin/lspci $(TARGET_DIR)/usr/share/misc/$(PCIIDS_FILE)
-
-pciutils-source: $(DL_DIR)/$(PCIUTILS_SOURCE) $(DL_DIR)/$(PCIIDS_SOURCE)
-
-pciutils-clean:
-	-$(MAKE) -C $(PCIUTILS_DIR) clean
-	rm -f $(TARGET_DIR)/sbin/lspci $(TARGET_DIR)/sbin/setpci $(TARGET_DIR)/usr/share/misc/pci.ids*
-
-pciutils-dirclean:
-	rm -rf $(PCIUTILS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_PCIUTILS),y)
-TARGETS+=pciutils
-endif
+endef
+
+define PCIUTILS_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" \
+		OPT="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		RANLIB=$(TARGET_RANLIB) \
+		AR=$(TARGET_AR) \
+		-C $(PCIUTILS_DIR) \
+		SHARED=$(PCIUTILS_SHARED) \
+		ZLIB=$(PCIUTILS_ZLIB) \
+		DNS=$(PCIUTILS_DNS) \
+		SHAREDIR=/usr/share/misc
+endef
+
+define PCIUTILS_INSTALL_TARGET_CMDS
+	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(TARGET_DIR)/usr install
+endef
+
+$(eval $(call GENTARGETS,package,pciutils))
-- 
1.6.3.3
