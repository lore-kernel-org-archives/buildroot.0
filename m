From: Mike Crowe <mac@mcrowe.com>
Date: Thu, 8 Apr 2010 11:37:12 +0200
Subject: [Buildroot] [git commit master] libusb: bump version,
	convert to autotools, add -compat lib
Message-ID: <20100408094036.BE1FF9994D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e237c9935796445434a7888b9fe2aa84e3e7975a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upgrade libusb to v1.0.3 and add new libusb-compat package for
compatibility with old packages that expect the pre-1.0 API.

Also update usb_modeswitch to depend on libusb-compat rather than
libusb.

Minor fixes by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>.

Fixes bug #1093.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 CHANGES                                            |   12 ++-
 package/Config.in                                  |    1 +
 package/libusb-compat/Config.in                    |    7 ++
 .../libusb-compat-0.1.3-pkgconfig.patch            |   10 +++
 package/libusb-compat/libusb-compat.mk             |   14 +++
 package/libusb/libusb-0.1.12-nocpp.patch           |   20 -----
 package/libusb/libusb.mk                           |   85 ++-----------------
 package/usb_modeswitch/Config.in                   |    2 +-
 package/usb_modeswitch/usb_modeswitch.mk           |    2 +-
 9 files changed, 51 insertions(+), 102 deletions(-)
 create mode 100644 package/libusb-compat/Config.in
 create mode 100644 package/libusb-compat/libusb-compat-0.1.3-pkgconfig.patch
 create mode 100644 package/libusb-compat/libusb-compat.mk
 delete mode 100644 package/libusb/libusb-0.1.12-nocpp.patch

diff --git a/CHANGES b/CHANGES
index a105773..eb5271d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,13 +8,14 @@
 
 	X.org updated to 7.5.
 
-	New packages: librsync, lmbench, netperf, squid
+	New packages: librsync, libusb-compat, lmbench, netperf, squid
 
 	Updated/fixed packages: busybox, dnsmasq, dosfstools,
 	e2fsprogs, freetype, iperf, iptables, iw, less, libdrm,
-	libgcrypt, libglib2, libpng, libxml2, matchbox, mdadm, memstat,
-	mtd-utils, nano, openssl, php, pppd, qt, radvd, setserial,
-	squashfs, wget, xlib_libX11, xlib_libXfont
+	libgcrypt, libglib2, libpng, libusb, libxml2, matchbox, mdadm,
+	memstat, mtd-utils, nano, openssl, php, pppd, qt, radvd,
+	setserial, squashfs, usb_modeswitch, wget, xlib_libX11,
+	xlib_libXfont
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -23,6 +24,9 @@
 	#800: [PATCH] iperf update to 2.0.4
 	#805: [PATCH] mdadm - version update
 	#817: integrator926_defconfig uses unsupported uboot board name
+	#1093: Upgrade libusb to v1.0.3 and add new libusb-compat
+               package for compatibility with old packages that expect
+               the pre-1.0 API.
 	#1105: Add new netperf package
 	#1111: Bump wget to 1.12 and migrate to Makefile.autotools.in
 	#1117: Bump nano to 2.2.3 and migrate to Makefile.autotools.in
diff --git a/package/Config.in b/package/Config.in
index 35c6d9c..6a695cb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -265,6 +265,7 @@ source "package/libaio/Config.in"
 source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
 source "package/libusb/Config.in"
+source "package/libusb-compat/Config.in"
 endmenu
 
 menu "Java"
diff --git a/package/libusb-compat/Config.in b/package/libusb-compat/Config.in
new file mode 100644
index 0000000..f6f49ca
--- /dev/null
+++ b/package/libusb-compat/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBUSB_COMPAT
+	bool "libusb-compat"
+	depends on BR2_PACKAGE_LIBUSB
+	help
+	  libusb-0.1 compatibility layer for libusb-1.0.
+
+	  http://libusb.sourceforge.net/
diff --git a/package/libusb-compat/libusb-compat-0.1.3-pkgconfig.patch b/package/libusb-compat/libusb-compat-0.1.3-pkgconfig.patch
new file mode 100644
index 0000000..e5ba786
--- /dev/null
+++ b/package/libusb-compat/libusb-compat-0.1.3-pkgconfig.patch
@@ -0,0 +1,10 @@
+--- libusb-compat-0.1.3.orig/libusb.pc.in	2008-06-18 00:13:02.000000000 +0100
++++ libusb-compat-0.1.3/libusb.pc.in	2009-09-16 12:06:50.000000000 +0100
+@@ -9,6 +9,7 @@ emulated_by=libusb-1.0
+ Name: libusb
+ Description: USB access library (libusb-1.0 compat wrapper)
+ Version: @LIBUSB01_VERSION@
++Requires: libusb-1.0
+ Libs: -L${libdir} -lusb
+ Cflags: -I${includedir}
+ 
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
new file mode 100644
index 0000000..98271c7
--- /dev/null
+++ b/package/libusb-compat/libusb-compat.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libusb-compat
+#
+#############################################################
+LIBUSB_COMPAT_VERSION = 0.1.3
+LIBUSB_COMPAT_SOURCE = libusb-compat-$(LIBUSB_COMPAT_VERSION).tar.bz2
+LIBUSB_COMPAT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libusb/libusb-compat-0.1/libusb-compat-$(LIBUSB_COMPAT_VERSION)
+LIBUSB_COMPAT_LIBTOOL_PATCH = NO
+LIBUSB_COMPAT_DEPENDENCIES = host-pkg-config libusb
+LIBUSB_COMPAT_INSTALL_STAGING = YES
+LIBUSB_COMPAT_INSTALL_TARGET = YES
+
+$(eval $(call AUTOTARGETS,package,libusb-compat))
diff --git a/package/libusb/libusb-0.1.12-nocpp.patch b/package/libusb/libusb-0.1.12-nocpp.patch
deleted file mode 100644
index de1a8c7..0000000
--- a/package/libusb/libusb-0.1.12-nocpp.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- libusb-0.1.12/Makefile.am	2006-03-04 13:52:46.000000000 +1100
-+++ libusb-0.1.12/Makefile.am.new	2007-11-08 16:25:38.000000000 +1100
-@@ -4,7 +4,7 @@
- # gnu strictness chokes on README being autogenerated
- AUTOMAKE_OPTIONS = 1.4 foreign
- 
--SUBDIRS = . tests doc
-+SUBDIRS = . doc
- 
- AM_CFLAGS = -Werror
- 
-@@ -19,7 +19,7 @@
-              apidocs/footer.html apidocs/doxygen.css apidocs/doxygen.png libusb.pc.in
- EXTRA_libusb_la_SOURCE = linux.c linux.h bsd.c darwin.c
- 
--lib_LTLIBRARIES = libusb.la libusbpp.la
-+lib_LTLIBRARIES = libusb.la
- 
- pkgconfig_DATA = libusb.pc
- 
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index adf3e20..8977d52 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -3,79 +3,12 @@
 # libusb
 #
 #############################################################
-LIBUSB_VERSION:=0.1.12
-LIBUSB_PATCH_FILE:=libusb_$(LIBUSB_VERSION)-10.diff.gz
-LIBUSB_SOURCE:=libusb_$(LIBUSB_VERSION).orig.tar.gz
-LIBUSB_SITE:=http://snapshot.debian.net/archive/2008/04/27/debian/pool/main/libu/libusb
-LIBUSB_DIR:=$(BUILD_DIR)/libusb-$(LIBUSB_VERSION)
-LIBUSB_CAT:=$(ZCAT)
-LIBUSB_BINARY:=usr/lib/libusb.so
-
-ifneq ($(LIBUSB_PATCH_FILE),)
-LIBUSB_PATCH=$(DL_DIR)/$(LIBUSB_PATCH_FILE)
-$(LIBUSB_PATCH):
-	$(call DOWNLOAD,$(LIBUSB_SITE),$(LIBUSB_PATCH_FILE))
-endif
-$(DL_DIR)/$(LIBUSB_SOURCE): $(LIBUSB_PATCH)
-	$(call DOWNLOAD,$(LIBUSB_SITE),$(LIBUSB_SOURCE))
-	touch -c $@
-
-libusb-source: $(DL_DIR)/$(LIBUSB_SOURCE) $(LIBUSB_PATCH)
-
-libusb-unpacked: $(LIBUSB_DIR)/.unpacked
-$(LIBUSB_DIR)/.unpacked: $(DL_DIR)/$(LIBUSB_SOURCE)
-	$(LIBUSB_CAT) $(DL_DIR)/$(LIBUSB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-ifneq ($(LIBUSB_PATCH_FILE),)
-	(cd $(LIBUSB_DIR) && $(LIBUSB_CAT) $(LIBUSB_PATCH) | patch -p1)
-endif
-	toolchain/patch-kernel.sh $(LIBUSB_DIR) package/libusb/ libusb-$(LIBUSB_VERSION)\*.patch*
-	$(SED) 's,^all:.*,all:,g' $(LIBUSB_DIR)/tests/Makefile.in
-	$(SED) 's,^install:.*,install:,g' $(LIBUSB_DIR)/tests/Makefile.in
-	$(CONFIG_UPDATE) $(LIBUSB_DIR)
-	cd $(LIBUSB_DIR) && $(AUTORECONF)
-	touch $@
-
-$(LIBUSB_DIR)/.configured: $(LIBUSB_DIR)/.unpacked
-	(cd $(LIBUSB_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_header_regex_h=no \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=$(STAGING_DIR)/usr \
-		--disable-debug \
-		--disable-build-docs \
-	)
-	touch $@
-
-$(STAGING_DIR)/usr/lib/libusb.so: $(LIBUSB_DIR)/.configured
-	$(MAKE) -C $(LIBUSB_DIR)
-	$(MAKE) -C $(LIBUSB_DIR) install
-
-$(TARGET_DIR)/$(LIBUSB_BINARY): $(STAGING_DIR)/usr/lib/libusb.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libusb*.so* $(TARGET_DIR)/usr/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libusb*.so*
-
-libusb: host-pkg-config host-autoconf host-automake host-libtool $(TARGET_DIR)/$(LIBUSB_BINARY)
-
-libusb-clean:
-	rm -f $(STAGING_DIR)/bin/libusb-config
-	rm -f $(STAGING_DIR)/usr/includes/usb*.h
-	rm -f $(STAGING_DIR)/lib/libusb*
-	rm -rf $(STAGING_DIR)/lib/pkgconfig
-	rm -f $(TARGET_DIR)/usr/lib/libusb*
-	-$(MAKE) -C $(LIBUSB_DIR) clean
-
-libusb-dirclean:
-	rm -rf $(LIBUSB_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBUSB),y)
-TARGETS+=libusb
-endif
+LIBUSB_VERSION = 1.0.3
+LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
+LIBUSB_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libusb/libusb-1.0/libusb-$(LIBUSB_VERSION)
+LIBUSB_LIBTOOL_PATCH = NO
+LIBUSB_DEPENDENCIES = host-pkg-config
+LIBUSB_INSTALL_STAGING = YES
+LIBUSB_INSTALL_TARGET = YES
+
+$(eval $(call AUTOTARGETS,package,libusb))
diff --git a/package/usb_modeswitch/Config.in b/package/usb_modeswitch/Config.in
index 41cd3a0..f9fa76e 100644
--- a/package/usb_modeswitch/Config.in
+++ b/package/usb_modeswitch/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_USB_MODESWITCH
 	bool "usb_modeswitch"
-	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  USB mode switcher.
 	  Used to switch mode on multiple-function devices
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 306d803..377bc3b 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -8,7 +8,7 @@ USB_MODESWITCH_VERSION = 1.0.7
 USB_MODESWITCH_SOURCE = usb_modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-USB_MODESWITCH_DEPENDENCIES = libusb
+USB_MODESWITCH_DEPENDENCIES = libusb-compat
 USB_MODESWITCH_MAKE_OPT = CC="$(TARGET_CC)" OPTS="$(TARGET_CFLAGS)"
 
 $(eval $(call AUTOTARGETS,package,usb_modeswitch))
-- 
1.6.3.3
