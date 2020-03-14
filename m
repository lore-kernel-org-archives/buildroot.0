From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:33:07 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/lxc: fix build
 with ultrasparc
Message-ID: <20200314172109.54EFF8392B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d25de05e100474b525a2efdb95620fa00bed30b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixes:
 - http://autobuild.buildroot.org/results/17c2319850f02f24da6fbef9656c07f86fdc5a3a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 71d6e2cc054a3961c2357ac44ff961bc00829949)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...src-lxc-raw_syscalls.c-fix-sparc-assembly.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/lxc/0003-src-lxc-raw_syscalls.c-fix-sparc-assembly.patch b/package/lxc/0003-src-lxc-raw_syscalls.c-fix-sparc-assembly.patch
new file mode 100644
index 0000000000..4de07ddada
--- /dev/null
+++ b/package/lxc/0003-src-lxc-raw_syscalls.c-fix-sparc-assembly.patch
@@ -0,0 +1,41 @@
+From 5f7dd076fe203ebe6992698b63a1856a98bc0bba Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 28 Feb 2020 17:35:42 +0100
+Subject: [PATCH] src/lxc/raw_syscalls.c: fix sparc assembly
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Build of lxc 3.2.1 fails with ultrasparc on:
+
+raw_syscalls.c: In function ???lxc_raw_clone???:
+raw_syscalls.c:66:3: error: invalid 'asm': invalid operand output code
+   asm volatile(
+   ^~~
+
+Issue has been added with commit
+b52e8e68a61866da2af86e85905ec850f8a8b7fc which added %g1 instead of %%g1
+
+Fixes:
+ - http://autobuild.buildroot.org/results/17c2319850f02f24da6fbef9656c07f86fdc5a3a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/lxc/lxc/commit/5f7dd076fe203ebe6992698b63a1856a98bc0bba]
+---
+ src/lxc/raw_syscalls.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lxc/raw_syscalls.c b/src/lxc/raw_syscalls.c
+index 7ffb2584b8..bfa48c0348 100644
+--- a/src/lxc/raw_syscalls.c
++++ b/src/lxc/raw_syscalls.c
+@@ -76,7 +76,7 @@ __returns_twice pid_t lxc_raw_clone(unsigned long flags, int *pidfd)
+ 		     * processor status register (psr) is used instead of a
+ 		     * full register.
+ 		     */
+-		    "addx %%g0, 0, %g1"
++		    "addx %%g0, 0, %%g1"
+ 		    : "=r"(g1), "=r"(o0), "=r"(o1), "=r"(o2) /* outputs */
+ 		    : "r"(g1), "r"(o0), "r"(o1), "r"(o2)     /* inputs */
+ 		    : "%cc");				     /* clobbers */
