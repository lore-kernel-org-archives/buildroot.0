From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Feb 2013 00:22:29 +0100
Subject: [Buildroot] [PATCH 3/6] package/tvheadend: wait for DVB devices
In-Reply-To: <cover.1361143078.git.yann.morin.1998@free.fr>
References: <cover.1361143078.git.yann.morin.1998@free.fr>
Message-ID: <265e8598251b35399c144699c4e0ffb250f87286.1361143078.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wait for DVB devices before starting up the tvheadend daemon.
Wait for maximum 15 seconds.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tvheadend/S99tvheadend |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/tvheadend/S99tvheadend b/package/tvheadend/S99tvheadend
index 407b873..3a1218a 100644
--- a/package/tvheadend/S99tvheadend
+++ b/package/tvheadend/S99tvheadend
@@ -23,6 +23,13 @@ ARGS="-f"
 
 case "$1" in
     start)
+        printf "Waiting for DVB device nodes..."
+        cpt=15
+        while [ ! -d /dev/dvb/adapter0 -a ${cpt} -gt 0 ]; do
+            sleep 1
+            cpt=$((cpt-1))
+        done
+        printf "\n"
         printf "Starting TVHeadend daemon: "
         if start-stop-daemon -S -q -p ${PIDFILE} -m --exec "${DAEMON}" -- ${ARGS}; then
             printf "OK\n"
-- 
1.7.2.5
