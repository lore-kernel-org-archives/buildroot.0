From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jun 2018 11:22:34 +0200
Subject: [Buildroot] [git commit] sysvinit: reduce number of mkdir calls in
 inittab
Message-ID: <20180612092203.0CC4588071@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc267db6ab4d54ed3ddb582774fb51ef64332649
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default sysvinit inittab does two separate mkdir calls to create
/dev/pts and /dev/shm. Reduce this to call mkdir only once for both
directories.

This removes id "si3" but keeps ids "si4".."si9" intact rather than
renumbering them. This would just increase the turmoil without any
practical effect.

Based on commit e9db8122fb, by Florian La Roche <F.LaRoche@pilz.de>.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysvinit/inittab | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index 7eaef59d9e..2ca253ad6c 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -6,8 +6,7 @@ id:3:initdefault:
 
 si0::sysinit:/bin/mount -t proc proc /proc
 si1::sysinit:/bin/mount -o remount,rw /
-si2::sysinit:/bin/mkdir -p /dev/pts
-si3::sysinit:/bin/mkdir -p /dev/shm
+si2::sysinit:/bin/mkdir -p /dev/pts /dev/shm
 si4::sysinit:/bin/mount -a
 si5::sysinit:/bin/ln -sf /proc/self/fd /dev/fd 2>/dev/null
 si6::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin 2>/dev/null
