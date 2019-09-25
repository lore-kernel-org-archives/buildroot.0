From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 23:02:32 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/uclibc: backport
 patch to remove asm constraint on sparc
Message-ID: <20190925211449.3E0EE8F6F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63a2eb7bbedd14d055653b43674dc948ed8b8f4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

uClibc-ng don't build with gcc 9.1 [1] on sparc due to a new check
that "catch illegal asm constraint usage" [2]. This issue has been
fixed in upstream uclibc-ng, so we simply backport the fix.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Thomas: backport the patch that was applied to upstream uclibc-ng]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 08d25f394266eea15c64ed5c583d6af86103166f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../uclibc/0004-sparc-remove-asm-constraint.patch  | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/uclibc/0004-sparc-remove-asm-constraint.patch b/package/uclibc/0004-sparc-remove-asm-constraint.patch
new file mode 100644
index 0000000000..2fbe8cda51
--- /dev/null
+++ b/package/uclibc/0004-sparc-remove-asm-constraint.patch
@@ -0,0 +1,40 @@
+From 75a1a2a9fec8a310a18ff7d63ead95f3a0d1b11b Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 24 May 2019 12:42:04 +0200
+Subject: [PATCH] sparc: remove asm constraint
+
+uClibc-ng don't build with gcc 9.1 [1] due to a new check that
+"catch illegal asm constraint usage" [2].
+gcc 9.1 print this error:
+"invalid hard register usage between earlyclobber operand and input operand"
+The asm constraint is present in uClibc since it support sparc (back in 2002)[3].
+Note: There is no such constraint is Glibc counterpart code [4].
+[1] https://gitlab.com/kubu93/toolchains-builder/-/jobs/205435757
+[2] https://github.com/gcc-mirror/gcc/commit/b782636f28f5c378897c238081d28d7a4a6ca578
+[3] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=3b6d086531102b6d09ce852feb1e370d5dca3ce9
+[4]
++https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/sparc/sysdep.h;h=981b2a26b7a91093f821c97876
++e55bc4be2d9f8a;hb=HEAD
+
+(cherry picked from commit c2eaf6c30d930b65a8bcf5f912ef8873a6f4eb20)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ libc/sysdeps/linux/sparc/bits/syscalls.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libc/sysdeps/linux/sparc/bits/syscalls.h b/libc/sysdeps/linux/sparc/bits/syscalls.h
+index 75af7a157..28edc0568 100644
+--- a/libc/sysdeps/linux/sparc/bits/syscalls.h
++++ b/libc/sysdeps/linux/sparc/bits/syscalls.h
+@@ -33,7 +33,7 @@
+             register long __g1 __asm__("g1") = sys_num;     \
+             LOAD_ARGS_##nr(args)                            \
+             __asm__ __volatile__( __SYSCALL_STRING          \
+-                : "=r" (__res), "=&r" (__o0)                \
++                : "=r" (__res), "=r" (__o0)                \
+                 : "1" (__o0) ASM_ARGS_##nr, "r" (__g1)     \
+                 : __SYSCALL_CLOBBERS );                                   \
+         }                                                   \
+-- 
+2.21.0
+
