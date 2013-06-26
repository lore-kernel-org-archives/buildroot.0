From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Jun 2013 15:20:50 +0200
Subject: [Buildroot] [git commit] busybox: udhcpc.script: fix resolv.conf
	handling with multiple interfaces
Message-ID: <20130626132400.8C4AC9B1C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=584f418ec1ae3f0b5e09c10133c82578d78a3e03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When udhcpc is used on multiple network devices at the same time (or a mix
of dhcp and fixed configuration), /etc/resolv.conf should contain the
union of information from all the interfaces.

Currently that's not the case. The udhcpc script simply overwrites
resolv.conf with the information from the specific interface on each dhcp
bound/renew event.

Fix it by tagging lines with the interface they came from when added,
and drop the affected lines on deconfig/renew. As /etc/resolv.conf is
often a symlink to /tmp (and rootfs might be read only), special care
has to be taken when it is updated.

Notice that I'm not really aware of any official documentation requiring
that '#' comments in /etc/resolv.conf must be supported, but atleast
glibc and uClibc do.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/udhcpc.script |   19 ++++++++++++++++---
 1 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index f7beb56..43742fb 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -13,6 +13,13 @@ case "$1" in
 		/sbin/ifconfig $interface up
 		/sbin/ifconfig $interface 0.0.0.0
 
+		# drop info from this interface
+		# resolv.conf may be a symlink to /tmp/, so take care
+		TMPFILE=$(mktemp)
+		grep -vE "# $interface\$" $RESOLV_CONF > $TMPFILE
+		cat $TMPFILE > $RESOLV_CONF
+		rm -f $TMPFILE
+
 		if [ -x /usr/sbin/avahi-autoipd ]; then
 			/usr/sbin/avahi-autoipd -k $interface
 		fi
@@ -41,11 +48,17 @@ case "$1" in
 			done
 		fi
 
-		echo -n > $RESOLV_CONF
-		[ -n "$domain" ] && echo search $domain >> $RESOLV_CONF
+		# drop info from this interface
+		# resolv.conf may be a symlink to /tmp/, so take care
+		TMPFILE=$(mktemp)
+		grep -vE "# $interface\$" $RESOLV_CONF > $TMPFILE
+		cat $TMPFILE > $RESOLV_CONF
+		rm -f $TMPFILE
+
+		[ -n "$domain" ] && echo "search $domain # $interface" >> $RESOLV_CONF
 		for i in $dns ; do
 			echo adding dns $i
-			echo nameserver $i >> $RESOLV_CONF
+			echo "nameserver $i # $interface" >> $RESOLV_CONF
 		done
 		;;
 esac
