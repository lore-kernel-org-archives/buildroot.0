From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 13:13:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/libevent
	package/libgcrypt packa etc...
Message-ID: <20070919201310.C01BE3004F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 13:13:08 -0700 (Wed, 19 Sep 2007)
New Revision: 19898

Log:
- fixes and cleanups (Cristian Ionescu-Idbohrn)


Modified:
   trunk/buildroot/package/libevent/libevent.mk
   trunk/buildroot/package/libgcrypt/libgcrypt.mk
   trunk/buildroot/package/liblockfile/liblockfile.mk
   trunk/buildroot/package/libsndfile/libsndfile.mk
   trunk/buildroot/package/libtool/libtool.mk
   trunk/buildroot/package/libvorbis/Config.in
   trunk/buildroot/package/libvorbis/libvorbis.mk
   trunk/buildroot/package/lighttpd/lighttpd.mk
   trunk/buildroot/package/openntpd/openntpd.mk
   trunk/buildroot/package/sed/sed.mk
   trunk/buildroot/project/project.mk
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Modified: trunk/buildroot/package/libevent/libevent.mk
===================================================================
--- trunk/buildroot/package/libevent/libevent.mk	2007-09-19 18:46:45 UTC (rev 19897)
+++ trunk/buildroot/package/libevent/libevent.mk	2007-09-19 20:13:08 UTC (rev 19898)
@@ -31,6 +31,7 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
+		--mandir=/usr/share/man \
 		--disable-static \
 		--with-gnu-ld \
 	)
@@ -44,9 +45,11 @@
 
 $(TARGET_DIR)/$(LIBEVENT_TARGET_BINARY): $(STAGING_DIR)/$(LIBEVENT_TARGET_BINARY)
 	$(MAKE) -C $(LIBEVENT_DIR) DESTDIR=$(TARGET_DIR) install
-	rm -f $(TARGET_DIR)/usr/lib/libevent*.la $(TARGET_DIR)/usr/include/ev*
-	rm -f $(TARGET_DIR)/usr/man/man3/ev*.3
-	rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/man/man3
+	rm -f $(addprefix $(TARGET_DIR)/usr/,lib/libevent*.la \
+					     include/ev*)
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	rm -fr $(TARGET_DIR)/usr/share/man
+endif
 
 libevent: uclibc $(TARGET_DIR)/$(LIBEVENT_TARGET_BINARY)
 

Modified: trunk/buildroot/package/libgcrypt/libgcrypt.mk
===================================================================
--- trunk/buildroot/package/libgcrypt/libgcrypt.mk	2007-09-19 18:46:45 UTC (rev 19897)
+++ trunk/buildroot/package/libgcrypt/libgcrypt.mk	2007-09-19 20:13:08 UTC (rev 19898)
@@ -42,8 +42,8 @@
 		--datadir=/usr/share \
 		--localstatedir=/var \
 		--includedir=/usr/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
+		--mandir=/usr/share/man \
+		--infodir=/usr/share/info \
 		--disable-optimization \
 	)
 	touch $@
@@ -57,6 +57,9 @@
 
 $(TARGET_DIR)/$(LIBGCRYPT_TARGET_LIBRARY): $(STAGING_DIR)/$(LIBGCRYPT_TARGET_LIBRARY)
 	cp -dpf $<* $(TARGET_DIR)/$(LIBGCRYPT_DESTDIR)
+ifneq ($(BR2_HAVE_INFOPAGES),y)
+	rm -rf $(STAGING_DIR)/usr/share/info
+endif
 
 libgcrypt: uclibc libgpg-error $(TARGET_DIR)/$(LIBGCRYPT_TARGET_LIBRARY)
 

Modified: trunk/buildroot/package/liblockfile/liblockfile.mk
===================================================================
--- trunk/buildroot/package/liblockfile/liblockfile.mk	2007-09-19 18:46:45 UTC (rev 19897)
+++ trunk/buildroot/package/liblockfile/liblockfile.mk	2007-09-19 20:13:08 UTC (rev 19898)
@@ -28,29 +28,38 @@
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--bindir=/usr/bin \
+		--libdir=/usr/lib \
+		--includedir=/usr/include \
+		--mandir=/usr/share/man \
 		--enable-shared \
 	)
 	touch $@
 
 $(STAGING_DIR)/lib/$(LIBLOCKFILE_BINARY): $(LIBLOCKFILE_DIR)/.configured
-	mkdir -p $(STAGING_DIR)/man/man1 $(STAGING_DIR)/man/man3
-	$(MAKE) -C $(LIBLOCKFILE_DIR) prefix= ROOT=$(STAGING_DIR) install
-	ln -sf $(LIBLOCKFILE_BINARY) $(STAGING_DIR)/lib/liblockfile.so.1
-	cp -dpf $(LIBLOCKFILE_DIR)/liblockfile.a $(STAGING_DIR)/lib
+	mkdir -p $(addprefix $(STAGING_DIR)/usr/share/man/man,1 3)
+	mkdir -p $(STAGING_DIR)/usr/share/man/man3
+	rm -f $(STAGING_DIR)/usr/lib/liblockfile.so
+	$(MAKE) -C $(LIBLOCKFILE_DIR) ROOT=$(STAGING_DIR) install
+	ln -sf $(LIBLOCKFILE_BINARY) $(STAGING_DIR)/usr/lib/liblockfile.so.1
+	cp -dpf $(LIBLOCKFILE_DIR)/liblockfile.a $(STAGING_DIR)/usr/lib
 
 $(TARGET_DIR)/usr/lib/$(LIBLOCKFILE_BINARY): $(STAGING_DIR)/lib/$(LIBLOCKFILE_BINARY)
 	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -a $(STAGING_DIR)/lib/liblockfile.so* $(TARGET_DIR)/usr/lib
-	$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/$(LIBLOCKFILE_BINARY)
+	cp -a $(STAGING_DIR)/usr/lib/liblockfile.so* $(TARGET_DIR)/usr/lib
+	$(STRIP) $(STRIP_STRIP_UNNEEDED) \
+		$(TARGET_DIR)/usr/lib/$(LIBLOCKFILE_BINARY)
 
 liblockfile: uclibc $(TARGET_DIR)/usr/lib/$(LIBLOCKFILE_BINARY)
 
 liblockfile-clean:
 	rm -f $(TARGET_DIR)/usr/lib/liblockfile.so*
-	rm -f $(STAGING_DIR)/lib/liblockfile*
-	rm -f $(STAGING_DIR)/usr/include/lockfile.h
-	rm -f $(STAGING_DIR)/usr/include/mailfile.h
-	rm -rf $(STAGING_DIR)/man
+	rm -f $(STAGING_DIR)/usr/lib/liblockfile*
+	rm -f $(addprefix $(STAGING_DIR)/usr/include/,lockfile.h mailfile.h)
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	rm -rf $(STAGING_DIR)/usr/share/man
+endif
 	$(MAKE) -C $(LIBLOCKFILE_DIR) clean
 
 liblockfile-dirclean:

Modified: trunk/buildroot/package/libsndfile/libsndfile.mk
===================================================================
--- trunk/buildroot/package/libsndfile/libsndfile.mk	2007-09-19 18:46:45 UTC (rev 19897)
+++ trunk/buildroot/package/libsndfile/libsndfile.mk	2007-09-19 20:13:08 UTC (rev 19898)
@@ -36,17 +36,20 @@
 	$(MAKE) CC=$(TARGET_CC) -C $(LIBSNDFILE_DIR)
 
 $(TARGET_DIR)/$(LIBSNDFILE_TARGET_BINARY): $(LIBSNDFILE_DIR)/$(LIBSNDFILE_BINARY)
+	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(LIBSNDFILE_DIR) install
 	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LIBSNDFILE_DIR) install
-	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(LIBSNDFILE_DIR) install
-	rm -Rf $(TARGET_DIR)/usr/man
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	rm -Rf $(TARGET_DIR)/usr/share/man
+	rm -Rf $(STAGING_DIR)/usr/share/man
+endif
 
 libsndfile: uclibc $(TARGET_DIR)/$(LIBSNDFILE_TARGET_BINARY)
 
 libsndfile-source: $(DL_DIR)/$(LIBSNDFILE_SOURCE)
 
 libsndfile-clean:
+	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(LIBSNDFILE_DIR) uninstall
 	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LIBSNDFILE_DIR) uninstall
-	-$(MAKE) prefix=$(STAGING_DIR)/usr -C $(LIBSNDFILE_DIR) uninstall
 	-$(MAKE) -C $(LIBSNDFILE_DIR) clean
 
 libsndfile-dirclean:
@@ -60,4 +63,3 @@
 ifeq ($(strip $(BR2_PACKAGE_LIBSNDFILE)),y)
 TARGETS+=libsndfile
 endif
-

Modified: trunk/buildroot/package/libtool/libtool.mk
===================================================================
--- trunk/buildroot/package/libtool/libtool.mk	2007-09-19 18:46:45 UTC (rev 19897)
+++ trunk/buildroot/package/libtool/libtool.mk	2007-09-19 20:13:08 UTC (rev 19898)
@@ -46,8 +46,8 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
+		--mandir=/usr/share/man \
+		--infodir=/usr/share/info \
 		$(DISABLE_NLS) \
 	)
 	touch $@
@@ -67,15 +67,21 @@
 	    sysconfdir=$(TARGET_DIR)/etc \
 	    localstatedir=$(TARGET_DIR)/var \
 	    libdir=$(TARGET_DIR)/usr/lib \
-	    infodir=$(TARGET_DIR)/usr/info \
-	    mandir=$(TARGET_DIR)/usr/man \
+	    infodir=$(TARGET_DIR)/usr/share/info \
+	    mandir=$(TARGET_DIR)/usr/share/man \
 	    includedir=$(TARGET_DIR)/usr/include \
 	    -C $(LIBTOOL_DIR) install
 	$(STRIP) $(TARGET_DIR)//usr/lib/libltdl.so.*.*.* > /dev/null 2>&1
 	$(SED) "s,^CC.*,CC=\"/usr/bin/gcc\"," $(TARGET_DIR)/usr/bin/libtool
 	$(SED) "s,^LD.*,LD=\"/usr/bin/ld\"," $(TARGET_DIR)/usr/bin/libtool
-	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
+	rm -rf $(TARGET_DIR)/share/locale
+	rm -rf $(TARGET_DIR)/usr/share/doc
+ifneq ($(BR2_HAVE_INFOPAGES),y)
+	rm -rf $(TARGET_DIR)/usr/share/info
+endif
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	rm -rf $(TARGET_DIR)/usr/share/man
+endif
 	touch -c $@
 
 libtool: uclibc $(TARGET_DIR)/$(LIBTOOL_TARGET_BINARY)
@@ -116,8 +122,14 @@
 
 $(STAGING_DIR)/$(LIBTOOL_TARGET_BINARY): $(LIBTOOL_HOST_DIR)/$(LIBTOOL_BINARY)
 	$(MAKE) -C $(LIBTOOL_HOST_DIR) install
-	rm -rf $(STAGING_DIR)/share/locale $(STAGING_DIR)/usr/info \
-		$(STAGING_DIR)/usr/man $(STAGING_DIR)/usr/share/doc
+	rm -rf $(STAGING_DIR)/share/locale
+	rm -rf $(STAGING_DIR)/usr/share/doc
+ifneq ($(BR2_HAVE_INFOPAGES),y)
+	rm -rf $(STAGING_DIR)/usr/share/info
+endif
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	rm -rf $(STAGING_DIR)/usr/share/man
+endif
 	touch -c $@
 
 host-libtool: $(STAGING_DIR)/$(LIBTOOL_TARGET_BINARY)

Modified: trunk/buildroot/package/libvorbis/Config.in
===================================================================
--- trunk/buildroot/package/libvorbis/Config.in	2007-09-19 18:46:45 UTC (rev 19897)
+++ trunk/buildroot/package/libvorbis/Config.in	2007-09-19 20:13:08 UTC (rev 19898)
@@ -8,9 +8,10 @@
 	  (8kHz-48.0kHz, 16+ bit, polyphonic) audio and music at fixed and
 	  variable bitrates from 16 to 128 kbps/channel.
 
-	  This places Vorbis in the same competitive class as audio representations
-	  such as MPEG-4 (AAC), and similar to, but higher performance than
-	  MPEG-1/2 audio layer 3, MPEG-4 audio (TwinVQ), WMA and PAC.
+	  This places Vorbis in the same competitive class as audio
+	  representations such as MPEG-4 (AAC), and similar to, but higher
+	  performance than MPEG-1/2 audio layer 3, MPEG-4 audio (TwinVQ),
+	  WMA and PAC.
 
 
 config BR2_PACKAGE_LIBVORBIS_HEADERS

Modified: trunk/buildroot/package/libvorbis/libvorbis.mk
===================================================================
--- trunk/buildroot/package/libvorbis/libvorbis.mk	2007-09-19 18:46:45 UTC (rev 19897)
+++ trunk/buildroot/package/libvorbis/libvorbis.mk	2007-09-19 20:13:08 UTC (rev 19898)
@@ -19,11 +19,13 @@
 	touch $@
 
 $(LIBVORBIS_DIR)/.configured: $(LIBVORBIS_DIR)/.source
-	(cd $(LIBVORBIS_DIR); rm -rf config.cache ; \
+	(cd $(LIBVORBIS_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		PKG_CONFIG_PATH="$(STAGING_DIR)/lib/pkconfig:$(STAGING_DIR)/usr/lib/pkgconfig" PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" PKG_CONFIG_SYSROOT=$(STAGING_DIR) \
+		PKG_CONFIG_PATH="$(STAGING_DIR)/lib/pkconfig:$(STAGING_DIR)/usr/lib/pkgconfig" \
+		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
+		PKG_CONFIG_SYSROOT=$(STAGING_DIR) \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -34,7 +36,7 @@
 		--enable-static \
 		--disable-oggtest \
 		$(DISABLE_NLS) \
-	);
+	)
 	touch $@
 
 $(LIBVORBIS_DIR)/.libs: $(LIBVORBIS_DIR)/.configured
@@ -51,7 +53,8 @@
 
 libvorbis-header: $(TARGET_DIR)/usr/lib/libvorbis.a
 	mkdir -p $(TARGET_DIR)/usr/include/vorbis
-	cp -dpf $(LIBVORBIS_DIR)/include/vorbis/*.h $(TARGET_DIR)/usr/include/vorbis
+	cp -dpf $(LIBVORBIS_DIR)/include/vorbis/*.h \
+		$(TARGET_DIR)/usr/include/vorbis
 
 libvorbis: uclibc pkgconfig $(TARGET_DIR)/usr/lib/libvorbis.so
 
@@ -80,7 +83,7 @@
 $(DL_DIR)/$(TREMOR_SOURCE):
 	(cd $(BUILD_DIR); \
 		svn co $(TREMOR_TRUNK); \
-		mv -af Tremor $(TREMOR_NAME); \
+		mv -f Tremor $(TREMOR_NAME); \
 		tar -cvf $(TREMOR_NAME).tar $(TREMOR_DIR); \
 		bzip2 $(TREMOR_NAME).tar; \
 		rm -fr $(TREMOR_DIR); \

Modified: trunk/buildroot/package/lighttpd/lighttpd.mk
===================================================================
--- trunk/buildroot/package/lighttpd/lighttpd.mk	2007-09-19 18:46:45 UTC (rev 19897)
+++ trunk/buildroot/package/lighttpd/lighttpd.mk	2007-09-19 20:13:08 UTC (rev 19898)
@@ -14,11 +14,13 @@
 
 $(DL_DIR)/$(LIGHTTPD_SOURCE):
 	$(WGET) -P $(DL_DIR) $(LIGHTTPD_SITE)/$(LIGHTTPD_SOURCE)
+
 ifneq ($(LIGHTTPD_PATCH),)
 LIGHTTPD_PATCH_FILE:=$(DL_DIR)/$(LIGHTTPD_PATCH)
 $(LIGHTTPD_PATCH_FILE):
 	$(WGET) -P $(DL_DIR) $(LIGHTTPD_SITE)/$(LIGHTTPD_PATCH)
 endif
+
 lighttpd-source: $(DL_DIR)/$(LIGHTTPD_SOURCE) $(LIGHTTPD_PATCH_FILE)
 
 $(LIGHTTPD_DIR)/.unpacked: $(DL_DIR)/$(LIGHTTPD_SOURCE)
@@ -63,17 +65,21 @@
 
 $(LIGHTTPD_DIR)/$(LIGHTTPD_BINARY): $(LIGHTTPD_DIR)/.configured
 	$(MAKE) -C $(LIGHTTPD_DIR)
-   
+
 $(TARGET_DIR)/$(LIGHTTPD_TARGET_BINARY): $(LIGHTTPD_DIR)/$(LIGHTTPD_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(LIGHTTPD_DIR) install
-	@rm -rf $(TARGET_DIR)/usr/share/man $(TARGET_DIR)/usr/man
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	rm -rf $(TARGET_DIR)/usr/share/man
+endif
 	@rm -rf $(TARGET_DIR)/usr/lib/lighttpd/*.la
 	$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/lighttpd/*.so
 	$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(LIGHTTPD_TARGET_BINARY)
 	@if [ ! -f $(TARGET_DIR)/etc/lighttpd/lighttpd.conf ]; then \
-		$(INSTALL) -m 0644 -D $(LIGHTTPD_DIR)/doc/lighttpd.conf $(TARGET_DIR)/etc/lighttpd/lighttpd.conf; \
+		$(INSTALL) -m 0644 -D $(LIGHTTPD_DIR)/doc/lighttpd.conf \
+			$(TARGET_DIR)/etc/lighttpd/lighttpd.conf; \
 	fi
-	$(INSTALL) -m 0755 -D package/lighttpd/rc.lighttpd $(TARGET_DIR)/etc/init.d/S99lighttpd
+	$(INSTALL) -m 0755 -D package/lighttpd/rc.lighttpd \
+		$(TARGET_DIR)/etc/init.d/S99lighttpd
 
 ifeq ($(strip $(BR2_PACKAGE_LIGHTTPD_OPENSSL)),y)
 lighttpd: uclibc openssl $(TARGET_DIR)/$(LIGHTTPD_TARGET_BINARY)

Modified: trunk/buildroot/package/openntpd/openntpd.mk
===================================================================
--- trunk/buildroot/package/openntpd/openntpd.mk	2007-09-19 18:46:45 UTC (rev 19897)
+++ trunk/buildroot/package/openntpd/openntpd.mk	2007-09-19 20:13:08 UTC (rev 19898)
@@ -64,7 +64,7 @@
 
 ntpd-clean:
 	rm -f $(addprefix $(TARGET_DIR)/,etc/ntpd.conf \
-					 usr/share/man/man?/ntpd.conf* \
+					 usr/share/man/man?/ntpd* \
 					 $(OPENNTPD_TARGET_BINARY))
 	-$(MAKE) -C $(OPENNTPD_DIR) clean
 

Modified: trunk/buildroot/package/sed/sed.mk
===================================================================
--- trunk/buildroot/package/sed/sed.mk	2007-09-19 18:46:45 UTC (rev 19897)
+++ trunk/buildroot/package/sed/sed.mk	2007-09-19 20:13:08 UTC (rev 19898)
@@ -54,21 +54,29 @@
 	@if [ -L $(HOST_SED_DIR)/$(SED_TARGET_BINARY) ]; then \
 		rm -f $(HOST_SED_DIR)/$(SED_TARGET_BINARY); \
 	fi
-	@if [ ! -f $(HOST_SED_DIR)/$(SED_TARGET_BINARY) -o $(HOST_SED_DIR)/$(SED_TARGET_BINARY) \
-	-ot $(SED_DIR1)/$(SED_BINARY) ]; then \
-	    set -x; \
-	    mkdir -p $(HOST_SED_DIR)/bin; \
-	    $(MAKE) DESTDIR=$(HOST_SED_DIR) -C $(SED_DIR1) install; \
-	    mv $(HOST_SED_DIR)/usr/bin/sed $(HOST_SED_DIR)/bin/; \
-	    rm -rf $(HOST_SED_DIR)/share/locale $(HOST_SED_DIR)/usr/info \
-		    $(HOST_SED_DIR)/usr/man $(HOST_SED_DIR)/usr/share/doc; \
+	@if [ ! -f $(HOST_SED_DIR)/$(SED_TARGET_BINARY) \
+	      -o $(HOST_SED_DIR)/$(SED_TARGET_BINARY) \
+	      -ot $(SED_DIR1)/$(SED_BINARY) ]; then \
+		set -x; \
+		mkdir -p $(HOST_SED_DIR)/bin; \
+		$(MAKE) DESTDIR=$(HOST_SED_DIR) -C $(SED_DIR1) install; \
+		mv $(HOST_SED_DIR)/usr/bin/sed $(HOST_SED_DIR)/bin/; \
+		rm -rf $(HOST_SED_DIR)/share/locale; \
+		rm -rf $(HOST_SED_DIR)/usr/share/doc; \
 	fi
+ifneq ($(BR2_HAVE_INFOPAGES),y)
+	rm -rf $(HOST_SED_DIR)/usr/man/info
+endif
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	rm -rf $(HOST_SED_DIR)/usr/share/man
+endif
 
 $(HOST_SED_DIR)/$(SED_TARGET_BINARY):
 	if [ ! -e "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)" ]; then \
 		mkdir -p "$(HOST_SED_DIR)/bin"; \
 		rm -f "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)"; \
-		ln -sf "$(HOST_SED_IF_ANY)" "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)"; \
+		ln -sf "$(HOST_SED_IF_ANY)" \
+			"$(HOST_SED_DIR)/$(SED_TARGET_BINARY)"; \
 	fi
 
 .PHONY: sed host-sed use-sed-host-binary
@@ -117,8 +125,8 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
+		--mandir=/usr/share/man \
+		--infodir=/usr/share/info \
 		--include=$(STAGING_DIR)/usr/include \
 		$(DISABLE_NLS) \
 	)
@@ -133,14 +141,21 @@
 		rm -f $(TARGET_DIR)/$(SED_TARGET_BINARY); \
 	fi
 
-	@if [ ! -f $(SED_DIR2)/$(SED_BINARY) -o $(TARGET_DIR)/$(SED_TARGET_BINARY) \
-	-ot $(SED_DIR2)/$(SED_BINARY) ]; then \
-	    set -x; \
-	    $(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(SED_DIR2) install; \
-	    mv $(TARGET_DIR)/usr/bin/sed $(TARGET_DIR)/bin/; \
-	    rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-		    $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc; \
+	@if [ ! -f $(SED_DIR2)/$(SED_BINARY) \
+	      -o $(TARGET_DIR)/$(SED_TARGET_BINARY) \
+	      -ot $(SED_DIR2)/$(SED_BINARY) ]; then \
+		set -x; \
+		$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(SED_DIR2) install; \
+		mv $(TARGET_DIR)/usr/bin/sed $(TARGET_DIR)/bin/; \
+		rm -rf $(TARGET_DIR)/share/locale; \
+		rm -rf $(TARGET_DIR)/usr/share/doc; \
 	fi
+ifneq ($(BR2_HAVE_INFOPAGES),y)
+	rm -rf $(TARGET_DIR)/usr/share/info
+endif
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	rm -rf $(TARGET_DIR)/usr/share/man
+endif
 
 sed: uclibc sed-target_binary
 

Modified: trunk/buildroot/project/project.mk
===================================================================
--- trunk/buildroot/project/project.mk	2007-09-19 18:46:45 UTC (rev 19897)
+++ trunk/buildroot/project/project.mk	2007-09-19 20:13:08 UTC (rev 19898)
@@ -1,7 +1,7 @@
 PROJECT_FILE:=$(LOCAL)/$(PROJECT)/$(PROJECT).config
 
 
-.PHONY: target-host-info  saveconfig getconfig
+.PHONY: target-host-info saveconfig getconfig
 
 target-host-info: $(TARGET_DIR)/etc/issue $(TARGET_DIR)/etc/hostname
 
@@ -18,27 +18,31 @@
 saveconfig: $(CONFIG)/conf
 	mkdir -p $(LOCAL)/$(PROJECT)
 	-cp .config $(PROJECT_FILE)
-	if [ -f $(LINUX26_DIR)/.config ] ; then \
-		cp $(LINUX26_DIR)/.config $(LOCAL)/$(PROJECT)/linux-$(LINUX26_VERSION).config ; \
-		$(SED) '/BR2_PACKAGE_LINUX_KCONFIG/d' $(PROJECT_FILE) ; \
-		echo "BR2_PACKAGE_LINUX_KCONFIG:=$(LOCAL)/$(PROJECT)/linux-$(LINUX26_VERSION).config" >> $(PROJECT_FILE)	; \
+	if [ -f $(LINUX26_DIR)/.config ]; then \
+		cp $(LINUX26_DIR)/.config \
+			$(LOCAL)/$(PROJECT)/linux-$(LINUX26_VERSION).config; \
+		$(SED) '/BR2_PACKAGE_LINUX_KCONFIG/d' $(PROJECT_FILE); \
+		echo "BR2_PACKAGE_LINUX_KCONFIG:=$(LOCAL)/$(PROJECT)/linux-$(LINUX26_VERSION).config" >> $(PROJECT_FILE); \
 	fi
-	if [ -f $(BUSYBOX_DIR)/.config ] ; then \
-		cp $(BUSYBOX_DIR)/.config $(LOCAL)/$(PROJECT)/busybox-$(BUSYBOX_VERSION).config ; \
-		$(SED) '/BR2_PACKAGE_BUSYBOX_CONFIG/d' $(PROJECT_FILE) ; \
-		echo "BR2_PACKAGE_BUSYBOX_CONFIG:=$(LOCAL)/$(PROJECT)/busybox-$(BUSYBOX_VERSION).config" >> $(PROJECT_FILE) ; \
+	if [ -f $(BUSYBOX_DIR)/.config ]; then \
+		cp $(BUSYBOX_DIR)/.config \
+			$(LOCAL)/$(PROJECT)/busybox-$(BUSYBOX_VERSION).config; \
+		$(SED) '/BR2_PACKAGE_BUSYBOX_CONFIG/d' $(PROJECT_FILE); \
+		echo "BR2_PACKAGE_BUSYBOX_CONFIG:=$(LOCAL)/$(PROJECT)/busybox-$(BUSYBOX_VERSION).config" >> $(PROJECT_FILE); \
 	fi
-	if [ -f $(UCLIBC_DIR)/.config ] ; then \
-		cp $(UCLIBC_DIR)/.config $(LOCAL)/$(PROJECT)/uclibc-$(UCLIBC_VER).config ; \
-		$(SED) '/BR2_UCLIBC_CONFIG/d' $(PROJECT_FILE) ; \
-		echo "BR2_UCLIBC_CONFIG:=$(LOCAL)/$(PROJECT)/uclibc-$(UCLIBC_VER).config" >> $(PROJECT_FILE) ; \
+	if [ -f $(UCLIBC_DIR)/.config ]; then \
+		cp $(UCLIBC_DIR)/.config \
+			$(LOCAL)/$(PROJECT)/uclibc-$(UCLIBC_VER).config; \
+		$(SED) '/BR2_UCLIBC_CONFIG/d' $(PROJECT_FILE); \
+		echo "BR2_UCLIBC_CONFIG:=$(LOCAL)/$(PROJECT)/uclibc-$(UCLIBC_VER).config" >> $(PROJECT_FILE); \
 	fi
-	if [ -f $(UBOOT_DIR)/include/configs/$(PROJECT).h ] ; then \
-		cp $(UBOOT_DIR)/include/configs/$(PROJECT).h $(LOCAL)/$(PROJECT)/u-boot/$(PROJECT).h ; \
+	if [ -f $(UBOOT_DIR)/include/configs/$(PROJECT).h ]; then \
+		cp $(UBOOT_DIR)/include/configs/$(PROJECT).h \
+			$(LOCAL)/$(PROJECT)/u-boot/$(PROJECT).h; \
 	fi
 
 getconfig: $(CONFIG)/conf
-	-cp $(LOCAL)/$(PROJECT)/$(PROJECT).config .config 
+	-cp $(LOCAL)/$(PROJECT)/$(PROJECT).config .config
 
 vendor-dbg:
 	@echo VENDOR_SITE=$(BR2_VENDOR_SITE)

Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2007-09-19 18:46:45 UTC (rev 19897)
+++ trunk/buildroot/toolchain/binutils/Config.in	2007-09-19 20:13:08 UTC (rev 19898)
@@ -13,7 +13,7 @@
 		bool "binutils 2.14.90.0.8"
 
 	config BR2_BINUTILS_VERSION_2_15
-		depends !BR2_avr32 &&  BR2_DEPRECATED
+		depends !BR2_avr32 && BR2_DEPRECATED
 		bool "binutils 2.15"
 
 	config BR2_BINUTILS_VERSION_2_15_94_0_2_2
@@ -107,34 +107,33 @@
 
 config BR2_BINUTILS_VERSION
 	string
-	default "2.14.90.0.8"     if BR2_BINUTILS_VERSION_2_14_90_0_8
-	default "2.15"            if BR2_BINUTILS_VERSION_2_15
-	default "2.15.94.0.2.2"   if BR2_BINUTILS_VERSION_2_15_94_0_2_2
-	default "2.16.1"          if BR2_BINUTILS_VERSION_2_16_1
-	default "2.16.90.0.3"     if BR2_BINUTILS_VERSION_2_16_90_0_3
-	default "2.16.91.0.5"     if BR2_BINUTILS_VERSION_2_16_91_0_5
-	default "2.16.91.0.6"     if BR2_BINUTILS_VERSION_2_16_91_0_6
-	default "2.16.91.0.7"     if BR2_BINUTILS_VERSION_2_16_91_0_7
-	default "2.17"            if BR2_BINUTILS_VERSION_2_17
-	default "2.17.50.0.2"     if BR2_BINUTILS_VERSION_2_17_50_0_2
-	default "2.17.50.0.3"     if BR2_BINUTILS_VERSION_2_17_50_0_3
-	default "2.17.50.0.4"     if BR2_BINUTILS_VERSION_2_17_50_0_4
-	default "2.17.50.0.5"     if BR2_BINUTILS_VERSION_2_17_50_0_5
-	default "2.17.50.0.6"     if BR2_BINUTILS_VERSION_2_17_50_0_6
-	default "2.17.50.0.7"     if BR2_BINUTILS_VERSION_2_17_50_0_7
-	default "2.17.50.0.8"     if BR2_BINUTILS_VERSION_2_17_50_0_8
-	default "2.17.50.0.9"     if BR2_BINUTILS_VERSION_2_17_50_0_9
-	default "2.17.50.0.10"    if BR2_BINUTILS_VERSION_2_17_50_0_10
-	default "2.17.50.0.12"    if BR2_BINUTILS_VERSION_2_17_50_0_12
-	default "2.17.50.0.14"    if BR2_BINUTILS_VERSION_2_17_50_0_14
-	default "2.17.50.0.16"    if BR2_BINUTILS_VERSION_2_17_50_0_16
-	default "2.17.50.0.17"    if BR2_BINUTILS_VERSION_2_17_50_0_17
-	default "2.18"            if BR2_BINUTILS_VERSION_2_18
-	default "2.18.50.0.1"     if BR2_BINUTILS_VERSION_2_18_50_0_1
+	default "2.14.90.0.8"	if BR2_BINUTILS_VERSION_2_14_90_0_8
+	default "2.15"		if BR2_BINUTILS_VERSION_2_15
+	default "2.15.94.0.2.2" if BR2_BINUTILS_VERSION_2_15_94_0_2_2
+	default "2.16.1"	if BR2_BINUTILS_VERSION_2_16_1
+	default "2.16.90.0.3"	if BR2_BINUTILS_VERSION_2_16_90_0_3
+	default "2.16.91.0.5"	if BR2_BINUTILS_VERSION_2_16_91_0_5
+	default "2.16.91.0.6"	if BR2_BINUTILS_VERSION_2_16_91_0_6
+	default "2.16.91.0.7"	if BR2_BINUTILS_VERSION_2_16_91_0_7
+	default "2.17"		if BR2_BINUTILS_VERSION_2_17
+	default "2.17.50.0.2"	if BR2_BINUTILS_VERSION_2_17_50_0_2
+	default "2.17.50.0.3"	if BR2_BINUTILS_VERSION_2_17_50_0_3
+	default "2.17.50.0.4"	if BR2_BINUTILS_VERSION_2_17_50_0_4
+	default "2.17.50.0.5"	if BR2_BINUTILS_VERSION_2_17_50_0_5
+	default "2.17.50.0.6"	if BR2_BINUTILS_VERSION_2_17_50_0_6
+	default "2.17.50.0.7"	if BR2_BINUTILS_VERSION_2_17_50_0_7
+	default "2.17.50.0.8"	if BR2_BINUTILS_VERSION_2_17_50_0_8
+	default "2.17.50.0.9"	if BR2_BINUTILS_VERSION_2_17_50_0_9
+	default "2.17.50.0.10"	if BR2_BINUTILS_VERSION_2_17_50_0_10
+	default "2.17.50.0.12"	if BR2_BINUTILS_VERSION_2_17_50_0_12
+	default "2.17.50.0.14"	if BR2_BINUTILS_VERSION_2_17_50_0_14
+	default "2.17.50.0.16"	if BR2_BINUTILS_VERSION_2_17_50_0_16
+	default "2.17.50.0.17"	if BR2_BINUTILS_VERSION_2_17_50_0_17
+	default "2.18"		if BR2_BINUTILS_VERSION_2_18
+	default "2.18.50.0.1"	if BR2_BINUTILS_VERSION_2_18_50_0_1
 
 config BR2_EXTRA_BINUTILS_CONFIG_OPTIONS
 	string "Additional binutils options"
 	default ""
 	help
 	  Any additional binutils options you may want to include.
-
