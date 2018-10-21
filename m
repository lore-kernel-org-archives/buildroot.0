From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 16:28:50 +0200
Subject: [Buildroot] [git commit] package/clang: default linker to the cross
 GNU
Message-ID: <20181021142712.994EF882B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2b0fe80e025ebd816cf0447fb11022d3fe57309
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/clang/clang.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 52e0b98a76..f9d4ae3713 100644
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
