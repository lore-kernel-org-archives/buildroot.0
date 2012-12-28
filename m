From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Dec 2012 21:53:54 +0100
Subject: [Buildroot] [git commit] hostapd: remove gnutls support
Message-ID: <20121228213150.4757B9A4EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=788fcd99e0578e361f192aae4b89b15f1a60faac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

hostapd isn't API compatible with gnutls3 so remove support.
It's probably hardly used since openssl is far more common, and hostapd
can use its internal routines if it's not available.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
