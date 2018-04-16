From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:35:05 +0200
Subject: [Buildroot] [git commit] upmpdcli: don't test if the binary exists
 in the init script
Message-ID: <20180416053719.7172488647@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=799e9848866bc7b080b2897dd9e7760c673de4ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Replace the DAEMON variable, which was used only once, by the full path
of the binary file.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
