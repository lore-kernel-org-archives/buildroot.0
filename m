From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 10 Mar 2009 21:03:15 +0000 (UTC)
Subject: [Buildroot] svn commit: [25600] trunk/buildroot/package/libcurl
Message-ID: <20090310210315.31D0176465@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-10 21:03:14 +0000 (Tue, 10 Mar 2009)
New Revision: 25600

Log:
libcurl: fix configure with openssl when target == host.

Modified:
   trunk/buildroot/package/libcurl/libcurl.mk


Changeset:
Modified: trunk/buildroot/package/libcurl/libcurl.mk
===================================================================
--- trunk/buildroot/package/libcurl/libcurl.mk	2009-03-10 21:03:10 UTC (rev 25599)
+++ trunk/buildroot/package/libcurl/libcurl.mk	2009-03-10 21:03:14 UTC (rev 25600)
@@ -13,6 +13,11 @@
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBCURL_DEPENDENCIES += openssl
 LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
+# configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
+# native stuff during the rest of configure when target == host.
+# Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
+# are found first.
+LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:/lib:/usr/lib
 LIBCURL_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr --with-random=/dev/urandom
 endif
 
