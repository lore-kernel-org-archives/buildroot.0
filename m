From: =?UTF-8?q?DUPONCHEEL=20S=C3=A9bastien?= <sebastien.duponcheel@corp.ovh.com>
Date: Wed, 21 Nov 2018 16:12:38 +0100
Subject: [Buildroot] [PATCH v2 2/2] shadowsocks-libev: add connmarktos build
 option
In-Reply-To: <1542813158-17776-1-git-send-email-sebastien.duponcheel@corp.ovh.com>
References: <1542813158-17776-1-git-send-email-sebastien.duponcheel@corp.ovh.com>
Message-ID: <1542813158-17776-3-git-send-email-sebastien.duponcheel@corp.ovh.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: DUPONCHEEL S?bastien <sebastien.duponcheel@corp.ovh.com>
---
 package/shadowsocks-libev/Config.in            | 10 ++++++++++
 package/shadowsocks-libev/shadowsocks-libev.mk |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
index f58abdb..cfe5634 100644
--- a/package/shadowsocks-libev/Config.in
+++ b/package/shadowsocks-libev/Config.in
@@ -15,6 +15,16 @@ config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 
 	  https://github.com/shadowsocks/shadowsocks-libev
 
+config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
+	bool "conmarktos support in ss-server"
+	depends on BR2_PACKAGE_SHADOWSOCKS_LIBEV
+	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
+	help
+	  Build ss-server with the connmark to TOS feature.
+	  This feature require advanced tc, iptables and conntrac
+	  rules to perform QoS on the server side.
+	  if unsure say N.
+
 comment "shadowsocks-libev needs a toolchain w/ threads"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HAS_SYNC_8 || !BR2_ARCH_IS_64
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index 7e71bbe..616cc3d 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -21,4 +21,12 @@ ifeq ($(BR2_riscv),y)
 SHADOWSOCKS_LIBEV_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_REENTRANT"
 endif
 
+ifeq ($(BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS),y)
+SHADOWSOCKS_LIBEV_DEPENDENCIES += libnetfilter_conntrack
+SHADOWSOCKS_LIBEV_CONF_OPTS += --enable-connmarktos
+# Uncomment when shadowsocks 3.2.2 is released
+#else
+#SHADOWSOCKS_LIBEV_CONF_OPTS += --disable-connmarktos
+endif
+
 $(eval $(autotools-package))
-- 
2.7.4
