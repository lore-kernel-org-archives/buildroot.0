From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:42 -0300
Subject: [Buildroot] [PATCH 24/26] triggerhappy: don't test if the binary
 exists in the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-25-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Replace the DAEMON variable, which was used only once, by the full path
of the binary file.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
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
 
-- 
2.14.3
