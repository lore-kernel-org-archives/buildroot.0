From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Nov 2014 22:50:19 +0100
Subject: [Buildroot] [git commit] package/shairport-sync: fix init script
Message-ID: <20141119215025.048957F8B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20fbed2f7148163c6ca7389f2fb0fbff00d18d23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

shairport-sync uses libdaemon for running as daemon and creating the pidfile
which conflicts with start-stop-daemons `-b -m` options. For that reason
shairport-sync does not start using /etc/init.d/S99shairport-sync start.

The issue is fixed by removing the background and pidfile task from
start-stop-daemon and add a daemon option `-d` to shairport-sync.

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shairport-sync/S99shairport-sync |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/S99shairport-sync b/package/shairport-sync/S99shairport-sync
index 31359fc..54d20ff 100644
--- a/package/shairport-sync/S99shairport-sync
+++ b/package/shairport-sync/S99shairport-sync
@@ -1,12 +1,12 @@
 #! /bin/sh
 
 # Additional options that are passed to Shairport Sync
-OPTIONS=""
+OPTIONS="-d"
 
 case "$1" in
     start)
 	echo -n "Starting shairport-sync: "
-	start-stop-daemon -S -q -m -b -p /var/run/shairport-sync.pid --exec /usr/bin/shairport-sync -- $OPTIONS
+	start-stop-daemon -S -q -p /var/run/shairport-sync.pid --exec /usr/bin/shairport-sync -- $OPTIONS
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 	;;
     stop)
