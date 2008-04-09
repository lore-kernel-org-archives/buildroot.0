From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Wed,  9 Apr 2008 02:57:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libbeecrypt
Message-ID: <20080409095725.A490A3C4D6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-09 02:57:25 -0700 (Wed, 09 Apr 2008)
New Revision: 21680

Log:
* Added libbeecrypt (requirement for rpm5)


Added:
   trunk/buildroot/package/libbeecrypt/
   trunk/buildroot/package/libbeecrypt/Config.in
   trunk/buildroot/package/libbeecrypt/beecrypt-4.1.2_disable-cxxglue.patch
   trunk/buildroot/package/libbeecrypt/libbeecrypt.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-04-09 07:35:12 UTC (rev 21679)
+++ trunk/buildroot/package/Config.in	2008-04-09 09:57:25 UTC (rev 21680)
@@ -74,6 +74,7 @@
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/less/Config.in"
 endif
+source "package/libbeecrypt/Config.in"
 source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"

Added: trunk/buildroot/package/libbeecrypt/Config.in
===================================================================
--- trunk/buildroot/package/libbeecrypt/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libbeecrypt/Config.in	2008-04-09 09:57:25 UTC (rev 21680)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBBEECRYPT
+	bool "libbeecrypt"
+	default n
+	help
+	  Beecrypt is a general-purpose cryptography library.
+
+	  http://rpm5.org

Added: trunk/buildroot/package/libbeecrypt/beecrypt-4.1.2_disable-cxxglue.patch
===================================================================
--- trunk/buildroot/package/libbeecrypt/beecrypt-4.1.2_disable-cxxglue.patch	                        (rev 0)
+++ trunk/buildroot/package/libbeecrypt/beecrypt-4.1.2_disable-cxxglue.patch	2008-04-09 09:57:25 UTC (rev 21680)
@@ -0,0 +1,12 @@
+diff -ru beecrypt-4.1.2_vanilla/Makefile.am beecrypt-4.1.2_disable-cxxglue/Makefile.am
+--- beecrypt-4.1.2_vanilla/Makefile.am	2004-12-22 07:06:31.000000000 +0000
++++ beecrypt-4.1.2_disable-cxxglue/Makefile.am	2008-03-21 23:24:51.000000000 +0000
+@@ -49,7 +49,7 @@
+ 
+ libalt_LTLIBRARIES = libbeecrypt.la
+ 
+-libbeecrypt_la_SOURCES = aes.c base64.c beecrypt.c blockmode.c blockpad.c blowfish.c dhaes.c dldp.c dlkp.c dlpk.c dlsvdp-dh.c dsa.c elgamal.c endianness.c entropy.c fips186.c hmac.c hmacmd5.c hmacsha1.c hmacsha256.c md5.c hmacsha384.c hmacsha512.c memchunk.c mp.c mpbarrett.c mpnumber.c mpprime.c mtprng.c pkcs1.c pkcs12.c rsa.c rsakp.c rsapk.c sha1.c sha256.c sha384.c sha512.c sha_k.c timestamp.c cppglue.cxx
++libbeecrypt_la_SOURCES = aes.c base64.c beecrypt.c blockmode.c blockpad.c blowfish.c dhaes.c dldp.c dlkp.c dlpk.c dlsvdp-dh.c dsa.c elgamal.c endianness.c entropy.c fips186.c hmac.c hmacmd5.c hmacsha1.c hmacsha256.c md5.c hmacsha384.c hmacsha512.c memchunk.c mp.c mpbarrett.c mpnumber.c mpprime.c mtprng.c pkcs1.c pkcs12.c rsa.c rsakp.c rsapk.c sha1.c sha256.c sha384.c sha512.c sha_k.c timestamp.c
+ libbeecrypt_la_DEPENDENCIES = $(BEECRYPT_OBJECTS)
+ libbeecrypt_la_LIBADD = aesopt.lo blowfishopt.lo mpopt.lo sha1opt.lo
+ libbeecrypt_la_LDFLAGS = -no-undefined -version-info $(LIBBEECRYPT_LT_CURRENT):$(LIBBEECRYPT_LT_REVISION):$(LIBBEECRYPT_LT_AGE)

Added: trunk/buildroot/package/libbeecrypt/libbeecrypt.mk
===================================================================
--- trunk/buildroot/package/libbeecrypt/libbeecrypt.mk	                        (rev 0)
+++ trunk/buildroot/package/libbeecrypt/libbeecrypt.mk	2008-04-09 09:57:25 UTC (rev 21680)
@@ -0,0 +1,75 @@
+#############################################################
+#
+# libbeecrypt
+#
+#############################################################
+LIBBEECRYPT_VERSION:=4.1.2
+LIBBEECRYPT_SOURCE:=beecrypt-$(LIBBEECRYPT_VERSION).tar.gz
+LIBBEECRYPT_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/beecrypt
+LIBBEECRYPT_DIR:=$(BUILD_DIR)/beecrypt-$(LIBBEECRYPT_VERSION)
+LIBBEECRYPT_CAT:=$(ZCAT)
+
+$(DL_DIR)/$(LIBBEECRYPT_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LIBBEECRYPT_SITE)/$(LIBBEECRYPT_SOURCE)
+
+libbeecrypt-source: $(DL_DIR)/$(LIBBEECRYPT_SOURCE)
+
+$(LIBBEECRYPT_DIR)/.unpacked: $(DL_DIR)/$(LIBBEECRYPT_SOURCE)
+	$(LIBBEECRYPT_CAT) $(DL_DIR)/$(LIBBEECRYPT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LIBBEECRYPT_DIR) package/libbeecrypt/ beecrypt\*.patch
+	touch $@
+
+$(LIBBEECRYPT_DIR)/.configured: $(LIBBEECRYPT_DIR)/.unpacked
+	(cd $(LIBBEECRYPT_DIR); rm -rf config.cache; \
+		autoreconf; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=$(STAGING_DIR)/usr \
+		--exec_prefix=$(STAGING_DIR) \
+		--libdir=$(STAGING_DIR)/usr/lib \
+		--includedir=$(STAGING_DIR)/usr/include \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libexecdir=/usr/lib \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+		--without-cplusplus \
+		--without-java \
+		--without-python \
+		$(DISABLE_NLS) \
+	)
+	touch $@
+
+$(LIBBEECRYPT_DIR)/.libs/libbeecrypt.so: $(LIBBEECRYPT_DIR)/.configured
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(LIBBEECRYPT_DIR)
+
+$(STAGING_DIR)/usr/lib/libbeecrypt.so: $(LIBBEECRYPT_DIR)/.libs/libbeecrypt.so
+	$(MAKE) -C $(LIBBEECRYPT_DIR) install
+
+$(TARGET_DIR)/usr/lib/libbeecrypt.so: $(STAGING_DIR)/usr/lib/libbeecrypt.so
+	cp -dpf $(STAGING_DIR)/usr/lib/libbeecrypt.so* $(TARGET_DIR)/usr/lib/
+
+libbeecrypt: uclibc $(TARGET_DIR)/usr/lib/libbeecrypt.so
+
+libbeecrypt-clean:
+	rm -f $(TARGET_DIR)/usr/lib/libbeecrypt.so*
+	-$(MAKE) -C $(LIBBEECRYPT_DIR) clean
+
+libbeecrypt-dirclean:
+	rm -rf $(LIBBEECRYPT_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LIBBEECRYPT)),y)
+TARGETS+=libbeecrypt
+endif
