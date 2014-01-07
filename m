From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue,  7 Jan 2014 11:29:20 +0100
Subject: [Buildroot] [PATCH 2/3] network-manager: fix DHCP clients detection.
In-Reply-To: <1389090561-32196-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1389090561-32196-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1389090561-32196-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If either dhclient or dhcpcd are selected, network-manager is now
configured with the proper paths.

This allows 'dhcp=dhclient' or 'dhcp=dhcpcd' to be set in
/etc/NetworkManager/NetworkManager.conf.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/network-manager/network-manager.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 7c9cc88..e847f25 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -34,6 +34,14 @@ NETWORK_MANAGER_CONF_OPT = \
 		--disable-ifupdown \
 		--disable-ifnet
 
+ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
+NETWORK_MANAGER_CONF_OPT += --with-dhclient=/usr/sbin/dhclient
+endif
+
+ifeq ($(BR2_PACKAGE_DHCPCD),y)
+NETWORK_MANAGER_CONF_OPT += --with-dhcpcd=/usr/sbin/dhcpcd
+endif
+
 # uClibc by default doesn't have backtrace support, so don't use it
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 NETWORK_MANAGER_CONF_OPT += --disable-crashtrace
-- 
1.7.9.5
