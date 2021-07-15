From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Jul 2021 21:42:41 +0200
Subject: [Buildroot] [git commit] package/sbc: bump to version 1.5
Message-ID: <20210715190929.2FBB390F00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=1f77fce9664b9bc866bc4d4dd47eb03a00e630be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to backport a commit to fix a build failure on non-x86.

Also update hash file formatting (2 spaces)

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-sbc_primitives-Fix-build-on-non-x86.patch | 49 ++++++++++++++++++++++
 package/sbc/sbc.hash                               |  6 +--
 package/sbc/sbc.mk                                 |  2 +-
 3 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/package/sbc/0001-sbc_primitives-Fix-build-on-non-x86.patch b/package/sbc/0001-sbc_primitives-Fix-build-on-non-x86.patch
new file mode 100644
index 0000000000..3ed73ebd88
--- /dev/null
+++ b/package/sbc/0001-sbc_primitives-Fix-build-on-non-x86.patch
@@ -0,0 +1,49 @@
+From 909a9bdf7ab143e1f0baaf9736baebd3cd79aacf Mon Sep 17 00:00:00 2001
+From: Marius Bakke <marius@gnu.org>
+Date: Tue, 22 Dec 2020 11:04:26 +0000
+Subject: [PATCH] sbc_primitives: Fix build on non-x86.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Don't call __builtin_cpu_init unless targeting i386 or x86_64.
+Otherwise we get an error at link time:
+
+  CC       sbc/sbc_primitives.lo
+sbc/sbc_primitives.c: In function ???sbc_init_primitives_x86???:
+sbc/sbc_primitives.c:596:2: warning: implicit declaration of function ???__builtin_cpu_init???; did you mean ???__builtin_irint???? [-Wimplicit-function-declaration]
+[...]
+  CCLD     src/sbcdec
+ld: sbc/.libs/libsbc-private.a(sbc_primitives.o): in function `sbc_init_primitives':
+sbc_primitives.c:(.text+0x3a30): undefined reference to `__builtin_cpu_init'
+
+Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
+[Upstream status: backport from upstream commit 909a9bdf7ab143e1f0baaf9736baebd3cd79aacf]
+
+---
+ sbc/sbc_primitives.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sbc/sbc_primitives.c b/sbc/sbc_primitives.c
+index 97a75be..09c214a 100644
+--- a/sbc/sbc_primitives.c
++++ b/sbc/sbc_primitives.c
+@@ -593,6 +593,7 @@ static int sbc_calc_scalefactors_j(
+ 
+ static void sbc_init_primitives_x86(struct sbc_encoder_state *state)
+ {
++#if defined(__x86_64__) || defined(__i386__)
+ 	__builtin_cpu_init();
+ 
+ #ifdef SBC_BUILD_WITH_MMX_SUPPORT
+@@ -604,6 +605,7 @@ static void sbc_init_primitives_x86(struct sbc_encoder_state *state)
+ 	if (__builtin_cpu_supports("sse4.2"))
+ 		sbc_init_primitives_sse(state);
+ #endif
++#endif
+ }
+ 
+ /*
+-- 
+2.17.1
+
diff --git a/package/sbc/sbc.hash b/package/sbc/sbc.hash
index d703f23437..beb3b232a8 100644
--- a/package/sbc/sbc.hash
+++ b/package/sbc/sbc.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
-sha256	518bf46e6bb3dc808a95e1eabad26fdebe8a099c1e781c27ed7fca6c2f4a54c9	sbc-1.4.tar.xz
+sha256  0cbad69823a99e8421fe0700e8cf9eeb8fa0c1ad28e8dbc2182b3353507931d2  sbc-1.5.tar.xz
 
 # sha256 locally computed
-sha256	b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259	COPYING
-sha256	ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5	COPYING.LIB
+sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
+sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/sbc/sbc.mk b/package/sbc/sbc.mk
index 73e4aceb85..af5cf291a3 100644
--- a/package/sbc/sbc.mk
+++ b/package/sbc/sbc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SBC_VERSION = 1.4
+SBC_VERSION = 1.5
 SBC_SOURCE = sbc-$(SBC_VERSION).tar.xz
 SBC_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 SBC_INSTALL_STAGING = YES
