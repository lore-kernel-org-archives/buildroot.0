From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 28 Dec 2008 13:50:49 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/curl
Message-ID: <20081228135049.C68CC76D44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-28 13:50:49 +0000 (Sun, 28 Dec 2008)
New Revision: 24575

Log:
curl: remove unused legacy patches

Removed:
   trunk/buildroot/package/curl/curl-7.10.4-path.patch
   trunk/buildroot/package/curl/curl-7.12.0-nousr.patch
   trunk/buildroot/package/curl/curl-7.13.1-2005-3185.patch
   trunk/buildroot/package/curl/curl-7.13.1-auth.patch
   trunk/buildroot/package/curl/curl-7.13.1-cve-2005-4077.patch


Changeset:
Deleted: trunk/buildroot/package/curl/curl-7.10.4-path.patch
===================================================================
--- trunk/buildroot/package/curl/curl-7.10.4-path.patch	2008-12-28 13:50:45 UTC (rev 24574)
+++ trunk/buildroot/package/curl/curl-7.10.4-path.patch	2008-12-28 13:50:49 UTC (rev 24575)
@@ -1,13 +0,0 @@
---- curl-7.10.4/lib/Makefile.am
-+++ curl-7.10.4/lib/Makefile.am
-@@ -78,8 +78,8 @@
- 
- install-data-hook:
- 	@if test -n "@CURL_CA_BUNDLE@"; then \
--	  $(mkinstalldirs) `dirname $(DESTDIR)@CURL_CA_BUNDLE@`; \
--	  @INSTALL_DATA@ $(srcdir)/ca-bundle.crt $(DESTDIR)@CURL_CA_BUNDLE@; \
-+	  $(mkinstalldirs) `dirname $(prefix)/../@CURL_CA_BUNDLE@`; \
-+	  @INSTALL_DATA@ $(srcdir)/ca-bundle.crt $(prefix)/../@CURL_CA_BUNDLE@; \
-         fi
- 
- # this hook is mainly for non-unix systems to build even if configure

Deleted: trunk/buildroot/package/curl/curl-7.12.0-nousr.patch
===================================================================
--- trunk/buildroot/package/curl/curl-7.12.0-nousr.patch	2008-12-28 13:50:45 UTC (rev 24574)
+++ trunk/buildroot/package/curl/curl-7.12.0-nousr.patch	2008-12-28 13:50:49 UTC (rev 24575)
@@ -1,16 +0,0 @@
---- curl-7.12.0/configure.ac.orig	2004-05-25 23:43:39.000000000 +0200
-+++ curl-7.12.0/configure.ac		2004-07-26 15:12:03.029071072 +0200
-@@ -742,5 +742,5 @@
-     dnl check the given spot right away!
-     EXTRA_SSL=$OPT_SSL
--    LDFLAGS="$LDFLAGS -L$EXTRA_SSL/lib$libsuff"
-+    #LDFLAGS="$LDFLAGS -L$EXTRA_SSL/lib$libsuff"
-     CPPFLAGS="$CPPFLAGS -I$EXTRA_SSL/include/openssl -I$EXTRA_SSL/include"
-     ;;
-@@ -750,5 +750,5 @@
-      HAVECRYPTO="yes"
-      ],[
--     LDFLAGS="$CLEANLDFLAGS -L$EXTRA_SSL/lib$libsuff"
-+     LDFLAGS="$CLEANLDFLAGS"
-      CPPFLAGS="$CLEANCPPFLAGS -I$EXTRA_SSL/include/openssl -I$EXTRA_SSL/include"
-      AC_CHECK_LIB(crypto, CRYPTO_add_lock,[

Deleted: trunk/buildroot/package/curl/curl-7.13.1-2005-3185.patch
===================================================================
--- trunk/buildroot/package/curl/curl-7.13.1-2005-3185.patch	2008-12-28 13:50:45 UTC (rev 24574)
+++ trunk/buildroot/package/curl/curl-7.13.1-2005-3185.patch	2008-12-28 13:50:49 UTC (rev 24575)
@@ -1,16 +0,0 @@
---- curl-7.13.1/lib/http_ntlm.c.2005-3185	2005-02-22 13:10:30.000000000 +0100
-+++ curl-7.13.1/lib/http_ntlm.c	2005-10-19 15:18:42.165859528 +0200
-@@ -534,6 +534,13 @@
-     size=64;
-     ntlmbuf[62]=ntlmbuf[63]=0;
- 
-+    /* Make sure that the user and domain strings fit in the target buffer
-+         before we copy them there. */
-+    if(size + userlen + domlen >= sizeof(ntlmbuf)) {
-+      failf(conn->data, "user + domain name too big");
-+      return CURLE_OUT_OF_MEMORY;
-+    }
-+
-     memcpy(&ntlmbuf[size], domain, domlen);
-     size += domlen;
- 

Deleted: trunk/buildroot/package/curl/curl-7.13.1-auth.patch
===================================================================
--- trunk/buildroot/package/curl/curl-7.13.1-auth.patch	2008-12-28 13:50:45 UTC (rev 24574)
+++ trunk/buildroot/package/curl/curl-7.13.1-auth.patch	2008-12-28 13:50:49 UTC (rev 24575)
@@ -1,48 +0,0 @@
---- curl-7.13.1/lib/http.c.pom	2005-02-19 00:53:07.000000000 +0100
-+++ curl-7.13.1/lib/http.c	2005-04-27 11:48:40.000000000 +0200
-@@ -455,6 +455,7 @@
-   /* To prevent the user+password to get sent to other than the original
-      host due to a location-follow, we do some weirdo checks here */
-   if(!data->state.this_is_a_follow ||
-+     conn->bits.netrc || 
-      !data->state.first_host ||
-      curl_strequal(data->state.first_host, conn->host.name) ||
-      data->set.http_disable_hostname_check_before_authentication) {
---- curl-7.13.1/lib/url.c.pom	2005-02-09 23:47:57.000000000 +0100
-+++ curl-7.13.1/lib/url.c	2005-04-27 11:45:59.000000000 +0200
-@@ -3131,15 +3131,23 @@
-            user, passwd);
-   }
- 
-+  conn->bits.netrc = FALSE;
-   if (data->set.use_netrc != CURL_NETRC_IGNORED) {
-     if(Curl_parsenetrc(conn->host.name,
-                        user, passwd,
-                        data->set.netrc_file)) {
--      infof(data, "Couldn't find host %s in the " DOT_CHAR "netrc file, using defaults\n",
-+      infof(data, "Couldn't find host %s in the " DOT_CHAR
-+            "netrc file, using defaults\n",
-             conn->host.name);
-     }
--    else
-+    else {
-+      /* set bits.netrc TRUE to remember that we got the name from a .netrc
-+         file, so that it is safe to use even if we followed a Location: to a
-+         different host or similar. */
-+      conn->bits.netrc = TRUE;
-+
-       conn->bits.user_passwd = 1; /* enable user+password */
-+    }
-   }
- 
-   /* If our protocol needs a password and we have none, use the defaults */
---- curl-7.13.1/lib/urldata.h.pom	2005-02-09 14:06:56.000000000 +0100
-+++ curl-7.13.1/lib/urldata.h	2005-04-27 11:50:31.000000000 +0200
-@@ -388,6 +388,7 @@
-   bool ftp_use_lprt;  /* As set with CURLOPT_FTP_USE_EPRT, but if we find out
-                          LPRT doesn't work we disable it for the forthcoming
-                          requests */
-+  bool netrc;         /* name+password provided by netrc */
- };
- 
- struct hostname {

Deleted: trunk/buildroot/package/curl/curl-7.13.1-cve-2005-4077.patch
===================================================================
--- trunk/buildroot/package/curl/curl-7.13.1-cve-2005-4077.patch	2008-12-28 13:50:45 UTC (rev 24574)
+++ trunk/buildroot/package/curl/curl-7.13.1-cve-2005-4077.patch	2008-12-28 13:50:49 UTC (rev 24575)
@@ -1,23 +0,0 @@
---- curl-7.13.1/lib/url.c.cve-2005-4077	2005-12-08 13:08:03.000000000 +0100
-+++ curl-7.13.1/lib/url.c	2005-12-08 13:15:56.565790336 +0100
-@@ -2313,12 +2313,18 @@
-   if(urllen < LEAST_PATH_ALLOC)
-     urllen=LEAST_PATH_ALLOC;
- 
--  conn->pathbuffer=(char *)malloc(urllen);
-+  /*
-+   * We malloc() the buffers below urllen+2 to make room for to possibilities:
-+   * 1 - an extra terminating zero
-+   * 2 - an extra slash (in case a syntax like "www.host.com?moo" is used)
-+   */
-+
-+  conn->pathbuffer=(char *)malloc(urllen+3);
-   if(NULL == conn->pathbuffer)
-     return CURLE_OUT_OF_MEMORY; /* really bad error */
-   conn->path = conn->pathbuffer;
- 
--  conn->host.rawalloc=(char *)malloc(urllen);
-+  conn->host.rawalloc=(char *)malloc(urllen+3);
-   if(NULL == conn->host.rawalloc)
-     return CURLE_OUT_OF_MEMORY;
-   conn->host.name = conn->host.rawalloc;
