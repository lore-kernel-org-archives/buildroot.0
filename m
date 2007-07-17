From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 17 Jul 2007 11:10:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libgcrypt
Message-ID: <20070717181036.6B156A65E5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-17 11:10:35 -0700 (Tue, 17 Jul 2007)
New Revision: 19140

Log:
Add GNU Crypto library

Added:
   trunk/buildroot/package/libgcrypt/
   trunk/buildroot/package/libgcrypt/Config.in
   trunk/buildroot/package/libgcrypt/libgcrypt.mk


Changeset:
Added: trunk/buildroot/package/libgcrypt/Config.in
===================================================================
--- trunk/buildroot/package/libgcrypt/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libgcrypt/Config.in	2007-07-17 18:10:35 UTC (rev 19140)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBGCRYPT
+	bool "libgcrypt"
+	select BR2_PACKAGE_LIBGPG_ERROR
+	default n
+	help
+	  LibGCrypt is GNU's basic cryptographic library. 
+
+	  ftp://gd.tuwien.ac.at/privacy/gnupg/libgcrypt/

Added: trunk/buildroot/package/libgcrypt/libgcrypt.mk
===================================================================
--- trunk/buildroot/package/libgcrypt/libgcrypt.mk	                        (rev 0)
+++ trunk/buildroot/package/libgcrypt/libgcrypt.mk	2007-07-17 18:10:35 UTC (rev 19140)
@@ -0,0 +1,75 @@
+#############################################################
+#
+# libgcrypt
+#
+#############################################################
+LIBGCRYPT_VERSION:=1.2.4
+LIBGCRYPT_SOURCE:=libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
+LIBGCRYPT_SITE:=ftp://gd.tuwien.ac.at/privacy/gnupg/libgcrypt/
+LIBGCRYPT_DIR:=$(BUILD_DIR)/libgcrypt-$(LIBGCRYPT_VERSION)
+LIBGCRYPT_LIBRARY:=src/libgcrypt.la
+LIBGCRYPT_DESTDIR:=lib
+LIBGCRYPT_TARGET_LIBRARY=$(LIBGCRYPT_DESTDIR)/libgcrypt.so
+
+$(DL_DIR)/$(LIBGCRYPT_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LIBGCRYPT_SITE)/$(LIBGCRYPT_SOURCE)
+
+$(LIBGCRYPT_DIR)/.source: $(DL_DIR)/$(LIBGCRYPT_SOURCE)
+	$(BZCAT) $(DL_DIR)/$(LIBGCRYPT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LIBGCRYPT_DIR) package/libgcrypt/ libgcrypt\*.patch
+	touch $@
+
+$(LIBGCRYPT_DIR)/.configured: $(LIBGCRYPT_DIR)/.source
+	(cd $(LIBGCRYPT_DIR); \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+			--target=$(GNU_TARGET_NAME) \
+			--host=$(GNU_TARGET_NAME) \
+			--build=$(GNU_HOST_NAME) \
+			--prefix=/usr \
+			--exec-prefix=/usr \
+			--bindir=/usr/bin \
+			--sbindir=/usr/sbin \
+			--libdir=/lib \
+			--libexecdir=/$(LIBGCRYPT_DESTDIR) \
+			--sysconfdir=/etc \
+			--datadir=/usr/share \
+			--localstatedir=/var \
+			--includedir=/include \
+			--includedir=/usr/include \
+			--mandir=/usr/man \
+			--infodir=/usr/info \
+	);
+	touch $@
+
+$(LIBGCRYPT_DIR)/$(LIBGCRYPT_LIBRARY): $(LIBGCRYPT_DIR)/.configured
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBGCRYPT_DIR)
+
+$(STAGING_DIR)/$(LIBGCRYPT_TARGET_LIBRARY): $(LIBGCRYPT_DIR)/$(LIBGCRYPT_LIBRARY)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR) -C $(LIBGCRYPT_DIR) install
+	touch -c $@
+
+$(TARGET_DIR)/$(LIBGCRYPT_TARGET_LIBRARY): $(STAGING_DIR)/$(LIBGCRYPT_TARGET_LIBRARY)
+	cp -dpf $<* $(TARGET_DIR)/$(LIBGCRYPT_DESTDIR)
+
+libgcrypt: uclibc libgpg-error $(TARGET_DIR)/$(LIBGCRYPT_TARGET_LIBRARY)
+
+libgcrypt-source: $(DL_DIR)/$(LIBGCRYPT_SOURCE)
+
+libgcrypt-clean:
+	rm -f $(TARGET_DIR)/$(LIBGCRYPT_TARGET_LIBRARY)*
+	-$(MAKE) -C $(LIBGCRYPT_DIR) clean
+
+libgcrypt-dirclean:
+	rm -rf $(LIBGCRYPT_DIR)
+
+.PHONY:	libgcrypt
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LIBGCRYPT)),y)
+TARGETS+=libgcrypt
+endif
