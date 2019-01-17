From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Jan 2019 09:56:49 +0100
Subject: [Buildroot] [git commit] package/llvm: set the path to llvm-config
Message-ID: <20190117085622.BABFE864BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3245ce4258f4f5e5230e976862a0fd40fdd1890
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While building llvm for the target (x86_64), the build failed due to
path poisoning (-I/usr/include/libxml2) while building NATIVE tools
(i.e for the host). The llvm package tries to build a tool for the host
with the cross-compiler which doesn't work when the paranoid toolchain
wrapper (BR2_COMPILER_PARANOID_UNSAFE_PATH) is enabled.

We know that llvm (target) needs llvm-tablegen and llvm-config built by
host-llvm, but only LLVM_TABLEGEN is provided by llvm.mk. Adding
LLVM_CONFIG_PATH=$(HOST_DIR)/bin/llvm-config for llvm (target)
fixes the path poisoining issue since llvm doesn't build the NATIVE
variant.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/llvm/llvm.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index f33ec11fbf..952f678eee 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -57,6 +57,9 @@ endif
 # Use native llvm-tblgen from host-llvm (needed for cross-compilation)
 LLVM_CONF_OPTS += -DLLVM_TABLEGEN=$(HOST_DIR)/bin/llvm-tblgen
 
+# Use native llvm-config from host-llvm (needed for cross-compilation)
+LLVM_CONF_OPTS += -DLLVM_CONFIG_PATH=$(HOST_DIR)/bin/llvm-config
+
 # BUILD_SHARED_LIBS has a misleading name. It is in fact an option for
 # LLVM developers to build all LLVM libraries as separate shared libraries.
 # For normal use of LLVM, it is recommended to build a single
