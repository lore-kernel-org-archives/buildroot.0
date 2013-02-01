From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Fri,  1 Feb 2013 20:33:24 +0100
Subject: [Buildroot] [PATCH] arch/Config.in.arm: Use armv6k for arm1136jf-s
	rev1
Message-ID: <1359747204-12412-1-git-send-email-benoit.thebaudeau@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to the ARM1136JF-S and ARM1136J-S Revision r1p5 Technical Reference
Manual, from release rev1 (r1pn), the ARM1136JF-S processor implements the ARMv6
instruction set with the ARMv6k additions.

This patch differentiates the ARM1136JF-S revisions 0 and 1 in order to use
either ARMv6j (e.g. on Freescale i.MX31) or ARMv6k (e.g. on Freescale i.MX35).

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
---
 arch/Config.in.arm |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 806b196..b681d27 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -31,8 +31,10 @@ config BR2_arm926t
 	bool "arm926t"
 config BR2_arm10t
 	bool "arm10t"
-config BR2_arm1136jf_s
-	bool "arm1136jf_s"
+config BR2_arm1136jf_s_r0
+	bool "arm1136jf_s rev0"
+config BR2_arm1136jf_s_r1
+	bool "arm1136jf_s rev1"
 config BR2_arm1176jz_s
 	bool "arm1176jz-s"
 config BR2_arm1176jzf_s
@@ -59,6 +61,10 @@ config BR2_iwmmxt
 	bool "iwmmxt"
 endchoice
 
+config BR2_arm1136jf_s
+	bool
+	default BR2_arm1136jf_s_r0 || BR2_arm1136jf_s_r1
+
 choice
 	prompt "Target ABI"
 	depends on BR2_arm || BR2_armeb
@@ -126,7 +132,8 @@ config BR2_GCC_TARGET_ARCH
 	default "armv4t"	if BR2_arm922t
 	default "armv5te"	if BR2_arm926t
 	default "armv5t"	if BR2_arm10t
-	default "armv6j"	if BR2_arm1136jf_s
+	default "armv6j"	if BR2_arm1136jf_s_r0
+	default "armv6k"	if BR2_arm1136jf_s_r1
 	default "armv6zk"	if BR2_arm1176jz_s
 	default "armv6zk"	if BR2_arm1176jzf_s
 	default "armv7-a"	if BR2_cortex_a5
-- 
1.7.10.4
