From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 30 Dec 2019 21:27:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: Replace libtirpc
 patch with simple removing files
Message-ID: <20191230202750.12541-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We delete files anyway, so let's use this way instead of applying patch.

Since libtirpc update to 1.2.5 commit message in patch was wrong anyway
(libtirpc patch 0005-Disable-DES-authentification-support.patch was
replaced by upstream solution).

NOTE: upstream will probably delete these tests anyway [1], but even if
it does until next LTP release it's IMHO better to remove files instead
backporting it.

[1] https://lists.linux.it/pipermail/ltp/2019-December/014856.html

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...ble-tirpc_auth_authdes_-create-tests.patch | 36 -------------------
 package/ltp-testsuite/ltp-testsuite.mk        | 12 ++++---
 2 files changed, 8 insertions(+), 40 deletions(-)
 delete mode 100644 package/ltp-testsuite/0001-rpc-tirpc-disable-tirpc_auth_authdes_-create-tests.patch

diff --git a/package/ltp-testsuite/0001-rpc-tirpc-disable-tirpc_auth_authdes_-create-tests.patch b/package/ltp-testsuite/0001-rpc-tirpc-disable-tirpc_auth_authdes_-create-tests.patch
deleted file mode 100644
index 6fe2d6e72b..0000000000
--- a/package/ltp-testsuite/0001-rpc-tirpc-disable-tirpc_auth_authdes_-create-tests.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9bbadb7ece1b068465279e7248b3439d443054a6 Mon Sep 17 00:00:00 2001
-From: Erico Nunes <nunes.erico@gmail.com>
-Date: Fri, 30 Sep 2016 17:43:08 +0200
-Subject: [PATCH] rpc-tirpc: disable tirpc_auth_authdes_*create tests
-
-Due to Buildroot patch 0005-Disable-DES-authentification-support.patch on
-libtirpc, this library is built without method authdes_create. Any code
-that uses this library, like the rpc-tirpc testsuite, thus fails to link.
-
-In the context of Buildroot, instead of disabling ltp-testsuite entirely,
-just disable the problematic tests.
-
-Upstream-status: not applicable
-Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-[Erico: Rebase for ltp 20160920]
-Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
----
- testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile
-index 45bc8a6..c04a088 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile
-@@ -19,4 +19,8 @@
- top_srcdir		?= ../../../../../../..
- 
- include	$(top_srcdir)/include/mk/env_pre.mk
-+
-+FILTER_OUT_DIRS += tirpc_auth_authdes_seccreate \
-+		   tirpc_auth_authdes_create
-+
- include $(top_srcdir)/include/mk/generic_trunk_target.mk
--- 
-2.7.4
-
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index ce02cc4e98..0d81afc2a4 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -62,13 +62,18 @@ LTP_TESTSUITE_CONF_ENV += \
 	LIBS="$(LTP_TESTSUITE_LIBS)" \
 	SYSROOT="$(STAGING_DIR)"
 
+# libtirpc 1.2.5 has by default authdes disabled
+LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
+	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/ \
+	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/
+
 # uclibc: bessel support normally not enabled
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
+LTP_TESTSUITE_UNSUPPORTED_TEST_CASES += \
 	testcases/misc/math/float/bessel/ \
-	testcases/misc/math/float/float_bessel.c
+	testcases/misc/math/float/float_bessel.c \
 else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
+LTP_TESTSUITE_UNSUPPORTED_TEST_CASES += \
 	testcases/kernel/pty/pty01.c \
 	testcases/kernel/pty/pty02.c \
 	testcases/kernel/pty/ptem01.c \
@@ -97,7 +102,6 @@ LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
 	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_svc_unregister/ \
 	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/ \
 	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/ \
-	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/ \
 	utils/benchmark/ebizzy-0.3
 endif
 
-- 
2.24.0
