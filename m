From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Oct 2015 09:16:58 +0200
Subject: [Buildroot] [git commit] package/initscripts: S40network: wait for
	network interfaces to appear
Message-ID: <20151016111136.50FA381F8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=49964858f45d2243c513e6d362e992ad89ec7a45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On some machines, the network interface is slow to appear. For example,
on the Raspberry Pi, the network interface eth0 is an ethernet-over-USB,
and our standard boot process is too fast, so our network startup script
is called before the USB bus is compeltely enumerated, thus it can't
configure eth0.

Closes #8116.

[Peter: move to S40network, handle multiple interfaces]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/initscripts/init.d/S40network |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/initscripts/init.d/S40network b/package/initscripts/init.d/S40network
index 7b11d8b..a8d7c5d 100755
--- a/package/initscripts/init.d/S40network
+++ b/package/initscripts/init.d/S40network
@@ -6,8 +6,37 @@
 # Debian ifupdown needs the /run/network lock directory
 mkdir -p /run/network
 
+# In case we have a slow-to-appear interface (e.g. eth-over-USB),
+# and we need to configure it, wait until it appears, but not too
+# long either. WAIT_DELAY is in seconds.
+WAIT_DELAY=15
+
+wait_for_interfaces() {
+	IFACES=$(awk '/^auto/ { print $2 }' /etc/network/interfaces)
+	[ -n "$IFACES" ] || return
+
+	printf "Waiting for network interfaces to appear"
+
+	for i in $(seq $WAIT_DELAY); do
+	    for IFACE in $IFACES; do
+		if [ ! -e "/sys/class/net/$IFACE" ]; then
+		    printf "."
+		    sleep 1
+		    continue 2
+		fi
+	    done
+
+	    printf " ok\n"; return
+	done
+
+	printf " timeout\n"
+	exit 1
+}
+
 case "$1" in
   start)
+	wait_for_interfaces
+
  	echo "Starting network..."
 	/sbin/ifup -a
 	;;
