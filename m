From: Norbert Lange <nolange79@gmail.com>
Date: Thu,  6 Feb 2020 10:36:27 +0100
Subject: [Buildroot] [PATCH 04/10] package/systemd: create "remote" user if
 the feature is enabled
In-Reply-To: <20200206093633.251413-1-nolange79@gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
Message-ID: <20200206093633.251413-5-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b46c4fd540..b3e83b5d3b 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -181,6 +181,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE),y)
 SYSTEMD_CONF_OPTS += -Dremote=true
+SYSTEMD_REMOTE_USER = systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
 else
 SYSTEMD_CONF_OPTS += -Dremote=false
 endif
@@ -431,7 +432,7 @@ define SYSTEMD_USERS
 	- - systemd-journal -1 * - - - Journal
 	- - render -1 * - - - DRI rendering nodes
 	- - kvm -1 * - - - kvm nodes
-	systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
+	$(SYSTEMD_REMOTE_USER)
 	$(SYSTEMD_COREDUMP_USER)
 	$(SYSTEMD_NETWORKD_USER)
 	$(SYSTEMD_RESOLVED_USER)
-- 
2.24.1
