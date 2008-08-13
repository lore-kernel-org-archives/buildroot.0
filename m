From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Wed, 13 Aug 2008 11:55:48 +0100
Subject: [Buildroot] Building Cairo using DirectFB
Message-ID: <1218624948.11802.3.camel@lnx32dtp04>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following patch add support for building DirectFB 1.0 or 1.2.X
It also stop auto adding packages and turns features on if people
have enabled them from menuconfig.

 Config.in   |   27 ++++++--
 directfb.mk |  200 +++++++++++++++++++++++++++++++++++++++---------------------
 2 files changed, 151 insertions(+), 76 deletions(-)

Signed-off-by: daniel.j.laird <daniel.j.laird@nxp.com>

diff -urN buildroot.orig/package/directfb/Config.in buildroot/package/directfb/Config.in
--- buildroot.orig/package/directfb/Config.in	2008-08-13 10:44:42.000000000 +0100
+++ buildroot/package/directfb/Config.in	2008-08-12 11:58:15.000000000 +0100
@@ -1,19 +1,34 @@
 config BR2_PACKAGE_DIRECTFB
 	bool "directfb"
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_JPEG
+	default n
 	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_LIBSYSFS
-	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_TSLIB
+	select BR2_PACKAGE_JPEG
 	help
 	  http://www.directfb.org/
 
+choice
+	prompt "DirectFB Version"
+	depends BR2_PACKAGE_DIRECTFB
+	default BR2_DIRECTFB_VERSION_1_0_X
+	help
+	  Select the version of DirectFB you wish to use.
+
+	config BR2_DIRECTFB_VERSION_1_0_X
+		bool "DirectFB 1.0.0"
+
+	config BR2_DIRECTFB_VERSION_1_2_X
+		bool "DirectFB 1.2.0"
+endchoice
+
+config BR2_DIRECTFB_VERSION
+	string
+	default "1.0.0"		if BR2_DIRECTFB_VERSION_1_0_X
+	default "1.2.0"		if BR2_DIRECTFB_VERSION_1_2_X
 
 config BR2_PACKAGE_DIRECTFB_MULTI
 	bool "directfb multi application"
+	default n
 	depends on BR2_PACKAGE_DIRECTFB
-	select BR2_PACKAGE_LINUX_FUSION
 	help
 	  Enable use of multiple concurrent DirectFB applications
 	  http://www.directfb.org/
diff -urN buildroot.orig/package/directfb/directfb.mk buildroot/package/directfb/directfb.mk
--- buildroot.orig/package/directfb/directfb.mk	2008-08-13 10:44:42.000000000 +0100
+++ buildroot/package/directfb/directfb.mk	2008-08-13 11:33:17.000000000 +0100
@@ -3,27 +3,65 @@
 # directfb
 #
 #############################################################
-#DIRECTFB_VERSION:=0.9.25.1
-#DIRECTFB_SITE:=http://www.directfb.org/downloads/Old
-DIRECTFB_VERSION:=1.0.1
 DIRECTFB_SITE:=http://www.directfb.org/downloads/Core
+DIRECTFB_CAT:=zcat
+DIRECTFB_VERSION=$(strip $(subst ",, $(BR2_DIRECTFB_VERSION)))
 DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
-DIRECTFB_CAT:=$(ZCAT)
 DIRECTFB_DIR:=$(BUILD_DIR)/DirectFB-$(DIRECTFB_VERSION)
 
+DIRECTFB_CFLAGS:=$(TARGET_CFLAGS) -I. -I$(DIRECTFB_DIR)/include/fusion -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
+# What if we need large file support.
+ifeq ($(BR2_LARGEFILE),y)
+DIRECTFB_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+endif
+
+# If we are building multi with the fusion kernel module then enable-multi.
 ifeq ($(BR2_PACKAGE_DIRECTFB_MULTI),y)
 DIRECTFB_MULTI:=--enable-multi
-DIRECTFB_FUSION:=linux-fusion
 else
 DIRECTFB_MULTI:=
-DIRECTFB_FUSION:=
 endif
+
+#If we have enabled freetype then build with support for it.
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+DIRECTFB_FREETYPE:=--enable-freetype
+else
+DIRECTFB_FREETYPE:=
+endif
+
+#If we have enabled sysfs then build with support for it
+ifeq ($(BR2_PACKAGE_LIBSYSFS),y)
+DIRECTFB_SYSFS:=--enable-sysfs
+else
+DIRECTFB_SYSFS:=
+endif
+
+#If we have enabled zlib then build with support for it
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+DIRECTFB_ZLIB:=--enable-zlib
+else
+DIRECTFB_ZLIB:=
+endif
+
+# If no X server specified then disable X
 ifeq ($(BR2_PACKAGE_XSERVER_none),y)
 DIRECTFB_X:=--disable-x11
 else
 DIRECTFB_X:=--enable-x11
 endif
 
+#If libjpeg or libpng then build the imageproviders for them.
+ifeq ($(BR2_PACKAGE_JPEG),y)
+DIRECTFB_JPEG:=--enable-jpeg
+else
+DIRECTFB_JPEG:=--disable-jpeg 
+endif
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+DIRECTFB_PNG:=--enable-png
+else
+DIRECTFB_PNG:=--disable-png
+endif
+
 $(DL_DIR)/$(DIRECTFB_SOURCE):
 	$(WGET) -P $(DL_DIR) $(DIRECTFB_SITE)/$(DIRECTFB_SOURCE)
 
@@ -31,81 +69,103 @@
 
 $(DIRECTFB_DIR)/.unpacked: $(DL_DIR)/$(DIRECTFB_SOURCE)
 	$(DIRECTFB_CAT) $(DL_DIR)/$(DIRECTFB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(DIRECTFB_DIR) package/directfb/ directfb\*.patch
-	touch $@
+	touch $(DIRECTFB_DIR)/.unpacked
 
-$(DIRECTFB_DIR)/.configured: $(DIRECTFB_DIR)/.unpacked
-	(cd $(DIRECTFB_DIR); rm -f config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
+$(DIRECTFB_DIR)/.patched:$(DIRECTFB_DIR)/.unpacked
+	cp -R package/directfb/overlay$(DIRECTFB_VERSION)/* $(DIRECTFB_DIR)
+	toolchain/patch-kernel.sh $(DIRECTFB_DIR) package/directfb/ libdir-la.patch
+	touch  $(DIRECTFB_DIR)/.patched
+
+$(DIRECTFB_DIR)/.configured: $(DIRECTFB_DIR)/.patched
+	(cd $(DIRECTFB_DIR); \
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(DIRECTFB_CFLAGS)" \
+	LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib" \
 	ac_cv_header_linux_wm97xx_h=no \
 	ac_cv_header_linux_sisfb_h=no \
-	ac_cv_header_asm_page_h=no \
 	./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/bin \
-		--sbindir=/sbin \
-		--libdir=/lib \
-		--libexecdir=/lib \
-		--sysconfdir=/etc \
-		--datadir=/share \
-		--localstatedir=/var \
-		--includedir=/include \
-		--mandir=/man \
-		--infodir=/info \
-		--with-gfxdrivers=cle266,unichrome \
-		--enable-shared \
-		$(DIRECTFB_MULTI) \
-		$(DIRECTFB_X) \
-		--enable-jpeg \
-		--enable-png \
-		--enable-linux-input \
-		--enable-zlib \
-		--enable-freetype \
-		--disable-sysfs \
-		--disable-sdl \
-		--disable-vnc \
-		--disable-video4linux \
-		--disable-video4linux2 \
-		--enable-fusion )
-	touch $@
+	--target=$(GNU_TARGET_NAME) \
+	--host=$(GNU_TARGET_NAME) \
+	--build=$(GNU_HOST_NAME) \
+	--prefix=/usr \
+	--exec-prefix=/usr \
+	--bindir=/usr/bin \
+	--sbindir=/usr/sbin \
+	--libdir=/usr/lib \
+	--libexecdir=/usr/lib \
+	--sysconfdir=/etc \
+	--datadir=/usr/share \
+	--localstatedir=/var \
+	--includedir=/usr/include \
+	--mandir=/usr/man \
+	--infodir=/usr/info \
+	--with-gfxdrivers=cle266,unichrome \
+	--with-inputdrivers=linuxinput \
+	--disable-sdl \
+	--disable-vnc \
+	--disable-video4linux \
+	--disable-video4linux2 \
+	--enable-gif \
+	$(DIRECTFB_JPEG) \
+	$(DIRECTFB_PNG) \
+	$(DIRECTFB_ZLIB) \
+	$(DIRECTFB_FREETYPE) \
+	$(DIRECTFB_SYSFS) \
+	$(DIRECTFB_X) \
+	$(DIRECTFB_MULTI) \
+	);
+	touch  $(DIRECTFB_DIR)/.configured
 
 $(DIRECTFB_DIR)/.compiled: $(DIRECTFB_DIR)/.configured
-	$(MAKE) PATH=$(STAGING_DIR)/usr/lib:$(PATH) \
-		$(TARGET_CONFIGURE_OPTS) \
-		-C $(DIRECTFB_DIR)
+	$(MAKE) -C $(DIRECTFB_DIR)
 	touch $(DIRECTFB_DIR)/.compiled
 
 $(STAGING_DIR)/usr/lib/libdirectfb.so: $(DIRECTFB_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(DIRECTFB_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
-		$(STAGING_DIR)/usr/lib/libdirectfb.la
-	$(SED) "s,/lib/libfusion.la,$(STAGING_DIR)/usr/lib/libfusion.la,g" \
-		$(STAGING_DIR)/usr/lib/libdirectfb.la
-	$(SED) "s,/lib/libdirect.la,$(STAGING_DIR)/usr/lib/libdirect.la,g" \
-		$(STAGING_DIR)/usr/lib/libdirectfb.la
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
-		$(STAGING_DIR)/usr/lib/libdirect.la
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
-		$(STAGING_DIR)/usr/lib/libfusion.la
-	$(SED) "s,/lib/libdirect.la,$(STAGING_DIR)/usr/lib/libdirect.la,g" \
-		$(STAGING_DIR)/usr/lib/libfusion.la
-	touch -c $@
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DIRECTFB_DIR) install
+	$(SED) "/^libdir=/ s,/usr/lib,$(STAGING_DIR)/usr/lib,g" $(STAGING_DIR)/usr/lib/libdirectfb.la
+	$(SED) "/^dependency_libs=/ s,/usr/lib,$(STAGING_DIR)/usr/lib,g" $(STAGING_DIR)/usr/lib/libdirectfb.la
+	$(SED) "/^libdir=/ s,/usr/lib,$(STAGING_DIR)/usr/lib,g" $(STAGING_DIR)/usr/lib/libdirect.la
+	$(SED) "/^dependency_libs=/ s,/usr/lib,$(STAGING_DIR)/usr/lib,g" $(STAGING_DIR)/usr/lib/libdirect.la
+	$(SED) "/^libdir=/ s,/usr/lib,$(STAGING_DIR)/usr/lib,g" $(STAGING_DIR)/usr/lib/libfusion.la
+	$(SED) "/^dependency_libs=/ s,/usr/lib,$(STAGING_DIR)/usr/lib,g" $(STAGING_DIR)/usr/lib/libfusion.la
+	touch -c $(STAGING_DIR)/usr/lib/libdirectfb.so
 
 $(TARGET_DIR)/usr/lib/libdirectfb.so: $(STAGING_DIR)/usr/lib/libdirectfb.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libdirect* $(STAGING_DIR)/usr/lib/libfusion* $(TARGET_DIR)/usr/lib/
-	cp -rdpf $(STAGING_DIR)/usr/lib/directfb-* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) \
-		$(TARGET_DIR)/usr/lib/libdirectfb.so \
-		$(TARGET_DIR)/usr/lib/libdirect.so \
-		$(TARGET_DIR)/usr/lib/libfusion.so
-
-directfb: uclibc jpeg libpng freetype libsysfs tslib $(DIRECTFB_FUSION) \
-		$(TARGET_DIR)/usr/lib/libdirectfb.so
+	mkdir -p $(TARGET_DIR)/usr/lib
+	mkdir -p $(TARGET_DIR)/usr/bin
+	mkdir -p $(TARGET_DIR)/usr/share/directfb-$(DIRECTFB_VERSION)
+	# Copy in the useful DirectFB apps
+	$(INSTALL) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-dfbdump $(TARGET_DIR)/usr/bin/dfbdump
+	$(INSTALL) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-dfbg $(TARGET_DIR)/usr/bin/dfbg
+	$(INSTALL) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-dfbinfo $(TARGET_DIR)/usr/bin/dfbinfo
+	$(INSTALL) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-dfblayer $(TARGET_DIR)/usr/bin/dfblayer
+	$(INSTALL) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-dfbscreen $(TARGET_DIR)/usr/bin/dfbscreen
+	$(INSTALL) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-dfbinput $(TARGET_DIR)/usr/bin/dfbinput
+	# Copy in the DirectFB libraries
+	cp -dpf $(STAGING_DIR)/usr/lib/libdirect* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/usr/lib/libfusion* $(TARGET_DIR)/usr/lib/
+	cp -rdpf $(STAGING_DIR)/usr/lib/directfb-1.* $(TARGET_DIR)/usr/lib/
+	# Copy in the DirectFB cursor
+	cp -rdpf $(STAGING_DIR)/usr/share/directfb-$(DIRECTFB_VERSION) $(TARGET_DIR)/usr/share/
+	# Strip the libraries
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/dfbdump
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/dfbg
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/dfbinfo
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/dfblayer
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/dfbscreen
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/dfbinput
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libdirect*.so
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libfusion*.so
+
+directfb: uclibc \
+	$(if $(BR2_PACKAGE_FREETYPE), freetype) \
+	$(if $(BR2_PACKAGE_ZLIB), zlib) \
+	$(if $(BR2_PACKAGE_LIBPNG), libpng) \
+	$(if $(BR2_PACKAGE_JPEG), jpeg) \
+	$(if $(BR2_PACKAGE_LIBSYSFS), libsysfs) \
+	$(if $(BR2_PACKAGE_TSLIB), tslib) \
+	$(if $(BR2_PACKAGE_DIRECTFB_MULTI), linux-fusion) \
+	$(TARGET_DIR)/usr/lib/libdirectfb.so
 
 directfb-clean:
 	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIRECTFB_DIR) uninstall
