From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  3 Oct 2019 18:49:48 +0200
Subject: [Buildroot] [PATCH 2/2] package/uacme: add openssl optional
 dependency
In-Reply-To: <20191003164948.17496-1-fontaine.fabrice@gmail.com>
References: <20191003164948.17496-1-fontaine.fabrice@gmail.com>
Message-ID: <20191003164948.17496-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select openssl if mbedtls or gnutls are not enabled

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uacme/Config.in | 2 +-
 package/uacme/uacme.mk  | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index 96247f9c94..ac59764e1a 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_UACME
 	bool "uacme"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_MBEDTLS if !BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
 	select BR2_PACKAGE_LIBCURL
 	help
 	  uacme is a client for the ACMEv2 protocol described in
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 03f2621249..2060ca0e7f 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -19,6 +19,9 @@ UACME_DEPENDENCIES += gnutls
 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 UACME_CONF_OPTS += --with-mbedtls
 UACME_DEPENDENCIES += mbedtls
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+UACME_CONF_OPTS += --with-openssl
+UACME_DEPENDENCIES += openssl
 endif
 
 $(eval $(autotools-package))
-- 
2.23.0
