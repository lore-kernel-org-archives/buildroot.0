From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 15:59:28 +0100
Subject: [Buildroot] [git commit] uclibc: add various upstream patches
Message-ID: <20161210145941.8251980797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41e5c94c5661afcff45d222551f317a3b84b17d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix some static linking issues for Xtensa/Blackfin.
Optimize the size for non-threaded static binaries and
fix static C/C++ applications when running on the target.
Fix noMMU madvise declarations.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...s-linux-common-madvise.c-disable-on-noMMU.patch | 31 ++++++++
 ...-mman.h-remove-madvise-posix_madvise-prot.patch | 36 ++++++++++
 package/uclibc/0003-bfin-fix-a-gcc-warning.patch   | 25 +++++++
 ...4-fix-static-linking-for-FDPIC-toolchains.patch | 49 +++++++++++++
 .../uclibc/0005-xtensa-fix-static-linking.patch    | 60 ++++++++++++++++
 ...ads-optimize-single-threaded-applications.patch | 83 ++++++++++++++++++++++
 6 files changed, 284 insertions(+)

diff --git a/package/uclibc/0001-libc-sysdeps-linux-common-madvise.c-disable-on-noMMU.patch b/package/uclibc/0001-libc-sysdeps-linux-common-madvise.c-disable-on-noMMU.patch
new file mode 100644
index 0000000..bc97153
--- /dev/null
+++ b/package/uclibc/0001-libc-sysdeps-linux-common-madvise.c-disable-on-noMMU.patch
@@ -0,0 +1,31 @@
+From bf7a84dc1fd8c9c340222260cb3e53019715088c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 7 Dec 2016 23:18:49 +0100
+Subject: [PATCH] libc/sysdeps/linux/common/madvise.c: disable on noMMU
+ architectures
+
+Similar to what was done in commit
+9945c6d21797553e78cbef8034f6dd16b3824df5 for posix_madvise().
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ libc/sysdeps/linux/common/madvise.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libc/sysdeps/linux/common/madvise.c b/libc/sysdeps/linux/common/madvise.c
+index e953d7b..bb486d2 100644
+--- a/libc/sysdeps/linux/common/madvise.c
++++ b/libc/sysdeps/linux/common/madvise.c
+@@ -9,6 +9,8 @@
+ 
+ #include <sys/syscall.h>
+ #include <sys/mman.h>
++#ifdef __ARCH_USE_MMU__
+ #if defined __NR_madvise && defined __USE_BSD
+ _syscall3(int, madvise, void *, __addr, size_t, __len, int, __advice)
++#endif /* __ARCH_USE_MMU__ */
+ #endif
+-- 
+2.1.4
+
diff --git a/package/uclibc/0002-include-sys-mman.h-remove-madvise-posix_madvise-prot.patch b/package/uclibc/0002-include-sys-mman.h-remove-madvise-posix_madvise-prot.patch
new file mode 100644
index 0000000..1d0d8a6
--- /dev/null
+++ b/package/uclibc/0002-include-sys-mman.h-remove-madvise-posix_madvise-prot.patch
@@ -0,0 +1,36 @@
+From 25a60624713990c637f125e094e968ff4655307c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 7 Dec 2016 23:20:18 +0100
+Subject: [PATCH] include/sys/mman.h: remove madvise/posix_madvise
+ prototypes on noMMU
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ include/sys/mman.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/include/sys/mman.h b/include/sys/mman.h
+index 71d553a..fc8fce5 100644
+--- a/include/sys/mman.h
++++ b/include/sys/mman.h
+@@ -99,6 +99,7 @@ static __inline__ int msync (void *__addr, size_t __len, int __flags) { return 0
+ 
+ #endif
+ 
++#ifdef __ARCH_USE_MMU__
+ #if defined __USE_BSD && (defined __UCLIBC_LINUX_SPECIFIC__ || defined __UCLIBC_HAS_THREADS_NATIVE__)
+ /* Advise the system about particular usage patterns the program follows
+    for the region starting at ADDR and extending LEN bytes.  */
+@@ -108,6 +109,8 @@ extern int madvise (void *__addr, size_t __len, int __advice) __THROW;
+ /* This is the POSIX name for this function.  */
+ extern int posix_madvise (void *__addr, size_t __len, int __advice) __THROW;
+ #endif
++#endif /* __ARCH_USE_MMU__ */
++
+ 
+ #if defined __UCLIBC_HAS_REALTIME__
+ # ifdef __ARCH_USE_MMU__
+-- 
+2.1.4
+
diff --git a/package/uclibc/0003-bfin-fix-a-gcc-warning.patch b/package/uclibc/0003-bfin-fix-a-gcc-warning.patch
new file mode 100644
index 0000000..2463e6c
--- /dev/null
+++ b/package/uclibc/0003-bfin-fix-a-gcc-warning.patch
@@ -0,0 +1,25 @@
+From 1f79f41508d0f9c30be812bea9b84fd7900a273e Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Thu, 8 Dec 2016 04:07:47 +0100
+Subject: [PATCH] bfin: fix a gcc warning
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ ldso/ldso/bfin/dl-sysdep.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ldso/ldso/bfin/dl-sysdep.h b/ldso/ldso/bfin/dl-sysdep.h
+index 5758117..4262a26 100644
+--- a/ldso/ldso/bfin/dl-sysdep.h
++++ b/ldso/ldso/bfin/dl-sysdep.h
+@@ -93,6 +93,6 @@ static __always_inline void
+ elf_machine_relative (DL_LOADADDR_TYPE load_off, const Elf32_Addr rel_addr,
+ 		      Elf32_Word relative_count)
+ {
+-	return 0;
++	return;
+ }
+ #endif
+-- 
+2.1.4
+
diff --git a/package/uclibc/0004-fix-static-linking-for-FDPIC-toolchains.patch b/package/uclibc/0004-fix-static-linking-for-FDPIC-toolchains.patch
new file mode 100644
index 0000000..3dc778f
--- /dev/null
+++ b/package/uclibc/0004-fix-static-linking-for-FDPIC-toolchains.patch
@@ -0,0 +1,49 @@
+From 569914be2e968a1bda8b4982ca97c1524635174e Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Thu, 8 Dec 2016 04:36:10 +0100
+Subject: [PATCH] fix static linking for FDPIC toolchains
+
+Fixes following problem, when trying to compile a simple
+C application statically with a FDPIC toolchain (for example
+with Blackfin architecture):
+lib/libc.a(libdl.os): In function `do_dlclose':
+(.text+0x6be): undefined reference to `_dl_free'
+..
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ ldso/libdl/libdl.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/ldso/libdl/libdl.c b/ldso/libdl/libdl.c
+index 0cf3b70..04d7c43 100644
+--- a/ldso/libdl/libdl.c
++++ b/ldso/libdl/libdl.c
+@@ -30,6 +30,14 @@
+  */
+ 
+ 
++/* When libdl is linked in statically into libc.a, we need to replace
++ * these symbols that otherwise would have been loaded in from ldso.
++ * This must be before including ldso.h */
++#ifndef SHARED
++#define _dl_malloc malloc
++#define _dl_free free
++#endif
++
+ #include <ldso.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -86,9 +94,6 @@ extern char *_dl_debug;
+ 
+ #else /* !SHARED */
+ 
+-#define _dl_malloc malloc
+-#define _dl_free free
+-
+ /* When libdl is linked as a static library, we need to replace all
+  * the symbols that otherwise would have been loaded in from ldso... */
+ 
+-- 
+2.1.4
+
diff --git a/package/uclibc/0005-xtensa-fix-static-linking.patch b/package/uclibc/0005-xtensa-fix-static-linking.patch
new file mode 100644
index 0000000..7a96bf7
--- /dev/null
+++ b/package/uclibc/0005-xtensa-fix-static-linking.patch
@@ -0,0 +1,60 @@
+From 6579597083e608f5a66fe8a898d113c2588e2c8f Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Wed, 7 Dec 2016 07:59:34 +0100
+Subject: [PATCH] xtensa: fix static linking
+
+uClibc-ng 1.0.20 fixed static linking with "libdl" by adding all libdl functions
+into the libc. On xtensa, though, libdl contains an unresolved reference that is
+satisfied by the ld.so - which is not a part of the linking in a static case.
+
+Signed-off-by: Alexey Neyman <stilor@att.net>
+Acked-by: Max Filippov <jcmvbkbc@gmail.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ libpthread/nptl/sysdeps/Makefile.commonarch      | 5 +++--
+ libpthread/nptl/sysdeps/xtensa/Makefile.arch     | 2 +-
+ libpthread/nptl/sysdeps/xtensa/libc-dl-tlsdesc.S | 1 +
+ 3 files changed, 5 insertions(+), 3 deletions(-)
+ create mode 100644 libpthread/nptl/sysdeps/xtensa/libc-dl-tlsdesc.S
+
+diff --git a/libpthread/nptl/sysdeps/Makefile.commonarch b/libpthread/nptl/sysdeps/Makefile.commonarch
+index c206ac9..134eade 100644
+--- a/libpthread/nptl/sysdeps/Makefile.commonarch
++++ b/libpthread/nptl/sysdeps/Makefile.commonarch
+@@ -32,10 +32,11 @@ libpthread_arch_SOBJ = $(patsubst %.S,$(libpthread_arch_OUT)/%.o,$(libpthread_ar
+ libpthread_arch_OBJS = $(libpthread_subarch_OBJS) $(libpthread_arch_COBJ) $(libpthread_arch_SOBJ)
+ 
+ libc_arch_COBJ = $(patsubst %.c,$(libpthread_arch_OUT)/%.o,$(libc_arch_CSRC))
+-libc_arch_SOBJ = $(patsubst %.c,$(libpthread_arch_OUT)/%.o,$(libc_arch_SSRC))
++libc_arch_SOBJ = $(patsubst %.S,$(libpthread_arch_OUT)/%.o,$(libc_arch_SSRC))
+ libc_arch_OBJS = $(libc_arch_COBJ) $(libc_arch_SOBJ)
+ libc_arch_a_COBJ = $(patsubst %.c,$(libpthread_arch_OUT)/%.o,$(libc_arch_a_CSRC))
+-libc_arch_a_OBJS = $(libc_arch_a_COBJ)
++libc_arch_a_SOBJ = $(patsubst %.S,$(libpthread_arch_OUT)/%.o,$(libc_arch_a_SSRC))
++libc_arch_a_OBJS = $(libc_arch_a_COBJ) $(libc_arch_a_SOBJ)
+ 
+ librt_arch_COBJ = $(patsubst %.c,$(libpthread_arch_OUT)/%.o,$(librt_arch_CSRC))
+ librt_arch_SOBJ = $(patsubst %.S,$(libpthread_arch_OUT)/%.o,$(librt_arch_SSRC))
+diff --git a/libpthread/nptl/sysdeps/xtensa/Makefile.arch b/libpthread/nptl/sysdeps/xtensa/Makefile.arch
+index 9e63b19..642e4ba 100644
+--- a/libpthread/nptl/sysdeps/xtensa/Makefile.arch
++++ b/libpthread/nptl/sysdeps/xtensa/Makefile.arch
+@@ -20,7 +20,7 @@ ASFLAGS-pthread_spin_lock.S = -DNOT_IN_libc -DIS_IN_libpthread
+ ASFLAGS-pthread_spin_trylock.S = -DNOT_IN_libc -DIS_IN_libpthread
+ 
+ libc_arch_a_CSRC = libc-tls.c
+-librt_arch_a_SSRC = dl-tlsdesc.S
++libc_arch_a_SSRC = libc-dl-tlsdesc.S
+ 
+ CFLAGS-gen_tlsdesc.c = -S
+ $(libpthread_arch_OUT)/gen_tlsdesc.c: $(libpthread_arch_DIR)/tlsdesc.sym | $(libpthread_arch_OUT)
+diff --git a/libpthread/nptl/sysdeps/xtensa/libc-dl-tlsdesc.S b/libpthread/nptl/sysdeps/xtensa/libc-dl-tlsdesc.S
+new file mode 100644
+index 0000000..39da7c2
+--- /dev/null
++++ b/libpthread/nptl/sysdeps/xtensa/libc-dl-tlsdesc.S
+@@ -0,0 +1 @@
++#include <ldso/ldso/xtensa/dl-tlsdesc.S>
+-- 
+2.1.4
+
diff --git a/package/uclibc/0006-threads-optimize-single-threaded-applications.patch b/package/uclibc/0006-threads-optimize-single-threaded-applications.patch
new file mode 100644
index 0000000..2983820
--- /dev/null
+++ b/package/uclibc/0006-threads-optimize-single-threaded-applications.patch
@@ -0,0 +1,83 @@
+From 5ca03df6978345c297225212cc0ca33d476b0272 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Wed, 7 Dec 2016 07:56:44 +0100
+Subject: [PATCH] threads: optimize single threaded applications
+
+Revert the removal of the weak pthread functions and
+guarantee a link order so that single threaded applications
+doesn't link in all the pthread functions they don't use.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Tested-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ libc/misc/internals/Makefile.in     |  4 +++-
+ libc/misc/internals/__uClibc_main.c | 37 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 40 insertions(+), 1 deletion(-)
+
+diff --git a/libc/misc/internals/Makefile.in b/libc/misc/internals/Makefile.in
+index ae094ee..ce7f75a 100644
+--- a/libc/misc/internals/Makefile.in
++++ b/libc/misc/internals/Makefile.in
+@@ -25,7 +25,9 @@ libc-shared-y += $(MISC_INTERNALS_OUT)/__uClibc_main.oS
+ else
+ libc-shared-y += $(MISC_INTERNALS_OUT)/__uClibc_main.os
+ endif
+-libc-static-y += $(MISC_INTERNALS_OUT)/__uClibc_main.o
++# link order is important to not pull in pthread functions, when
++# a single threaded application is statically linked
++libc-static-y := $(MISC_INTERNALS_OUT)/__uClibc_main.o $(libc-static-y)
+ libc-static-$(UCLIBC_FORMAT_FLAT_SEP_DATA) += \
+   $(MISC_INTERNALS_OUT)/shared_flat_initfini.o \
+   $(MISC_INTERNALS_OUT)/shared_flat_add_library.o
+diff --git a/libc/misc/internals/__uClibc_main.c b/libc/misc/internals/__uClibc_main.c
+index 46e24d8..d80565e 100644
+--- a/libc/misc/internals/__uClibc_main.c
++++ b/libc/misc/internals/__uClibc_main.c
+@@ -68,6 +68,43 @@ uintptr_t __stack_chk_guard attribute_relro;
+ 
+ void internal_function _dl_aux_init (ElfW(auxv_t) *av);
+ 
++#ifdef __UCLIBC_HAS_THREADS__
++/*
++ * uClibc internal locking requires that we have weak aliases
++ * for dummy functions in case a single threaded application is linked.
++ * This needs to be in compilation unit that is pulled always
++ * in or linker will disregard these weaks.
++ */
++
++static int __pthread_return_0 (pthread_mutex_t *unused) { return 0; }
++weak_alias (__pthread_return_0, __pthread_mutex_lock)
++weak_alias (__pthread_return_0, __pthread_mutex_trylock)
++weak_alias (__pthread_return_0, __pthread_mutex_unlock)
++
++int weak_function
++__pthread_mutex_init(pthread_mutex_t *mutex, const pthread_mutexattr_t *attr)
++{
++        return 0;
++}
++
++void weak_function
++_pthread_cleanup_push_defer(struct _pthread_cleanup_buffer *__buffer,
++                            void (*__routine) (void *), void *__arg)
++{
++        __buffer->__routine = __routine;
++        __buffer->__arg = __arg;
++}
++
++void weak_function
++_pthread_cleanup_pop_restore(struct _pthread_cleanup_buffer *__buffer,
++                             int __execute)
++{
++        if (__execute)
++                __buffer->__routine(__buffer->__arg);
++}
++
++#endif /* __UCLIBC_HAS_THREADS__ */
++
+ #endif /* !SHARED */
+ 
+ /* Defeat compiler optimization which assumes function addresses are never NULL */
+-- 
+2.1.4
+
