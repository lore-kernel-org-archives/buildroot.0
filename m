From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 20 Feb 2020 16:40:03 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_93847
Message-ID: <20200220154004.126384-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

git package fails to build for the Nios2 architecture with optimization
enabled with gcc < 9.x:
http://autobuild.buildroot.net/results/924/92484c49b655e4aa78ca52f124c6d8f605b9d06b/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93847

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 973c03254f..b8c2f79a36 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -159,6 +159,14 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
 	bool
 	default y if BR2_microblaze
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93847
+# ICE: compiler error: Segmentation fault on Nios II. This bug
+# no longer exists in gcc 9.x.
+config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
+	bool
+	default y if BR2_nios2
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
-- 
2.20.1
