From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  3 Oct 2019 18:49:47 +0200
Subject: [Buildroot] [PATCH 1/2] package/uacme: fix build with mbedtls and
 gnutls
Message-ID: <20191003164948.17496-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mbedtls and gnutls can't be enabled at the same time so prefer gnutls
to keep the same default behavior than the configure file

Fixes:
 - http://autobuild.buildroot.org/results/a016b58d755cc0888680b345844f92de467329b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uacme/uacme.mk | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 999cc365e9..03f2621249 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -13,18 +13,12 @@ UACME_LICENSE = GPL-3.0+
 UACME_LICENSE_FILES = COPYING
 UACME_DEPENDENCIES = libcurl
 
-ifeq ($(BR2_PACKAGE_MBEDTLS),y)
-UACME_CONF_OPTS += --with-mbedtls
-UACME_DEPENDENCIES += mbedtls
-else
-UACME_CONF_OPTS += --without-mbedtls
-endif
-
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 UACME_CONF_OPTS += --with-gnutls
 UACME_DEPENDENCIES += gnutls
-else
-UACME_CONF_OPTS += --without-gnutls
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+UACME_CONF_OPTS += --with-mbedtls
+UACME_DEPENDENCIES += mbedtls
 endif
 
 $(eval $(autotools-package))
-- 
2.23.0
