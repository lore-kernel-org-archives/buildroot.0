From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  7 Feb 2013 20:04:48 +0100
Subject: [Buildroot] [PATCH] arch/arm: fix-up the ARM Kconfig warning
Message-ID: <1360263888-5806-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kconfig does not accepts that a symbol that is part of a choice
be affected a default value.

Fix this by introducing a dummy EABI symbol., and nake the real
EABI symbol a prompt-less option that depends on !OABI.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 arch/Config.in.arm |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 37152c0..ecb45ab 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -76,7 +76,7 @@ choice
 	  Note:
 	    Using OABI is discouraged.
 
-config BR2_ARM_EABI
+config BR2_ARM_EABI_DUMMY
 	bool "EABI"
 config BR2_ARM_OABI
 	bool "OABI"
@@ -84,8 +84,9 @@ config BR2_ARM_OABI
 endchoice
 
 config BR2_ARM_EABI
-	default y
-	depends on !BR2_DEPRECATED
+	def_bool y
+	depends on BR2_arm || BR2_armeb
+	depends on !BR2_ARM_OABI
 
 config BR2_ARM_ENABLE_NEON
 	bool "Enable NEON SIMD extension support"
-- 
1.7.2.5
