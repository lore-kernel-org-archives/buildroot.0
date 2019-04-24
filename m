From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:00:24 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/netsnmp: fix
 static build with openssl
Message-ID: <20190424195555.62F4A802A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7da7760f80a9a95f8ea07863185f59ddae54c35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Use pkg-config to find openssl dependencies such as lz or latomic

Fixes:
 - http://autobuild.buildroot.org/results/8f6fdbf8a21967363b737bc771252bcded4278a9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit db430c67a263e5986d08bca520ba210a9a71c4c5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
