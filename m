From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 23:22:01 +0200
Subject: [Buildroot] [git commit] package/clang: link libclang against
 libLLVM.so
Message-ID: <20180511212131.9E5418CA99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95fc31239962ae488b159f83e8fc436c10b1128c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libclang.so is statically linking against all LLVM static libraries
instead of linking dynamically against libLLVM.so.

This patch fixes this problem by setting LLVM_LINK_LLVM_DYLIB to ON.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
