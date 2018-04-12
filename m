From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Thu, 12 Apr 2018 14:36:28 +0200
Subject: [Buildroot] [PATCH v2] package/llvm: remove $ORIGIN/../lib from
 RPATH
Message-ID: <20180412123628.26076-1-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

AddLLVM.cmake adds $ORIGIN/../lib to the RPATH of llvm binaries.
This causes a problem when llvm-config from host installed in
STAGING_DIR is executed under the following conditions:

*Target architecture same as host architecture (normally x86_64)
*Target's libc different from host's libc (normally glibc)

llvm-config will try to link with the target's libc, resulting in:

./llvm-config: error while loading shared libraries: libc.so.0:
cannot open shared object file: No such file or directory.

Link to autobuild error:
http://autobuild.buildroot.net/results/b81c12d529c66a028e2297ea5ce1d6930324fa69/

To avoid this, add HOST_LLVM_CONF_OPTS += -DCMAKE_INSTALL_RPATH="$(HOST_DIR)/lib"

Link to discussion:
http://lists.busybox.net/pipermail/buildroot/2018-April/218627.html

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
Changes v1 -> v2:

Instead of patching AddLLVM.cmake, use CMAKE_INSTALL_RPATH option
for host in llvm.mk

 package/llvm/llvm.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 8b88957203..3587b8af9d 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -25,6 +25,12 @@ LLVM_CONF_OPTS += -DLLVM_ENABLE_PROJECTS=""
 HOST_LLVM_CONF_OPTS += -DLLVM_CCACHE_BUILD=$(if $(BR2_CCACHE),ON,OFF)
 LLVM_CONF_OPTS += -DLLVM_CCACHE_BUILD=$(if $(BR2_CCACHE),ON,OFF)
 
+# This option avoids AddLLVM.cmake from adding $ORIGIN/../lib
+# to binaries. Otherwise, llvm-config (host variant installed
+# in STAGING) will try to link with target's libc:
+# http://autobuild.buildroot.net/results/b81c12d529c66a028e2297ea5ce1d6930324fa69/
+HOST_LLVM_CONF_OPTS += -DCMAKE_INSTALL_RPATH="$(HOST_DIR)/lib"
+
 # Disable experimental Global Instruction Selection support.
 # https://llvm.org/docs/GlobalISel.html
 HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_GLOBAL_ISEL=OFF
-- 
2.14.3
