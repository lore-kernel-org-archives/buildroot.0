From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jul 2010 10:24:08 +0200
Subject: [Buildroot] [git commit master 1/1] libcurl: bump version to fix
	build issue
Message-ID: <20100730082548.3FB10836C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=28ac3c6785961411af29a9d22388697610b55667
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ./configure script of libcurl includes <arpa_inet.h> instead of
<arpa/inet.h> when testing for inet_pton(). The test fails, but it
doesn't prevent libcurl to build as it can work without inet_pton().

However, it fills the configure cache with the fact that inet_pton()
does not exist. And later, tcpreplay reads this from the configure
cache and fails to build, because tcpreplay really need inet_pton().

Unfortunately, just fixing the .m4 file doesn't work because the
autoreconfiguration of the package fails. Since the fix for this
problem is already upstream, the easiest solution is therefore to bump
libcurl.

The libcurl-7.19.2-fix-ssl-no-verbose.patch patch is no longer needed.

Since we're patching a m4 file, we must autoreconfigure the package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libcurl-7.19.2-fix-ssl-no-verbose.patch        |   25 --------------------
 package/libcurl/libcurl.mk                         |    3 +-
 2 files changed, 2 insertions(+), 26 deletions(-)
 delete mode 100644 package/libcurl/libcurl-7.19.2-fix-ssl-no-verbose.patch

diff --git a/package/libcurl/libcurl-7.19.2-fix-ssl-no-verbose.patch b/package/libcurl/libcurl-7.19.2-fix-ssl-no-verbose.patch
deleted file mode 100644
index b15ed96..0000000
--- a/package/libcurl/libcurl-7.19.2-fix-ssl-no-verbose.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-ssluse.c: fix build breakage with --with-ssl --disable-verbose
-
-Revision 1.206 of ssluse.c removed the prefix argument to asn1_output,
-but it is still referenced in the CURL_DISABLE_VERBOSE_STRINGS case.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- lib/ssluse.c |    4 ----
- 1 file changed, 4 deletions(-)
-
-Index: curl-7.19.2/lib/ssluse.c
-===================================================================
---- curl-7.19.2.orig/lib/ssluse.c
-+++ curl-7.19.2/lib/ssluse.c
-@@ -923,10 +923,6 @@
-   int i;
-   int year=0,month=0,day=0,hour=0,minute=0,second=0;
- 
--#ifdef CURL_DISABLE_VERBOSE_STRINGS
--  (void)prefix;
--#endif
--
-   i=tm->length;
-   asn1_string=(const char *)tm->data;
- 
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 863c301..488df04 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -3,11 +3,12 @@
 # libcurl
 #
 #############################################################
-LIBCURL_VERSION = 7.19.2
+LIBCURL_VERSION = 7.21.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download/
 LIBCURL_INSTALL_STAGING = YES
 LIBCURL_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols
+LIBCURL_LIBTOOL_PATCH = NO
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBCURL_DEPENDENCIES += openssl
-- 
1.7.1
