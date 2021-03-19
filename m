From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 23:03:33 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/transmission: fix
 sysv init script (name vs. exec)
Message-ID: <20210319215607.CF4D1884BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b95dcfda388cecbe69bf6f7947821a670895905b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

With the start-stop-daemon enabled (instead of the busybox applet),
stopping transmission emits spurious warnings:

  $ /etc/init.d/S92transmission stop
  Stopping bittorrent client transmission-daemon...
  start-stop-daemon: warning: this system is not able to track process names
  longer than 15 characters, please use --exec instead of --name.

Update our startup script to match what was done upstream 9 years ago:
    https://trac.transmissionbt.com/ticket/4724
    https://trac.transmissionbt.com/wiki/Scripts/initd?action=diff&version=24&old_version=23

Partially fixes:
  - https://bugs.busybox.net/show_bug.cgi?id=13576

Reported-by: ingineru_de_sistem at yahoo.com
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998 at free.fr:
  - reword commit log
  - add reference to upstream ticket and changeset
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 45d326a08c7838658f1ed9813967ea8caeff7495)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
