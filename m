From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 14:10:56 +0200
Subject: [Buildroot] [git commit] package/pkcs11-helper: fix build without
 threads
Message-ID: <20200501115559.11E6A90C6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0199dc161769e5f28e9aebc634230ece08ff5008
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use --{en,dis}able-{threading,slotevent} to fix build without threads

Fixes:
 - http://autobuild.buildroot.org/results/d6eefca3ab1fb86e148e998238eed1df2310775f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: move earlier; use single-line assignments]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkcs11-helper/pkcs11-helper.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
index a95340daf7..a651be98bb 100644
--- a/package/pkcs11-helper/pkcs11-helper.mk
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -16,6 +16,12 @@ PKCS11_HELPER_CONF_OPTS = \
 	--disable-crypto-engine-polarssl \
 	--disable-crypto-engine-cryptoapi
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+PKCS11_HELPER_CONF_OPTS += --enable-slotevent --enable-threading
+else
+PKCS11_HELPER_CONF_OPTS += --disable-slotevent --disable-threading
+endif
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 PKCS11_HELPER_DEPENDENCIES += gnutls
 PKCS11_HELPER_CONF_OPTS += --enable-crypto-engine-gnutls
