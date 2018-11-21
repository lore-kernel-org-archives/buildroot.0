From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Nov 2018 22:29:15 +0100
Subject: [Buildroot] [git commit] shadowsocks-libev: add connmarktos build
 option
Message-ID: <20181202071557.17FA48843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73962d34498f8570a465a8fe5771c05daa4414d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: DUPONCHEEL S??bastien <sebastien.duponcheel@corp.ovh.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shadowsocks-libev/Config.in            | 12 ++++++++++++
 package/shadowsocks-libev/shadowsocks-libev.mk |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
index f58abdbcb1..5ad79ad9cf 100644
--- a/package/shadowsocks-libev/Config.in
+++ b/package/shadowsocks-libev/Config.in
@@ -15,6 +15,18 @@ config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 
 	  https://github.com/shadowsocks/shadowsocks-libev
 
+config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
+	bool "conmarktos support in ss-server"
+	depends on BR2_PACKAGE_SHADOWSOCKS_LIBEV
+	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
+	help
+	  Build ss-server with the connmark to TOS feature.
+
+	  This feature requires advanced tc, iptables and conntrack
+	  rules to perform QoS on the server side.
+
+	  If unsure, don't enable this option
+
 comment "shadowsocks-libev needs a toolchain w/ threads"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HAS_SYNC_8 || !BR2_ARCH_IS_64
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index 2280a45a9c..368cb24a9a 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -14,4 +14,10 @@ SHADOWSOCKS_LIBEV_CONF_OPTS = \
 	--with-pcre=$(STAGING_DIR)/usr \
 	--disable-ssp
 
+# --disable option was broken in 3.2.1, it will be fixed in 3.2.2
+ifeq ($(BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS),y)
+SHADOWSOCKS_LIBEV_DEPENDENCIES += libnetfilter_conntrack
+SHADOWSOCKS_LIBEV_CONF_OPTS += --enable-connmarktos
+endif
+
 $(eval $(autotools-package))
