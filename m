From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 9 Sep 2020 22:57:49 +0200
Subject: [Buildroot] [git commit] package/iwd: bump to 1.9
Message-ID: <20200909205103.B7C1A86E50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2134df9de4d0bb3c72aa4b12ef8b6f5432337005
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also drop mainlined [1] patch.

[1] https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=6bf5c3ddbd1e8f50e8c06bf8ff3cda79ee436de4

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../iwd/0001-src-p2p.c-fix-build-with-uclibc.patch | 38 ----------------------
 package/iwd/iwd.hash                               |  2 +-
 package/iwd/iwd.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/package/iwd/0001-src-p2p.c-fix-build-with-uclibc.patch b/package/iwd/0001-src-p2p.c-fix-build-with-uclibc.patch
deleted file mode 100644
index 34c525f907..0000000000
--- a/package/iwd/0001-src-p2p.c-fix-build-with-uclibc.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 7d29d294c7138460dc400df8d051d7f334d149cf Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 20 Jun 2020 15:13:17 +0200
-Subject: [PATCH] src/p2p.c: fix build with uclibc
-
-explicit_bzero is used in src/p2p.c since commit
-1675c765a3d66f3c626a1581a7bf514e1859b064 but src/missing.h is not
-included, as a result build with uclibc fails on:
-
-/home/naourr/work/instance-0/output-1/per-package/iwd/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: src/p2p.o: in function `p2p_connection_reset':
-p2p.c:(.text+0x2cf4): undefined reference to `explicit_bzero'
-/home/naourr/work/instance-0/output-1/per-package/iwd/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: p2p.c:(.text+0x2cfc): undefined reference to `explicit_bzero'
-
-Fixes:
- - http://autobuild.buildroot.org/results/8bbf7e1d0929d0883c0c2445990f62f5a1d54163
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://lists.01.org/hyperkitty/list/iwd at lists.01.org/thread/EXR3JZJXIVITX2ZSQRE6GEXGN6P3KUTC]
----
- src/p2p.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/p2p.c b/src/p2p.c
-index dc78b887..a759df5c 100644
---- a/src/p2p.c
-+++ b/src/p2p.c
-@@ -37,6 +37,7 @@
- 
- #include "linux/nl80211.h"
- 
-+#include "src/missing.h"
- #include "src/iwd.h"
- #include "src/wiphy.h"
- #include "src/scan.h"
--- 
-2.26.2
-
diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 10c9dde983..16e01ed473 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  14b39fc8b2bf170e75cc3d0c08b666dbcfeaee73384485cb6eaf463da8963aa4  iwd-1.8.tar.gz
+sha256  e4178a105021ef1b7b7c23cbc6f8e45cbab3bb0830da588b406ff4a281e9f948  iwd-1.9.tar.gz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index bba787c07f..58d332dc07 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.8
+IWD_VERSION = 1.9
 IWD_SITE = https://git.kernel.org/pub/scm/network/wireless/iwd.git
 IWD_SITE_METHOD = git
 IWD_LICENSE = LGPL-2.1+
