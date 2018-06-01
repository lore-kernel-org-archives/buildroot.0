From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Jun 2018 18:24:18 +0200
Subject: [Buildroot] [git commit] package/clang: fix host-clang binaries
Message-ID: <20180601162633.2B54483713@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71b3df1cbbfeb69d9f9a39af9a1ae5722215a9a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes the following error when trying to execute clang compiler
(host-variant):

CommandLine Error: Option 'x86-use-base-pointer' registered more than once!
LLVM ERROR: inconsistency in registered CommandLine options

The same happens for the other binaries, such as clang-format:

./clang-format
: CommandLine Error: Option 'help-list' registered more than once!
LLVM ERROR: inconsistency in registered CommandLine options

Clang binaries are tools, and given that DLLVM_LINK_LLVM_DYLIB is set,
they are linked against libLLVM.so. The problem is that binaries are
also linking against some LLVM static libraries, resulting in the error
shown above. However, it is not the same case for libclang, which is also
a tool but links only against libLLVM.so.

To fix this problem, add LLVM_DYLIB_COMPONENTS=all.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
Tested-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clang/clang.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index ae0140c783..dc086c6eed 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -89,5 +89,9 @@ HOST_CLANG_POST_INSTALL_HOOKS = HOST_CLANG_INSTALL_CLANG_TBLGEN
 HOST_CLANG_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
 CLANG_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
 
+# Prevent clang binaries from linking against LLVM static libs
+HOST_CLANG_CONF_OPTS += -DLLVM_DYLIB_COMPONENTS=all
+CLANG_CONF_OPTS += -DLLVM_DYLIB_COMPONENTS=all
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
