From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:28 -0300
Subject: [Buildroot] [PATCH 10/26] neard: don't test if the binary exists in
 the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-11-casantos@datacom.ind.br>
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
 package/neard/S53neard | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/neard/S53neard b/package/neard/S53neard
index f515668389..4fd4e0aad3 100755
--- a/package/neard/S53neard
+++ b/package/neard/S53neard
@@ -4,15 +4,11 @@
 #
 
 NAME=neard
-DAEMON=/usr/libexec/nfc/$NAME
-
-# Exit gracefully if the package has been removed
-[ -x $DAEMON ] || exit 0
 
 case "$1" in
   start)
     printf "Starting $NAME: "
-    start-stop-daemon -S -q -p /var/run/${NAME}.pid -x $DAEMON -- -d '*'
+    start-stop-daemon -S -q -p /var/run/${NAME}.pid -x /usr/libexec/nfc/neard -- -d '*'
     echo "OK"
     ;;
   stop)
-- 
2.14.3
