From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 22 Dec 2016 09:02:32 +0100
Subject: [Buildroot] [PATCH 1/1] libupnp: bump to version 1.6.21
Message-ID: <1482393752-1432-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 ...-unhandled-POSTs-to-write-to-the-filesyst.patch | 73 ----------------------
 ...bound-access-in-create_url_list-CVE-2016-.patch | 64 -------------------
 package/libupnp/libupnp.hash                       |  2 +-
 package/libupnp/libupnp.mk                         |  4 +-
 4 files changed, 2 insertions(+), 141 deletions(-)
 delete mode 100644 package/libupnp/0001-Don-t-allow-unhandled-POSTs-to-write-to-the-filesyst.patch
 delete mode 100644 package/libupnp/0002-Fix-out-of-bound-access-in-create_url_list-CVE-2016-.patch

diff --git a/package/libupnp/0001-Don-t-allow-unhandled-POSTs-to-write-to-the-filesyst.patch b/package/libupnp/0001-Don-t-allow-unhandled-POSTs-to-write-to-the-filesyst.patch
deleted file mode 100644
index 4bf1473..0000000
--- a/package/libupnp/0001-Don-t-allow-unhandled-POSTs-to-write-to-the-filesyst.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From c91a8a3903367e1163765b73eb4d43be7d7927fa Mon Sep 17 00:00:00 2001
-From: Matthew Garrett <mjg59@srcf.ucam.org>
-Date: Tue, 23 Feb 2016 13:53:20 -0800
-Subject: [PATCH] Don't allow unhandled POSTs to write to the filesystem by
- default
-
-Fixes CVE-2016-6255: write files via POST
-
-If there's no registered handler for a POST request, the default behaviour
-is to write it to the filesystem. Several million deployed devices appear
-to have this behaviour, making it possible to (at least) store arbitrary
-data on them. Add a configure option that enables this behaviour, and change
-the default to just drop POSTs that aren't directly handled.
-
-Signed-off-by: Marcelo Roberto Jimenez <mroberto@users.sourceforge.net>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure.ac                         | 4 ++++
- upnp/inc/upnpconfig.h.in             | 5 +++++
- upnp/src/genlib/net/http/webserver.c | 4 ++++
- 3 files changed, 13 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index dd88734..ea2bc09 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -482,6 +482,10 @@ if test "x$enable_scriptsupport" = xyes ; then
-         AC_DEFINE(IXML_HAVE_SCRIPTSUPPORT, 1, [see upnpconfig.h])
- fi
- 
-+RT_BOOL_ARG_ENABLE([postwrite], [no], [write to the filesystem on otherwise unhandled POST requests])
-+if test "x$enable_postwrite" = xyes ; then
-+        AC_DEFINE(UPNP_ENABLE_POST_WRITE, 1, [see upnpconfig.h])
-+fi
- 
- RT_BOOL_ARG_ENABLE([samples], [yes], [compilation of upnp/sample/ code])
- 
-diff --git a/upnp/inc/upnpconfig.h.in b/upnp/inc/upnpconfig.h.in
-index 46ddc6e..5df8c5a 100644
---- a/upnp/inc/upnpconfig.h.in
-+++ b/upnp/inc/upnpconfig.h.in
-@@ -135,5 +135,10 @@
-  *  (i.e. configure --enable-open_ssl) */
- #undef UPNP_ENABLE_OPEN_SSL
- 
-+/** Defined to 1 if the library has been compiled to support filesystem writes on POST
-+ *  (i.e. configure --enable-postwrite) */
-+#undef UPNP_ENABLE_POST_WRITE
-+
-+
- #endif /* UPNP_CONFIG_H */
- 
-diff --git a/upnp/src/genlib/net/http/webserver.c b/upnp/src/genlib/net/http/webserver.c
-index 8991c16..8b2ecf2 100644
---- a/upnp/src/genlib/net/http/webserver.c
-+++ b/upnp/src/genlib/net/http/webserver.c
-@@ -1369,9 +1369,13 @@ static int http_RecvPostMessage(
- 		if (Fp == NULL)
- 			return HTTP_INTERNAL_SERVER_ERROR;
- 	} else {
-+#ifdef UPNP_ENABLE_POST_WRITE
- 		Fp = fopen(filename, "wb");
- 		if (Fp == NULL)
- 			return HTTP_UNAUTHORIZED;
-+#else
-+		return HTTP_NOT_FOUND;
-+#endif
- 	}
- 	parser->position = POS_ENTITY;
- 	do {
--- 
-2.10.2
-
diff --git a/package/libupnp/0002-Fix-out-of-bound-access-in-create_url_list-CVE-2016-.patch b/package/libupnp/0002-Fix-out-of-bound-access-in-create_url_list-CVE-2016-.patch
deleted file mode 100644
index 1b74d3e..0000000
--- a/package/libupnp/0002-Fix-out-of-bound-access-in-create_url_list-CVE-2016-.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 9c099c2923ab4d98530ab5204af1738be5bddba7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@debian.org>
-Date: Thu, 8 Dec 2016 17:11:53 +0100
-Subject: [PATCH] Fix out-of-bound access in create_url_list() (CVE-2016-8863)
-
-If there is an invalid URL in URLS->buf after a valid one, uri_parse is
-called with out pointing after the allocated memory. As uri_parse writes
-to *out before returning an error the loop in create_url_list must be
-stopped early to prevent an out-of-bound access
-
-Bug: https://sourceforge.net/p/pupnp/bugs/133/
-Bug-CVE: https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-8863
-Bug-Debian: https://bugs.debian.org/842093
-Bug-Redhat: https://bugzilla.redhat.com/show_bug.cgi?id=1388771
-(cherry picked from commit a0f6e719bc03c4d2fe6a4a42ef6b8761446f520b)
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- upnp/src/gena/gena_device.c | 17 ++++++++++++-----
- 1 file changed, 12 insertions(+), 5 deletions(-)
-
-diff --git a/upnp/src/gena/gena_device.c b/upnp/src/gena/gena_device.c
-index fb04a29..245c56b 100644
---- a/upnp/src/gena/gena_device.c
-+++ b/upnp/src/gena/gena_device.c
-@@ -1113,7 +1113,7 @@ static int create_url_list(
- 	/*! [out] . */
- 	URL_list *out)
- {
--    size_t URLcount = 0;
-+    size_t URLcount = 0, URLcount2 = 0;
-     size_t i;
-     int return_code = 0;
-     uri_type temp;
-@@ -1155,16 +1155,23 @@ static int create_url_list(
-         }
-         memcpy( out->URLs, URLS->buff, URLS->size );
-         out->URLs[URLS->size] = 0;
--        URLcount = 0;
-         for( i = 0; i < URLS->size; i++ ) {
-             if( ( URLS->buff[i] == '<' ) && ( i + 1 < URLS->size ) ) {
-                 if( ( ( return_code =
-                         parse_uri( &out->URLs[i + 1], URLS->size - i + 1,
--                                   &out->parsedURLs[URLcount] ) ) ==
-+                                   &out->parsedURLs[URLcount2] ) ) ==
-                       HTTP_SUCCESS )
--                    && ( out->parsedURLs[URLcount].hostport.text.size !=
-+                    && ( out->parsedURLs[URLcount2].hostport.text.size !=
-                          0 ) ) {
--                    URLcount++;
-+                    URLcount2++;
-+                    if (URLcount2 >= URLcount)
-+                        /*
-+                         * break early here in case there is a bogus URL that
-+                         * was skipped above. This prevents to access
-+                         * out->parsedURLs[URLcount] which is beyond the
-+                         * allocation.
-+                         */
-+                        break;
-                 } else {
-                     if( return_code == UPNP_E_OUTOF_MEMORY ) {
-                         free( out->URLs );
--- 
-2.10.2
-
diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index 64a8bdb..df39f32 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  ee3537081e3ea56f66ada10387486823989210bc98002f098305551c966e3a63  libupnp-1.6.20.tar.bz2
+sha256	af3f3c0846a1d75baeadae4aa5a2bda427567e2a1fb4559bf73ccff0a4f9a39b	libupnp-1.6.21.tar.bz2
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index 2a4e078..8236cee 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.6.20
+LIBUPNP_VERSION = 1.6.21
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
 LIBUPNP_INSTALL_STAGING = YES
 LIBUPNP_LICENSE = BSD-3c
 LIBUPNP_LICENSE_FILES = LICENSE
-# configure.ac patched by 0001-Don-t-allow-unhandled-POSTs-to-write-to-the-filesyst.patch
-LIBUPNP_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.7.4
