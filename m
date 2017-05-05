From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 May 2017 10:43:59 +0200
Subject: [Buildroot] [git commit] qemu: fix user mode emulation build on ARM
Message-ID: <20170505084457.A036A7FA2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40c5fff46629ac4f0f55165f9c3594980a4700ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch that adjusts how the mcontext structure is used
on ARM with a uClibc C library.

Fixes:

  http://autobuild.buildroot.net/results/79900b22c190e883b6d9a3075e1286ec95840ae1/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ix-usage-of-mcontext-structure-on-ARM-uCl.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch b/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
new file mode 100644
index 0000000..6d6d024
--- /dev/null
+++ b/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
@@ -0,0 +1,35 @@
+From d3f1e7e9ff9aae3f770b0bcb9aa3c2f787f76a1b Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 5 May 2017 09:07:15 +0200
+Subject: [PATCH] user-exec: fix usage of mcontext structure on ARM/uClibc
+
+user-exec.c has some conditional code to decide how to use the
+mcontext structure. Unfortunately, since uClibc defines __GLIBC__, but
+with old versions of __GLIBC__ and __GLIBC_MINOR__, an old code path
+gets used, which doesn't apply to uClibc.
+
+Fix this by excluding __UCLIBC__, which ensures we fall back to the
+general case of using uc_mcontext.arm_pc, which works fine with
+uClibc.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ user-exec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/user-exec.c b/user-exec.c
+index 6db0758..2b3d116 100644
+--- a/user-exec.c
++++ b/user-exec.c
+@@ -409,7 +409,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
+ 
+ #if defined(__NetBSD__)
+     pc = uc->uc_mcontext.__gregs[_REG_R15];
+-#elif defined(__GLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
++#elif defined(__GLIBC__) && !defined(__UCLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
+     pc = uc->uc_mcontext.gregs[R15];
+ #else
+     pc = uc->uc_mcontext.arm_pc;
+-- 
+2.7.4
+
