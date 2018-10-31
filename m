From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 31 Oct 2018 23:56:47 +0100
Subject: [Buildroot] [PATCH 2/2] wireshark: add lua optional dependency
In-Reply-To: <20181031225647.23660-1-fontaine.fabrice@gmail.com>
References: <20181031225647.23660-1-fontaine.fabrice@gmail.com>
Message-ID: <20181031225647.23660-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- lua 5.3 or luajit is not supported
- Don't specify the path to found lua as pkgconfig is used for lua
  (this is not the case for the other options)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 4569a86cb1..421338f0f8 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -22,7 +22,6 @@ WIRESHARK_CONF_OPTS = \
 	--without-krb5 \
 	--enable-static=no \
 	--with-libsmi=no \
-	--with-lua=no \
 	--with-pcap=$(STAGING_DIR)/usr \
 	--includedir=$(STAGING_DIR)/usr/include
 
@@ -99,6 +98,14 @@ else
 WIRESHARK_CONF_OPTS += --without-libssh
 endif
 
+# no support for lua53 yet
+ifeq ($(BR2_PACKAGE_LUA_5_1)$(BR2_PACKAGE_LUA_5_2),y)
+WIRESHARK_CONF_OPTS += --with-lua
+WIRESHARK_DEPENDENCIES += lua
+else
+WIRESHARK_CONF_OPTS += --without-lua
+endif
+
 ifeq ($(BR2_PACKAGE_SBC),y)
 WIRESHARK_CONF_OPTS += --with-sbc=yes
 WIRESHARK_DEPENDENCIES += sbc
-- 
2.17.1
