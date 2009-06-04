From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Jun 2009 14:55:58 +0200
Subject: [Buildroot] [git commit] avahi: udhcpc default.script: only bring
	up avahi-autoipd on nak/timeout
Message-ID: <20090604125919.AE38E7776D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=871435fdb5019e34875e9b87c38e45a90f1af806
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


The avahi udhcpc script used to start up avahi-autoipd at defconfig
(init) time, and then kill it if a dhcp lease was acquired, leading
to extra network traffic.

Change it to only start avahi-autoipd on timeout and dhcp nak.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/avahi/busybox-udhcpc-default.script |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/avahi/busybox-udhcpc-default.script b/package/avahi/busybox-udhcpc-default.script
index cc89feb..0bb3dea 100755
--- a/package/avahi/busybox-udhcpc-default.script
+++ b/package/avahi/busybox-udhcpc-default.script
@@ -19,6 +19,12 @@ case "$1" in
 			/sbin/ifconfig $interface 0.0.0.0
 		fi
 		if [ -x /usr/sbin/avahi-autoipd ]; then
+			/usr/sbin/avahi-autoipd -k $interface
+		fi
+		;;
+
+	leasefail|nak)
+		if [ -x /usr/sbin/avahi-autoipd ]; then
 			/usr/sbin/avahi-autoipd -wD $interface --no-chroot
 		fi
 		;;
-- 
1.6.0.6
