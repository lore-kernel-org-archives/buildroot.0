From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  1 Aug 2016 18:30:20 +0200
Subject: [Buildroot] [PATCH 2/3] package/xenomai: disable for cortex-M cpus
In-Reply-To: <1470069021-24233-1-git-send-email-romain.naour@gmail.com>
References: <1470069021-24233-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1470069021-24233-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following include/asm-arm/features.h, Xenomai doesn't support cortex-M
cpus.

error "Could not find current ARM architecture"

Fixes:
http://autobuild.buildroot.net/results/06a/06a52b2c2c23df595f58feb6b95437fc65a86d31

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/xenomai/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index a4a2795..3de7bde 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_i386 || BR2_x86_64 || BR2_arm || \
-		   BR2_bfin || BR2_powerpc || BR2_sh4
+	depends on BR2_i386 || BR2_x86_64 || (BR2_arm && !BR2_ARM_CPU_ARMV7M) || \
+		BR2_bfin || BR2_powerpc || BR2_sh4
 
 comment "xenomai needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.5.5
