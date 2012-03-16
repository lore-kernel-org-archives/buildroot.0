From: Alvaro G. M <alvaro.gamez@hazent.com>
Date: Fri, 16 Mar 2012 14:42:54 +0100
Subject: [Buildroot] [PATCH 2/3] Microblaze: added architecture support for
	both big endian and low endian
In-Reply-To: <1331905375-9177-1-git-send-email-alvaro.gamez@hazent.com>
References: <1331905375-9177-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <1331905375-9177-2-git-send-email-alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Alvaro G. M" <alvaro.gamez@hazent.com>

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
---
 target/Config.in.arch |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 25c6e50..1910ff6 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -21,6 +21,10 @@ config BR2_i386
 config BR2_m68k
 	bool "m68k"
 	depends on BROKEN # ice in uclibc / inet_ntoa_r
+config BR2_microblazeel
+	bool "Microblaze AXI (little-endian)"
+config BR2_microblazebe
+	bool "Microblaze non-AXI (big-endian)""
 config BR2_mips
 	bool "mips"
 config BR2_mipsel
@@ -40,6 +44,10 @@ config BR2_xtensa
 	bool "xtensa"
 endchoice
 
+config BR2_microblaze
+	bool
+	default y if BR2_microblazeel || BR2_microblazebe
+
 #
 # Keep the variants separate, there's no need to clutter everything else.
 # sh is fairly "special" in this regard, as virtually everyone else has
@@ -515,6 +523,7 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_athlon
 	default "i686"		if BR2_x86_athlon_4
 	default "m68k"		if BR2_m68k
+	default "microblaze"	if BR2_microblaze
 	default "mips"		if BR2_mips
 	default "mipsel"	if BR2_mipsel
 	default "powerpc"	if BR2_powerpc
@@ -542,10 +551,12 @@ config BR2_ARCH
 config BR2_ENDIAN
 	string
 	default "LITTLE" if BR2_arm || BR2_bfin || BR2_i386 || BR2_mipsel || \
-			    BR2_sh3 || BR2_sh4 || BR2_sh4a || BR2_x86_64 || BR2_sh64
+			    BR2_sh3 || BR2_sh4 || BR2_sh4a || BR2_x86_64 || BR2_sh64 || \
+			    BR2_microblazeel
 	default "BIG"    if BR2_armeb || BR2_avr32 || BR2_m68k || BR2_mips || \
 			    BR2_powerpc || BR2_sh2 || BR2_sh2a || \
-			    BR2_sh3eb || BR2_sh4eb || BR2_sh4aeb || BR2_sparc
+			    BR2_sh3eb || BR2_sh4eb || BR2_sh4aeb || BR2_sparc || \
+			    BR2_microblazebe
 
 config BR2_GCC_TARGET_TUNE
 	string
-- 
1.7.9.1
