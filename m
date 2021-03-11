From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Mar 2021 21:22:09 +0100
Subject: [Buildroot] [git commit] package/libopenssl: fix build wrt. 64-bit
 time-related syscalls & structs
Message-ID: <20210311195954.3C08888D0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=359c5c266aeb4db533634494e6970c8bc99de380
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

riscv32 is (surprise!) a 32-bit architecture. But it has been Y2038-safe
from its inception. As such, there are no legacy binaries that may use
the 32-bit time syscalls, and thus they are not available on riscv32.

Code that directly calls to the syscalls without using the C libraries
wrappers thus need to handle this case by themselves.

Backport two cumulative patches from the upstream openssl development
branch that will eventually be openssl 3.0, but has not yet been
backported to the 1.1.1 stable branch.

Fixes:
    http://autobuild.buildroot.org/results/eb9/eb9a64d4ffae8569b5225083f282cf87ffa7c681/
    ...
    http://autobuild.buildroot.org/results/07e/07e413b24ba8adc9558c80267ce16dda339bf032/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Mark Corbin <mark@dibsco.co.uk>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-support-for-io_pgetevents_time64-syscall.patch | 61 ++++++++++++++
 ...-support-for-io_pgetevents_time64-syscall.patch | 98 ++++++++++++++++++++++
 2 files changed, 159 insertions(+)

diff --git a/package/libopenssl/0006-Add-support-for-io_pgetevents_time64-syscall.patch b/package/libopenssl/0006-Add-support-for-io_pgetevents_time64-syscall.patch
new file mode 100644
index 0000000000..0f59fa648e
--- /dev/null
+++ b/package/libopenssl/0006-Add-support-for-io_pgetevents_time64-syscall.patch
@@ -0,0 +1,61 @@
+From 5b5e2985f355c8e99c196d9ce5d02c15bebadfbc Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Thu, 29 Aug 2019 13:56:21 -0700
+Subject: [PATCH] Add support for io_pgetevents_time64 syscall
+
+32-bit architectures that are y2038 safe don't include syscalls that use
+32-bit time_t. Instead these architectures have suffixed syscalls that
+always use a 64-bit time_t. In the case of the io_getevents syscall the
+syscall has been replaced with the io_pgetevents_time64 syscall instead.
+
+This patch changes the io_getevents() function to use the correct
+syscall based on the avaliable syscalls and the time_t size. We will
+only use the new 64-bit time_t syscall if the architecture is using a
+64-bit time_t. This is to avoid having to deal with 32/64-bit
+conversions and relying on a 64-bit timespec struct on 32-bit time_t
+platforms. As of Linux 5.3 there are no 32-bit time_t architectures
+without __NR_io_getevents. In the future if a 32-bit time_t architecture
+wants to use the 64-bit syscalls we can handle the conversion.
+
+This fixes build failures on 32-bit RISC-V.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+Reviewed-by: Paul Dale <paul.dale@oracle.com>
+(Merged from https://github.com/openssl/openssl/pull/9819)
+---
+ engines/e_afalg.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/engines/e_afalg.c b/engines/e_afalg.c
+index dacbe358cb..99516cb1bb 100644
+--- a/engines/e_afalg.c
++++ b/engines/e_afalg.c
+@@ -125,7 +125,23 @@ static ossl_inline int io_getevents(aio_context_t ctx, long min, long max,
+                                struct io_event *events,
+                                struct timespec *timeout)
+ {
++#if defined(__NR_io_getevents)
+     return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
++#elif defined(__NR_io_pgetevents_time64)
++    /* Let's only support the 64 suffix syscalls for 64-bit time_t.
++     * This simplifies the code for us as we don't need to use a 64-bit
++     * version of timespec with a 32-bit time_t and handle converting
++     * between 64-bit and 32-bit times and check for overflows.
++     */
++    if (sizeof(timeout->tv_sec) == 8)
++        return syscall(__NR_io_pgetevents_time64, ctx, min, max, events, timeout, NULL);
++    else {
++        errno = ENOSYS;
++        return -1;
++    }
++#else
++# error "We require either the io_getevents syscall or __NR_io_pgetevents_time64."
++#endif
+ }
+ 
+ static void afalg_waitfd_cleanup(ASYNC_WAIT_CTX *ctx, const void *key,
+-- 
+2.25.1
+
diff --git a/package/libopenssl/0007-Fixup-support-for-io_pgetevents_time64-syscall.patch b/package/libopenssl/0007-Fixup-support-for-io_pgetevents_time64-syscall.patch
new file mode 100644
index 0000000000..4313eecd6d
--- /dev/null
+++ b/package/libopenssl/0007-Fixup-support-for-io_pgetevents_time64-syscall.patch
@@ -0,0 +1,98 @@
+From e5499a3cac1e823c3e0697e8667e952317b70cc8 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Thu, 4 Mar 2021 12:10:11 -0500
+Subject: [PATCH] Fixup support for io_pgetevents_time64 syscall
+
+This is a fixup for the original commit 5b5e2985f355c8e99c196d9ce5d02c15bebadfbc
+"Add support for io_pgetevents_time64 syscall" that didn't correctly
+work for 32-bit architecutres with a 64-bit time_t that aren't RISC-V.
+
+For a full discussion of the issue see:
+https://github.com/openssl/openssl/commit/5b5e2985f355c8e99c196d9ce5d02c15bebadfbc
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+Reviewed-by: Paul Dale <pauli@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/14432)
+---
+ engines/e_afalg.c | 55 ++++++++++++++++++++++++++++++++++++-----------
+ 1 file changed, 42 insertions(+), 13 deletions(-)
+
+diff --git a/engines/e_afalg.c b/engines/e_afalg.c
+index 9480d7c24b..4e9d67db2d 100644
+--- a/engines/e_afalg.c
++++ b/engines/e_afalg.c
+@@ -124,27 +124,56 @@ static ossl_inline int io_read(aio_context_t ctx, long n, struct iocb **iocb)
+     return syscall(__NR_io_submit, ctx, n, iocb);
+ }
+ 
++/* A version of 'struct timespec' with 32-bit time_t and nanoseconds.  */
++struct __timespec32
++{
++  __kernel_long_t tv_sec;
++  __kernel_long_t tv_nsec;
++};
++
+ static ossl_inline int io_getevents(aio_context_t ctx, long min, long max,
+                                struct io_event *events,
+                                struct timespec *timeout)
+ {
++#if defined(__NR_io_pgetevents_time64)
++    /* Check if we are a 32-bit architecture with a 64-bit time_t */
++    if (sizeof(*timeout) != sizeof(struct __timespec32)) {
++        int ret = syscall(__NR_io_pgetevents_time64, ctx, min, max, events,
++                          timeout, NULL);
++        if (ret == 0 || errno != ENOSYS)
++            return ret;
++    }
++#endif
++
+ #if defined(__NR_io_getevents)
+-    return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
+-#elif defined(__NR_io_pgetevents_time64)
+-    /* Let's only support the 64 suffix syscalls for 64-bit time_t.
+-     * This simplifies the code for us as we don't need to use a 64-bit
+-     * version of timespec with a 32-bit time_t and handle converting
+-     * between 64-bit and 32-bit times and check for overflows.
+-     */
+-    if (sizeof(timeout->tv_sec) == 8)
+-        return syscall(__NR_io_pgetevents_time64, ctx, min, max, events, timeout, NULL);
++    if (sizeof(*timeout) == sizeof(struct __timespec32))
++        /*
++         * time_t matches our architecture length, we can just use
++         * __NR_io_getevents
++         */
++        return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
+     else {
+-        errno = ENOSYS;
+-        return -1;
++        /*
++         * We don't have __NR_io_pgetevents_time64, but we are using a
++         * 64-bit time_t on a 32-bit architecture. If we can fit the
++         * timeout value in a 32-bit time_t, then let's do that
++         * and then use the __NR_io_getevents syscall.
++         */
++        if (timeout && timeout->tv_sec == (long)timeout->tv_sec) {
++            struct __timespec32 ts32;
++
++            ts32.tv_sec = (__kernel_long_t) timeout->tv_sec;
++            ts32.tv_nsec = (__kernel_long_t) timeout->tv_nsec;
++
++            return syscall(__NR_io_getevents, ctx, min, max, events, ts32);
++        } else {
++            return syscall(__NR_io_getevents, ctx, min, max, events, NULL);
++        }
+     }
+-#else
+-# error "We require either the io_getevents syscall or __NR_io_pgetevents_time64."
+ #endif
++
++    errno = ENOSYS;
++    return -1;
+ }
+ 
+ static void afalg_waitfd_cleanup(ASYNC_WAIT_CTX *ctx, const void *key,
+-- 
+2.25.1
+
