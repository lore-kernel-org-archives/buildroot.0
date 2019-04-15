From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 21:25:37 +0200
Subject: [Buildroot] [git commit] package/clang: fix build with gcc < 5.1
Message-ID: <20190415192120.C11B48E7D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45d9a2b5bfe4feb144990ab4aa68eb03091e9a64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/dc2302844a1d274e63da72023b6fd7be993f97b7

Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/clang/clang.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 6dda8ac2c3..0cab1c7f89 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -15,6 +15,13 @@ CLANG_INSTALL_STAGING = YES
 HOST_CLANG_DEPENDENCIES = host-llvm host-libxml2
 CLANG_DEPENDENCIES = llvm host-clang
 
+# LLVM >= 9.0 will soon require C++14 support, building llvm 8.x using a
+# toolchain using gcc < 5.1 gives an error but actually still works. Setting
+# this option makes it still build with gcc >= 4.8.
+# https://reviews.llvm.org/D57264
+HOST_CLANG_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
+CLANG_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
+
 # This option is needed, otherwise multiple shared libs
 # (libclangAST.so, libclangBasic.so, libclangFrontend.so, etc.) will
 # be generated. As a final shared lib containing all these components
