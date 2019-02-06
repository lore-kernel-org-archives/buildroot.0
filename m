From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 15:57:09 +0100
Subject: [Buildroot] [git commit] package/dhcpcd: systemv and systemd
 services conflict with NetworkManager
Message-ID: <20190206145549.3BEAB7FE04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b530daf42e1769018f4dd745b900841c40f8812
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When NetworkManager and dhcpcd packages are both enabled, dhcpcd
services and NetworkManager both spawn dhcpcd. This causes the network
port to retrieve an IP address and later lose it a few seconds after
startup.

This patch prevents dhcpcd services from launching dhcpcd if
NetworkManager is enabled.

Signed-off-by: Jim Brennan <jbrennan@impinj.com>
[Thomas: add a comment in the code to explain the seemingly strange
condition.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dhcpcd/dhcpcd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 92a78cd7ad..ae16c340d6 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -36,6 +36,10 @@ define DHCPCD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
 endef
 
+# When network-manager is enabled together with dhcpcd, it will use
+# dhcpcd as a DHCP client, and will be in charge of running, so we
+# don't want the init script or service file to be installed.
+ifeq ($(BR2_PACKAGE_NETWORK_MANAGER),)
 define DHCPCD_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/dhcpcd/S41dhcpcd \
 		$(TARGET_DIR)/etc/init.d/S41dhcpcd
@@ -48,6 +52,7 @@ define DHCPCD_INSTALL_INIT_SYSTEMD
 	ln -sf ../../../../usr/lib/systemd/system/dhcpcd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dhcpcd.service
 endef
+endif
 
 # NOTE: Even though this package has a configure script, it is not generated
 # using the autotools, so we have to use the generic package infrastructure.
