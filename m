From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 10:05:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpg123
Message-ID: <20070728170539.66936A4682@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 10:05:38 -0700 (Sat, 28 Jul 2007)
New Revision: 19300

Log:
Bump version of mpg123,use configure, change site to Sourceforge

Modified:
   trunk/buildroot/package/mpg123/Config.in
   trunk/buildroot/package/mpg123/mpg123.mk


Changeset:
Modified: trunk/buildroot/package/mpg123/Config.in
===================================================================
--- trunk/buildroot/package/mpg123/Config.in	2007-07-28 16:49:16 UTC (rev 19299)
+++ trunk/buildroot/package/mpg123/Config.in	2007-07-28 17:05:38 UTC (rev 19300)
@@ -6,3 +6,8 @@
 	  MPEG 1.0/2.0 layers 1, 2 and 3.
 
 	  http://www.mpg123.de/
+
+config BR2_PACKAGE_MPG123_ALSA
+	bool
+	default y
+	depends on BR2_PACKAGE_ALSA_LIB

Modified: trunk/buildroot/package/mpg123/mpg123.mk
===================================================================
--- trunk/buildroot/package/mpg123/mpg123.mk	2007-07-28 16:49:16 UTC (rev 19299)
+++ trunk/buildroot/package/mpg123/mpg123.mk	2007-07-28 17:05:38 UTC (rev 19300)
@@ -3,53 +3,67 @@
 # mpg123
 #
 #############################################################
+MPG123_VERSION=0.66
+MPG123_SOURCE=mpg123-$(MPG123_VERSION).tar.bz2
+MPG123_CAT:=$(BZCAT)
+MPG123_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mpg123
+MPG123_DIR:=$(BUILD_DIR)/mpg123-$(MPG123_VERSION)
+MPG123_BIN:=mpg123
+MPG123_TARGET_BIN:=usr/bin/$(MPG123_BIN)
 
-MPG123_VERSION=0.59r
+# Check if ALSA is built, then we should configure after alsa-lib so
+# ./configure can find alsa-lib.
+ifeq ($(strip $(BR2_PACKAGE_MPG123_ALSA)),y)
+MPG123_USE_ALSA:=--with-audio=alsa
+MPG123_ALSA_DEP:=alsa-lib
+endif
 
-# Don't alter below this line unless you (think) you know
-# what you are doing! Danger, Danger!
-
-MPG123_SOURCE=mpg123-$(MPG123_VERSION).tar.gz
-MPG123_CAT:=$(ZCAT)
-MPG123_SITE=http://www.mpg123.de/mpg123
-MPG123_DIR=$(BUILD_DIR)/mpg123-$(MPG123_VERSION)
-
 $(DL_DIR)/$(MPG123_SOURCE):
 	$(WGET) -P $(DL_DIR) $(MPG123_SITE)/$(MPG123_SOURCE)
 
 $(MPG123_DIR)/.unpacked:	$(DL_DIR)/$(MPG123_SOURCE)
 	$(MPG123_CAT) $(DL_DIR)/$(MPG123_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(MPG123_DIR) package/mpg123/ mpg123\*.patch
+	$(CONFIG_UPDATE) $(MPG123_DIR)/build
 	touch $@
 
-$(MPG123_DIR)/mpg123:	$(MPG123_DIR)/.unpacked
-	rm -f $@
-ifeq ($(BR2_ARCH),"i386")
-	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" -C $(MPG123_DIR) linux
-else
-ifeq ($(BR2_ENDIAN),"LITTLE")
-	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" -C $(MPG123_DIR) linux-littleend
-else
-	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" -C $(MPG123_DIR) linux-bigend
-endif
-endif
+$(MPG123_DIR)/.configured: $(MPG123_DIR)/.unpacked
+	(cd $(MPG123_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		./configure \
+		--target=$(REAL_GNU_TARGET_NAME) \
+		--host=$(REAL_GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+		--with-cpu=generic_nofpu \
+		$(MPG123_USE_ALSA) \
+		$(DISABLE_NLS) \
+		$(DISABLE_LARGEFILE) \
+	);
+	touch $@
 
-$(MPG123_DIR)/.installed: 	$(MPG123_DIR)/mpg123
-	mkdir -p $(TARGET_DIR)/usr/bin
-	cp -f $(MPG123_DIR)/mpg123 $(TARGET_DIR)/usr/bin
-	$(STRIP) --strip-all $(TARGET_DIR)/usr/bin/mpg123
-	touch $(MPG123_DIR)/.installed
+$(MPG123_DIR)/$(MPG123_BIN): $(MPG123_DIR)/.configured
+	$(MAKE) -C $(MPG123_DIR)
 
-mpg123:	uclibc $(MPG123_DIR)/.installed
+$(TARGET_DIR)/$(MPG123_TARGET_BIN): $(MPG123_DIR)/$(MPG123_BIN)
+	$(INSTALL) -D $(MPG123_DIR)/src/$(MPG123_BIN) $(TARGET_DIR)/$(MPG123_TARGET_BIN)
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/$(MPG123_TARGET_BIN)
 
-mpg123-source: $(DL_DIR)/$(MPG123_SOURCE)
+mpg123:	uclibc $(MPG123_ALSA_DEP) $(TARGET_DIR)/$(MPG123_TARGET_BIN)
 
 mpg123-clean:
-	-$(MAKE) -C $(MPG123_DIR) clean
+	@if [ -d $(MPG123_DIR)/Makefile ] ; then \
+		$(MAKE) -C $(MPG123_DIR) clean ; \
+	fi;
 
 mpg123-dirclean:
-	rm -rf $(MPG123_DIR)
+	rm -rf $(MPG123_DIR) $(MPG123_DIR)
 
+mpg123-source: $(DL_DIR)/$(MPG123_SOURCE)
+
 #############################################################
 #
 # Toplevel Makefile options
