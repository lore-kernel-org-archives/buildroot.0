From: Carlos Santos <casantos@datacom.com.br>
Date: Mon, 11 Jun 2018 03:00:13 -0300
Subject: [Buildroot] [PATCH 1/4] sysvinit: reduce number of mkdir calls in
 inittab
In-Reply-To: <20180611060016.20755-1-casantos@datacom.com.br>
References: <20180611060016.20755-1-casantos@datacom.com.br>
Message-ID: <20180611060016.20755-2-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default sysvinit inittab does two separate mkdir calls to create
/dev/pts and /dev/shm. Reduce this to call mkdir only once for both
directories.

This removes id "si3" but keeps ids "si4".."si9" intact rather than
renumbering them. This would just increase the turmoil without any
practical effect.

Based on commit e9db8122fb, by Florian La Roche <F.LaRoche@pilz.de>.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
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
-- 
2.17.0
