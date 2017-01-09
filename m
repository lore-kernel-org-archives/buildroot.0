From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jan 2017 16:39:50 +0100
Subject: [Buildroot] [git commit] gnutls: security bump to version 3.5.8
Message-ID: <20170109155019.110DB81D71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b347c4acd15afd1368c2d1d24ca73557cb43ceb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 3.5.x has been promoted to stable, hence 3.4.x is deprecated and
3.3.x kept as old-stable.

libdane now specifies LGPLv2.1+ so drop the README kludge (which is also
gone regarding licensing).

libunistring is a new dependency, even though gnutls ships a builtin version
we prefer to use unbundled to avoid duplication with other users and target
size growth.

Fixes:

GNUTLS-SA-2017-01 - It was found using the OSS-FUZZ fuzzer
infrastructure that decoding a specially crafted X.509 certificate with
Proxy Certificate Information extension present could lead to a double
free.
GNUTLS-SA-2017-02 - It was found using the OSS-FUZZ fuzzer
infrastructure that decoding a specially crafted OpenPGP certificate
could lead to heap and stack overflows.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/Config.in   |  1 +
 package/gnutls/gnutls.hash |  2 +-
 package/gnutls/gnutls.mk   | 13 +++++--------
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 998e213..cfb7cb3 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
 	select BR2_PACKAGE_LIBTASN1
+	select BR2_PACKAGE_LIBUNISTRING
 	select BR2_PACKAGE_NETTLE
 	select BR2_PACKAGE_PCRE
 	depends on BR2_USE_WCHAR
diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 897562b..121f75a 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	9b50e8a670d5e950425d96935c7ddd415eb6f8079615a36df425f09a3143172e	gnutls-3.4.17.tar.xz
+sha256	0e97f243ae72b70307d684b84c7fe679385aa7a7a0e37e5be810193dcc17d4ff	gnutls-3.5.8.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index af7621c..4fab812 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,17 +4,13 @@
 #
 ################################################################################
 
-GNUTLS_VERSION_MAJOR = 3.4
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).17
+GNUTLS_VERSION_MAJOR = 3.5
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).8
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
-# README says that the core library is under LGPLv2.1+, but a few
-# files in libdane specify LGPLv3+. It seems to be a mistake, and we
-# therefore trust the README file here. A bug was reported upstream at
-# https://gitlab.com/gnutls/gnutls/issues/109.
 GNUTLS_LICENSE = LGPLv2.1+ (core library), GPLv3+ (gnutls-openssl library)
-GNUTLS_LICENSE_FILES = COPYING COPYING.LESSER README
-GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle pcre
+GNUTLS_LICENSE_FILES = doc/COPYING doc/COPYING.LESSER
+GNUTLS_DEPENDENCIES = host-pkgconf libunistring libtasn1 nettle pcre
 GNUTLS_CONF_OPTS = \
 	--disable-doc \
 	--disable-guile \
@@ -23,6 +19,7 @@ GNUTLS_CONF_OPTS = \
 	--enable-local-libopts \
 	--enable-openssl-compatibility \
 	--with-libnettle-prefix=$(STAGING_DIR)/usr \
+	--with-libunistring-prefix=$(STAGING_DIR)/usr \
 	--with-librt-prefix=$(STAGING_DIR) \
 	--without-tpm \
 	$(if $(BR2_PACKAGE_GNUTLS_TOOLS),--enable-tools,--disable-tools)
