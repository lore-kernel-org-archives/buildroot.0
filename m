From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:48 +0200
Subject: [Buildroot] [git commit] network-manager: don't test if the binary
 exists in the init script
Message-ID: <20180416053718.6EF7C88325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=047341e6ebbf483d00303d7b91963bb08e340aa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Replace the NETWORKMANAGER_BIN variable, which was used only once, by
the full path of the binary file.

Drop the now useless variables prefix, exec_prefix and sbindir.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/S45network-manager | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/network-manager/S45network-manager b/package/network-manager/S45network-manager
index bb4bf164a5..bc775d3b20 100755
--- a/package/network-manager/S45network-manager
+++ b/package/network-manager/S45network-manager
@@ -3,21 +3,13 @@
 # Allow a few customizations from a config file
 test -r /etc/default/NetworkManager && . /etc/default/NetworkManager
 
-prefix=/usr
-exec_prefix=/usr
-sbindir=${exec_prefix}/sbin
-
-NETWORKMANAGER_BIN=${sbindir}/NetworkManager
-
-[ -x $NETWORKMANAGER_BIN ] || exit 0
-
 PID=`pidof NetworkManager`
 case "$1" in
 	start)
 		printf "Starting NetworkManager ... "
 		[ ! -d /var/run/NetworkManager ] && install -d /var/run/NetworkManager
 		if [ -z "$PID" ]; then
-			$NETWORKMANAGER_BIN $NETWORKMANAGER_ARGS
+			/usr/sbin/NetworkManager $NETWORKMANAGER_ARGS
 		fi
 		if [ ! -z "$PID" -o $? -gt 0 ]; then
 			echo "failed!"
