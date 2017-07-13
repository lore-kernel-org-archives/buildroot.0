From: Oleksandr Zhadan <oleks@arcturusnetworks.com>
Date: Thu, 13 Jul 2017 12:38:17 -0400
Subject: [Buildroot] [PATCH 1/1] board/arcturus/ppc-ucp1020 new gcc-6.x
	Linux kernel build fix
Message-ID: <20170713163817.7114-1-oleks@arcturusnetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the Linux-3.18 patch "powerpc/ptrace: Fix out of bounds array access warning" to the board/arcturus/ppc-ucp1020 BSP

" gcc-6 correctly warns about a out of bounds access

arch/powerpc/kernel/ptrace.c:407:24: warning: index 32 denotes an offset greater than size of 'u64[32][1] {aka long long unsigned int[32][1]}' [-Warray-bounds]
        offsetof(struct thread_fp_state, fpr[32][0]));
                        ^

check the end of array instead of beginning of next element to fix this"

Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>
---
 ...ce-Fix-out-of-bounds-array-access-warning.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 board/arcturus/ppc-ucp1020/patches/linux/0003-powerpc-ptrace-Fix-out-of-bounds-array-access-warning.patch

diff --git a/board/arcturus/ppc-ucp1020/patches/linux/0003-powerpc-ptrace-Fix-out-of-bounds-array-access-warning.patch b/board/arcturus/ppc-ucp1020/patches/linux/0003-powerpc-ptrace-Fix-out-of-bounds-array-access-warning.patch
new file mode 100644
index 000000000..29d2b71fa
--- /dev/null
+++ b/board/arcturus/ppc-ucp1020/patches/linux/0003-powerpc-ptrace-Fix-out-of-bounds-array-access-warning.patch
@@ -0,0 +1,52 @@
+From 35b7ce4f8f290794d3b89db7461e8c568b5defa1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Apr 2016 09:19:17 -0700
+Subject: powerpc/ptrace: Fix out of bounds array access warning
+
+commit 1e407ee3b21f981140491d5b8a36422979ca246f upstream.
+
+gcc-6 correctly warns about a out of bounds access
+
+arch/powerpc/kernel/ptrace.c:407:24: warning: index 32 denotes an offset greater than size of 'u64[32][1] {aka long long unsigned int[32][1]}' [-Warray-bounds]
+        offsetof(struct thread_fp_state, fpr[32][0]));
+                        ^
+
+check the end of array instead of beginning of next element to fix this
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Kees Cook <keescook@chromium.org>
+Cc: Michael Ellerman <mpe@ellerman.id.au>
+Cc: Segher Boessenkool <segher@kernel.crashing.org>
+Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>
+Acked-by: Olof Johansson <olof@lixom.net>
+Cc: Arnd Bergmann <arnd@arndb.de>
+Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/powerpc/kernel/ptrace.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
+index f21897b..93f200f 100644
+--- a/arch/powerpc/kernel/ptrace.c
++++ b/arch/powerpc/kernel/ptrace.c
+@@ -376,7 +376,7 @@ static int fpr_get(struct task_struct *target, const struct user_regset *regset,
+ 
+ #else
+ 	BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
+-		     offsetof(struct thread_fp_state, fpr[32][0]));
++		     offsetof(struct thread_fp_state, fpr[32]));
+ 
+ 	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+ 				   &target->thread.fp_state, 0, -1);
+@@ -404,7 +404,7 @@ static int fpr_set(struct task_struct *target, const struct user_regset *regset,
+ 	return 0;
+ #else
+ 	BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
+-		     offsetof(struct thread_fp_state, fpr[32][0]));
++		     offsetof(struct thread_fp_state, fpr[32]));
+ 
+ 	return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+ 				  &target->thread.fp_state, 0, -1);
+-- 
+cgit v1.1
-- 
2.11.0
