From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 11 Mar 2021 08:29:32 -0600
Subject: [Buildroot] [PATCH v11 9/9] package/compiler-rt: runtime test use
 toolchain-wrapper
In-Reply-To: <20210311142932.44985-1-matthew.weber@rockwellcollins.com>
References: <20210311142932.44985-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210311142932.44985-9-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The toolchain wrapper for clang allows the build of the
libfuzzer package to not point at "-B $(HOST_DIR)/opt/ext-toolchain"
which prevents a build failure to link due to missing crtbeging.o
and libgcc.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 .../clang-compiler-rt/package/libfuzzer/libfuzzer.mk            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
index 6c6371bea7..0515b9da35 100644
--- a/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
+++ b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
@@ -12,7 +12,7 @@ LIBFUZZER_DEPENDENCIES = compiler-rt
 
 define LIBFUZZER_BUILD_CMDS
 	$(HOST_DIR)/bin/clang++ --sysroot=$(STAGING_DIR) \
-		-B $(HOST_DIR)/opt/ext-toolchain -fsanitize=address,fuzzer \
+		-fsanitize=address,fuzzer \
 		$(@D)/tutorial/libFuzzer/fuzz_me.cc \
 		-o $(@D)/fuzz_me
 endef
-- 
2.17.1
