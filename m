From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 7 Nov 2018 00:13:34 +0100
Subject: [Buildroot] [git commit] wireshark: add nghttp2 optional dependency
Message-ID: <20181106235706.CBE5B81542@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c859af7c83f9a9e8d88bfd6ee5a3c39203696298
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Embedded nghttp2 code has been removed and an optional dependency to
  nghttp2 has been added with version 2.4.0 and
  https://github.com/wireshark/wireshark/commit/b1cc056b12702435f6ebdc6ba0a8e17a41e159a0
- Specify the path to found nghttp2 as this is done for other options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wireshark/wireshark.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index a141ca3e2a..39a3060149 100644
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
