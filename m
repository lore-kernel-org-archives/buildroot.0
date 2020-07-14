From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:34:28 +0200
Subject: [Buildroot] [git commit] package/optee-test: bump to version 3.9.0
Message-ID: <20200714133101.DE13586D40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7cb6020e569f5cdd0fe8ce35ab134ec83046c5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE Test package version to OP-TEE release 3.9.0.

Drop patch on scripts/file_to_c.py that is merged in 3.9.0.
Add patch from [1] for related issue found in 3.9.0 xtest tool.
Add patch to default disable xtest regression test 1027 and 1028 that
mandate changes in Linux kernel OP-TEE driver that are not available
in mainline, at least as of Linux kernel v5.7.

[1] https://github.com/OP-TEE/optee_test/commit/e1af176af2bb274745e9b0d43456763f8946f107

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-use-python3-instead-of-python.patch       | 50 ----------------------
 .../0001-xtest-fix-generic-argument-handling.patch | 32 ++++++++++++++
 ...ssion-1027-1028-skip-tests-when-test-leve.patch | 47 ++++++++++++++++++++
 package/optee-test/optee-test.hash                 |  4 +-
 package/optee-test/optee-test.mk                   |  2 +-
 5 files changed, 82 insertions(+), 53 deletions(-)

diff --git a/package/optee-test/0001-use-python3-instead-of-python.patch b/package/optee-test/0001-use-python3-instead-of-python.patch
deleted file mode 100644
index 2765a980db..0000000000
--- a/package/optee-test/0001-use-python3-instead-of-python.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From cc3cb798375c5f47ea5c7579f32060933435e231 Mon Sep 17 00:00:00 2001
-From: Scott Branden <scott.branden@broadcom.com>
-Date: Fri, 27 Dec 2019 12:54:28 -0800
-Subject: [PATCH] use python3 instead of python
-
-use python3 instead of python as python2 is EOL January 2020.
-
-Signed-off-by: Scott Branden <scott.branden@broadcom.com>
-Reviewed-by: Jerome Forissier <jerome@forissier.org>
-Tested-by: Jerome Forissier <jerome@forissier.org> (QEMU, CFG_GCM_NIST_VECTORS=y)
-
-(cherry picked from commit 6271160639002a2580d80b75b5397a96d56329f2)
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- scripts/file_to_c.py       | 4 ++--
- scripts/rsp_to_gcm_test.py | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/scripts/file_to_c.py b/scripts/file_to_c.py
-index ae16f52..b4ce2a2 100755
---- a/scripts/file_to_c.py
-+++ b/scripts/file_to_c.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # SPDX-License-Identifier: BSD-2-Clause
- #
- # Copyright (c) 2018, Linaro Limited
-@@ -29,7 +29,7 @@ def main():
- 
-     f.write("const uint8_t " + args.name + "[] = {\n")
-     i = 0
--    for x in array.array("B", inf.read()):
-+    for x in array.array("B", map(ord, (inf.read()))):
-         f.write("0x" + '{0:02x}'.format(x) + ",")
-         i = i + 1
-         if i % 8 == 0:
-diff --git a/scripts/rsp_to_gcm_test.py b/scripts/rsp_to_gcm_test.py
-index 0543541..e4418be 100755
---- a/scripts/rsp_to_gcm_test.py
-+++ b/scripts/rsp_to_gcm_test.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- 
- modes = {'encrypt': 0, 'decrypt': 1}
- 
--- 
-2.24.1
-
diff --git a/package/optee-test/0001-xtest-fix-generic-argument-handling.patch b/package/optee-test/0001-xtest-fix-generic-argument-handling.patch
new file mode 100644
index 0000000000..c61dc49c5c
--- /dev/null
+++ b/package/optee-test/0001-xtest-fix-generic-argument-handling.patch
@@ -0,0 +1,32 @@
+From e1af176af2bb274745e9b0d43456763f8946f107 Mon Sep 17 00:00:00 2001
+From: Etienne Carriere <etienne.carriere@linaro.org>
+Date: Mon, 25 May 2020 13:09:59 +0200
+Subject: [PATCH] xtest: fix generic argument handling
+
+Fix position of last generic argument badly handled that makes -d, -l or
+-t argument being treated also as if it was the first test ID to consider
+in the filtered test IDs list.
+
+Fixes: 66542a1bb4e0 ("xtest: exclude tests with -x")
+Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
+Acked-by: Jerome Forissier <jerome@forissier.org>
+---
+ host/xtest/xtest_main.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/host/xtest/xtest_main.c b/host/xtest/xtest_main.c
+index 3dff2fe..1e566fa 100644
+--- a/host/xtest/xtest_main.c
++++ b/host/xtest/xtest_main.c
+@@ -188,8 +188,6 @@ int main(int argc, char *argv[])
+ 		}
+ 	}
+ next:
+-	if (last_gen_option > 1)
+-		last_gen_option--;
+ 
+ 	for (index = last_gen_option; index < argc; index++) {
+ 		if (!strcmp(argv[index], "-x")) {
+-- 
+2.17.1
+
diff --git a/package/optee-test/0002-xtest-regression-1027-1028-skip-tests-when-test-leve.patch b/package/optee-test/0002-xtest-regression-1027-1028-skip-tests-when-test-leve.patch
new file mode 100644
index 0000000000..d45644426e
--- /dev/null
+++ b/package/optee-test/0002-xtest-regression-1027-1028-skip-tests-when-test-leve.patch
@@ -0,0 +1,47 @@
+From 899099be7f522d59baa51d26077c0f5804161cfe Mon Sep 17 00:00:00 2001
+From: Etienne Carriere <etienne.carriere@linaro.org>
+Date: Fri, 29 May 2020 15:27:06 +0200
+Subject: [PATCH] xtest: regression 1027/1028: skip tests when test level is 0
+
+Skip regression tests 1027 and 1028 when xtest runs with test level 0
+since these tests expect changes in Linux kernel that are not available
+in mainline kernel source trees, at least up to v5.7.
+
+Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
+---
+ host/xtest/regression_1000.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/host/xtest/regression_1000.c b/host/xtest/regression_1000.c
+index a70a722..2b0140c 100644
+--- a/host/xtest/regression_1000.c
++++ b/host/xtest/regression_1000.c
+@@ -2096,6 +2096,12 @@ static void xtest_tee_test_1027(ADBG_Case_t *c)
+ 	TEEC_UUID uuid_ns = { };
+ 	char uuid_name[TEE_UUID_NS_NAME_SIZE] = { };
+ 
++	/* Skip test at level 0 since its dependency on patched Linux kernel */
++	if (level == 0) {
++		Do_ADBG_Log("Test level 0: skip regression 1027");
++		return;
++	}
++
+ 	result = xtest_uuid_from_str(&uuid_ns, client_uuid_linux_ns);
+ 
+ 	if (!ADBG_EXPECT_TEEC_SUCCESS(c, result))
+@@ -2159,6 +2165,12 @@ static void xtest_tee_test_1028(ADBG_Case_t *c)
+ 	char uuid_name[TEE_UUID_NS_NAME_SIZE] = { };
+ 	uint32_t group = 0;
+ 
++	/* Skip test at level 0 since its dependency on patched Linux kernel */
++	if (level == 0) {
++		Do_ADBG_Log("Test level 0: skip regression 1027");
++		return;
++	}
++
+ 	group = getegid();
+ 
+ 	result = xtest_uuid_from_str(&uuid_ns, client_uuid_linux_ns);
+-- 
+2.17.1
+
diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 17f73e26d7..3a769ac4c2 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_test/archive/3.7.0.tar.gz
-sha256 6486ba7eba8ea8b43278032c9d6ea1d6b35340a7f76ef4c6f34efbca3d80265d  optee-test-3.7.0.tar.gz
+# From https://github.com/OP-TEE/optee_test/archive/3.9.0.tar.gz
+sha256 59be1c97cdef7a886bdf4c50f7bf86354be68a68f6ffd43cd5ce4bb96156f402  optee-test-3.9.0.tar.gz
 # Locally computed
 sha256 6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index 4cf2f95305..fb6c9fcc50 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 3.7.0
+OPTEE_TEST_VERSION = 3.9.0
 OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md
