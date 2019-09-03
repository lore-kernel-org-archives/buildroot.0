From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:38 -0000
Subject: [Buildroot] [git commit] package/gauche: add optional mbedtls
 dependency
Message-ID: <20190903133621.43A4B8A5E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4035aca23937800de53b74e05c8a34ae85576703
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mbedtls support has been added in version 0.9.6 with
https://github.com/shirok/Gauche/commit/d449f013fae79639bb300d783962328c6b6b1bd0

So enable it if mbedtls is enabled and always enable embedded axTLS
support to keep existing behavior

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gauche/gauche.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index 1f66e28de7..2a30a2b39a 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -16,6 +16,16 @@ GAUCHE_AUTORECONF = YES
 HOST_GAUCHE_CONF_OPTS = --without-zlib
 GAUCHE_CONF_OPTS = --without-libatomic-ops
 
+# Enable embedded axTLS
+GAUCHE_TLS_LIBS = axtls
+
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+GAUCHE_TLS_LIBS += mbedtls
+GAUCHE_DEPENDENCIES += mbedtls
+endif
+
+GAUCHE_CONF_OPTS += --with-tls="$(GAUCHE_TLS_LIBS)"
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GAUCHE_CONF_OPTS += --with-zlib=$(STAGING_DIR)
 GAUCHE_DEPENDENCIES += zlib
