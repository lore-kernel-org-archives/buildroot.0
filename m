From: Jim Brennan <jbrennan@impinj.com>
Date: Tue, 1 May 2018 00:02:45 +0000
Subject: [Buildroot] [PATCH 1/1] dhcpcd: systemv and systemd services
 conflict with NetworkManager
Message-ID: <71FE4BA8-F083-4A73-A05D-262F9C28E9E2@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When NetworkManager and dhcpcd packages are both enabled,
dhcpcd services and NetworkManager both spawn dhcpcd.  This causes
the network port to retrieve an IP address and later lose it a few
seconds after startup.

This patch prevents dhcpcd services from launching dhcpcd if
NetworkManager is enabled.

Signed-off-by: Jim Brennan <jbrennan@impinj.com>
---
 package/dhcpcd/dhcpcd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 92a78cd7ad..7536d71869 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -36,6 +36,7 @@ define DHCPCD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
 endef
 
+ifeq ($(BR2_PACKAGE_NETWORK_MANAGER),)
 define DHCPCD_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/dhcpcd/S41dhcpcd \
 		$(TARGET_DIR)/etc/init.d/S41dhcpcd
@@ -48,6 +49,7 @@ define DHCPCD_INSTALL_INIT_SYSTEMD
 	ln -sf ../../../../usr/lib/systemd/system/dhcpcd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dhcpcd.service
 endef
+endif
 
 # NOTE: Even though this package has a configure script, it is not generated
 # using the autotools, so we have to use the generic package infrastructure.
-- 
2.11.0
