From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 14 Dec 2006 07:55:33 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpg123
Message-ID: <20061214155533.BD78048609@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-14 07:55:33 -0800 (Thu, 14 Dec 2006)
New Revision: 16930

Log:
- Ulrich Hecht writes: The current mpg123 package
- ignores TARGET_CC (overwritten in Makefile)
- ignores TARGET_CFLAGS
- is hardcoded to use the i386 target


Modified:
   trunk/buildroot/package/mpg123/mpg123.mk


Changeset:
Modified: trunk/buildroot/package/mpg123/mpg123.mk
===================================================================
--- trunk/buildroot/package/mpg123/mpg123.mk	2006-12-14 15:47:50 UTC (rev 16929)
+++ trunk/buildroot/package/mpg123/mpg123.mk	2006-12-14 15:55:33 UTC (rev 16930)
@@ -20,11 +20,20 @@
 
 $(MPG123_DIR)/.unpacked:	$(DL_DIR)/$(MPG123_SOURCE)
 	$(MPG123_CAT) $(DL_DIR)/$(MPG123_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(MPG123_DIR) package/mpg123/ mpg123\*.patch
 	touch $(MPG123_DIR)/.unpacked
 
 $(MPG123_WORKDIR)/mpg123:	$(MPG123_DIR)/.unpacked
 	rm -f $@
-	$(MAKE) CC=$(TARGET_CC) -C $(MPG123_WORKDIR) linux
+ifeq ($(BR2_ARCH),"i386")
+	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" -C $(MPG123_WORKDIR) linux
+else
+ifeq ($(BR2_ENDIAN),"LITTLE")
+	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" -C $(MPG123_WORKDIR) linux-littleend
+else
+	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" -C $(MPG123_WORKDIR) linux-bigend
+endif
+endif
 
 $(MPG123_WORKDIR)/.installed: 	$(MPG123_WORKDIR)/mpg123
 	mkdir -p $(TARGET_DIR)/usr/bin
