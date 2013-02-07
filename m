From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Feb 2013 20:39:26 +0100
Subject: [Buildroot] [git commit] arch/arm: fix-up the ARM Kconfig warning
Message-ID: <20130207194248.C52DB9AA03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58c2500e2ab550e28a5edd8369e1cf9b043874d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kconfig does not accepts that a symbol that is part of a choice
be affected a default value.

Fix this by introducing a dummy EABI symbol, and make the real
EABI symbol a prompt-less option that depends on !OABI.

[Peter: drop arm dependency, rename to EABI_CHOICE]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 arch/Config.in.arm |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 37152c0..79f08f7 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -76,7 +76,7 @@ choice
 	  Note:
 	    Using OABI is discouraged.
 
-config BR2_ARM_EABI
+config BR2_ARM_EABI_CHOICE
 	bool "EABI"
 config BR2_ARM_OABI
 	bool "OABI"
@@ -84,8 +84,8 @@ config BR2_ARM_OABI
 endchoice
 
 config BR2_ARM_EABI
-	default y
-	depends on !BR2_DEPRECATED
+	def_bool y
+	depends on !BR2_ARM_OABI
 
 config BR2_ARM_ENABLE_NEON
 	bool "Enable NEON SIMD extension support"
