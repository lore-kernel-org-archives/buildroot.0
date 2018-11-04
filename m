From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Nov 2018 11:10:29 +0100
Subject: [Buildroot] [PATCH v2,5/6] wireshark: add lz4 optional dependency
In-Reply-To: <20181104101030.14402-1-fontaine.fabrice@gmail.com>
References: <20181104101030.14402-1-fontaine.fabrice@gmail.com>
Message-ID: <20181104101030.14402-5-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Optional dependency to lz4 has been added with version 2.4.0 and
  https://github.com/wireshark/wireshark/commit/47649d1c7fb6ba48b805e19268a711404eb6908b
- Specify the path to found lz4 as this is done for other options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Drop all new dependencies in the first patch of the serie

 package/wireshark/wireshark.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 04ef9b088d..2466343f67 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -16,7 +16,6 @@ WIRESHARK_CONF_ENV = \
 
 WIRESHARK_CONF_OPTS = \
 	--enable-static=no \
-	--without-lz4 \
 	--without-snappy \
 	--with-libsmi=no \
 	--with-pcap=$(STAGING_DIR)/usr
@@ -115,6 +114,13 @@ else
 WIRESHARK_CONF_OPTS += --without-lua
 endif
 
+ifeq ($(BR2_PACKAGE_LZ4),y)
+WIRESHARK_CONF_OPTS += --with-lz4=$(STAGING_DIR)/usr
+WIRESHARK_DEPENDENCIES += lz4
+else
+WIRESHARK_CONF_OPTS += --without-lz4
+endif
+
 ifeq ($(BR2_PACKAGE_NGHTTP2),y)
 WIRESHARK_CONF_OPTS += --with-nghttp2=$(STAGING_DIR)/usr
 WIRESHARK_DEPENDENCIES += nghttp2
-- 
2.17.1
