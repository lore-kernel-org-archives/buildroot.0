From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 18 May 2015 22:54:13 +0200
Subject: [Buildroot] [PATCH] package/iproute2: disable iptables support for
	static build
Message-ID: <1431982453-17867-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If iptable support is enabled, it will try to build m_xt.so even
for static build only.

So, disable iptables support for static build and remove
TC_CONFIG_IPSET and TC_CONFIG_XT if previously added by the
configure script.

Fixes:
http://autobuild.buildroot.net/results/3b3/3b37871bdf5766677fc20dca22c13177091d104f/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/iproute2/iproute2.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 9595165..d97e75e 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -18,7 +18,7 @@ IPROUTE2_DEPENDENCIES += busybox
 endif
 
 # If we've got iptables enable xtables support for tc
-ifeq ($(BR2_PACKAGE_IPTABLES),y)
+ifeq ($(BR2_PACKAGE_IPTABLES)x$(BR2_STATIC_LIBS),yx)
 IPROUTE2_DEPENDENCIES += iptables
 define IPROUTE2_WITH_IPTABLES
 	# Makefile is busted so it never passes IPT_LIB_DIR properly
@@ -27,6 +27,9 @@ define IPROUTE2_WITH_IPTABLES
 endef
 else
 define IPROUTE2_WITH_IPTABLES
+	# delete TC_CONFIG_IPSET and TC_CONFIG_XT if any
+	$(SED) '/TC_CONFIG_IPSET/d' $(IPROUTE2_DIR)/Config
+	$(SED) '/TC_CONFIG_XT/d' $(IPROUTE2_DIR)/Config
 	# em_ipset needs xtables, but configure misdetects it
 	echo "TC_CONFIG_IPSET:=n" >>$(IPROUTE2_DIR)/Config
 endef
-- 
1.9.3
