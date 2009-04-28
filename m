From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 28 Apr 2009 18:30:11 +0000 (UTC)
Subject: [Buildroot] svn commit: [26227] trunk/buildroot/package/openssl
Message-ID: <20090428183011.684B977118@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-28 18:30:10 +0000 (Tue, 28 Apr 2009)
New Revision: 26227

Log:
package/openssl: also strip libraries with _OPENSSL_BIN is enabled

Modified:
   trunk/buildroot/package/openssl/openssl.mk


Changeset:
Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2009-04-28 18:30:06 UTC (rev 26226)
+++ trunk/buildroot/package/openssl/openssl.mk	2009-04-28 18:30:10 UTC (rev 26227)
@@ -60,12 +60,12 @@
 ifeq ($(BR2_PACKAGE_OPENSSL_BIN),y)
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/openssl
 else
+	rm -f $(TARGET_DIR)/usr/bin/openssl
+endif
+	rm -f $(TARGET_DIR)/usr/bin/c_rehash
 	# libraries gets installed read only, so strip fails
 	for i in $(addprefix $(TARGET_DIR)/usr/lib/,libcrypto.so.* libssl.so.*); \
 	do chmod +w $$i; $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $$i; done
-	rm -f $(TARGET_DIR)/usr/bin/openssl
-endif
-	rm -f $(TARGET_DIR)/usr/bin/c_rehash
 ifneq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
 	rm -rf $(TARGET_DIR)/usr/lib/engines
 else
