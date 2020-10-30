From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 30 Oct 2020 08:50:43 +0100
Subject: [Buildroot] [PATCH 6/8] package/optee-test: bump to version 3.11.0
In-Reply-To: <20201030075045.6960-1-etienne.carriere@linaro.org>
References: <20201030075045.6960-1-etienne.carriere@linaro.org>
Message-ID: <20201030075045.6960-6-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump OP-TEE Test package version to OP-TEE release 3.11.0.
Add dependency on BR2_INSTALL_LIBSTDCPP since C++ support is needed
to build some OP-TEE test trusted applications.
Remove local patch files since issues addressed since.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 ...-xtest-fix-generic-argument-handling.patch | 32 -------------
 ...-1027-1028-skip-tests-when-test-leve.patch | 47 -------------------
 package/optee-test/Config.in                  |  6 ++-
 package/optee-test/optee-test.hash            |  4 +-
 package/optee-test/optee-test.mk              |  2 +-
 5 files changed, 7 insertions(+), 84 deletions(-)
 delete mode 100644 package/optee-test/0001-xtest-fix-generic-argument-handling.patch
 delete mode 100644 package/optee-test/0002-xtest-regression-1027-1028-skip-tests-when-test-leve.patch

diff --git a/package/optee-test/0001-xtest-fix-generic-argument-handling.patch b/package/optee-test/0001-xtest-fix-generic-argument-handling.patch
deleted file mode 100644
index c61dc49c5c..0000000000
--- a/package/optee-test/0001-xtest-fix-generic-argument-handling.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From e1af176af2bb274745e9b0d43456763f8946f107 Mon Sep 17 00:00:00 2001
-From: Etienne Carriere <etienne.carriere@linaro.org>
-Date: Mon, 25 May 2020 13:09:59 +0200
-Subject: [PATCH] xtest: fix generic argument handling
-
-Fix position of last generic argument badly handled that makes -d, -l or
--t argument being treated also as if it was the first test ID to consider
-in the filtered test IDs list.
-
-Fixes: 66542a1bb4e0 ("xtest: exclude tests with -x")
-Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
-Acked-by: Jerome Forissier <jerome@forissier.org>
----
- host/xtest/xtest_main.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/host/xtest/xtest_main.c b/host/xtest/xtest_main.c
-index 3dff2fe..1e566fa 100644
---- a/host/xtest/xtest_main.c
-+++ b/host/xtest/xtest_main.c
-@@ -188,8 +188,6 @@ int main(int argc, char *argv[])
- 		}
- 	}
- next:
--	if (last_gen_option > 1)
--		last_gen_option--;
- 
- 	for (index = last_gen_option; index < argc; index++) {
- 		if (!strcmp(argv[index], "-x")) {
--- 
-2.17.1
-
diff --git a/package/optee-test/0002-xtest-regression-1027-1028-skip-tests-when-test-leve.patch b/package/optee-test/0002-xtest-regression-1027-1028-skip-tests-when-test-leve.patch
deleted file mode 100644
index d45644426e..0000000000
--- a/package/optee-test/0002-xtest-regression-1027-1028-skip-tests-when-test-leve.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 899099be7f522d59baa51d26077c0f5804161cfe Mon Sep 17 00:00:00 2001
-From: Etienne Carriere <etienne.carriere@linaro.org>
-Date: Fri, 29 May 2020 15:27:06 +0200
-Subject: [PATCH] xtest: regression 1027/1028: skip tests when test level is 0
-
-Skip regression tests 1027 and 1028 when xtest runs with test level 0
-since these tests expect changes in Linux kernel that are not available
-in mainline kernel source trees, at least up to v5.7.
-
-Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
----
- host/xtest/regression_1000.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/host/xtest/regression_1000.c b/host/xtest/regression_1000.c
-index a70a722..2b0140c 100644
---- a/host/xtest/regression_1000.c
-+++ b/host/xtest/regression_1000.c
-@@ -2096,6 +2096,12 @@ static void xtest_tee_test_1027(ADBG_Case_t *c)
- 	TEEC_UUID uuid_ns = { };
- 	char uuid_name[TEE_UUID_NS_NAME_SIZE] = { };
- 
-+	/* Skip test at level 0 since its dependency on patched Linux kernel */
-+	if (level == 0) {
-+		Do_ADBG_Log("Test level 0: skip regression 1027");
-+		return;
-+	}
-+
- 	result = xtest_uuid_from_str(&uuid_ns, client_uuid_linux_ns);
- 
- 	if (!ADBG_EXPECT_TEEC_SUCCESS(c, result))
-@@ -2159,6 +2165,12 @@ static void xtest_tee_test_1028(ADBG_Case_t *c)
- 	char uuid_name[TEE_UUID_NS_NAME_SIZE] = { };
- 	uint32_t group = 0;
- 
-+	/* Skip test at level 0 since its dependency on patched Linux kernel */
-+	if (level == 0) {
-+		Do_ADBG_Log("Test level 0: skip regression 1027");
-+		return;
-+	}
-+
- 	group = getegid();
- 
- 	result = xtest_uuid_from_str(&uuid_ns, client_uuid_linux_ns);
--- 
-2.17.1
-
diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
index a40f1e9069..d1085b43d9 100644
--- a/package/optee-test/Config.in
+++ b/package/optee-test/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPTEE_TEST
 	bool "optee-test"
 	depends on BR2_TARGET_OPTEE_OS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_TARGET_OPTEE_OS_SDK
 	help
@@ -22,6 +23,7 @@ config BR2_PACKAGE_OPTEE_TEST
 
 	  http://github.com/OP-TEE/optee_test
 
-comment "optee-test needs a toolchain w/ threads"
+comment "optee-test needs a toolchain w/ threads and C++"
 	depends on BR2_TARGET_OPTEE_OS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREAD
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 3a769ac4c2..52e2373bf7 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_test/archive/3.9.0.tar.gz
-sha256 59be1c97cdef7a886bdf4c50f7bf86354be68a68f6ffd43cd5ce4bb96156f402  optee-test-3.9.0.tar.gz
+# From https://github.com/OP-TEE/optee_test/archive/3.11.0.tar.gz
+sha256 54d4b7e2ad22cd409ee8e25e990c1878690b1b5eb8843f649d12022888186a53  optee-test-3.11.0.tar.gz
 # Locally computed
 sha256 6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index fb6c9fcc50..1f4f586672 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 3.9.0
+OPTEE_TEST_VERSION = 3.11.0
 OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md
-- 
2.17.1
