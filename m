From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Apr 2019 16:51:56 +0200
Subject: [Buildroot] [git commit] package/llvm: fix build with gcc < 5.1
Message-ID: <20190413145020.691B88D509@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a17fb6057eed2416e81cc138c885b1385fbff5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/0c046a1b57a4f0b992333003d41062e1b256eb0d

Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
[Arnout: add explanatory comment suggested by Romain]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/llvm/llvm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index cd374d74b4..3c62285188 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -17,6 +17,13 @@ LLVM_INSTALL_STAGING = YES
 HOST_LLVM_DEPENDENCIES = host-python
 LLVM_DEPENDENCIES = host-llvm
 
+# LLVM >= 9.0 will soon require C++14 support, building llvm 8.x using a
+# toolchain using gcc < 5.1 gives an error but actually still works. Setting
+# this option makes it still build with gcc >= 4.8.
+# https://reviews.llvm.org/D57264
+HOST_LLVM_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
+LLVM_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
+
 # Don't build clang libcxx libcxxabi lldb compiler-rt lld polly as llvm subprojects
 # This flag assumes that projects are checked out side-by-side and not nested
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PROJECTS=""
