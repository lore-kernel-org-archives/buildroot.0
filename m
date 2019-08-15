From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 15 Aug 2019 19:19:33 -0300
Subject: [Buildroot] [PATCH] package/gnutls: make the OpenSSL compatibility
 library optional
Message-ID: <20190815221933.18645-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Add a BR2_PACKAGE_GNUTLS_OPENSSL option, disabled by default since it is
not used by any package that depends on gnutls.

The library is licensed under GPLv3, which can be a problem for embedded
systems due to the so-called anti-tivoization clause.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
Tested building all packages that depend on gnutls.
---
 package/gnutls/Config.in | 5 +++++
 package/gnutls/gnutls.mk | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 7e8dcc1e4f..15b930b6bd 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -16,6 +16,11 @@ config BR2_PACKAGE_GNUTLS
 
 if BR2_PACKAGE_GNUTLS
 
+config BR2_PACKAGE_GNUTLS_OPENSSL
+	bool "OpenSSL compatibility library"
+	help
+	  Install OpenSSL compatibility library.
+
 config BR2_PACKAGE_GNUTLS_TOOLS
 	bool "install tools"
 	select BR2_PACKAGE_ARGP_STANDALONE \
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 4f40b896ff..f3f430ead0 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -8,8 +8,13 @@ GNUTLS_VERSION_MAJOR = 3.6
 GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).8
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
+ifeq ($(BR2_PACKAGE_GNUTLS_OPENSSL),y)
 GNUTLS_LICENSE = LGPL-2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
-GNUTLS_LICENSE_FILES = doc/COPYING doc/COPYING.LESSER
+GNUTLS_LICENSE_FILES = doc/COPYING.LESSER doc/COPYING
+else
+GNUTLS_LICENSE = LGPL-2.1+ (core library)
+GNUTLS_LICENSE_FILES = doc/COPYING.LESSER
+endif
 GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle pcre
 GNUTLS_CONF_OPTS = \
 	--disable-doc \
@@ -20,6 +25,7 @@ GNUTLS_CONF_OPTS = \
 	--enable-openssl-compatibility \
 	--with-librt-prefix=$(STAGING_DIR) \
 	--without-tpm \
+	$(if $(BR2_PACKAGE_GNUTLS_OPENSSL),--enable,--disable)-openssl-compatibility \
 	$(if $(BR2_PACKAGE_GNUTLS_TOOLS),--enable-tools,--disable-tools)
 GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	ac_cv_header_wchar_h=$(if $(BR2_USE_WCHAR),yes,no) \
-- 
2.18.1
