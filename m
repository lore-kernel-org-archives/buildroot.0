From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:44 -0300
Subject: [Buildroot] [PATCH 26/26] upmpdcli: don't test if the binary exists
 in the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-27-casantos@datacom.ind.br>
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
 package/upmpdcli/S99upmpdcli | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/upmpdcli/S99upmpdcli b/package/upmpdcli/S99upmpdcli
index 71d19a58e5..c1586eb05d 100644
--- a/package/upmpdcli/S99upmpdcli
+++ b/package/upmpdcli/S99upmpdcli
@@ -1,17 +1,13 @@
 #!/bin/sh
 
 NAME=upmpdcli
-DAEMON=/usr/bin/$NAME
 CONFFILE=/etc/$NAME.conf
 PIDFILE=/var/run/$NAME.pid
 DAEMON_ARGS="-D -c $CONFFILE"
 
-# Sanity checks
-test -f $DAEMON || exit 0
-
 start() {
         printf "Starting $NAME: "
-        start-stop-daemon --start --quiet --background --exec $DAEMON \
+        start-stop-daemon --start --quiet --background --exec /usr/bin/upmpdcli \
                 -- $DAEMON_ARGS \
                 && echo "OK" || echo "FAIL"
 }
-- 
2.14.3
