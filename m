From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Sep 2017 18:17:31 +0200
Subject: [Buildroot] [PATCH v2 02/11] package/gcc: fix build issue with
 glibc 2.26
In-Reply-To: <20170902205423.21288-3-romain.naour@gmail.com>
References: <20170902205423.21288-1-romain.naour@gmail.com>
 <20170902205423.21288-3-romain.naour@gmail.com>
Message-ID: <20170917161731.GF2930@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2017-09-02 22:54 +0200, Romain Naour spake thusly:
> ../../../../libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc: In function ?int __sanitizer::TracerThread(void*)?:
> ../../../../libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc:241:22: error: aggregate ?sigaltstack handler_stack? has incomplete type and cannot be defined
>    struct sigaltstack handler_stack;
> 
> ../../../../libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc: In function ?int __sanitizer::TracerThread(void*)?:
> ../../../../libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc:276:22: error: aggregate ?sigaltstack handler_stack? has incomplete type and cannot be defined
>    struct sigaltstack handler_stack;
>                       ^~~~~~~~~~~~~
> 
> The fix is already included in gcc 7.2 release [1]. We have to backport it to
> all older gcc release since it's not included in any stable release yet.
> 
> [1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=72edc2c02f8b4768ad660f46a1c7e2400c0a8e06
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gcc/4.9.4/944-sanitizer-linux.patch | 88 +++++++++++++++++++++++++++++
>  package/gcc/5.4.0/944-sanitizer-linux.patch | 87 ++++++++++++++++++++++++++++

For gcc-5:
    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=833e00c01e96f61e24cd7ec97b93fad212dc914b

>  package/gcc/6.4.0/943-sanitizer-linux.patch | 87 ++++++++++++++++++++++++++++

For gcc-6:
    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=8937b94d1a643fd9760714642296d034a45254a8

As discused on IRC: for gcc-4.9, either we re-introduce a glibc version
choice, or we make glibc depends on gcc_at_least_5, or we keep your
back-ported patch.

I'm fine with either, as well as also ditching gcc-4.9. ;-)

Regards,
Yann E. MORIN.

>  3 files changed, 262 insertions(+)
>  create mode 100644 package/gcc/4.9.4/944-sanitizer-linux.patch
>  create mode 100644 package/gcc/5.4.0/944-sanitizer-linux.patch
>  create mode 100644 package/gcc/6.4.0/943-sanitizer-linux.patch
> 
> diff --git a/package/gcc/4.9.4/944-sanitizer-linux.patch b/package/gcc/4.9.4/944-sanitizer-linux.patch
> new file mode 100644
> index 0000000..caadf2d
> --- /dev/null
> +++ b/package/gcc/4.9.4/944-sanitizer-linux.patch
> @@ -0,0 +1,88 @@
> +From f9a35ba5c150da2e381c4cab01f8f12bcd6af5d2 Mon Sep 17 00:00:00 2001
> +From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Mon, 17 Jul 2017 19:41:08 +0000
> +Subject: [PATCH] 	Backported from mainline 	2017-07-14  Jakub
> + Jelinek  <jakub@redhat.com>
> +
> +	PR sanitizer/81066
> +	* sanitizer_common/sanitizer_linux.h: Cherry-pick upstream r307969.
> +	* sanitizer_common/sanitizer_linux.cc: Likewise.
> +	* sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc: Likewise.
> +	* tsan/tsan_platform_linux.cc: Likewise.
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch at 250287 138bc75d-0d04-0410-961f-82ee72b054a4
> +(cherry picked from commit 72edc2c02f8b4768ad660f46a1c7e2400c0a8e06)
> +[Romain backport to 4.9.4]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + libsanitizer/sanitizer_common/sanitizer_linux.cc                      | 3 +--
> + libsanitizer/sanitizer_common/sanitizer_linux.h                       | 4 +---
> + libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc | 2 +-
> + libsanitizer/tsan/tsan_platform_linux.cc                              | 2 +-
> + 4 files changed, 4 insertions(+), 7 deletions(-)
> +
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_linux.cc b/libsanitizer/sanitizer_common/sanitizer_linux.cc
> +index 69c9c10..8e53673 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_linux.cc
> ++++ b/libsanitizer/sanitizer_common/sanitizer_linux.cc
> +@@ -599,8 +599,7 @@ uptr internal_prctl(int option, uptr arg2, uptr arg3, uptr arg4, uptr arg5) {
> +   return internal_syscall(__NR_prctl, option, arg2, arg3, arg4, arg5);
> + }
> + 
> +-uptr internal_sigaltstack(const struct sigaltstack *ss,
> +-                         struct sigaltstack *oss) {
> ++uptr internal_sigaltstack(const void *ss, void *oss) {
> +   return internal_syscall(__NR_sigaltstack, (uptr)ss, (uptr)oss);
> + }
> + 
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_linux.h b/libsanitizer/sanitizer_common/sanitizer_linux.h
> +index 6422df1..8e111d1 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_linux.h
> ++++ b/libsanitizer/sanitizer_common/sanitizer_linux.h
> +@@ -18,7 +18,6 @@
> + #include "sanitizer_platform_limits_posix.h"
> + 
> + struct link_map;  // Opaque type returned by dlopen().
> +-struct sigaltstack;
> + 
> + namespace __sanitizer {
> + // Dirent structure for getdents(). Note that this structure is different from
> +@@ -28,8 +27,7 @@ struct linux_dirent;
> + // Syscall wrappers.
> + uptr internal_getdents(fd_t fd, struct linux_dirent *dirp, unsigned int count);
> + uptr internal_prctl(int option, uptr arg2, uptr arg3, uptr arg4, uptr arg5);
> +-uptr internal_sigaltstack(const struct sigaltstack* ss,
> +-                          struct sigaltstack* oss);
> ++uptr internal_sigaltstack(const void* ss, void* oss);
> + uptr internal_sigaction(int signum, const __sanitizer_kernel_sigaction_t *act,
> +     __sanitizer_kernel_sigaction_t *oldact);
> + uptr internal_sigprocmask(int how, __sanitizer_kernel_sigset_t *set,
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc b/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
> +index 6ee63ec..50c21a3 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
> ++++ b/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
> +@@ -238,7 +238,7 @@ static int TracerThread(void* argument) {
> + 
> +   // Alternate stack for signal handling.
> +   InternalScopedBuffer<char> handler_stack_memory(kHandlerStackSize);
> +-  struct sigaltstack handler_stack;
> ++  stack_t handler_stack;
> +   internal_memset(&handler_stack, 0, sizeof(handler_stack));
> +   handler_stack.ss_sp = handler_stack_memory.data();
> +   handler_stack.ss_size = kHandlerStackSize;
> +diff --git a/libsanitizer/tsan/tsan_platform_linux.cc b/libsanitizer/tsan/tsan_platform_linux.cc
> +index fe69430..49f5270 100644
> +--- a/libsanitizer/tsan/tsan_platform_linux.cc
> ++++ b/libsanitizer/tsan/tsan_platform_linux.cc
> +@@ -351,7 +351,7 @@ bool IsGlobalVar(uptr addr) {
> + // closes within glibc. The code is a pure hack.
> + int ExtractResolvFDs(void *state, int *fds, int nfd) {
> +   int cnt = 0;
> +-  __res_state *statp = (__res_state*)state;
> ++  struct __res_state *statp = (struct __res_state*)state;
> +   for (int i = 0; i < MAXNS && cnt < nfd; i++) {
> +     if (statp->_u._ext.nsaddrs[i] && statp->_u._ext.nssocks[i] != -1)
> +       fds[cnt++] = statp->_u._ext.nssocks[i];
> +-- 
> +2.9.5
> +
> diff --git a/package/gcc/5.4.0/944-sanitizer-linux.patch b/package/gcc/5.4.0/944-sanitizer-linux.patch
> new file mode 100644
> index 0000000..bbeb3c7
> --- /dev/null
> +++ b/package/gcc/5.4.0/944-sanitizer-linux.patch
> @@ -0,0 +1,87 @@
> +From 659b130df028d6e580c9e7f87ff61f67cfb3e0a3 Mon Sep 17 00:00:00 2001
> +From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Mon, 17 Jul 2017 19:41:08 +0000
> +Subject: [PATCH] 	Backported from mainline 	2017-07-14  Jakub
> + Jelinek  <jakub@redhat.com>
> +
> +	PR sanitizer/81066
> +	* sanitizer_common/sanitizer_linux.h: Cherry-pick upstream r307969.
> +	* sanitizer_common/sanitizer_linux.cc: Likewise.
> +	* sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc: Likewise.
> +	* tsan/tsan_platform_linux.cc: Likewise.
> +
> +[Romain cherry-pick on gcc-6-branch from gcc-7-branch]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch at 250287 138bc75d-0d04-0410-961f-82ee72b054a4
> +---
> + libsanitizer/sanitizer_common/sanitizer_linux.cc                      | 3 +--
> + libsanitizer/sanitizer_common/sanitizer_linux.h                       | 4 +---
> + libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc | 2 +-
> + libsanitizer/tsan/tsan_platform_linux.cc                              | 2 +-
> + 4 files changed, 4 insertions(+), 7 deletions(-)
> +
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_linux.cc b/libsanitizer/sanitizer_common/sanitizer_linux.cc
> +index 9feb307..821b26d 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_linux.cc
> ++++ b/libsanitizer/sanitizer_common/sanitizer_linux.cc
> +@@ -514,8 +514,7 @@ uptr internal_prctl(int option, uptr arg2, uptr arg3, uptr arg4, uptr arg5) {
> + }
> + #endif
> + 
> +-uptr internal_sigaltstack(const struct sigaltstack *ss,
> +-                         struct sigaltstack *oss) {
> ++uptr internal_sigaltstack(const void *ss, void *oss) {
> +   return internal_syscall(SYSCALL(sigaltstack), (uptr)ss, (uptr)oss);
> + }
> + 
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_linux.h b/libsanitizer/sanitizer_common/sanitizer_linux.h
> +index 086834c..3a6f4cd 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_linux.h
> ++++ b/libsanitizer/sanitizer_common/sanitizer_linux.h
> +@@ -18,7 +18,6 @@
> + #include "sanitizer_platform_limits_posix.h"
> + 
> + struct link_map;  // Opaque type returned by dlopen().
> +-struct sigaltstack;
> + 
> + namespace __sanitizer {
> + // Dirent structure for getdents(). Note that this structure is different from
> +@@ -27,8 +26,7 @@ struct linux_dirent;
> + 
> + // Syscall wrappers.
> + uptr internal_getdents(fd_t fd, struct linux_dirent *dirp, unsigned int count);
> +-uptr internal_sigaltstack(const struct sigaltstack* ss,
> +-                          struct sigaltstack* oss);
> ++uptr internal_sigaltstack(const void* ss, void* oss);
> + uptr internal_sigprocmask(int how, __sanitizer_sigset_t *set,
> +     __sanitizer_sigset_t *oldset);
> + void internal_sigfillset(__sanitizer_sigset_t *set);
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc b/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
> +index 5881202..c54894d 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
> ++++ b/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
> +@@ -234,7 +234,7 @@ static int TracerThread(void* argument) {
> + 
> +   // Alternate stack for signal handling.
> +   InternalScopedBuffer<char> handler_stack_memory(kHandlerStackSize);
> +-  struct sigaltstack handler_stack;
> ++  stack_t handler_stack;
> +   internal_memset(&handler_stack, 0, sizeof(handler_stack));
> +   handler_stack.ss_sp = handler_stack_memory.data();
> +   handler_stack.ss_size = kHandlerStackSize;
> +diff --git a/libsanitizer/tsan/tsan_platform_linux.cc b/libsanitizer/tsan/tsan_platform_linux.cc
> +index 3259131..b8e9078 100644
> +--- a/libsanitizer/tsan/tsan_platform_linux.cc
> ++++ b/libsanitizer/tsan/tsan_platform_linux.cc
> +@@ -377,7 +377,7 @@ bool IsGlobalVar(uptr addr) {
> + int ExtractResolvFDs(void *state, int *fds, int nfd) {
> + #if SANITIZER_LINUX
> +   int cnt = 0;
> +-  __res_state *statp = (__res_state*)state;
> ++  struct __res_state *statp = (struct __res_state*)state;
> +   for (int i = 0; i < MAXNS && cnt < nfd; i++) {
> +     if (statp->_u._ext.nsaddrs[i] && statp->_u._ext.nssocks[i] != -1)
> +       fds[cnt++] = statp->_u._ext.nssocks[i];
> +-- 
> +2.9.5
> +
> diff --git a/package/gcc/6.4.0/943-sanitizer-linux.patch b/package/gcc/6.4.0/943-sanitizer-linux.patch
> new file mode 100644
> index 0000000..8c83f7e
> --- /dev/null
> +++ b/package/gcc/6.4.0/943-sanitizer-linux.patch
> @@ -0,0 +1,87 @@
> +From 0fa7102d76376b27ae4bbc10848600aac6ed71d2 Mon Sep 17 00:00:00 2001
> +From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Mon, 17 Jul 2017 19:41:08 +0000
> +Subject: [PATCH] 	Backported from mainline 	2017-07-14  Jakub
> + Jelinek  <jakub@redhat.com>
> +
> +	PR sanitizer/81066
> +	* sanitizer_common/sanitizer_linux.h: Cherry-pick upstream r307969.
> +	* sanitizer_common/sanitizer_linux.cc: Likewise.
> +	* sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc: Likewise.
> +	* tsan/tsan_platform_linux.cc: Likewise.
> +
> +[Romain cherry-pick on gcc-6-branch from gcc-7-branch]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch at 250287 138bc75d-0d04-0410-961f-82ee72b054a4
> +---
> + libsanitizer/sanitizer_common/sanitizer_linux.cc                      | 3 +--
> + libsanitizer/sanitizer_common/sanitizer_linux.h                       | 4 +---
> + libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc | 2 +-
> + libsanitizer/tsan/tsan_platform_linux.cc                              | 2 +-
> + 4 files changed, 4 insertions(+), 7 deletions(-)
> +
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_linux.cc b/libsanitizer/sanitizer_common/sanitizer_linux.cc
> +index 2cefa20..223d9c6 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_linux.cc
> ++++ b/libsanitizer/sanitizer_common/sanitizer_linux.cc
> +@@ -546,8 +546,7 @@ uptr internal_prctl(int option, uptr arg2, uptr arg3, uptr arg4, uptr arg5) {
> + }
> + #endif
> + 
> +-uptr internal_sigaltstack(const struct sigaltstack *ss,
> +-                         struct sigaltstack *oss) {
> ++uptr internal_sigaltstack(const void *ss, void *oss) {
> +   return internal_syscall(SYSCALL(sigaltstack), (uptr)ss, (uptr)oss);
> + }
> + 
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_linux.h b/libsanitizer/sanitizer_common/sanitizer_linux.h
> +index 4497702..1594058 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_linux.h
> ++++ b/libsanitizer/sanitizer_common/sanitizer_linux.h
> +@@ -19,7 +19,6 @@
> + #include "sanitizer_platform_limits_posix.h"
> + 
> + struct link_map;  // Opaque type returned by dlopen().
> +-struct sigaltstack;
> + 
> + namespace __sanitizer {
> + // Dirent structure for getdents(). Note that this structure is different from
> +@@ -28,8 +27,7 @@ struct linux_dirent;
> + 
> + // Syscall wrappers.
> + uptr internal_getdents(fd_t fd, struct linux_dirent *dirp, unsigned int count);
> +-uptr internal_sigaltstack(const struct sigaltstack* ss,
> +-                          struct sigaltstack* oss);
> ++uptr internal_sigaltstack(const void* ss, void* oss);
> + uptr internal_sigprocmask(int how, __sanitizer_sigset_t *set,
> +     __sanitizer_sigset_t *oldset);
> + void internal_sigfillset(__sanitizer_sigset_t *set);
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc b/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
> +index c919e4f..014162af 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
> ++++ b/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
> +@@ -267,7 +267,7 @@ static int TracerThread(void* argument) {
> + 
> +   // Alternate stack for signal handling.
> +   InternalScopedBuffer<char> handler_stack_memory(kHandlerStackSize);
> +-  struct sigaltstack handler_stack;
> ++  stack_t handler_stack;
> +   internal_memset(&handler_stack, 0, sizeof(handler_stack));
> +   handler_stack.ss_sp = handler_stack_memory.data();
> +   handler_stack.ss_size = kHandlerStackSize;
> +diff --git a/libsanitizer/tsan/tsan_platform_linux.cc b/libsanitizer/tsan/tsan_platform_linux.cc
> +index 09cec5f..908f4fe 100644
> +--- a/libsanitizer/tsan/tsan_platform_linux.cc
> ++++ b/libsanitizer/tsan/tsan_platform_linux.cc
> +@@ -291,7 +291,7 @@ bool IsGlobalVar(uptr addr) {
> + int ExtractResolvFDs(void *state, int *fds, int nfd) {
> + #if SANITIZER_LINUX
> +   int cnt = 0;
> +-  __res_state *statp = (__res_state*)state;
> ++  struct __res_state *statp = (struct __res_state*)state;
> +   for (int i = 0; i < MAXNS && cnt < nfd; i++) {
> +     if (statp->_u._ext.nsaddrs[i] && statp->_u._ext.nssocks[i] != -1)
> +       fds[cnt++] = statp->_u._ext.nssocks[i];
> +-- 
> +2.9.4
> +
> -- 
> 2.9.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
