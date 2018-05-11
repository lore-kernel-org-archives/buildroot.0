From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Fri, 11 May 2018 13:47:52 +0200
Subject: [Buildroot] [PATCH v2] package/clang: link libclang against
 libLLVM.so
Message-ID: <20180511114752.16980-1-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libclang.so is statically linking against all LLVM static libraries
instead of linking dynamically against libLLVM.so.

This patch fixes this problem by setting LLVM_LINK_LLVM_DYLIB to ON.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---

Changes v1 -> v2

*Avoid patching libclang's CMakeLists.txt
*Use LLVM_LINK_LLVM_DYLIB=ON

 package/clang/clang.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 8d86c5edda..14d6441c9a 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -85,5 +85,9 @@ define HOST_CLANG_INSTALL_CLANG_TBLGEN
 endef
 HOST_CLANG_POST_INSTALL_HOOKS = HOST_CLANG_INSTALL_CLANG_TBLGEN
 
+# This option must be enabled to link libclang dynamically against libLLVM.so
+HOST_CLANG_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
+CLANG_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.14.3
