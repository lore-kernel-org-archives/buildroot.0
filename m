From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 13:00:48 +0200
Subject: [Buildroot] [git commit] package/sysvinit: don't start logging
Message-ID: <20141012110315.44DE1B2418@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d61c8d73d409f4df6162fb32a02617360e4a02e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't try to start logging from /etc/inittab because busybox installs a
S01logging script that handles that and can lead to duplicate logging
processes.
Let's handle the logging in each package that provides it since we can
get multiple variants in the future like syslog-ng that have different
initialization routines.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysvinit/inittab |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index 8812cca..d3de4a7 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -17,16 +17,9 @@ init::sysinit:/etc/init.d/rcS
 
 # S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
 
-# Logging junk
-mess::sysinit:/bin/touch /var/log/messages
-sysl:1:respawn:/sbin/syslogd -n -m 0
-klog:1:respawn:/sbin/klogd -n
-
 # Stuff to do for the 3-finger salute
 rebo::ctrlaltdel:/sbin/reboot
 
 # Stuff to do before rebooting
-sklo:6:wait:/usr/bin/killall klogd
-ssys:6:wait:/usr/bin/killall syslogd
 umou:6:wait:/bin/umount -a -r
 swap:6:wait:/sbin/swapoff -a
