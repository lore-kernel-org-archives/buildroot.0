From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:43 -0300
Subject: [Buildroot] [PATCH 25/26] tvheadend: don't test if the binary
 exists in the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-26-casantos@datacom.ind.br>
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
 package/tvheadend/S99tvheadend | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/tvheadend/S99tvheadend b/package/tvheadend/S99tvheadend
index 65669ce404..fc125a2305 100644
--- a/package/tvheadend/S99tvheadend
+++ b/package/tvheadend/S99tvheadend
@@ -5,11 +5,8 @@
 
 PATH=/usr/sbin:/usr/bin:/sbin:/bin
 NAME=tvheadend
-DAEMON=/usr/bin/$NAME
 PIDFILE=/var/run/$NAME.pid
 
-[ -f "${DAEMON}" -a -x "${DAEMON}" ] || exit 0
-
 # Read configuration variable file if it is present
 [ -r "/etc/default/${NAME}" ] && . "/etc/default/${NAME}"
 
@@ -29,7 +26,7 @@ fi
 case "$1" in
     start)
         printf "Starting TVHeadend daemon: "
-        if start-stop-daemon -S -q -p ${PIDFILE} -m --exec "${DAEMON}" -- ${ARGS}; then
+        if start-stop-daemon -S -q -p ${PIDFILE} -m --exec /usr/bin/tvheadend -- ${ARGS}; then
             printf "OK\n"
         else
             printf "failed\n"
-- 
2.14.3
