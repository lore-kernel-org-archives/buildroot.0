From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 7 Nov 2018 00:21:36 +0100
Subject: [Buildroot] [git commit] wireshark: add snappy optional dependency
Message-ID: <20181106235706.E0C9281540@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cd1baf25be8688e829897430e256d3ec243be54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Optional dependency to snappy has been added with version 2.4.0 and
  https://github.com/wireshark/wireshark/commit/47649d1c7fb6ba48b805e19268a711404eb6908b
- Specify the path to found libssh as this is done for other options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wireshark/wireshark.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index f42dca1c86..2e41c3d652 100644
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
