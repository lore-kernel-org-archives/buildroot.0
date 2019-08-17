From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Aug 2019 15:37:47 +0200
Subject: [Buildroot] [git commit] package/gnutls: make the OpenSSL
 compatibility library optional
Message-ID: <20190817133529.BD90081604@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4c12d6bcdfc2813dfac3d207d980e0497d33f5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a BR2_PACKAGE_GNUTLS_OPENSSL option, disabled by default since it is
not used by any package that depends on gnutls.

The library is licensed under GPLv3, which can be a problem for embedded
systems due to the so-called anti-tivoization clause.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
[Thomas: don't repeat the license details for the gnutls-openssl case,
simply append to them]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnutls/Config.in |  5 +++++
 package/gnutls/gnutls.mk | 11 +++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

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
index 4f40b896ff..700737050d 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -8,8 +8,14 @@ GNUTLS_VERSION_MAJOR = 3.6
 GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).8
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
-GNUTLS_LICENSE = LGPL-2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
-GNUTLS_LICENSE_FILES = doc/COPYING doc/COPYING.LESSER
+GNUTLS_LICENSE = LGPL-2.1+ (core library)
+GNUTLS_LICENSE_FILES = doc/COPYING.LESSER
+
+ifeq ($(BR2_PACKAGE_GNUTLS_OPENSSL),y)
+GNUTLS_LICENSE := $(GNUTLS_LICENSE), GPL-3.0+ (gnutls-openssl library)
+GNUTLS_LICENSE_FILES += doc/COPYING
+endif
+
 GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle pcre
 GNUTLS_CONF_OPTS = \
 	--disable-doc \
@@ -20,6 +26,7 @@ GNUTLS_CONF_OPTS = \
 	--enable-openssl-compatibility \
 	--with-librt-prefix=$(STAGING_DIR) \
 	--without-tpm \
+	$(if $(BR2_PACKAGE_GNUTLS_OPENSSL),--enable,--disable)-openssl-compatibility \
 	$(if $(BR2_PACKAGE_GNUTLS_TOOLS),--enable-tools,--disable-tools)
 GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	ac_cv_header_wchar_h=$(if $(BR2_USE_WCHAR),yes,no) \
