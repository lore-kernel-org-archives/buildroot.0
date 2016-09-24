From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 24 Sep 2016 14:47:40 +0200
Subject: [Buildroot] [PATCH] xvisor: needs gcc >= 4.9
Message-ID: <1474721260-6810-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xvisor needs gcc >= 4.9, as previous versions trigger an ICE on
dwarf2out_frame_debug_adjust_cfa() [1].

Fixes:

 - http://autobuild.buildroot.net/results/fdb/fdb5a568fb38a9d20780cd37eecb71b60b6ca96a/

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60264

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/xvisor/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/xvisor/Config.in b/package/xvisor/Config.in
index f450f6f..92e8937 100644
--- a/package/xvisor/Config.in
+++ b/package/xvisor/Config.in
@@ -1,6 +1,7 @@
 menuconfig BR2_PACKAGE_XVISOR
 	bool "xvisor"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_arm || BR2_aarch64 || BR2_x86_64
 	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV7M
 	help
@@ -56,3 +57,9 @@ config BR2_PACKAGE_XVISOR_BUILD_TEST_DTB
 	  Build test device-tree blobs for popular boards.
 
 endif
+
+comment "xvisor needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_USE_MMU
+	depends on BR2_arm || BR2_aarch64 || BR2_x86_64
+	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV7M
-- 
2.4.11
