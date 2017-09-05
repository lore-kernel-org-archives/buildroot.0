From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  5 Sep 2017 22:05:25 +0300
Subject: [Buildroot] [PATCH 1/2] shairport-sync: fix static link with mbedtls
Message-ID: <87aa32f0dbacc3252ade43fc605e7f2c310e6465.1504638326.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mbedtls provided libraries are interdependent. libmbedtls depends on
libmbedx509. Both depend on libmbedcrypto. When compression is enabled
libz is also needed.

Fixes:
http://autobuild.buildroot.net/results/79d/79d9aff5edb6a767c38efb54256a4f20fc36a6ee/

Cc: J?rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/shairport-sync/shairport-sync.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 208a9b3b1e33..75e1ae85e3d2 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -19,6 +19,8 @@ SHAIRPORT_SYNC_CONF_OPTS = --with-alsa \
 	--with-pipe \
 	--with-stdout
 
+SHAIRPORT_SYNC_CONF_ENV += LIBS="$(SHAIRPORT_SYNC_CONF_LIBS)"
+
 # Avahi or tinysvcmdns (shaiport-sync bundles its own version of tinysvcmdns).
 # Avahi support needs libavahi-client, which is built by avahi if avahi-daemon
 # and dbus is selected. Since there is no BR2_PACKAGE_LIBAVAHI_CLIENT config
@@ -38,6 +40,10 @@ SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=openssl
 else
 SHAIRPORT_SYNC_DEPENDENCIES += mbedtls
 SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=mbedtls
+SHAIRPORT_SYNC_CONF_LIBS += -lmbedx509 -lmbedcrypto
+ifeq ($(BR2_PACKAGE_MBEDTLS_COMPRESSION),y)
+SHAIRPORT_SYNC_CONF_LIBS += -lz
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR),y)
-- 
2.14.1
