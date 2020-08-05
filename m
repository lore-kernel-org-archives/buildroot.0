From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 23:14:39 +0200
Subject: [Buildroot] [git commit] package/glibc: fix build on RISC-V with
 gcc 10.x
Message-ID: <20200805210912.F24338158A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ea05ebd1951237626d5c2d97e0f600a0607b322
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport upstream commit to use __has_include:
https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=28dd3939221ab26c6774097e9596e30d9753f758

Otherwise glibc fails to build with gcc 10:

warning: "__has_include__" is not defined, evaluates to 0 [-Wundef]
../sysdeps/unix/sysv/linux/riscv/flush-icache.c:24:21: error: missing binary operator before token "("
   24 | #if __has_include__ (<asm/syscalls.h>)
      |                     ^

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/655618374

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-riscv-Do-not-use-__has_include__.patch    | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/0001-riscv-Do-not-use-__has_include__.patch b/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/0001-riscv-Do-not-use-__has_include__.patch
new file mode 100644
index 0000000000..93159e9a7b
--- /dev/null
+++ b/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/0001-riscv-Do-not-use-__has_include__.patch
@@ -0,0 +1,28 @@
+From 28dd3939221ab26c6774097e9596e30d9753f758 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Thu, 6 Jun 2019 11:24:32 +0200
+Subject: [PATCH] riscv: Do not use __has_include__
+
+The user-visible preprocessor construct is called __has_include.
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ sysdeps/unix/sysv/linux/riscv/flush-icache.c | 2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/sysdeps/unix/sysv/linux/riscv/flush-icache.c b/sysdeps/unix/sysv/linux/riscv/flush-icache.c
+index cd5c400977..f2dfcc50d0 100644
+--- a/sysdeps/unix/sysv/linux/riscv/flush-icache.c
++++ b/sysdeps/unix/sysv/linux/riscv/flush-icache.c
+@@ -21,7 +21,7 @@
+ #include <stdlib.h>
+ #include <atomic.h>
+ #include <sys/cachectl.h>
+-#if __has_include__ (<asm/syscalls.h>)
++#if __has_include (<asm/syscalls.h>)
+ # include <asm/syscalls.h>
+ #else
+ # include <asm/unistd.h>
+-- 
+2.25.4
+
