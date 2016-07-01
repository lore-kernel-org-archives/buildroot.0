From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:29 +0200
Subject: [Buildroot] [PATCH 29/31] package/systemd: Create user only when
	needed
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-29-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't want to create a bunch of group and users that might not be
used, it's more elegant to create them when the associated features is
selected.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/systemd/systemd.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 8b8d124..a02da6a 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -257,6 +257,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
 SYSTEMD_CONF_OPTS += --enable-resolved
+SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
 else
 SYSTEMD_CONF_OPTS += --disable-resolved
 endif
@@ -275,6 +276,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_COREDUMP),y)
 SYSTEMD_CONF_OPTS += --enable-coredump
+SYSTEMD_COREDUMP_USER = systemd-coredump -1 systemd-coredump -1 * /var/lib/systemd/coredump - - Core Dumper
 else
 SYSTEMD_CONF_OPTS += --disable-coredump
 endif
@@ -287,6 +289,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
+SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - Network Manager
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
 	ln -sf ../run/systemd/resolve/resolv.conf \
 		$(TARGET_DIR)/etc/resolv.conf
@@ -304,6 +307,7 @@ endif
 
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
-- 
2.8.1
