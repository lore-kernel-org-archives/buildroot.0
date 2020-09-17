From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 22:32:23 +0200
Subject: [Buildroot] [git commit] package/{clang,
 lld}: disable shared lib build for the host variant
Message-ID: <20200917202409.A1C63825E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8cf79e1873fb54a1c1360f140a2fc70f9f5cb7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is similar to the llvm package which also disables shared libs
for the host variant.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/clang/clang.mk | 1 +
 package/lld/lld.mk     | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index d740af5322..ceb7de9afa 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -33,6 +33,7 @@ CLANG_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
 # By setting BUILD_SHARED_LIBS to OFF, we generate multiple static
 # libraries (the same way as host's clang build) and finally
 # libclang.so to be installed on the target.
+HOST_CLANG_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
 CLANG_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
 
 # Default is Debug build, which requires considerably more disk space
diff --git a/package/lld/lld.mk b/package/lld/lld.mk
index ea09c5d340..cd1a03c1d3 100644
--- a/package/lld/lld.mk
+++ b/package/lld/lld.mk
@@ -19,6 +19,9 @@ HOST_LLD_DEPENDENCIES = host-llvm
 # https://reviews.llvm.org/D57264
 HOST_LLD_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
 
+# build as static libs as is done in llvm & clang
+HOST_LLD_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
+
 # GCC looks for tools in a different path from LLD's default installation path
 define HOST_LLD_CREATE_SYMLINKS
 	mkdir -p $(HOST_DIR)/$(GNU_TARGET_NAME)/bin
