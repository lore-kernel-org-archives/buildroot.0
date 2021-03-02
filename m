From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 2 Mar 2021 23:55:46 +0100
Subject: [Buildroot] [git commit] package/libopenssl: fix build on riscv32
Message-ID: <20210302223516.DBD148012C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2bb26c1a1d24cdbb946bc2a77680dbc8f9c0d537
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

riscv32 is (surprise!) a 32-bit architecture. But it has been Y2038-safe
from its inception. As such, there are no legacy binaries that may use
the 32-bit time syscalls, and thus they are not available on riscv32.

Code that directly calls to the syscalls without using the C libraries
wrappers thus need to handle this case by themselves.

Backport a patch from the upstream openssl development branch that will
eventually be openssl 3.0, but has not yet been backported to the 1.1.1
stable branch.

Fixes:
    http://autobuild.buildroot.org/results/eb9/eb9a64d4ffae8569b5225083f282cf87ffa7c681/
    ...
    http://autobuild.buildroot.org/results/07e/07e413b24ba8adc9558c80267ce16dda339bf032/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-support-for-io_pgetevents_time64-syscall.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/libopenssl/0006-Add-support-for-io_pgetevents_time64-syscall.patch b/package/libopenssl/0006-Add-support-for-io_pgetevents_time64-syscall.patch
new file mode 100644
index 0000000000..ab552de91a
--- /dev/null
+++ b/package/libopenssl/0006-Add-support-for-io_pgetevents_time64-syscall.patch
@@ -0,0 +1,63 @@
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
+[yann.morin.1998 at free.fr: backport from upstream 3.0 branch]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
