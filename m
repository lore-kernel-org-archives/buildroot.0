From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 May 2016 11:38:33 +0200
Subject: [Buildroot] [git commit branch/next] sysvinit: update the inittab
	to support "single" from the kernel
Message-ID: <20160526093917.72FBB7FCD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eda809cd052dea73bca02385c7a10a4d7795c912
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Closes #8911

When the kernel passes single in the command line, this translates
into an init -s option that is suppose to drop into a shell after
the sysinit and before the runlevel.

So, in busybox this is hardcoded - but, in sysvinit using the
sysinit action for the rcS means that it will always be executed
even when trying to get into single user mode for repair.

This change should run rcS in all of the expected runlevels
1-5 and should achieve the desired result compared to the busybox
and still allow a single user shell to get started as expected
before running rcS.

Signed-off-by: Charles Hardin <ckhardin@exablox.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysvinit/inittab | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index 27eb4a6..fad91ea 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -10,7 +10,7 @@ si2::sysinit:/bin/mkdir -p /dev/pts
 si3::sysinit:/bin/mkdir -p /dev/shm
 si4::sysinit:/bin/mount -a
 si5::sysinit:/bin/hostname -F /etc/hostname
-si6::sysinit:/etc/init.d/rcS
+rcS:12345:wait:/etc/init.d/rcS
 
 # S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
 
