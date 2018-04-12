From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 21:12:51 +0200
Subject: [Buildroot] [git commit] package/llvm: remove $ORIGIN/../lib from
 RPATH
Message-ID: <20180412191255.B097E884B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f9e3989f3c736d9792e942fcf0f22b2e8210d00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

AddLLVM.cmake adds $ORIGIN/../lib to the RPATH of llvm binaries.  This
causes a problem when llvm-config built for the host, installed in
STAGING_DIR, is executed under the following conditions:

* Target architecture same as host architecture (normally x86_64)
* Target's libc different from host's libc (normally glibc)

llvm-config will try to link with the target's libc, resulting in:

./llvm-config: error while loading shared libraries: libc.so.0: cannot open shared object file: No such file or directory.

To avoid this, we simply add pass
-DCMAKE_INSTALL_RPATH="$(HOST_DIR)/lib" in HOST_LLVM_CONF_OPTS.

Link to discussion:

  http://lists.busybox.net/pipermail/buildroot/2018-April/218627.html

Fixes:

  http://autobuild.buildroot.net/results/b81c12d529c66a028e2297ea5ce1d6930324fa69/

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/llvm/llvm.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 9c8bf5c820..de2ca38da1 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -25,6 +25,11 @@ LLVM_CONF_OPTS += -DLLVM_ENABLE_PROJECTS=""
 HOST_LLVM_CONF_OPTS += -DLLVM_CCACHE_BUILD=$(if $(BR2_CCACHE),ON,OFF)
 LLVM_CONF_OPTS += -DLLVM_CCACHE_BUILD=$(if $(BR2_CCACHE),ON,OFF)
 
+# This option prevents AddLLVM.cmake from adding $ORIGIN/../lib to
+# binaries. Otherwise, llvm-config (host variant installed in STAGING)
+# will try to use target's libc.
+HOST_LLVM_CONF_OPTS += -DCMAKE_INSTALL_RPATH="$(HOST_DIR)/lib"
+
 # Disable experimental Global Instruction Selection support.
 # https://llvm.org/docs/GlobalISel.html
 HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_GLOBAL_ISEL=OFF
