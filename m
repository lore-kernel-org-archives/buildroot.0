From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Aug 2018 23:26:55 +0200
Subject: [Buildroot] [git commit branch/next] package/squid: bump version to
 4.2
Message-ID: <20180819212054.B4DA38D6E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=edbc6042677c59d42a1774016d48bad429dfe11f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Added dependency for libxml2:
http://www.squid-cache.org/Versions/v4/RELEASENOTES.html#ss2.9

Rebased patch 0001, removed patches 0002 & 0003 after being applied
upstream. Added sha256 hash for tarball.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/squid/0001-assume-get-certificate-ok.patch | 18 ++++++-----
 ...e-sure-endofName-never-exceeds-tagEnd-130.patch | 35 ----------------------
 ...t-IP-logging-for-transactions-without-a-c.patch | 31 -------------------
 package/squid/Config.in                            |  1 +
 package/squid/squid.hash                           |  9 +++---
 package/squid/squid.mk                             |  8 ++---
 6 files changed, 21 insertions(+), 81 deletions(-)

diff --git a/package/squid/0001-assume-get-certificate-ok.patch b/package/squid/0001-assume-get-certificate-ok.patch
index e26b50d7bb..d3c075a59a 100644
--- a/package/squid/0001-assume-get-certificate-ok.patch
+++ b/package/squid/0001-assume-get-certificate-ok.patch
@@ -2,16 +2,20 @@ The openssl get_certificate working test isn't cross compile friendly.
 Just assume it works ok since we're using a modern OpenSSL version.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Bernd: Rebased for 4.2]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
 diff -Nura squid-3.5.1.orig/configure.ac squid-3.5.1/configure.ac
 --- squid-3.5.1.orig/configure.ac	2015-01-27 11:09:15.035711981 -0300
 +++ squid-3.5.1/configure.ac	2015-01-27 11:09:25.829084482 -0300
-@@ -1342,7 +1342,7 @@
-     AC_DEFINE(USE_OPENSSL,1,[OpenSSL support is available])
+@@ -1377,10 +1377,6 @@
+       ])
+     SQUID_STATE_ROLLBACK(check_SSL_CTX_get0_certificate)
  
-     # check for other specific broken implementations
--    SQUID_CHECK_OPENSSL_GETCERTIFICATE_WORKS
-+    #SQUID_CHECK_OPENSSL_GETCERTIFICATE_WORKS
+-    # check for other specific broken implementations
+-    if test "x$missing_SSL_CTX_get0_certificate" = "xyes"; then
+-      SQUID_CHECK_OPENSSL_GETCERTIFICATE_WORKS
+-    fi
      SQUID_CHECK_OPENSSL_CONST_SSL_METHOD
-     SQUID_CHECK_OPENSSL_TXTDB
-     SQUID_CHECK_OPENSSL_HELLO_OVERWRITE_HACK
+     SQUID_CHECK_OPENSSL_CONST_CRYPTO_EX_DATA
+     SQUID_CHECK_OPENSSL_CONST_SSL_SESSION_CB_ARG
diff --git a/package/squid/0003-ESI-make-sure-endofName-never-exceeds-tagEnd-130.patch b/package/squid/0003-ESI-make-sure-endofName-never-exceeds-tagEnd-130.patch
deleted file mode 100644
index 6e71677a19..0000000000
--- a/package/squid/0003-ESI-make-sure-endofName-never-exceeds-tagEnd-130.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From eb2db98a676321b814fc4a51c4fb7928a8bb45d9 Mon Sep 17 00:00:00 2001
-From: Amos Jeffries <yadij@users.noreply.github.com>
-Date: Fri, 19 Jan 2018 13:54:14 +1300
-Subject: [PATCH] ESI: make sure endofName never exceeds tagEnd (#130)
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/esi/CustomParser.cc | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/esi/CustomParser.cc b/src/esi/CustomParser.cc
-index d86d2d309..db634d921 100644
---- a/src/esi/CustomParser.cc
-+++ b/src/esi/CustomParser.cc
-@@ -121,7 +121,7 @@ ESICustomParser::parse(char const *dataToParse, size_t const lengthOfData, bool
- 
-             char * endofName = strpbrk(const_cast<char *>(tag), w_space);
- 
--            if (endofName > tagEnd)
-+            if (!endofName || endofName > tagEnd)
-                 endofName = const_cast<char *>(tagEnd);
- 
-             *endofName = '\0';
-@@ -214,7 +214,7 @@ ESICustomParser::parse(char const *dataToParse, size_t const lengthOfData, bool
- 
-             char * endofName = strpbrk(const_cast<char *>(tag), w_space);
- 
--            if (endofName > tagEnd)
-+            if (!endofName || endofName > tagEnd)
-                 endofName = const_cast<char *>(tagEnd);
- 
-             *endofName = '\0';
--- 
-2.11.0
-
diff --git a/package/squid/0004-Fix-indirect-IP-logging-for-transactions-without-a-c.patch b/package/squid/0004-Fix-indirect-IP-logging-for-transactions-without-a-c.patch
deleted file mode 100644
index 51fff30034..0000000000
--- a/package/squid/0004-Fix-indirect-IP-logging-for-transactions-without-a-c.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8232b83d3fa47a1399f155cb829db829369fbae9 Mon Sep 17 00:00:00 2001
-From: squidadm <squidadm@users.noreply.github.com>
-Date: Sun, 21 Jan 2018 08:07:08 +1300
-Subject: [PATCH] Fix indirect IP logging for transactions without a client
- connection (#129) (#136)
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/client_side_request.cc | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/client_side_request.cc b/src/client_side_request.cc
-index be124f355..203f89d46 100644
---- a/src/client_side_request.cc
-+++ b/src/client_side_request.cc
-@@ -488,9 +488,9 @@ clientFollowXForwardedForCheck(allow_t answer, void *data)
-         * Ensure that the access log shows the indirect client
-         * instead of the direct client.
-         */
--        ConnStateData *conn = http->getConn();
--        conn->log_addr = request->indirect_client_addr;
--        http->al->cache.caddr = conn->log_addr;
-+        http->al->cache.caddr = request->indirect_client_addr;
-+        if (ConnStateData *conn = http->getConn())
-+            conn->log_addr = request->indirect_client_addr;
-     }
-     request->x_forwarded_for_iterator.clean();
-     request->flags.done_follow_x_forwarded_for = true;
--- 
-2.11.0
-
diff --git a/package/squid/Config.in b/package/squid/Config.in
index 141a5029d2..c1eb25c6b9 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_SQUID
 	# needs fork()
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBXML2
 	help
 	  Caching proxy for the Web supporting HTTP, HTTPS, FTP, and
 	  more.
diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 8787cb25ef..47c7e1bb21 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,5 +1,6 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.27.tar.xz.asc
-md5 39ef8199675d48a314b540f92c00c545 squid-3.5.27.tar.xz
-sha1 1e69c96d13cd49844da3bcf33a0b428fbe7b6f77 squid-3.5.27.tar.xz
+# From http://www.squid-cache.org/Versions/v4/squid-4.2.tar.xz.asc
+md5 2cf3f5f183d04322d798f98ea5ead43f squid-4.2.tar.xz
+sha1 77fd6f06e6028780faf85ba7e7e9aef0922e9dc0 squid-4.2.tar.xz
 # Locally calculated
-sha256 58f5d05257af1fb964fde20e134d660fac9afa86b6fd8c70d63ead63068378fa COPYING
+sha256 994807762c59991b32449caf29418fd0ec9d2329746b18eb19bd930b6806d208 squid-4.2.tar.xz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 2d21ad8858..6675cab790 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,15 +4,14 @@
 #
 ################################################################################
 
-SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).27
+SQUID_VERSION = 4.2
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
-SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
+SQUID_SITE = http://www.squid-cache.org/Versions/v4
 SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
 # For 0001-assume-get-certificate-ok.patch
 SQUID_AUTORECONF = YES
-SQUID_DEPENDENCIES = libcap host-libcap host-pkgconf \
+SQUID_DEPENDENCIES = libcap host-libcap libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
 	ac_cv_epoll_works=yes \
@@ -21,6 +20,7 @@ SQUID_CONF_ENV = \
 	ac_cv_func___va_copy=yes \
 	ac_cv_func_strnstr=no \
 	ac_cv_have_squid=yes \
+	ac_cv_libxml2_include="-I$(STAGING_DIR)/usr/include/libxml2" \
 	BUILDCXX="$(HOSTCXX)" \
 	BUILDCXXFLAGS="$(HOST_CXXFLAGS)"
 SQUID_CONF_OPTS = \
