From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 29 Oct 2019 15:41:29 +0100
Subject: [Buildroot] [PATCH 3/5] package/optee-test: bump version to 3.7.0
In-Reply-To: <f25cf981ca8a67c30ac2b994980a9f26aceb1dd2.1572355772.git.etienne.carriere@linaro.org>
References: <f25cf981ca8a67c30ac2b994980a9f26aceb1dd2.1572355772.git.etienne.carriere@linaro.org>
Message-ID: <a647ffe76b0a99f7608e63f6b988a182bf2c8e36.1572355772.git.etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump OP-TEE Test package version to release 3.7.0.

This changes removes package patch on unsafe loop optimization issues
since it has been fixed in native package.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 ...prevent-unsafe-loop-optimizations-bu.patch | 63 -------------------
 package/optee-test/optee-test.hash            |  4 +-
 package/optee-test/optee-test.mk              |  2 +-
 3 files changed, 3 insertions(+), 66 deletions(-)
 delete mode 100644 package/optee-test/0001-regression-41xx-prevent-unsafe-loop-optimizations-bu.patch

diff --git a/package/optee-test/0001-regression-41xx-prevent-unsafe-loop-optimizations-bu.patch b/package/optee-test/0001-regression-41xx-prevent-unsafe-loop-optimizations-bu.patch
deleted file mode 100644
index 8b6871f4e3..0000000000
--- a/package/optee-test/0001-regression-41xx-prevent-unsafe-loop-optimizations-bu.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 5a83a50c47c46c54a443aa18ed6456416fa27a98 Mon Sep 17 00:00:00 2001
-From: Etienne Carriere <etienne.carriere@linaro.org>
-Date: Thu, 25 Apr 2019 10:19:05 +0200
-Subject: [PATCH] regression 41xx: prevent unsafe-loop-optimizations build
- error
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Add -Wno-unsafe-loop-optimizations directive since regression_4100.c
-fails to build on some recent toolchains as GCC 7.3.0 and 7.4.0 with
-an error trace like below. Note building with GCC 8.2.1 does not
-reproduce the build issue.
-
-/path/to/optee_test/host/xtest/regression_4100.c: In function ?convert_from_string?:
-/path/to/optee_test/host/xtest/regression_4100.c:448:8: error: missed loop optimization, the loop counter may overflow [-Werror=unsafe-loop-optimizations]
-  while (spos) {
-        ^
-/path/to/optee_test/host/xtest/regression_4100.c:455:6: error: missed loop optimization, the loop counter may overflow [-Werror=unsafe-loop-optimizations]
-   if (!spos)
-      ^
-
-The GNU Makefile build sequence defines -Wno-unsafe-loop-optimizations
-for the whole xtest sources while CMake build sequence defines it
-specifically for regression_4100.c among xtest source files.
-
-Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
-Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
----
- host/xtest/CMakeLists.txt | 4 ++++
- host/xtest/Makefile       | 1 +
- 2 files changed, 5 insertions(+)
-
-diff --git a/host/xtest/CMakeLists.txt b/host/xtest/CMakeLists.txt
-index 1f3a6f4..3868bcd 100644
---- a/host/xtest/CMakeLists.txt
-+++ b/host/xtest/CMakeLists.txt
-@@ -61,6 +61,10 @@ set (SRC
- 	xtest_test.c
- )
- 
-+set_source_files_properties(
-+	regression_4100.c PROPERTIES COMPILE_FLAGS -Wno-unsafe-loop-optimizations
-+)
-+
- if (CFG_GP_SOCKETS)
- 	list (APPEND SRC
- 		regression_2000.c
-diff --git a/host/xtest/Makefile b/host/xtest/Makefile
-index f226500..e930d9c 100644
---- a/host/xtest/Makefile
-+++ b/host/xtest/Makefile
-@@ -155,6 +155,7 @@ CFLAGS += -Wall -Wcast-align -Werror \
- 	  -Wshadow -Wstrict-prototypes -Wswitch-default \
- 	  -Wwrite-strings \
- 	  -Wno-declaration-after-statement \
-+	  -Wno-unsafe-loop-optimizations \
- 	  -Wno-missing-field-initializers -Wno-format-zero-length
- endif
- 
--- 
-2.17.1
-
diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index a99cf0bd40..17f73e26d7 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_test/archive/3.5.0.tar.gz
-sha256 19118b7002a618bb2519cf7d0d61feb90e8574148f69b29260344119ac855520  optee-test-3.5.0.tar.gz
+# From https://github.com/OP-TEE/optee_test/archive/3.7.0.tar.gz
+sha256 6486ba7eba8ea8b43278032c9d6ea1d6b35340a7f76ef4c6f34efbca3d80265d  optee-test-3.7.0.tar.gz
 # Locally computed
 sha256 6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index 935cdfa860..4cf2f95305 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 3.5.0
+OPTEE_TEST_VERSION = 3.7.0
 OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md
-- 
2.17.1
