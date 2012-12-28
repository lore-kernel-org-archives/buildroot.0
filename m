From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Dec 2012 16:47:18 -0300
Subject: [Buildroot] [PATCH 2/7] hostapd: remove gnutls support
In-Reply-To: <1356724043-8879-1-git-send-email-gustavo@zacarias.com.ar>
References: <1356724043-8879-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1356724043-8879-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hostapd isn't API compatible with gnutls3 so remove support.
It's probably hardly used since openssl is far more common, and hostapd
can use its internal routines if it's not available.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hostapd/hostapd.mk |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 45a93fc..b18881a 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -27,7 +27,7 @@ define HOSTAPD_LIBTOMMATH_CONFIG
 	$(SED) 's/\(#\)\(CONFIG_INTERNAL_LIBTOMMATH.*\)/\2/' $(HOSTAPD_CONFIG)
 endef
 
-# Try to use openssl or gnutls if it's already available
+# Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	HOSTAPD_DEPENDENCIES += openssl
 define HOSTAPD_TLS_CONFIG
@@ -35,17 +35,10 @@ define HOSTAPD_TLS_CONFIG
 	$(SED) 's/\(#\)\(CONFIG_EAP_PWD.*\)/\2/' $(HOSTAPD_CONFIG)
 endef
 else
-ifeq ($(BR2_PACKAGE_GNUTLS),y)
-	HOSTAPD_DEPENDENCIES += gnutls
-define HOSTAPD_TLS_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_TLS=\).*/\2gnutls/' $(HOSTAPD_CONFIG)
-endef
-else
 define HOSTAPD_TLS_CONFIG
 	$(SED) 's/\(#\)\(CONFIG_TLS=\).*/\2internal/' $(HOSTAPD_CONFIG)
 endef
 endif
-endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_EAP),y)
 define HOSTAPD_EAP_CONFIG
-- 
1.7.8.6
