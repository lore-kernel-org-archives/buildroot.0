From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2020 22:03:59 +0200
Subject: [Buildroot] [git commit] package/busybox: fix avahi-autoipd error
 message
Message-ID: <20200831201229.4625A81468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c5ca644ef8dbcccbc40fc3fc56b74bc54782ae4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using a combination of udhcpc and avahi-autoipd in case of receiving IP
from a DHCP server, the following message can be seen:
"Failed to kill daemon: No such file or directory".
Add a check for a running avahi-autoipd to fix this issue.

Signed-off-by: Lukasz Tekieli <tekieli.lukasz@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/udhcpc.script | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index 711963f974..0196351cd5 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -42,19 +42,19 @@ case "$1" in
 		rm -f $TMPFILE
 
 		if [ -x /usr/sbin/avahi-autoipd ]; then
-			/usr/sbin/avahi-autoipd -k $interface
+			/usr/sbin/avahi-autoipd -c $interface && /usr/sbin/avahi-autoipd -k $interface
 		fi
 		;;
 
 	leasefail|nak)
 		if [ -x /usr/sbin/avahi-autoipd ]; then
-			/usr/sbin/avahi-autoipd -wD $interface --no-chroot
+			/usr/sbin/avahi-autoipd -c $interface || /usr/sbin/avahi-autoipd -wD $interface --no-chroot
 		fi
 		;;
 
 	renew|bound)
 		if [ -x /usr/sbin/avahi-autoipd ]; then
-			/usr/sbin/avahi-autoipd -k $interface
+			/usr/sbin/avahi-autoipd -c $interface && /usr/sbin/avahi-autoipd -k $interface
 		fi
 		/sbin/ifconfig $interface $ip $BROADCAST $NETMASK
 		if [ -n "$ipv6" ] ; then
