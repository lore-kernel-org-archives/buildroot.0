From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 13 Jan 2020 16:34:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: update user generation
Message-ID: <20200113153415.486032-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

since V235 the "gateway" and "upload" services use DynamicUsers,
requiring no entries in /etc/passwd.
This functionality requires option nss-systemd, which is always
enabled in buildroot.

the "bus-proxy" user was removed in V244.

thre "remote" user will now only be generated if the feature is
enabled.

Description is matched to the ones in the upstream sysusers.d
files. home is set to /run/systemd.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 442803baa8..a3073f10a9 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -181,6 +181,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE),y)
 SYSTEMD_CONF_OPTS += -Dremote=true
+SYSTEMD_REMOTE_USER = systemd-journal-remote -1 systemd-journal-remote -1 * /run/systemd - - systemd Journal Remote
 else
 SYSTEMD_CONF_OPTS += -Dremote=false
 endif
@@ -304,7 +305,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_COREDUMP),y)
 SYSTEMD_CONF_OPTS += -Dcoredump=true
-SYSTEMD_COREDUMP_USER = systemd-coredump -1 systemd-coredump -1 * /var/lib/systemd/coredump - - Core Dumper
+SYSTEMD_COREDUMP_USER = systemd-coredump -1 systemd-coredump -1 * /run/systemd - - systemd core dump processing
 else
 SYSTEMD_CONF_OPTS += -Dcoredump=false
 endif
@@ -324,7 +325,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += -Dnetworkd=true
-SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - Network Manager
+SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * /run/systemd - - systemd Network Management
 SYSTEMD_NETWORKD_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
 ifneq ($(SYSTEMD_NETWORKD_DHCP_IFACE),)
 define SYSTEMD_INSTALL_NETWORK_CONFS
@@ -343,14 +344,14 @@ define SYSTEMD_INSTALL_RESOLVCONF_HOOK
 		$(TARGET_DIR)/etc/resolv.conf
 endef
 SYSTEMD_CONF_OPTS += -Dresolve=true
-SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
+SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * /run/systemd - - systemd Resolver
 else
 SYSTEMD_CONF_OPTS += -Dresolve=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
 SYSTEMD_CONF_OPTS += -Dtimesyncd=true
-SYSTEMD_TIMESYNCD_USER = systemd-timesync -1 systemd-timesync -1 * - - - Network Time Synchronization
+SYSTEMD_TIMESYNCD_USER = systemd-timesync -1 systemd-timesync -1 * /run/systemd - - systemd Time Synchronization
 else
 SYSTEMD_CONF_OPTS += -Dtimesyncd=false
 endif
@@ -423,10 +424,7 @@ define SYSTEMD_USERS
 	- - systemd-journal -1 * - - - Journal
 	- - render -1 * - - - DRI rendering nodes
 	- - kvm -1 * - - - kvm nodes
-	systemd-bus-proxy -1 systemd-bus-proxy -1 * - - - Proxy D-Bus messages to/from a bus
-	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
-	systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
-	systemd-journal-upload -1 systemd-journal-upload -1 * - - - Journal Upload
+	$(SYSTEMD_REMOTE_USER)
 	$(SYSTEMD_COREDUMP_USER)
 	$(SYSTEMD_NETWORKD_USER)
 	$(SYSTEMD_RESOLVED_USER)
-- 
2.24.1
