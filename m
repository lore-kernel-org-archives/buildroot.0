From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:35:03 +0200
Subject: [Buildroot] [git commit] tvheadend: don't test if the binary exists
 in the init script
Message-ID: <20180416053719.5F89788325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9dbe881e547de10d771be729a89df3127906ee8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Replace the DAEMON variable, which was used only once, by the full path
of the binary file.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
