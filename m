From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:35:02 +0200
Subject: [Buildroot] [git commit] triggerhappy: don't test if the binary
 exists in the init script
Message-ID: <20180416053719.497AE88325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=150327e7fc492e40233e74533ee8a282a6662346
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Replace the DAEMON variable, which was used only once, by the full path
of the binary file.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/triggerhappy/S10triggerhappy | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/triggerhappy/S10triggerhappy b/package/triggerhappy/S10triggerhappy
index 3253e910b1..4853873067 100755
--- a/package/triggerhappy/S10triggerhappy
+++ b/package/triggerhappy/S10triggerhappy
@@ -1,18 +1,14 @@
 #!/bin/sh
 
 NAME=thd
-DAEMON=/usr/sbin/$NAME
 PIDFILE=/var/run/$NAME.pid
 DAEMON_ARGS="--daemon --triggers /etc/triggerhappy/triggers.d --socket /var/run/thd.socket --pidfile $PIDFILE --user nobody /dev/input/event*"
 
-# Sanity checks
-test -x $DAEMON || exit 0
-
 [ -r /etc/default/triggerhappy ] && . /etc/default/triggerhappy
 
 start() {
         printf "Starting $NAME: "
-        start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_ARGS \
+        start-stop-daemon --start --quiet --pidfile $PIDFILE --exec /usr/sbin/thd -- $DAEMON_ARGS \
                 && echo "OK" || echo "FAIL"
 }
 
