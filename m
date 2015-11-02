From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 16:51:41 +0100
Subject: [Buildroot] [git commit] Revert "package/initscripts: S40network:
	wait for network interfaces to appear"
Message-ID: <20151102155158.93D8781DC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81ece45c3aae23f899b92eabfe45e0bdb73ed789
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 49964858f45d2243c513e6d362e992ad89ec7a45. It is
going to be replaced with an ifup hook in next patch.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/initscripts/init.d/S40network |   29 -----------------------------
 1 files changed, 0 insertions(+), 29 deletions(-)

diff --git a/package/initscripts/init.d/S40network b/package/initscripts/init.d/S40network
index a8d7c5d..7b11d8b 100755
--- a/package/initscripts/init.d/S40network
+++ b/package/initscripts/init.d/S40network
@@ -6,37 +6,8 @@
 # Debian ifupdown needs the /run/network lock directory
 mkdir -p /run/network
 
-# In case we have a slow-to-appear interface (e.g. eth-over-USB),
-# and we need to configure it, wait until it appears, but not too
-# long either. WAIT_DELAY is in seconds.
-WAIT_DELAY=15
-
-wait_for_interfaces() {
-	IFACES=$(awk '/^auto/ { print $2 }' /etc/network/interfaces)
-	[ -n "$IFACES" ] || return
-
-	printf "Waiting for network interfaces to appear"
-
-	for i in $(seq $WAIT_DELAY); do
-	    for IFACE in $IFACES; do
-		if [ ! -e "/sys/class/net/$IFACE" ]; then
-		    printf "."
-		    sleep 1
-		    continue 2
-		fi
-	    done
-
-	    printf " ok\n"; return
-	done
-
-	printf " timeout\n"
-	exit 1
-}
-
 case "$1" in
   start)
-	wait_for_interfaces
-
  	echo "Starting network..."
 	/sbin/ifup -a
 	;;
