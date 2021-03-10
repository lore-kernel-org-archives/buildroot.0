From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 10 Mar 2021 23:41:55 +0100
Subject: [Buildroot] [PATCH v2] package/transmission: fix sysv init script
 (name vs. exec)
Message-ID: <20210310224155.8138-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- fix sysv init script in case package start-stop-daemon is
  enabled

Fixes:

  - https://bugs.busybox.net/show_bug.cgi?id=13576

  $ /etc/init.d/S92transmission stop
  Stopping bittorrent client transmission-daemon...
  start-stop-daemon: warning: this system is not able to track process names
  longer than 15 characters, please use --exec instead of --name.

Reported-by: ingineru_de_sistem at yahoo.com
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - add reported-by and reference to bug entry
---
 package/transmission/S92transmission | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/transmission/S92transmission b/package/transmission/S92transmission
index 29d7cd5863..85ff40ec16 100644
--- a/package/transmission/S92transmission
+++ b/package/transmission/S92transmission
@@ -93,7 +93,7 @@ stop()
         #   1 if daemon was already stopped
         #   2 if daemon could not be stopped
         #   other if a failure occurred
-        start-stop-daemon --stop --quiet --retry=TERM/10/KILL/5 --pidfile $PIDFILE --name $NAME
+        start-stop-daemon --stop --quiet --retry=TERM/10/KILL/5 --pidfile $PIDFILE --exec $DAEMON
         RETVAL="$?"
         [ "$RETVAL" = 2 ] && return 2
 
-- 
2.30.1
