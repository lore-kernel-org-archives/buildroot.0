From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Jan 2014 13:17:48 +0100
Subject: [Buildroot] [git commit] network-manager: fix DHCP clients
	detection.
Message-ID: <20140109122318.325339C3E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16937a45db8847798f66a16a0e2e44969858b4c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If either dhclient or dhcpcd are selected, network-manager is now
configured with the proper paths.

This allows 'dhcp=dhclient' or 'dhcp=dhcpcd' to be set in
/etc/NetworkManager/NetworkManager.conf.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/network-manager.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

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
