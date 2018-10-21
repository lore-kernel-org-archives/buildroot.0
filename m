From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 21 Oct 2018 07:21:35 -0500
Subject: [Buildroot] [PATCH v2] package/clang: default linker to the cross
 GNU
Message-ID: <1540124495-63551-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default clang is assuming the system linker /usr/bin/ld.  This
patchset updates the default to point at the cross toolchain ld.

Previously clang had been used on target only, this update is
required for host clang/clang++ to be used as a frontend for
cross-compiling.

Example build command:

output/host/bin/clang++ -mcpu=cortex-a53  \
  --sysroot /<abs path>/output/staging/ \
  -B /<abs path>/output/host/opt/ext-toolchain/ \
  foobar.cc -o foobar

Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes
v1 -> v2
[Romain
 - Added example build command in commit description as example
   for an eventual wrapper
 - Moved setting of ld path option to be with other path assignments
---
 package/clang/clang.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 52e0b98..f9d4ae3 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -49,7 +49,8 @@ CLANG_CONF_OPTS += \
 	-DCLANG_INCLUDE_DOCS=OFF \
 	-DCLANG_INCLUDE_TESTS=OFF
 
-HOST_CLANG_CONF_OPTS += -DLLVM_CONFIG:FILEPATH=$(HOST_DIR)/bin/llvm-config
+HOST_CLANG_CONF_OPTS += -DLLVM_CONFIG:FILEPATH=$(HOST_DIR)/bin/llvm-config \
+	-DCLANG_DEFAULT_LINKER=$(TARGET_LD)
 CLANG_CONF_OPTS += -DLLVM_CONFIG:FILEPATH=$(STAGING_DIR)/usr/bin/llvm-config \
 	-DCLANG_TABLEGEN:FILEPATH=$(HOST_DIR)/bin/clang-tblgen \
 	-DLLVM_TABLEGEN_EXE:FILEPATH=$(HOST_DIR)/bin/llvm-tblgen
-- 
1.9.1
