From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  1 May 2020 12:27:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkcs11-helper: fix build without
 threads
Message-ID: <20200501102758.2136958-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use --{en,dis}able-{threading,slotevent} to fix build without threads

Fixes:
 - http://autobuild.buildroot.org/results/d6eefca3ab1fb86e148e998238eed1df2310775f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pkcs11-helper/pkcs11-helper.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
index a95340daf7..4d0974dd0f 100644
--- a/package/pkcs11-helper/pkcs11-helper.mk
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -48,4 +48,14 @@ PKCS11_HELPER_CONF_OPTS += \
 	--disable-crypto-engine-openssl
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+PKCS11_HELPER_CONF_OPTS += \
+	--enable-slotevent \
+	--enable-threading
+else
+PKCS11_HELPER_CONF_OPTS += \
+	--disable-slotevent \
+	--disable-threading
+endif
+
 $(eval $(autotools-package))
-- 
2.26.2
