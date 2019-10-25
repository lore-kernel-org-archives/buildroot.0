From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2019 10:31:38 +0200
Subject: [Buildroot] [git commit] package/lld: fix build with gcc < 5.1
Message-ID: <20191025082520.90F4680139@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=393938f04faaf06d35366450c498847507ef72e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fix is based on commit 2a17fb6 used for llvm.

Fixes:
http://autobuild.buildroot.net/results/76310241a335a99a4ff2726edb517b067367fd41
http://autobuild.buildroot.net/results/88cbfae219fd4475be376c9558b5760cebd2148f

[Peter: adjust comment as suggested by Romain]
Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lld/lld.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/lld/lld.mk b/package/lld/lld.mk
index bda5a56ab5..a023159e17 100644
--- a/package/lld/lld.mk
+++ b/package/lld/lld.mk
@@ -12,6 +12,12 @@ LLD_LICENSE_FILES = LICENSE.TXT
 LLD_SUPPORTS_IN_SOURCE_BUILD = NO
 HOST_LLD_DEPENDENCIES = host-llvm
 
+# LLVM > 9.0 will soon require C++14 support, building llvm <= 9.0 using a
+# toolchain using gcc < 5.1 gives an error but actually still works. Setting
+# this option makes it still build with gcc >= 4.8.
+# https://reviews.llvm.org/D57264
+HOST_LLD_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
+
 # GCC looks for tools in a different path from LLD's default installation path
 define HOST_LLD_CREATE_SYMLINKS
 	mkdir -p $(HOST_DIR)/$(GNU_TARGET_NAME)/bin
