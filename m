From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jan 2019 21:09:02 +0100
Subject: [Buildroot] [git commit] package/strace: fix build for no-MMU
 targets
Message-ID: <20190108200949.CE06E812A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10f902368b2a484747e50a0f14a71f8b0c102b40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest strace version bump added a call to fork() which breaks build
for no-MMU. Add a patch that removes the unneeded fork() call on no-MMU.

Fixes:
http://autobuild.buildroot.net/results/4a0/4a0e2872b27be93f73137c7550eae1c1f479c160/
http://autobuild.buildroot.net/results/747/74711084a54dfc17ad0d4d1e5faabf6d8a605dca/

Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../strace/0001-Fix-build-for-no-MMU-targets.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/strace/0001-Fix-build-for-no-MMU-targets.patch b/package/strace/0001-Fix-build-for-no-MMU-targets.patch
new file mode 100644
index 0000000000..1464fb697d
--- /dev/null
+++ b/package/strace/0001-Fix-build-for-no-MMU-targets.patch
@@ -0,0 +1,49 @@
+From 1b657bf8e2f4bf6f80b969b220900003d7ecbce6 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 8 Jan 2019 18:28:37 +0200
+Subject: [PATCH] Fix build for no-MMU targets
+
+Commit 7488ce9e23f1 ("Check whether PTRACE_GET_SYSCALL_INFO is supported
+by the kernel") added a fork() call in test_ptrace_get_syscall_info()
+which is included in the main strace executable code. Although the
+test_ptrace_get_syscall_info() routine is not called on no-MMU targets,
+the compiler can't optimize it out because it is a global symbol. So
+build for no-MMU targets currently fails:
+
+strace-ptrace_syscall_info.o: In function `test_ptrace_get_syscall_info':
+ptrace_syscall_info.c:(.text+0x1c): undefined reference to `fork'
+
+Make the test_ptrace_get_syscall_info() definition depend on HAVE_FORK
+to fix that.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status:
+https://lists.strace.io/pipermail/strace-devel/2019-January/008596.html
+
+ ptrace_syscall_info.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ptrace_syscall_info.c b/ptrace_syscall_info.c
+index 55eafddf7f71..cc6ce149649e 100644
+--- a/ptrace_syscall_info.c
++++ b/ptrace_syscall_info.c
+@@ -40,6 +40,7 @@ static const unsigned int expected_seccomp_size =
+  * Test that PTRACE_GET_SYSCALL_INFO API is supported by the kernel, and
+  * that the semantics implemented in the kernel matches our expectations.
+  */
++#ifdef HAVE_FORK
+ bool
+ test_ptrace_get_syscall_info(void)
+ {
+@@ -255,6 +256,7 @@ done:
+ 
+ 	return ptrace_get_syscall_info_supported;
+ }
++#endif /* HAVE_FORK */
+ 
+ void
+ print_ptrace_syscall_info(struct tcb *tcp, kernel_ulong_t addr,
+-- 
+2.20.1
+
