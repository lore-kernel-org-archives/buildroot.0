From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 16:24:06 +0200
Subject: [Buildroot] [git commit] package/iwd: fix build with uclibc
Message-ID: <20200620142216.247CA821F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8326d09d581bf64576bfee7a13809991a2f09ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/8bbf7e1d0929d0883c0c2445990f62f5a1d54163

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../iwd/0001-src-p2p.c-fix-build-with-uclibc.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/iwd/0001-src-p2p.c-fix-build-with-uclibc.patch b/package/iwd/0001-src-p2p.c-fix-build-with-uclibc.patch
new file mode 100644
index 0000000000..34c525f907
--- /dev/null
+++ b/package/iwd/0001-src-p2p.c-fix-build-with-uclibc.patch
@@ -0,0 +1,38 @@
+From 7d29d294c7138460dc400df8d051d7f334d149cf Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 20 Jun 2020 15:13:17 +0200
+Subject: [PATCH] src/p2p.c: fix build with uclibc
+
+explicit_bzero is used in src/p2p.c since commit
+1675c765a3d66f3c626a1581a7bf514e1859b064 but src/missing.h is not
+included, as a result build with uclibc fails on:
+
+/home/naourr/work/instance-0/output-1/per-package/iwd/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: src/p2p.o: in function `p2p_connection_reset':
+p2p.c:(.text+0x2cf4): undefined reference to `explicit_bzero'
+/home/naourr/work/instance-0/output-1/per-package/iwd/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: p2p.c:(.text+0x2cfc): undefined reference to `explicit_bzero'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8bbf7e1d0929d0883c0c2445990f62f5a1d54163
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://lists.01.org/hyperkitty/list/iwd at lists.01.org/thread/EXR3JZJXIVITX2ZSQRE6GEXGN6P3KUTC]
+---
+ src/p2p.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/p2p.c b/src/p2p.c
+index dc78b887..a759df5c 100644
+--- a/src/p2p.c
++++ b/src/p2p.c
+@@ -37,6 +37,7 @@
+ 
+ #include "linux/nl80211.h"
+ 
++#include "src/missing.h"
+ #include "src/iwd.h"
+ #include "src/wiphy.h"
+ #include "src/scan.h"
+-- 
+2.26.2
+
