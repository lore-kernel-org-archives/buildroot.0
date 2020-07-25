From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 26 Jul 2020 00:06:41 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/glibc: use __has_include instead
 of __has_include__
In-Reply-To: <20200725220641.1370957-1-romain.naour@gmail.com>
References: <20200725220641.1370957-1-romain.naour@gmail.com>
Message-ID: <20200725220641.1370957-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport upstream commit to use __has_include:
https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=28dd3939221ab26c6774097e9596e30d9753f758

Otherwise glibc fail to build with gcc 10:

warning: "__has_include__" is not defined, evaluates to 0 [-Wundef]
../sysdeps/unix/sysv/linux/riscv/flush-icache.c:24:21: error: missing binary operator before token "("
   24 | #if __has_include__ (<asm/syscalls.h>)
      |                     ^

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/655618374

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
---
 ...001-riscv-Do-not-use-__has_include__.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/0001-riscv-Do-not-use-__has_include__.patch

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
-- 
2.25.4
