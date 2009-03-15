From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 15 Mar 2009 07:28:07 +0000 (UTC)
Subject: [Buildroot] svn commit: [25660] trunk/buildroot/package/openssl
Message-ID: <20090315072807.972A176419@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-15 07:28:06 +0000 (Sun, 15 Mar 2009)
New Revision: 25660

Log:
openssl: strip libraries

Modified:
   trunk/buildroot/package/openssl/openssl.mk


Changeset:
Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2009-03-15 04:56:51 UTC (rev 25659)
+++ trunk/buildroot/package/openssl/openssl.mk	2009-03-15 07:28:06 UTC (rev 25660)
@@ -58,10 +58,16 @@
 ifeq ($(BR2_PACKAGE_OPENSSL_BIN),y)
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/openssl
 else
+	# libraries gets installed read only, so strip fails
+	for i in $(addprefix $(TARGET_DIR)/usr/lib/,libcrypto.so.* libssl.so.*); \
+	do chmod +w $$i; $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $$i; done
 	rm -f $(TARGET_DIR)/usr/bin/c_rehash
 	rm -f $(TARGET_DIR)/usr/bin/openssl
 endif
 ifneq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
 	rm -rf $(TARGET_DIR)/usr/lib/engines
+else
+	chmod +w $(TARGET_DIR)/usr/lib/engines/lib*.so
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/engines/lib*.so
 endif
 	touch $@
