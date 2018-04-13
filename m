From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 13 Apr 2018 13:00:27 -0300
Subject: [Buildroot] [PATCH] network-manager: support a defaults file in the
 init script
Message-ID: <20180413160027.6089-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sometimes it is useful to pass some parameters to NetworkManager when it
starts (e.g. --log-level) instead of editting NetworkManager.conf. Allow
the user add a file with a NETWORKMANAGER_ARGS variable containing such
flags. This is simpler than overriding the whole startup script (e.g. by
means of a rootfs overlay).

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/network-manager/S45network-manager | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/network-manager/S45network-manager b/package/network-manager/S45network-manager
index f39e20d73b..bb4bf164a5 100755
--- a/package/network-manager/S45network-manager
+++ b/package/network-manager/S45network-manager
@@ -1,5 +1,8 @@
 #!/bin/sh
 
+# Allow a few customizations from a config file
+test -r /etc/default/NetworkManager && . /etc/default/NetworkManager
+
 prefix=/usr
 exec_prefix=/usr
 sbindir=${exec_prefix}/sbin
@@ -14,7 +17,7 @@ case "$1" in
 		printf "Starting NetworkManager ... "
 		[ ! -d /var/run/NetworkManager ] && install -d /var/run/NetworkManager
 		if [ -z "$PID" ]; then
-			$NETWORKMANAGER_BIN
+			$NETWORKMANAGER_BIN $NETWORKMANAGER_ARGS
 		fi
 		if [ ! -z "$PID" -o $? -gt 0 ]; then
 			echo "failed!"
-- 
2.14.3
