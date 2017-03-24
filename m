From: Jeroen Roovers <jer@airfi.aero>
Date: Fri, 24 Mar 2017 08:12:03 +0100
Subject: [Buildroot] [PATCH] openvpn: Add explicit support for external lz4
Message-ID: <20170324071203.32449-1-jer@airfi.aero>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2.4.0 added lz4 support. Make that choice explicit or the bundled compat-lz4
"stub" will be used.

Signed-off-by: Jeroen Roovers <jer@airfi.aero>
---
 package/openvpn/Config.in  | 7 +++++++
 package/openvpn/openvpn.mk | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 5fa191d97..0a1675573 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -14,6 +14,13 @@ config BR2_PACKAGE_OPENVPN
 
 if BR2_PACKAGE_OPENVPN
 
+config BR2_PACKAGE_OPENVPN_LZ4
+	bool "LZ4 compression"
+	default y
+	select BR2_PACKAGE_LZ4
+	help
+	  Enable LZ4 compression.
+
 config BR2_PACKAGE_OPENVPN_LZO
 	bool "LZO compression"
 	default y
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 5e3df59f3..e152eb39a 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -36,6 +36,12 @@ else
 OPENVPN_CONF_ENV += IPROUTE=/sbin/ip
 endif
 
+ifeq ($(BR2_PACKAGE_OPENVPN_LZ4),y)
+OPENVPN_DEPENDENCIES += lz4
+else
+OPENVPN_CONF_OPTS += --disable-lz4
+endif
+
 ifeq ($(BR2_PACKAGE_OPENVPN_LZO),y)
 OPENVPN_DEPENDENCIES += lzo
 else
-- 
2.12.1
