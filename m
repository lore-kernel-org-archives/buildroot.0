From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu,  4 Dec 2008 08:47:20 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tslib
Message-ID: <20081204164720.3824F3C8E3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-04 08:47:19 -0800 (Thu, 04 Dec 2008)
New Revision: 24274

Log:
tslib: add dependency to hsot-autoconf and host-automake

Tslib uses autoconf and automake during configure section, make sure it is
available before building tslib.



Modified:
   trunk/buildroot/package/tslib/tslib.mk


Changeset:
Modified: trunk/buildroot/package/tslib/tslib.mk
===================================================================
--- trunk/buildroot/package/tslib/tslib.mk	2008-12-04 16:43:54 UTC (rev 24273)
+++ trunk/buildroot/package/tslib/tslib.mk	2008-12-04 16:47:19 UTC (rev 24274)
@@ -20,7 +20,7 @@
 	touch $@
 
 $(TSLIB_DIR)/.configured: $(TSLIB_DIR)/.patched
-	(cd $(TSLIB_DIR); rm -rf config.cache; ./autogen.sh)
+	(cd $(TSLIB_DIR); rm -rf config.cache; PATH=$(TARGET_PATH) ./autogen.sh)
 	$(CONFIG_UPDATE) $(TSLIB_DIR)
 	(cd $(TSLIB_DIR) && \
 	$(TARGET_CONFIGURE_OPTS) \
@@ -84,7 +84,7 @@
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/ts_test
 	cp -dpf package/tslib/ts.conf $(TARGET_DIR)/etc/
 
-tslib: uclibc $(TARGET_DIR)/usr/lib/libts.so
+tslib: uclibc host-automake host-autoconf $(TARGET_DIR)/usr/lib/libts.so
 
 tslib-build: uclibc $(TSLIB_DIR)/.configured
 	rm -f $(TSLIB_DIR)/.compiled
