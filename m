From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 16:45:34 +0200
Subject: [Buildroot] [git commit] package/systemd: Create user only when
	needed
Message-ID: <20160702144555.10D8E818B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=182492c8ad5d5bea951b05eb58753d64b45d8e05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't want to create a bunch of group and users that might not be
used, it's more elegant to create them when the associated features is
selected.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 6f5a610..2f5019c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -269,6 +269,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_COREDUMP),y)
 SYSTEMD_CONF_OPTS += --enable-coredump
+SYSTEMD_COREDUMP_USER = systemd-coredump -1 systemd-coredump -1 * /var/lib/systemd/coredump - - Core Dumper
 else
 SYSTEMD_CONF_OPTS += --disable-coredump
 endif
@@ -281,6 +282,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
+SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - Network Manager
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
 	ln -sf ../run/systemd/resolve/resolv.conf \
 		$(TARGET_DIR)/etc/resolv.conf
@@ -298,12 +300,14 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
 SYSTEMD_CONF_OPTS += --enable-resolved
+SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
 else
 SYSTEMD_CONF_OPTS += --disable-resolved
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
 SYSTEMD_CONF_OPTS += --enable-timesyncd
+SYSTEMD_TIMESYNCD_USER = systemd-timesync -1 systemd-timesync -1 * - - - Network Time Synchronization
 define SYSTEMD_INSTALL_SERVICE_TIMESYNC
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
 	ln -sf ../../../../lib/systemd/system/systemd-timesyncd.service \
@@ -348,13 +352,13 @@ define SYSTEMD_USERS
 	- - input -1 * - - - Input device group
 	- - systemd-journal -1 * - - - Journal
 	systemd-bus-proxy -1 systemd-bus-proxy -1 * - - - Proxy D-Bus messages to/from a bus
-	systemd-coredump -1 systemd-coredump -1 * /var/lib/systemd/coredump - - Core Dumper
 	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
 	systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
 	systemd-journal-upload -1 systemd-journal-upload -1 * - - - Journal Upload
-	systemd-network -1 systemd-network -1 * - - - Network Manager
-	systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
-	systemd-timesync -1 systemd-timesync -1 * - - - Network Time Synchronization
+	$(SYSTEMD_COREDUMP_USER)
+	$(SYSTEMD_NETWORKD_USER)
+	$(SYSTEMD_RESOLVED_USER)
+	$(SYSTEMD_TIMESYNCD_USER)
 endef
 
 define SYSTEMD_DISABLE_SERVICE_TTY1
