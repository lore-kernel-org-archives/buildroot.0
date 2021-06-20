From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 20 Jun 2021 22:56:06 +0200
Subject: [Buildroot] [RFC v1 1/2] package/iptables: add option to enabel
 libipq build
Message-ID: <20210620205607.25904-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add option to enable libipq build
- as libipq.h includes linux/netfilter_ipv4/ip_queue.h install (not
  provided by modern kernels otherwise?)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/iptables/Config.in   |  5 +++++
 package/iptables/iptables.mk | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/iptables/Config.in b/package/iptables/Config.in
index e6b12603e0..0aacf06c03 100644
--- a/package/iptables/Config.in
+++ b/package/iptables/Config.in
@@ -7,6 +7,11 @@ config BR2_PACKAGE_IPTABLES
 
 if BR2_PACKAGE_IPTABLES
 
+config BR2_PACKAGE_IPTABLES_LIBIPQ
+	bool "libipq"
+	help
+	  Build libipq.
+
 config BR2_PACKAGE_IPTABLES_BPF_NFSYNPROXY
 	bool "bpfc and nfsynproxy"
 	select BR2_PACKAGE_LIBPCAP
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index ca8178425e..227b485d43 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -29,6 +29,16 @@ ifeq ($(BR2_PACKAGE_LIBNFNETLINK),y)
 IPTABLES_DEPENDENCIES += libnfnetlink
 endif
 
+ifeq ($(BR2_PACKAGE_IPTABLES_LIBIPQ),y)
+IPTABLES_CONF_OPTS += --enable-libipq
+define IPTABLES_INSTALL_LIBIPQ_HEADERS_CMD
+	$(INSTALL) -m 0644 -D $(@D)/include/linux/netfilter_ipv4/ip_queue.h $(STAGING_DIR)/usr/include/linux/netfilter_ipv4/ip_queue.h
+endef
+IPTABLES_POST_INSTALL_STAGING_HOOKS += IPTABLES_INSTALL_LIBIPQ_HEADERS_CMD
+else
+IPTABLES_CONF_OPTS += --disable-libipq
+endif
+
 # For iptables-compat tools
 ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES),y)
 IPTABLES_CONF_OPTS += --enable-nftables
-- 
2.31.1
