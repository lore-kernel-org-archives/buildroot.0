From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Jun 2013 14:34:25 +0200
Subject: [Buildroot] [git commit] busybox: udhcpc.script: cleanup
Message-ID: <20130626132400.4314E9B1C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8432d81a849efca1d95ab0bd1324afd96bbdd804
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ifconfig up is a no-op if the device is already running, so let's just
do that unconditionally.

Systems might have multiple network devices, and perhaps run udhcpc on
another interface even when booted over nfs, so don't disable the
per-interface deconfig based on the global nfsroot= setting on the kernel
command line.

If you don't want udhcpc to mess with kernel level IP autoconfiguration
(E.G. for nfs boot), you should instead ensure udhcpc/ifup/ifplugd isn't
started for that interface.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/udhcpc.script |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index 0bb3dea..f7beb56 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -10,14 +10,9 @@ RESOLV_CONF="/etc/resolv.conf"
 
 case "$1" in
 	deconfig)
-		grep -q -v ip= /proc/cmdline
-		if [ $? -eq 0 ]; then
-			/sbin/ifconfig $interface up
-		fi
-		grep -q -v nfsroot= /proc/cmdline
-		if [ $? -eq 0 ]; then
-			/sbin/ifconfig $interface 0.0.0.0
-		fi
+		/sbin/ifconfig $interface up
+		/sbin/ifconfig $interface 0.0.0.0
+
 		if [ -x /usr/sbin/avahi-autoipd ]; then
 			/usr/sbin/avahi-autoipd -k $interface
 		fi
