From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Nov 2018 11:10:30 +0100
Subject: [Buildroot] [PATCH v2,
 6/6] wireshark: add snappy optional dependency
In-Reply-To: <20181104101030.14402-1-fontaine.fabrice@gmail.com>
References: <20181104101030.14402-1-fontaine.fabrice@gmail.com>
Message-ID: <20181104101030.14402-6-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Optional dependency to snappy has been added with version 2.4.0 and
  https://github.com/wireshark/wireshark/commit/47649d1c7fb6ba48b805e19268a711404eb6908b
- Specify the path to found libssh as this is done for other options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Drop all new dependencies in the first patch of the serie

 package/wireshark/wireshark.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 2466343f67..3632b25646 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -16,7 +16,6 @@ WIRESHARK_CONF_ENV = \
 
 WIRESHARK_CONF_OPTS = \
 	--enable-static=no \
-	--without-snappy \
 	--with-libsmi=no \
 	--with-pcap=$(STAGING_DIR)/usr
 
@@ -135,6 +134,13 @@ else
 WIRESHARK_CONF_OPTS += --with-sbc=no
 endif
 
+ifeq ($(BR2_PACKAGE_SNAPPY),y)
+WIRESHARK_CONF_OPTS += --with-snappy=$(STAGING_DIR)/usr
+WIRESHARK_DEPENDENCIES += snappy
+else
+WIRESHARK_CONF_OPTS += --without-snappy
+endif
+
 define WIRESHARK_REMOVE_DOCS
 	find $(TARGET_DIR)/usr/share/wireshark -name '*.txt' -print0 \
 		-o -name '*.html' -print0 | xargs -0 rm -f
-- 
2.17.1
