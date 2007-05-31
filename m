From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 31 May 2007 08:42:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpg123
Message-ID: <20070531154233.EADB248584@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-31 08:42:33 -0700 (Thu, 31 May 2007)
New Revision: 18712

Log:
Cleanup, get rid of MPG123_WORKDIR, use $@, libmad not needed

Modified:
   trunk/buildroot/package/mpg123/mpg123.mk


Changeset:
Modified: trunk/buildroot/package/mpg123/mpg123.mk
===================================================================
--- trunk/buildroot/package/mpg123/mpg123.mk	2007-05-31 15:27:05 UTC (rev 18711)
+++ trunk/buildroot/package/mpg123/mpg123.mk	2007-05-31 15:42:33 UTC (rev 18712)
@@ -12,8 +12,7 @@
 MPG123_SOURCE=mpg123-$(MPG123_VERSION).tar.gz
 MPG123_CAT:=$(ZCAT)
 MPG123_SITE=http://www.mpg123.de/mpg123
-MPG123_DIR=$(BUILD_DIR)/${shell basename $(MPG123_SOURCE) .tar.gz}
-MPG123_WORKDIR=$(BUILD_DIR)/mpg123-$(MPG123_VERSION)
+MPG123_DIR=$(BUILD_DIR)/mpg123-$(MPG123_VERSION)
 
 $(DL_DIR)/$(MPG123_SOURCE):
 	$(WGET) -P $(DL_DIR) $(MPG123_SITE)/$(MPG123_SOURCE)
@@ -21,37 +20,35 @@
 $(MPG123_DIR)/.unpacked:	$(DL_DIR)/$(MPG123_SOURCE)
 	$(MPG123_CAT) $(DL_DIR)/$(MPG123_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(MPG123_DIR) package/mpg123/ mpg123\*.patch
-	touch $(MPG123_DIR)/.unpacked
+	touch $@
 
-$(MPG123_WORKDIR)/mpg123:	$(MPG123_DIR)/.unpacked
+$(MPG123_DIR)/mpg123:	$(MPG123_DIR)/.unpacked
 	rm -f $@
 ifeq ($(BR2_ARCH),"i386")
-	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" -C $(MPG123_WORKDIR) linux
+	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" -C $(MPG123_DIR) linux
 else
 ifeq ($(BR2_ENDIAN),"LITTLE")
-	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" -C $(MPG123_WORKDIR) linux-littleend
+	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" -C $(MPG123_DIR) linux-littleend
 else
-	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" -C $(MPG123_WORKDIR) linux-bigend
+	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" -C $(MPG123_DIR) linux-bigend
 endif
 endif
 
-$(MPG123_WORKDIR)/.installed: 	$(MPG123_WORKDIR)/mpg123
+$(MPG123_DIR)/.installed: 	$(MPG123_DIR)/mpg123
 	mkdir -p $(TARGET_DIR)/usr/bin
-	cp -f $(MPG123_WORKDIR)/mpg123 $(TARGET_DIR)/usr/bin
+	cp -f $(MPG123_DIR)/mpg123 $(TARGET_DIR)/usr/bin
 	$(STRIP) --strip-all $(TARGET_DIR)/usr/bin/mpg123
-	touch $(MPG123_WORKDIR)/.installed
+	touch $(MPG123_DIR)/.installed
 
-mpg123:	uclibc libmad $(MPG123_WORKDIR)/.installed
+mpg123:	uclibc $(MPG123_DIR)/.installed
 
 mpg123-source: $(DL_DIR)/$(MPG123_SOURCE)
 
 mpg123-clean:
-	@if [ -d $(MPG123_WORKDIR)/Makefile ] ; then \
-		$(MAKE) -C $(MPG123_WORKDIR) clean ; \
-	fi;
+	-$(MAKE) -C $(MPG123_DIR) clean
 
 mpg123-dirclean:
-	rm -rf $(MPG123_DIR) $(MPG123_WORKDIR)
+	rm -rf $(MPG123_DIR)
 
 #############################################################
 #
