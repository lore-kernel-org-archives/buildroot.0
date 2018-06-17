From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:32:05 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] sysvinit: reduce number
 of mkdir calls in inittab
Message-ID: <20180617155626.CE7E8826A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e51711a79b3210f858059c218051223df8d4a990
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The default sysvinit inittab does two separate mkdir calls to create
/dev/pts and /dev/shm. Reduce this to call mkdir only once for both
directories.

This removes id "si3" but keeps ids "si4".."si9" intact rather than
renumbering them. This would just increase the turmoil without any
practical effect.

Based on commit e9db8122fb, by Florian La Roche <F.LaRoche@pilz.de>.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dc267db6ab4d54ed3ddb582774fb51ef64332649)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysvinit/inittab | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index fad91eae8b..6b0b580e59 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -6,8 +6,7 @@ id:3:initdefault:
 
 si0::sysinit:/bin/mount -t proc proc /proc
 si1::sysinit:/bin/mount -o remount,rw /
-si2::sysinit:/bin/mkdir -p /dev/pts
-si3::sysinit:/bin/mkdir -p /dev/shm
+si2::sysinit:/bin/mkdir -p /dev/pts /dev/shm
 si4::sysinit:/bin/mount -a
 si5::sysinit:/bin/hostname -F /etc/hostname
 rcS:12345:wait:/etc/init.d/rcS
