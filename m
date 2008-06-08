From: Matthias Geissert <matthias.geissert@web.de>
Date: Sun, 8 Jun 2008 17:12:27 +0200
Subject: [Buildroot] Patch to add cryptsetup to buildroot
Message-ID: <200806081712.28129.matthias.geissert@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody,

I would like to submit a patch to add cryptsetup to buildroot and I hope that 
this is the right place to do it.

I created the diff with the svn version from today. It works if uclibc is 
compiled with large file support. As far as I understand this is not enabled 
by default. However, I don't know how to change this.

Best,
matthias


--


diff -uNr b1/Config.in b2/Config.in
--- b1/Config.in	Sat Jun  7 19:39:21 2008
+++ b2/Config.in	Sun Jun  8 14:39:48 2008
@@ -83,6 +83,7 @@
 source "package/libfloat/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
+source "package/cryptsetup/Config.in"
 source "package/libiconv/Config.in"
 source "package/liblockfile/Config.in"
 source "package/libsysfs/Config.in"
diff -uNr b1/cryptsetup/Config.in b2/cryptsetup/Config.in
--- b1/cryptsetup/Config.in	Thu Jan  1 01:00:00 1970
+++ b2/cryptsetup/Config.in	Sat Apr 26 11:57:30 2008
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CRYPTSETUP
+	bool "cryptsetup"
+	default n
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_POPT
+	help
+		Not avaiable
diff -uNr b1/cryptsetup/cryptsetup.mk b2/cryptsetup/cryptsetup.mk
--- b1/cryptsetup/cryptsetup.mk	Thu Jan  1 01:00:00 1970
+++ b2/cryptsetup/cryptsetup.mk	Sun Jun  8 14:37:21 2008
@@ -0,0 +1,67 @@
+#############################################################
+#
+# cryptsetup
+#
+#############################################################
+CRYPTSETUP_VERSION:=1.0.6
+CRYPTSETUP_SOURCE:=cryptsetup-$(CRYPTSETUP_VERSION).tar.bz2
+CRYPTSETUP_SITE:=http://luks.endorphin.org/source
+CRYPTSETUP_DIR:=$(BUILD_DIR)/cryptsetup-$(CRYPTSETUP_VERSION)
+CRYPTSETUP_BINARY:=src/cryptsetup
+CRYPTSETUP_TARGET_BINARY:=usr/sbin/cryptsetup
+
+$(DL_DIR)/$(CRYPTSETUP_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(CRYPTSETUP_SITE)/$(CRYPTSETUP_SOURCE)
+
+$(CRYPTSETUP_DIR)/.source: $(DL_DIR)/$(CRYPTSETUP_SOURCE)
+	$(BZCAT) $(DL_DIR)/$(CRYPTSETUP_SOURCE) | tar -C $(BUILD_DIR) 
$(TAR_OPTIONS) -
+	touch $@
+
+$(CRYPTSETUP_DIR)/.configured: $(CRYPTSETUP_DIR)/.source
+	(cd $(CRYPTSETUP_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+		--disable-shared-library \
+		$(DISABLE_NLS); \
+		
$(SED)  's:^hardcode_libdir_flag_spec.*$$:hardcode_libdir_flag_spec=" -D__LIBTOOL_IS_A_FOOL__ ":'   -i 
libtool; \
+	)
+	touch $@
+
+$(CRYPTSETUP_DIR)/$(CRYPTSETUP_BINARY): $(CRYPTSETUP_DIR)/.configured 
+	$(MAKE) CC=$(TARGET_CC) -C $(CRYPTSETUP_DIR)
+
+$(TARGET_DIR)/$(CRYPTSETUP_TARGET_BINARY): 
$(CRYPTSETUP_DIR)/$(CRYPTSETUP_BINARY)
+	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(CRYPTSETUP_DIR) install
+	rm $(TARGET_DIR)/usr/lib/libcryptsetup*
+	rmdir $(TARGET_DIR)/usr/lib/cryptsetup
+	rm $(TARGET_DIR)/usr/include/libcryptsetup.h
+	rm -Rf $(TARGET_DIR)/usr/share/man
+	$(STRIPCMD) $(TARGET_DIR)/$(CRYPTSETUP_TARGET_BINARY)
+
+
+cryptsetup: libgcrypt libgpg-error popt host-e2fsprogs-uuid uclibc 
$(TARGET_DIR)/$(CRYPTSETUP_TARGET_BINARY)
+
+cryptsetup-source: $(DL_DIR)/$(CRYPTSETUP_SOURCE)
+
+
+cryptsetup-clean:
+	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(CRYPTSETUP_DIR) uninstall
+	-$(MAKE) -C $(CRYPTSETUP_DIR) clean
+
+cryptsetup-dirclean:
+	rm -rf $(CRYPTSETUP_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_CRYPTSETUP)),y)
+TARGETS+=cryptsetup
+endif
diff -uNr b1/e2fsprogs/e2fsprogs.mk b2/e2fsprogs/e2fsprogs.mk
--- b1/e2fsprogs/e2fsprogs.mk	Sat Jun  7 19:37:59 2008
+++ b2/e2fsprogs/e2fsprogs.mk	Sun Jun  8 14:34:21 2008
@@ -118,9 +118,17 @@
 
 e2fsprogs: uclibc $(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY)
 
+host-e2fsprogs-uuid:  $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY) 
$(STAGING_DIR)/usr/include/uuid/uuid.h 
+
+$(STAGING_DIR)/usr/include/uuid/uuid.h:
+	mkdir -p $(STAGING_DIR)/usr/include/uuid/
+	cp $(E2FSPROGS_DIR)/lib/uuid/uuid.h	$(STAGING_DIR)/usr/include/uuid
+	cp $(E2FSPROGS_DIR)/lib/libuuid.a $(STAGING_DIR)/usr/lib
+
 e2fsprogs-clean:
 	$(MAKE1) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(E2FSPROGS_DIR) uninstall
 	-$(MAKE1) -C $(E2FSPROGS_DIR) clean
+	rm -rf $(STAGING_DIR)/usr/include/uuid $(STAGING_DIR)/usr/lib
 
 e2fsprogs-dirclean:
 	rm -rf $(E2FSPROGS_DIR)
