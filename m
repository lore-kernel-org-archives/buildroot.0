From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 14 May 2019 10:20:39 +0200
Subject: [Buildroot] [PATCH v3 5/7] package/optee-test: bump version to 3.5.0
In-Reply-To: <20190514082041.3487-1-etienne.carriere@linaro.org>
References: <20190514082041.3487-1-etienne.carriere@linaro.org>
Message-ID: <20190514082041.3487-5-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump OP-TEE Test package version to release 3.5.0. This
change updates patches on OP-TEE Test package accordingly.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v2 -> v3:
- Fix on commit message: s/OP-TEE OS/OP-TEE Test/.
Changes v1 -> v2:
- No change
---
 ...n-4100-update-string-conversion-loop.patch | 72 -------------------
 ...prevent-unsafe-loop-optimizations-bu.patch | 63 ++++++++++++++++
 package/optee-test/optee-test.hash            |  4 +-
 package/optee-test/optee-test.mk              |  2 +-
 4 files changed, 66 insertions(+), 75 deletions(-)
 delete mode 100644 package/optee-test/0001-regression-4100-update-string-conversion-loop.patch
 create mode 100644 package/optee-test/0001-regression-41xx-prevent-unsafe-loop-optimizations-bu.patch

diff --git a/package/optee-test/0001-regression-4100-update-string-conversion-loop.patch b/package/optee-test/0001-regression-4100-update-string-conversion-loop.patch
deleted file mode 100644
index 62862867be..0000000000
--- a/package/optee-test/0001-regression-4100-update-string-conversion-loop.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 88714fc174b91950c9e1c53a9832fc6d4ffa6e2a Mon Sep 17 00:00:00 2001
-From: Etienne Carriere <etienne.carriere@linaro.org>
-Date: Sun, 17 Feb 2019 22:44:44 +0100
-Subject: [PATCH] regression 4100: update string conversion loop
-
-Change the loop used to convert string into numerical value.
-The original loop was fine but its implementation hits toolchain
-unsafe-loop-optimizations feature. The new implementation
-proposed here simplifies a bit the loop and prevents toolchain
-from complaining when directive -Werror=unsafe-loop-optimizations
-is enabled.
-
-Issue reported by the Buildroot cross toolchain [1] with the
-following error traces:
-
-build/armv7/build/optee-test-3.4.0/host/xtest/regression_4100.c:447:8: error: missed loop optimization, the loop counter may overflow [-Werror=unsafe-loop-optimizations]
-  while (spos) {
-        ^
-build/optee-test-3.4.0/host/xtest/regression_4100.c:454:6: error: missed loop optimization, the loop counter may overflow [-Werror=unsafe-loop-optimizations]
-   if (!spos)
-      ^
-
-[1] arm-buildroot-linux-uclibcgnueabihf-gcc.br_real (Buildroot 2019.02-git-00933-gb75e93c) 7.4.0
-
-Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
----
- host/xtest/regression_4100.c | 25 ++++++++++++++-----------
- 1 file changed, 14 insertions(+), 11 deletions(-)
-
-diff --git a/host/xtest/regression_4100.c b/host/xtest/regression_4100.c
-index b477f38..88346d4 100644
---- a/host/xtest/regression_4100.c
-+++ b/host/xtest/regression_4100.c
-@@ -445,21 +445,24 @@ static TEEC_Result convert_from_string(ADBG_Case_t *c, TEEC_Session *s,
- 		return TEEC_ERROR_OUT_OF_MEMORY;
- 
- 	while (spos) {
--		spos--;
--		nibble = digit_value(str[spos]);
--		if (nibble == -1)
-+		nibble = digit_value(str[spos - 1]);
-+		if (nibble == -1) {
-+			spos--;
- 			break;
-+		}
- 		os[ospos] = nibble;
- 
--		if (!spos)
--			break;
-+		if (spos > 1) {
-+			nibble = digit_value(str[spos - 2]);
-+			if (nibble == -1) {
-+				spos -= 2;
-+				break;
-+			}
-+			os[ospos] |= nibble << 4;
-+			ospos--;
-+			spos--;
-+		}
- 		spos--;
--		nibble = digit_value(str[spos]);
--		if (nibble == -1)
--			break;
--
--		os[ospos] |= nibble << 4;
--		ospos--;
- 	}
- 
- 	if (spos)
--- 
-2.20.1
-
diff --git a/package/optee-test/0001-regression-41xx-prevent-unsafe-loop-optimizations-bu.patch b/package/optee-test/0001-regression-41xx-prevent-unsafe-loop-optimizations-bu.patch
new file mode 100644
index 0000000000..8b6871f4e3
--- /dev/null
+++ b/package/optee-test/0001-regression-41xx-prevent-unsafe-loop-optimizations-bu.patch
@@ -0,0 +1,63 @@
+From 5a83a50c47c46c54a443aa18ed6456416fa27a98 Mon Sep 17 00:00:00 2001
+From: Etienne Carriere <etienne.carriere@linaro.org>
+Date: Thu, 25 Apr 2019 10:19:05 +0200
+Subject: [PATCH] regression 41xx: prevent unsafe-loop-optimizations build
+ error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Add -Wno-unsafe-loop-optimizations directive since regression_4100.c
+fails to build on some recent toolchains as GCC 7.3.0 and 7.4.0 with
+an error trace like below. Note building with GCC 8.2.1 does not
+reproduce the build issue.
+
+/path/to/optee_test/host/xtest/regression_4100.c: In function ?convert_from_string?:
+/path/to/optee_test/host/xtest/regression_4100.c:448:8: error: missed loop optimization, the loop counter may overflow [-Werror=unsafe-loop-optimizations]
+  while (spos) {
+        ^
+/path/to/optee_test/host/xtest/regression_4100.c:455:6: error: missed loop optimization, the loop counter may overflow [-Werror=unsafe-loop-optimizations]
+   if (!spos)
+      ^
+
+The GNU Makefile build sequence defines -Wno-unsafe-loop-optimizations
+for the whole xtest sources while CMake build sequence defines it
+specifically for regression_4100.c among xtest source files.
+
+Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
+Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
+---
+ host/xtest/CMakeLists.txt | 4 ++++
+ host/xtest/Makefile       | 1 +
+ 2 files changed, 5 insertions(+)
+
+diff --git a/host/xtest/CMakeLists.txt b/host/xtest/CMakeLists.txt
+index 1f3a6f4..3868bcd 100644
+--- a/host/xtest/CMakeLists.txt
++++ b/host/xtest/CMakeLists.txt
+@@ -61,6 +61,10 @@ set (SRC
+ 	xtest_test.c
+ )
+ 
++set_source_files_properties(
++	regression_4100.c PROPERTIES COMPILE_FLAGS -Wno-unsafe-loop-optimizations
++)
++
+ if (CFG_GP_SOCKETS)
+ 	list (APPEND SRC
+ 		regression_2000.c
+diff --git a/host/xtest/Makefile b/host/xtest/Makefile
+index f226500..e930d9c 100644
+--- a/host/xtest/Makefile
++++ b/host/xtest/Makefile
+@@ -155,6 +155,7 @@ CFLAGS += -Wall -Wcast-align -Werror \
+ 	  -Wshadow -Wstrict-prototypes -Wswitch-default \
+ 	  -Wwrite-strings \
+ 	  -Wno-declaration-after-statement \
++	  -Wno-unsafe-loop-optimizations \
+ 	  -Wno-missing-field-initializers -Wno-format-zero-length
+ endif
+ 
+-- 
+2.17.1
+
diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index c8ae51b8ee..a99cf0bd40 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_test/archive/3.4.0.tar.gz
-sha256 755904c5b845763a2460c32c21100a57c713009b6b88cc3fc21f0e5be8645e2b  optee-test-3.4.0.tar.gz
+# From https://github.com/OP-TEE/optee_test/archive/3.5.0.tar.gz
+sha256 19118b7002a618bb2519cf7d0d61feb90e8574148f69b29260344119ac855520  optee-test-3.5.0.tar.gz
 # Locally computed
 sha256 6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index abed09d5e3..935cdfa860 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 3.4.0
+OPTEE_TEST_VERSION = 3.5.0
 OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md
-- 
2.17.1
