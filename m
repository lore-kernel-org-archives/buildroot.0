From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Mar 2019 19:12:48 +0100
Subject: [Buildroot] [PATCH v3,
 1/1] package/keepalived: add optional libnftnl dependency
Message-ID: <20190327181248.24658-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nftables support has been added since version 2.0.11 and
https://github.com/acassen/keepalived/commit/aa12175ea638912a7789e832634d7ccf80fdf48d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Baruch Siach):
 - Drop libmnl dependency as libnftnl already depends on it

Changes v1 -> v2 (after review of Baruch Siach, Thomas Petazzoni and
Arnout Vandecappelle)
 - nftables support depends on libmnl and libnftnl, it does not depend
   on iptables's nftables option or nftables package

 package/keepalived/keepalived.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index fcdb43ce13..15a1b0e9f4 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -46,4 +46,11 @@ else
 KEEPALIVED_CONF_OPTS += --disable-libiptc
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNFTNL),y)
+KEEPALIVED_DEPENDENCIES += libnftnl
+KEEPALIVED_CONF_OPTS += --enable-nftables
+else
+KEEPALIVED_CONF_OPTS += --disable-nftables
+endif
+
 $(eval $(autotools-package))
-- 
2.20.1
