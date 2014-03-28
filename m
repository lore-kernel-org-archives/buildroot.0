From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 28 Mar 2014 11:00:52 +0000
Subject: [Buildroot] [PATCH v4] Disable o32 ABI for MIPS64 architectures
Message-ID: <1396004452-28983-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building o32 ELF files for MIPS64 is an exotic configuration that nobody
should be using. If o32 is required, then is better if it's built for
MIPS 32-bit cores so only 32-bit instructions will be used leading to a
more efficient o32 usage.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 CHANGES             |    8 ++++++++
 arch/Config.in.mips |   11 ++++++-----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 45a31c4..1487a29 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,11 @@
+2014.05, Not yet released:
+
+Support for MIPS o32 ABI on MIPS-64 targets has been removed. Building
+o32 ELF files for MIPS64 is an exotic configuration that nobody should
+be using. If o32 is required, then is better if it's built for MIPS
+32-bit cores so only 32-bit instructions will be used leading to a more
+efficient o32 usage.
+
 2014.02, Released February 27th, 2014
 
 	Minor fixes.
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index d9c0c02..20951e0 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -38,15 +38,12 @@ endchoice
 
 choice
 	prompt "Target ABI"
-	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	default BR2_MIPS_OABI32 if !BR2_ARCH_IS_64
-	default BR2_MIPS_NABI32 if BR2_ARCH_IS_64
+	depends on BR2_mips64 || BR2_mips64el
+	default BR2_MIPS_NABI32
 
 	help
 	  Application Binary Interface to use
 
-config BR2_MIPS_OABI32
-	bool "o32"
 config BR2_MIPS_NABI32
 	bool "n32"
 	depends on BR2_ARCH_IS_64
@@ -86,6 +83,10 @@ config BR2_GCC_TARGET_ARCH
 	default "mips64"	if BR2_mips_64
 	default "mips64r2"	if BR2_mips_64r2
 
+config BR2_MIPS_OABI32
+	bool
+	default y		if BR2_mips || BR2_mipsel
+
 config BR2_GCC_TARGET_ABI
 	default "32"		if BR2_MIPS_OABI32
 	default "n32"		if BR2_MIPS_NABI32
-- 
1.7.1
