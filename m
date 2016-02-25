From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:40 +0000
Subject: [Buildroot] [PATCH 31/32] package/systemd: only create
	'systemd-journal' group
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-32-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd-journal is a group used for controlling user access to the
journal when used with tools like journalctl.

While we're at it, sort the users list to improve readability.

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/systemd.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b9de3b7..e361f69 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -307,16 +307,16 @@ SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_RESOLVCONF_HOOK
 
 define SYSTEMD_USERS
+	- - input -1 * - - - Input device group
+	- - systemd-journal -1 * - - - Journal
+	systemd-bus-proxy -1 systemd-bus-proxy -1 * - - - Proxy D-Bus messages to/from a bus
 	systemd-coredump -1 systemd-coredump -1 * /var/lib/systemd/coredump - - Core Dumper
-	systemd-journal -1 systemd-journal -1 * /var/log/journal - - Journal
 	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
 	systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
 	systemd-journal-upload -1 systemd-journal-upload -1 * - - - Journal Upload
+	systemd-network -1 systemd-network -1 * - - - Network Manager
 	systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
-	systemd-bus-proxy -1 systemd-bus-proxy -1 * - - - Proxy D-Bus messages to/from a bus
 	systemd-timesync -1 systemd-timesync -1 * - - - Network Time Synchronization
-	systemd-network -1 systemd-network -1 * - - - Network Manager
-	- - input -1 * - - - Input device group
 endef
 
 define SYSTEMD_DISABLE_SERVICE_TTY1
-- 
1.9.1
