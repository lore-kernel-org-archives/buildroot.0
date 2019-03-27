From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Mar 2019 18:45:42 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/keepalived: add optional nftables dependency
Message-ID: <20190327174542.22224-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nftables support has been added since version 2.0.11 and
https://github.com/acassen/keepalived/commit/aa12175ea638912a7789e832634d7ccf80fdf48d

It depends on libmnl and libnftnl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Baruch Siach, Thomas Petazzoni and
Arnout Vandecappelle)
 - nftables support depends on libmnl and libnftnl, it does not depend
   on iptables's nftables option or nftables package

 package/keepalived/keepalived.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index fcdb43ce13..4790cf5689 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -46,4 +46,11 @@ else
 KEEPALIVED_CONF_OPTS += --disable-libiptc
 endif
 
+ifeq ($(BR2_PACKAGE_LIBMNL)$(BR2_PACKAGE_LIBNFTNL),yy)
+KEEPALIVED_DEPENDENCIES += libmnl libnftnl
+KEEPALIVED_CONF_OPTS += --enable-nftables
+else
+KEEPALIVED_CONF_OPTS += --disable-nftables
+endif
+
 $(eval $(autotools-package))
-- 
2.20.1
