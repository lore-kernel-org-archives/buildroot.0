From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:17 +0200
Subject: [Buildroot] [PATCH 17/31] package/systemd: only create
	'systemd-journal' group
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-17-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gabe Evans <gabe@hashrabbit.co>

systemd-journal is a group used for controlling user access to the
journal when used with tools like journalctl.

While we're at it, sort the users list to improve readability.

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/systemd.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 96c34a4..e463c8e 100644
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
2.8.1
