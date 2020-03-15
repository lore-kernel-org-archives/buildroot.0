From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2020 15:57:23 +0100
Subject: [Buildroot] [git commit] package/libcurl: add bearssl support
Message-ID: <20200315144452.6D0B688079@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=984b91447a466b83d400fc3d1c443bc5ae2e2666
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bearssl support is available since version 7.68.0 and
https://github.com/curl/curl/commit/9b879160df01e7ddbb4770904391d3b74114302b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcurl/Config.in  | 4 ++++
 package/libcurl/libcurl.mk | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index d05cbedf77..b89c46f5ef 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -52,6 +52,10 @@ config BR2_PACKAGE_LIBCURL_OPENSSL
 	bool "OpenSSL"
 	depends on BR2_PACKAGE_OPENSSL
 
+config BR2_PACKAGE_LIBCURL_BEARSSL
+	bool "BearSSL"
+	depends on BR2_PACKAGE_BEARSSL
+
 config BR2_PACKAGE_LIBCURL_GNUTLS
 	bool "GnuTLS"
 	depends on BR2_PACKAGE_GNUTLS
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 16b11ca944..5de2591178 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -51,6 +51,13 @@ else
 LIBCURL_CONF_OPTS += --without-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL_BEARSSL),y)
+LIBCURL_CONF_OPTS += --with-bearssl=$(STAGING_DIR)/usr
+LIBCURL_DEPENDENCIES += bearssl
+else
+LIBCURL_CONF_OPTS += --without-bearssl
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL_GNUTLS),y)
 LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr \
 	--with-ca-fallback
