From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 09:57:34 +0100
Subject: [Buildroot] [git commit] package/xvisor: unconditionally disable SSP
Message-ID: <20191231084810.5E4008E8F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84ad39f5b2da3244742b046190c1d08ffbde43e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

- http://autobuild.buildroot.net/results/5de37d3da17ca5cb17c0113d942ce8c22c0074e0
- http://autobuild.buildroot.net/results/41b00d95ec4eb851abceaa7919aa1c533d4f16e8
- http://autobuild.buildroot.net/results/119e22e8b03991ab9196e428a131f5a8ae2a2b2f

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...0001-MAKEFILE-Unconditionally-disable-SSP.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/xvisor/0001-MAKEFILE-Unconditionally-disable-SSP.patch b/package/xvisor/0001-MAKEFILE-Unconditionally-disable-SSP.patch
new file mode 100644
index 0000000000..ffa486d7d4
--- /dev/null
+++ b/package/xvisor/0001-MAKEFILE-Unconditionally-disable-SSP.patch
@@ -0,0 +1,35 @@
+From f04d1b73a9060e8f09cf1173f89daab73d6c0a18 Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Sat, 9 Nov 2019 17:13:46 +0100
+Subject: [PATCH] [MAKEFILE] Unconditionally disable SSP
+
+Though -nostdlib is passed in $(cflags), -fno-stack-protector must also be
+passed to avoid linking errors related to undefined references to
+'__stack_chk_guard' and '__stack_chk_fail' if toolchain enforces
+-fstack-protector.
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+[yann.morin.1998 at free.fr:
+  - applied upstream: https://github.com/avpatel/xvisor-next/commit/6edd4a8bf16c42aac8bea9e0a61e8b3b47e2aa7c
+]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index d6bcf519..de8e1043 100644
+--- a/Makefile
++++ b/Makefile
+@@ -137,7 +137,7 @@ cppflags+=$(cpu-cppflags)
+ cppflags+=$(board-cppflags)
+ cppflags+=$(libs-cppflags-y)
+ cc=$(CROSS_COMPILE)gcc
+-cflags=-g -Wall -nostdlib --sysroot=$(drivers_dir)/include -fno-builtin -D__VMM__
++cflags=-g -Wall -nostdlib --sysroot=$(drivers_dir)/include -fno-builtin -D__VMM__ -fno-stack-protector
+ cflags+=$(board-cflags) 
+ cflags+=$(cpu-cflags) 
+ cflags+=$(libs-cflags-y) 
+-- 
+2.21.0
+
