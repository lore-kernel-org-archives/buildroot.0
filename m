From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 13 Apr 2019 10:57:41 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/netsnmp: fix static build with openssl
Message-ID: <20190413085741.11342-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pkg-config to find openssl dependencies such as lz or latomic

Fixes:
 - http://autobuild.buildroot.org/results/8f6fdbf8a21967363b737bc771252bcded4278a9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Drop patch and use pkg-config

 package/netsnmp/netsnmp.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 4bd65ef17a..ed573c51e3 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -53,15 +53,12 @@ endif
 
 # OpenSSL
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-NETSNMP_DEPENDENCIES += openssl
+NETSNMP_DEPENDENCIES += host-pkgconf openssl
 NETSNMP_CONF_OPTS += \
 	--with-openssl=$(STAGING_DIR)/usr/include/openssl \
 	--with-security-modules="tsm,usm" \
 	--with-transports="DTLSUDP,TLSTCP"
-ifeq ($(BR2_STATIC_LIBS),y)
-# openssl uses zlib, so we need to explicitly link with it when static
-NETSNMP_CONF_ENV += LIBS=-lz
-endif
+NETSNMP_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 else ifeq ($(BR2_PACKAGE_NETSNMP_OPENSSL_INTERNAL),y)
 NETSNMP_CONF_OPTS += --with-openssl=internal
 else
-- 
2.20.1
