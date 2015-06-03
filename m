From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Wed,  3 Jun 2015 19:34:04 -0300
Subject: [Buildroot] [PATCH v3 2/2] arch: tidy up binary formats config
In-Reply-To: <1433370844-11584-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1433340749-7711-1-git-send-email-guido@vanguardiasur.com.ar>
 <1433370844-11584-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1433370844-11584-2-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of (black)listing architectures when deciding the binary format,
we can enable the ELF format only when using an MMU and FLAT only when
we're not. This mimics the logic in the Linux kernel for user binaries
support.

For FDPIC, we introduce a Kconfig option to enable its selection, and
have blackfin select it.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 arch/Config.in | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 3ad9574..94397b3 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -15,6 +15,9 @@ config BR2_ARCH_HAS_MMU_MANDATORY
 config BR2_ARCH_HAS_MMU_OPTIONAL
 	bool
 
+config BR2_ARCH_HAS_FDPIC_SUPPORT
+	bool
+
 choice
 	prompt "Target Architecture"
 	default BR2_i386
@@ -66,6 +69,7 @@ config BR2_aarch64
 
 config BR2_bfin
 	bool "Blackfin"
+	select BR2_ARCH_HAS_FDPIC_SUPPORT
 	help
 	  The Blackfin is a family of 16 or 32-bit microprocessors developed,
 	  manufactured and marketed by Analog Devices.
@@ -272,13 +276,13 @@ config BR2_BINFMT_SUPPORTS_SHARED
 # Set up target binary format
 choice
 	prompt "Target Binary Format"
-	default BR2_BINFMT_ELF if !(BR2_bfin || BR2_m68k)
-	default BR2_BINFMT_FDPIC if BR2_bfin
-	default BR2_BINFMT_FLAT if BR2_m68k
+	default BR2_BINFMT_ELF if BR2_USE_MMU
+	default BR2_BINFMT_FDPIC if BR2_ARCH_HAS_FDPIC_SUPPORT
+	default BR2_BINFMT_FLAT
 
 config BR2_BINFMT_ELF
 	bool "ELF"
-	depends on !BR2_bfin && !BR2_m68k
+	depends on BR2_USE_MMU
 	select BR2_BINFMT_SUPPORTS_SHARED
 	help
 	  ELF (Executable and Linkable Format) is a format for libraries and
@@ -287,7 +291,7 @@ config BR2_BINFMT_ELF
 
 config BR2_BINFMT_FDPIC
 	bool "FDPIC"
-	depends on BR2_bfin
+	depends on BR2_ARCH_HAS_FDPIC_SUPPORT
 	select BR2_BINFMT_SUPPORTS_SHARED
 	help
 	  ELF FDPIC binaries are based on ELF, but allow the individual load
@@ -297,7 +301,7 @@ config BR2_BINFMT_FDPIC
 
 config BR2_BINFMT_FLAT
 	bool "FLAT"
-	depends on BR2_bfin || BR2_m68k
+	depends on !BR2_USE_MMU
 	help
 	  FLAT binary is a relatively simple and lightweight executable format
 	  based on the original a.out format. It is widely used in environment
-- 
2.1.4
