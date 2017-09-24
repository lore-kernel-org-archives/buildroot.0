From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 12:56:12 +0200
Subject: [Buildroot] [git commit] shairport-sync: fix static link with
	mbedtls
Message-ID: <20170924111225.783FB7FEE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5ee77409ea06d084a8a57e3c2961c85af949113
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mbedtls provided libraries are interdependent. libmbedtls depends on
libmbedx509. Both depend on libmbedcrypto. When compression is enabled
libz is also needed.

Fixes:
http://autobuild.buildroot.net/results/79d/79d9aff5edb6a767c38efb54256a4f20fc36a6ee/

Cc: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/shairport-sync/shairport-sync.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 2dce4cd..01c1370 100644
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
