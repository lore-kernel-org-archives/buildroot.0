From: =?UTF-8?q?DUPONCHEEL=20S=C3=A9bastien?= <sebastien.duponcheel@corp.ovh.com>
Date: Thu, 15 Nov 2018 17:43:09 +0100
Subject: [Buildroot] [PATCH 1/1] shadowsocks-libev: add connmarktos build
 option
Message-ID: <1542300189-12939-1-git-send-email-sebastien.duponcheel@corp.ovh.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: DUPONCHEEL S?bastien <sebastien.duponcheel@corp.ovh.com>
---
 package/shadowsocks-libev/Config.in            | 7 +++++++
 package/shadowsocks-libev/shadowsocks-libev.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
index f58abdb..acd9a67 100644
--- a/package/shadowsocks-libev/Config.in
+++ b/package/shadowsocks-libev/Config.in
@@ -15,6 +15,13 @@ config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 
 	  https://github.com/shadowsocks/shadowsocks-libev
 
+config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
+	bool "enable connmarktos feature"
+	depends on BR2_PACKAGE_SHADOWSOCKS_LIBEV
+	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
+	help
+	  Build with the connmark to TOS feature
+
 comment "shadowsocks-libev needs a toolchain w/ threads"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HAS_SYNC_8 || !BR2_ARCH_IS_64
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index 7fdcd3f..34d95ca 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -21,4 +21,8 @@ ifeq ($(BR2_riscv),y)
 SHADOWSOCKS_LIBEV_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_REENTRANT"
 endif
 
+ifeq ($(BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS),y)
+SHADOWSOCKS_LIBEV_CONF_OPTS += --enable-connmarktos
+endif
+
 $(eval $(autotools-package))
-- 
2.7.4
