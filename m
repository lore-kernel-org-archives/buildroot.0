From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 28 Apr 2009 18:30:06 +0000 (UTC)
Subject: [Buildroot] svn commit: [26226] trunk/buildroot/package/openssl
Message-ID: <20090428183006.9CFDB77118@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-28 18:30:06 +0000 (Tue, 28 Apr 2009)
New Revision: 26226

Log:
package/openssl: make sure TARGET_CFLAGS are used

And remove the unnedded c_rehash binary while we're at it.

Patch by Gustavo Zacarias <gustavo@zacarias.com.br>, closes #307.

Saves ~250k on PPC with default config (E.G. -Os)

Modified:
   trunk/buildroot/package/openssl/openssl.mk


Changeset:
Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2009-04-28 17:33:44 UTC (rev 26225)
+++ trunk/buildroot/package/openssl/openssl.mk	2009-04-28 18:30:06 UTC (rev 26226)
@@ -46,6 +46,8 @@
 			no-rc5 \
 			zlib-dynamic \
 	)
+	$(SED) "s:-march=[-a-z0-9] ::" -e "s:-mcpu=[-a-z0-9] ::g" $(OPENSSL_DIR)/Makefile
+	$(SED) "s:-O[0-9]:$(TARGET_CFLAGS):" $(OPENSSL_DIR)/Makefile
 	touch $@
 
 $(OPENSSL_TARGET_BUILD):
@@ -61,9 +63,9 @@
 	# libraries gets installed read only, so strip fails
 	for i in $(addprefix $(TARGET_DIR)/usr/lib/,libcrypto.so.* libssl.so.*); \
 	do chmod +w $$i; $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $$i; done
-	rm -f $(TARGET_DIR)/usr/bin/c_rehash
 	rm -f $(TARGET_DIR)/usr/bin/openssl
 endif
+	rm -f $(TARGET_DIR)/usr/bin/c_rehash
 ifneq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
 	rm -rf $(TARGET_DIR)/usr/lib/engines
 else
