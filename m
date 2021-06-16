From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jun 2021 18:05:06 +0200
Subject: [Buildroot] [PATCH] package/libressl: fix openssldir setting to
 match openssl
Message-ID: <20210616160507.11223-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libressl defaults to $prefix/etc/ssl for its "openssldir" setting, E.G.
the location where configuration files and certificates are searched:

openssl version -d
OPENSSLDIR: "/usr/etc/ssl"

Change it to /etc/ssl so it matches openssl and the expectations of packages
dealing with certificates (ca-certificates, libcurl, p11-kit)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libressl/libressl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index ad345ba3f0..d09df8f40f 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -10,6 +10,7 @@ LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code
 LIBRESSL_LICENSE_FILES = COPYING
 LIBRESSL_CPE_ID_VENDOR = openbsd
 LIBRESSL_INSTALL_STAGING = YES
+LIBRESSL_CONF_OPTS = -DOPENSSLDIR="/etc/ssl"
 
 ifeq ($(BR2_PACKAGE_LIBRESSL_BIN),)
 define LIBRESSL_REMOVE_BIN
-- 
2.20.1
