From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 28 Dec 2008 20:04:02 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libcurl
Message-ID: <20081228200402.421C776D44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-28 20:04:01 +0000 (Sun, 28 Dec 2008)
New Revision: 24580

Log:
libcurl: compile with openssl support if available

Added:
   trunk/buildroot/package/libcurl/libcurl-7.19.2-fix-ssl-no-verbose.patch

Modified:
   trunk/buildroot/package/libcurl/libcurl.mk


Changeset:
Added: trunk/buildroot/package/libcurl/libcurl-7.19.2-fix-ssl-no-verbose.patch
===================================================================
--- trunk/buildroot/package/libcurl/libcurl-7.19.2-fix-ssl-no-verbose.patch	                        (rev 0)
+++ trunk/buildroot/package/libcurl/libcurl-7.19.2-fix-ssl-no-verbose.patch	2008-12-28 20:04:01 UTC (rev 24580)
@@ -0,0 +1,25 @@
+ssluse.c: fix build breakage with --with-ssl --disable-verbose
+
+Revision 1.206 of ssluse.c removed the prefix argument to asn1_output,
+but it is still referenced in the CURL_DISABLE_VERBOSE_STRINGS case.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ lib/ssluse.c |    4 ----
+ 1 file changed, 4 deletions(-)
+
+Index: curl-7.19.2/lib/ssluse.c
+===================================================================
+--- curl-7.19.2.orig/lib/ssluse.c
++++ curl-7.19.2/lib/ssluse.c
+@@ -923,10 +923,6 @@
+   int i;
+   int year=0,month=0,day=0,hour=0,minute=0,second=0;
+ 
+-#ifdef CURL_DISABLE_VERBOSE_STRINGS
+-  (void)prefix;
+-#endif
+-
+   i=tm->length;
+   asn1_string=(const char *)tm->data;
+ 

Modified: trunk/buildroot/package/libcurl/libcurl.mk
===================================================================
--- trunk/buildroot/package/libcurl/libcurl.mk	2008-12-28 20:00:07 UTC (rev 24579)
+++ trunk/buildroot/package/libcurl/libcurl.mk	2008-12-28 20:04:01 UTC (rev 24580)
@@ -10,6 +10,12 @@
 LIBCURL_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols \
 		   $(DISABLE_NLS) $(DISABLE_LARGEFILE) $(DISABLE_IPV6)
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBCURL_DEPENDENCIES += openssl
+LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
+LIBCURL_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr --with-random=/dev/urandom
+endif
+
 $(eval $(call AUTOTARGETS,package,libcurl))
 
 $(LIBCURL_HOOK_POST_INSTALL):
