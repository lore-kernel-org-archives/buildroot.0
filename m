From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 18 Oct 2019 00:14:41 +0200
Subject: [Buildroot] [PATCH v2 1/1] ltp-testsuite: Enable build under musl
Message-ID: <20191017221441.1445-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This requires to remove a lot of broken code until it's fixed in upstream.
Added 2 patches from upcoming release.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...ine-_GNU_SOURCE-to-fix-build-on-musl.patch | 27 ++++++++++
 ...x-missing-__kernel_fsid_t-definition.patch | 41 +++++++++++++++
 package/ltp-testsuite/Config.in               |  5 +-
 package/ltp-testsuite/ltp-testsuite.mk        | 50 ++++++++++++++++---
 4 files changed, 114 insertions(+), 9 deletions(-)
 create mode 100644 package/ltp-testsuite/0003-setxattr03-define-_GNU_SOURCE-to-fix-build-on-musl.patch
 create mode 100644 package/ltp-testsuite/0004-fanotify-Fix-missing-__kernel_fsid_t-definition.patch

diff --git a/package/ltp-testsuite/0003-setxattr03-define-_GNU_SOURCE-to-fix-build-on-musl.patch b/package/ltp-testsuite/0003-setxattr03-define-_GNU_SOURCE-to-fix-build-on-musl.patch
new file mode 100644
index 0000000000..6b76926a39
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
+[Upstream status: 3d2b9ef91f32a0a1794a8a05b825b18c6f956b0c]
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
index 0000000000..7450a0af9c
--- /dev/null
+++ b/package/ltp-testsuite/0004-fanotify-Fix-missing-__kernel_fsid_t-definition.patch
@@ -0,0 +1,41 @@
+From b8aebc83523691be2b37e87c62099d700b0473c7 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Mon, 14 Oct 2019 15:35:53 +0200
+Subject: [PATCH] fanotify: Fix missing __kernel_fsid_t definition
+
+which is needed for fallback definition when FAN_REPORT_FID is missing.
+Instead of including <asm/posix_types.h> where it's defined we just
+define the missing bit.
+
+This fixes build error at least on musl.
+
+Acked-by: Cyril Hrubis <chrubis@suse.cz>
+Acked-by: Jan Stancek <jstancek@redhat.com>
+Suggested-by: Jan Stancek <jstancek@redhat.com>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[Upstream status: b8aebc83523691be2b37e87c62099d700b0473c7]
+---
+ testcases/kernel/syscalls/fanotify/fanotify.h | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
+index 1c7623d3b..435f100d8 100644
+--- a/testcases/kernel/syscalls/fanotify/fanotify.h
++++ b/testcases/kernel/syscalls/fanotify/fanotify.h
+@@ -126,6 +126,13 @@ struct fanotify_event_info_header {
+ };
+ 
+ #ifdef HAVE_NAME_TO_HANDLE_AT
++#ifndef __kernel_fsid_t
++typedef struct {
++	int	val[2];
++} lapi_fsid_t;
++#define __kernel_fsid_t lapi_fsid_t
++#endif
++
+ struct fanotify_event_info_fid {
+ 	struct fanotify_event_info_header hdr;
+ 	__kernel_fsid_t fsid;
+-- 
+2.23.0
+
diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 500a8c2688..32e1b6ad76 100644
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
@@ -21,7 +20,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
 
 	  http://linux-test-project.github.io
 
-comment "ltp-testsuite needs a glibc or uClibc toolchain w/ NPTL"
+comment "ltp-testsuite needs a toolchain w/ NPTL"
 	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 0c850d2b67..2ab2cd726e 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -62,15 +62,53 @@ LTP_TESTSUITE_CONF_ENV += \
 	LIBS="$(LTP_TESTSUITE_LIBS)" \
 	SYSROOT="$(STAGING_DIR)"
 
-# Requires uClibc bessel support, normally not enabled
+# uclibc: bessel support normally not enabled
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-define LTP_TESTSUITE_REMOVE_UNSUPPORTED
-	rm -rf $(@D)/testcases/misc/math/float/bessel/
-	rm -f $(@D)/testcases/misc/math/float/float_bessel.c
-endef
-LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_UNSUPPORTED
+LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
+	testcases/misc/math/float/bessel/ \
+	testcases/misc/math/float/float_bessel.c
+else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
+	testcases/kernel/pty/pty01.c \
+	testcases/kernel/pty/pty02.c \
+	testcases/kernel/pty/ptem01.c \
+	testcases/kernel/sched/process_stress/process.c \
+	testcases/kernel/syscalls/accept4/accept4_01.c \
+	testcases/kernel/syscalls/confstr/confstr01.c \
+	testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
+	testcases/kernel/syscalls/getcontext/getcontext01.c \
+	testcases/kernel/syscalls/getdents/getdents01.c \
+	testcases/kernel/syscalls/getdents/getdents02.c \
+	testcases/kernel/syscalls/ioctl/ioctl01.c \
+	testcases/kernel/syscalls/ioctl/ioctl02.c \
+	testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
+	testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c \
+	testcases/kernel/syscalls/timer_create/timer_create01.c \
+	testcases/kernel/syscalls/timer_create/timer_create03.c \
+	testcases/misc/crash/crash01.c \
+	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcraw_create/ \
+	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svctcp_create/ \
+	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svctcp_create/ \
+	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_bufcreate/ \
+	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_create/ \
+	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_create/ \
+	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_registerrpc/ \
+	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_svc_register/ \
+	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_svc_unregister/ \
+	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/ \
+	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/ \
+	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/ \
+	utils/benchmark/ebizzy-0.3
 endif
 
+define LTP_TESTSUITE_REMOVE_UNSUPPORTED_TESTCASES
+	$(foreach f,$(LTP_TESTSUITE_UNSUPPORTED_TEST_CASES),
+		rm -rf $(@D)/$(f)
+	)
+endef
+
+LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_UNSUPPORTED_TESTCASES
+
 # ldd command build system tries to build a shared library unconditionally.
 ifeq ($(BR2_STATIC_LIBS),y)
 define LTP_TESTSUITE_REMOVE_LDD
-- 
2.23.0
