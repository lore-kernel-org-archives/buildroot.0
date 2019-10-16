From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 16 Oct 2019 23:34:23 +0200
Subject: [Buildroot] [PATCH 1/1] ltp-testsuite: Enable build under musl
Message-ID: <20191016213423.24782-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This requires to remove a lot of broken code until it's fixed in upstream.
Added 2 not-yet-upstreamed patch.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

tested also Fabrice's patch "package/ltp-testsuite: fix static build
with lts-musl" [1].

./utils/test-pkg -k -p ltp-testsuite
                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK

Kind regards,
Petr

[1] http://patchwork.ozlabs.org/patch/1176510/

 ...ine-_GNU_SOURCE-to-fix-build-on-musl.patch | 27 +++++++++++++
 ...x-missing-__kernel_fsid_t-definition.patch | 31 +++++++++++++++
 package/ltp-testsuite/Config.in               |  3 +-
 package/ltp-testsuite/ltp-testsuite.mk        | 38 ++++++++++++++++++-
 4 files changed, 95 insertions(+), 4 deletions(-)
 create mode 100644 package/ltp-testsuite/0003-setxattr03-define-_GNU_SOURCE-to-fix-build-on-musl.patch
 create mode 100644 package/ltp-testsuite/0004-fanotify-Fix-missing-__kernel_fsid_t-definition.patch

diff --git a/package/ltp-testsuite/0003-setxattr03-define-_GNU_SOURCE-to-fix-build-on-musl.patch b/package/ltp-testsuite/0003-setxattr03-define-_GNU_SOURCE-to-fix-build-on-musl.patch
new file mode 100644
index 0000000000..66071363d8
--- /dev/null
+++ b/package/ltp-testsuite/0003-setxattr03-define-_GNU_SOURCE-to-fix-build-on-musl.patch
@@ -0,0 +1,27 @@
+From a712a3930d98336f4a0931ae06da691b7fa0ecd7 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Mon, 14 Oct 2019 13:02:55 +0200
+Subject: [PATCH] setxattr03: define _GNU_SOURCE to fix build on musl
+
+musl defines loff_t in <fcntl.h> and guard it under _GNU_SOURCE.
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[Upstream status: https://patchwork.ozlabs.org/patch/1178188/]
+---
+ testcases/kernel/syscalls/setxattr/setxattr03.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/testcases/kernel/syscalls/setxattr/setxattr03.c b/testcases/kernel/syscalls/setxattr/setxattr03.c
+index bb511d5ba..58ee0f880 100644
+--- a/testcases/kernel/syscalls/setxattr/setxattr03.c
++++ b/testcases/kernel/syscalls/setxattr/setxattr03.c
+@@ -13,6 +13,7 @@
+  *    -1 and set errno to EPERM
+  */
+
++#define _GNU_SOURCE
+ #include "config.h"
+ #include <sys/ioctl.h>
+ #include <sys/types.h>
+--
+2.23.0
diff --git a/package/ltp-testsuite/0004-fanotify-Fix-missing-__kernel_fsid_t-definition.patch b/package/ltp-testsuite/0004-fanotify-Fix-missing-__kernel_fsid_t-definition.patch
new file mode 100644
index 0000000000..229e8b60a5
--- /dev/null
+++ b/package/ltp-testsuite/0004-fanotify-Fix-missing-__kernel_fsid_t-definition.patch
@@ -0,0 +1,31 @@
+From 24c076311fec7d52972861d23bf9cd0a44057490 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Mon, 14 Oct 2019 15:35:53 +0200
+Subject: [PATCH] fanotify: Fix missing __kernel_fsid_t definition
+
+which is missing at least on musl which doesn't have FAN_REPORT_FID
+support.
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[Upstream status: https://patchwork.ozlabs.org/patch/1178182/]
+---
+ testcases/kernel/syscalls/fanotify/fanotify.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
+index 1c7623d3b..1b955a5ed 100644
+--- a/testcases/kernel/syscalls/fanotify/fanotify.h
++++ b/testcases/kernel/syscalls/fanotify/fanotify.h
+@@ -35,6 +35,10 @@
+ #include <errno.h>
+ #include <fcntl.h>
+
++#if !defined(FAN_REPORT_FID) && defined(HAVE_NAME_TO_HANDLE_AT)
++#include <asm/posix_types.h> // __kernel_fsid_t
++#endif
++
+ #if defined(HAVE_SYS_FANOTIFY_H)
+
+ #include <sys/fanotify.h>
+--
+2.23.0
diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 500a8c2688..c062b90fb1 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -12,7 +12,6 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
@@ -24,4 +23,4 @@ config BR2_PACKAGE_LTP_TESTSUITE
 comment "ltp-testsuite needs a glibc or uClibc toolchain w/ NPTL"
 	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 0c850d2b67..a9fa017135 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -64,11 +64,45 @@ LTP_TESTSUITE_CONF_ENV += \
 
 # Requires uClibc bessel support, normally not enabled
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-define LTP_TESTSUITE_REMOVE_UNSUPPORTED
+define LTP_TESTSUITE_REMOVE_UNSUPPORTED_UCLIBC
 	rm -rf $(@D)/testcases/misc/math/float/bessel/
 	rm -f $(@D)/testcases/misc/math/float/float_bessel.c
 endef
-LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_UNSUPPORTED
+LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_UNSUPPORTED_UCLIBC
+else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+define LTP_TESTSUITE_REMOVE_UNSUPPORTED_MUSL
+	rm -rf $(@D)/testcases/kernel/pty/pty01.c
+	rm -rf $(@D)/testcases/kernel/pty/pty02.c
+	rm -rf $(@D)/testcases/kernel/pty/ptem01.c
+	rm -rf $(@D)/testcases/kernel/sched/process_stress/process.c
+	rm -rf $(@D)/testcases/kernel/syscalls/accept4/accept4_01.c
+	rm -rf $(@D)/testcases/kernel/syscalls/confstr/confstr01.c
+	rm -rf $(@D)/testcases/kernel/syscalls/fmtmsg/fmtmsg01.c
+	rm -rf $(@D)/testcases/kernel/syscalls/getcontext/getcontext01.c
+	rm -rf $(@D)/testcases/kernel/syscalls/getdents/getdents01.c
+	rm -rf $(@D)/testcases/kernel/syscalls/getdents/getdents02.c
+	rm -rf $(@D)/testcases/kernel/syscalls/ioctl/ioctl01.c
+	rm -rf $(@D)/testcases/kernel/syscalls/ioctl/ioctl02.c
+	rm -rf $(@D)/testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c
+	rm -rf $(@D)/testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c
+	rm -rf $(@D)/testcases/kernel/syscalls/timer_create/timer_create01.c
+	rm -rf $(@D)/testcases/kernel/syscalls/timer_create/timer_create03.c
+	rm -rf $(@D)/testcases/misc/crash/crash01.c
+	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcraw_create/
+	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svctcp_create/
+	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svctcp_create/
+	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_bufcreate/
+	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_create/
+	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_create/
+	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_registerrpc/
+	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_svc_register/
+	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_svc_unregister/
+	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/
+	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/
+	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/
+	rm -rf $(@D)/utils/benchmark/ebizzy-0.3
+endef
+LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_UNSUPPORTED_MUSL
 endif
 
 # ldd command build system tries to build a shared library unconditionally.
-- 
2.23.0
