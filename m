From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Nov 2018 11:10:27 +0100
Subject: [Buildroot] [PATCH v2,
 3/6] wireshark: add nghttp2 optional dependency
In-Reply-To: <20181104101030.14402-1-fontaine.fabrice@gmail.com>
References: <20181104101030.14402-1-fontaine.fabrice@gmail.com>
Message-ID: <20181104101030.14402-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Embedded nghttp2 code has been removed and an optional dependency to
  nghttp2 has been added with version 2.4.0 and
  https://github.com/wireshark/wireshark/commit/b1cc056b12702435f6ebdc6ba0a8e17a41e159a0
- Specify the path to found nghttp2 as this is done for other options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Drop all new dependencies in the first patch of the serie

 package/wireshark/wireshark.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 330ce59580..27de024bbe 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -18,7 +18,6 @@ WIRESHARK_CONF_OPTS = \
 	--enable-static=no \
 	--without-bcg729 \
 	--without-lz4 \
-	--without-nghttp2 \
 	--without-snappy \
 	--with-libsmi=no \
 	--with-pcap=$(STAGING_DIR)/usr
@@ -110,6 +109,13 @@ else
 WIRESHARK_CONF_OPTS += --without-lua
 endif
 
+ifeq ($(BR2_PACKAGE_NGHTTP2),y)
+WIRESHARK_CONF_OPTS += --with-nghttp2=$(STAGING_DIR)/usr
+WIRESHARK_DEPENDENCIES += nghttp2
+else
+WIRESHARK_CONF_OPTS += --without-nghttp2
+endif
+
 ifeq ($(BR2_PACKAGE_SBC),y)
 WIRESHARK_CONF_OPTS += --with-sbc=yes
 WIRESHARK_DEPENDENCIES += sbc
-- 
2.17.1
