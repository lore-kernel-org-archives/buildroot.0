From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 13 Sep 2011 16:02:38 +0200
Subject: [Buildroot] [git commit] uClibc: add patches to unbreak 0.9.32 on
	powerpc e500
Message-ID: <20110913140558.E04E98D598@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ab6b9e77fed118acb8a757d947708fc1773d21dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches from Jason Woodward, posted on the uClibc list back in July.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...x-e500-__fe_nomask_env-use-of-__set_errno.patch |   34 ++++++++++++++++++++
 .../uClibc-0.9.32-Fix-e500-fpu-libm-build.patch    |   31 ++++++++++++++++++
 ...ibc-0.9.32-honor-UCLIBC_HAS_FENV-for-e500.patch |   28 ++++++++++++++++
 3 files changed, 93 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.32-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.32-Fix-e500-fpu-libm-build.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.32-honor-UCLIBC_HAS_FENV-for-e500.patch

diff --git a/toolchain/uClibc/uClibc-0.9.32-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch b/toolchain/uClibc/uClibc-0.9.32-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch
new file mode 100644
index 0000000..1908925
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.32-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch
@@ -0,0 +1,34 @@
+>From 49f58308779cb0b798f5e7bc902bbc515c1ec394 Mon Sep 17 00:00:00 2001
+From: Jason Woodward <jason.woodward@timesys.com>
+Date: Sat, 11 Jun 2011 22:00:59 -0400
+Subject: [PATCH] Fix e500 __fe_nomask_env use of __set_errno w/o CFLAGS-libm
+
+Since the new _LIBC guard in 96c9a8f7d00cdf6bb7968a2390b9d87da8a45e2d we need
+to use CFLAGS-libm (-DNOT_IN_libc -DIS_IN_libm) or we end up with linker
+errors like:
+
+  lib/libm.a(fe_nomask.os): In function `__fe_nomask_env':
+  fe_nomask.c:(.text+0x26): undefined reference to `__libc_errno'
+  collect2: ld returned 1 exit status
+
+Signed-off-by: Jason Woodward <jason.woodward@timesys.com>
+---
+ libm/powerpc/e500/fpu/Makefile.arch |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/libm/powerpc/e500/fpu/Makefile.arch b/libm/powerpc/e500/fpu/Makefile.arch
+index 904561e..a64843f 100644
+--- a/libm/powerpc/e500/fpu/Makefile.arch
++++ b/libm/powerpc/e500/fpu/Makefile.arch
+@@ -11,6 +11,8 @@ libm_ARCH_SRC:=$(wildcard $(libm_ARCH_fpu_DIR)/*.c)
+ libm_ARCH_OBJ:=$(patsubst $(libm_ARCH_fpu_DIR)/%.c,$(libm_ARCH_fpu_OUT)/%.o,$(libm_ARCH_SRC))
+ endif
+ 
++CFLAGS-fe_nomask.c := $(CFLAGS-libm)
++
+ libm_ARCH_OBJS:=$(libm_ARCH_OBJ)
+ 
+ ifeq ($(DOPIC),y)
+-- 
+1.7.0.4
+
diff --git a/toolchain/uClibc/uClibc-0.9.32-Fix-e500-fpu-libm-build.patch b/toolchain/uClibc/uClibc-0.9.32-Fix-e500-fpu-libm-build.patch
new file mode 100644
index 0000000..a228bc1
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.32-Fix-e500-fpu-libm-build.patch
@@ -0,0 +1,31 @@
+>From 826984dee547b41238dc9572a1c756506a3c9148 Mon Sep 17 00:00:00 2001
+From: Jason Woodward <jason.woodward@timesys.com>
+Date: Sat, 11 Jun 2011 19:09:53 -0400
+Subject: [PATCH] Fix e500 fpu libm build
+
+Define libm_ARCH_fpu_OUT in libm/powerpc/e500/Makefile.arch as it is used
+in libm/powerpc/e500/fpu/Makefile.arch
+
+ libm_ARCH_OBJ:=$(patsubst $(libm_ARCH_fpu_DIR)/%.c,$(libm_ARCH_fpu_OUT)/%.o,$(libm_ARCH_SRC))
+
+This appears to have been broken since cd3a494e99fa4bcad1c2a621b71361005528bead
+
+Signed-off-by: Jason Woodward <jason.woodward@timesys.com>
+---
+ libm/powerpc/e500/Makefile.arch |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/libm/powerpc/e500/Makefile.arch b/libm/powerpc/e500/Makefile.arch
+index 912ce7f..febde67 100644
+--- a/libm/powerpc/e500/Makefile.arch
++++ b/libm/powerpc/e500/Makefile.arch
+@@ -6,5 +6,6 @@
+ #
+ 
+ libm_ARCH_fpu_DIR := $(libm_SUBARCH_DIR)/fpu
++libm_ARCH_fpu_OUT := $(libm_SUBARCH_OUT)/fpu
+ -include $(libm_ARCH_fpu_DIR)/Makefile.arch
+ 
+-- 
+1.7.0.4
+
diff --git a/toolchain/uClibc/uClibc-0.9.32-honor-UCLIBC_HAS_FENV-for-e500.patch b/toolchain/uClibc/uClibc-0.9.32-honor-UCLIBC_HAS_FENV-for-e500.patch
new file mode 100644
index 0000000..c90c34c
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.32-honor-UCLIBC_HAS_FENV-for-e500.patch
@@ -0,0 +1,28 @@
+>From 69d9cf20955d0222a5a2631021bc10854ea98128 Mon Sep 17 00:00:00 2001
+From: Jason Woodward <jason.woodward@timesys.com>
+Date: Sat, 11 Jun 2011 20:39:33 -0400
+Subject: [PATCH] honor UCLIBC_HAS_FENV for e500
+
+Signed-off-by: Jason Woodward <jason.woodward@timesys.com>
+---
+ libm/powerpc/e500/fpu/Makefile.arch |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/libm/powerpc/e500/fpu/Makefile.arch b/libm/powerpc/e500/fpu/Makefile.arch
+index 8f00e09..904561e 100644
+--- a/libm/powerpc/e500/fpu/Makefile.arch
++++ b/libm/powerpc/e500/fpu/Makefile.arch
+@@ -6,8 +6,10 @@
+ #
+ 
+ 
++ifeq ($(UCLIBC_HAS_FENV),y)
+ libm_ARCH_SRC:=$(wildcard $(libm_ARCH_fpu_DIR)/*.c)
+ libm_ARCH_OBJ:=$(patsubst $(libm_ARCH_fpu_DIR)/%.c,$(libm_ARCH_fpu_OUT)/%.o,$(libm_ARCH_SRC))
++endif
+ 
+ libm_ARCH_OBJS:=$(libm_ARCH_OBJ)
+ 
+-- 
+1.7.0.4
+
-- 
1.7.3.4
