From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  2 Mar 2021 22:15:51 +0100
Subject: [Buildroot] [PATCH] support/scripts/gen-bootlin-toolchains: correct
 xtensa toolchain dependencies
Message-ID: <20210302211551.19018-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/011/0111c2ed54618daaeedfc66b0ea04eda00a7e855/
http://autobuild.buildroot.net/results/e53/e53e3880b63a23fa3b3e6d34664d40d5ddbdff89/
..

As listed in the br_fragment file of the toolchain, this is built for a
little-endian "custom" xtensa variant rather than the (big-endian) fsf one:

BR2_xtensa=y
BR2_XTENSA_CUSTOM=y

So update the dependencies in the script and regenerate Config.in.options /
toolchain test.  Also fixup the autobuild config snippet to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../autobuild/bootlin-xtensa-uclibc.config                | 2 ++
 support/scripts/gen-bootlin-toolchains                    | 2 +-
 support/testing/tests/toolchain/test_external_bootlin.py  | 6 ++++--
 .../toolchain-external-bootlin/Config.in.options          | 8 +++++---
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-xtensa-uclibc.config b/support/config-fragments/autobuild/bootlin-xtensa-uclibc.config
index 7975287456..c44525b203 100644
--- a/support/config-fragments/autobuild/bootlin-xtensa-uclibc.config
+++ b/support/config-fragments/autobuild/bootlin-xtensa-uclibc.config
@@ -1,3 +1,5 @@
 BR2_xtensa=y
+BR2_XTENSA_CUSTOM=y
+BR2_XTENSA_LITTLE_ENDIAN=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE=y
diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index fc9d57f5a4..902b7795ee 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -210,7 +210,7 @@ arches = {
         'prefix': 'i686',
     },
     'xtensa-lx60': {
-        'conditions': ['BR2_xtensa', 'BR2_xtensa_fsf'],
+        'conditions': ['BR2_xtensa', 'BR2_XTENSA_CUSTOM', 'BR2_XTENSA_LITTLE_ENDIAN'],
         'prefix': 'xtensa',
     },
 }
diff --git a/support/testing/tests/toolchain/test_external_bootlin.py b/support/testing/tests/toolchain/test_external_bootlin.py
index 2edbfb3207..af60c21f7d 100644
--- a/support/testing/tests/toolchain/test_external_bootlin.py
+++ b/support/testing/tests/toolchain/test_external_bootlin.py
@@ -2567,7 +2567,8 @@ class TestExternalToolchainBootlinX86i686UclibcStable(TestExternalToolchain):
 class TestExternalToolchainBootlinXtensalx60UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_xtensa=y
-        BR2_xtensa_fsf=y
+        BR2_XTENSA_CUSTOM=y
+        BR2_XTENSA_LITTLE_ENDIAN=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE=y
@@ -2582,7 +2583,8 @@ class TestExternalToolchainBootlinXtensalx60UclibcBleedingEdge(TestExternalToolc
 class TestExternalToolchainBootlinXtensalx60UclibcStable(TestExternalToolchain):
     config = """
         BR2_xtensa=y
-        BR2_xtensa_fsf=y
+        BR2_XTENSA_CUSTOM=y
+        BR2_XTENSA_LITTLE_ENDIAN=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE=y
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index d47360ad8d..61ead9b82e 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -40,7 +40,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_x86_64 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3 && BR2_X86_CPU_HAS_SSE4 && BR2_X86_CPU_HAS_SSE42
 	default y if BR2_i386 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3
 	default y if BR2_i386 && !BR2_x86_i486 && !BR2_x86_i586 && !BR2_x86_x1000
-	default y if BR2_xtensa && BR2_xtensa_fsf
+	default y if BR2_xtensa && BR2_XTENSA_CUSTOM && BR2_XTENSA_LITTLE_ENDIAN
 
 if BR2_TOOLCHAIN_EXTERNAL_BOOTLIN
 
@@ -4252,7 +4252,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
 	bool "xtensa-lx60 uclibc bleeding-edge 2020.08-1"
 	depends on BR2_xtensa
-	depends on BR2_xtensa_fsf
+	depends on BR2_XTENSA_CUSTOM
+	depends on BR2_XTENSA_LITTLE_ENDIAN
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
@@ -4276,7 +4277,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE
 	bool "xtensa-lx60 uclibc stable 2020.08-1"
 	depends on BR2_xtensa
-	depends on BR2_xtensa_fsf
+	depends on BR2_XTENSA_CUSTOM
+	depends on BR2_XTENSA_LITTLE_ENDIAN
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
-- 
2.20.1
