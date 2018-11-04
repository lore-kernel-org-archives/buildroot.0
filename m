From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Nov 2018 11:10:28 +0100
Subject: [Buildroot] [PATCH v2,
 4/6] wireshark: add bcg729 optional dependency
In-Reply-To: <20181104101030.14402-1-fontaine.fabrice@gmail.com>
References: <20181104101030.14402-1-fontaine.fabrice@gmail.com>
Message-ID: <20181104101030.14402-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Optional dependency to bcg729 has been added with version 2.5.0 and
  https://github.com/wireshark/wireshark/commit/3e54cabf8193e6a8cd607b1671defb8b6800b53d
- Specify the path to found bcg729 as this is done for other options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Drop all new dependencies in the first patch of the serie

 package/wireshark/wireshark.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 27de024bbe..04ef9b088d 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -16,7 +16,6 @@ WIRESHARK_CONF_ENV = \
 
 WIRESHARK_CONF_OPTS = \
 	--enable-static=no \
-	--without-bcg729 \
 	--without-lz4 \
 	--without-snappy \
 	--with-libsmi=no \
@@ -52,6 +51,13 @@ ifeq ($(BR2_PACKAGE_WIRESHARK_GUI),)
 WIRESHARK_CONF_OPTS += --disable-wireshark
 endif
 
+ifeq ($(BR2_PACKAGE_BCG729),y)
+WIRESHARK_CONF_OPTS += --with-bcg729=$(STAGING_DIR)/usr
+WIRESHARK_DEPENDENCIES += bcg729
+else
+WIRESHARK_CONF_OPTS += --without-bcg729
+endif
+
 ifeq ($(BR2_PACKAGE_C_ARES),y)
 WIRESHARK_CONF_OPTS += --with-c-ares=$(STAGING_DIR)/usr
 WIRESHARK_DEPENDENCIES += c-ares
-- 
2.17.1
