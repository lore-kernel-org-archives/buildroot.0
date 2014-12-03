From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Dec 2014 22:41:32 +0100
Subject: [Buildroot] [PATCH 5/8] arch: introduce BR2_BINFMT_SUPPORTS_SHARED
In-Reply-To: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417642895-29606-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for the refactoring of the static/shared library
support, we add a BR2_BINFMT_SUPPORTS_SHARED hidden option that binary
formats supporting shared libraries should select.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index c05e5d7..c7bef5d 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -251,6 +251,10 @@ config BR2_GCC_TARGET_MODE
 config BR2_ARCH_HAS_ATOMICS
 	bool
 
+# Must be selected by binary formats that support shared libraries.
+config BR2_BINFMT_SUPPORTS_SHARED
+	bool
+
 # Set up target binary format
 choice
 	prompt "Target Binary Format"
@@ -261,6 +265,7 @@ choice
 config BR2_BINFMT_ELF
 	bool "ELF"
 	depends on !BR2_bfin && !BR2_m68k
+	select BR2_BINFMT_SUPPORTS_SHARED
 	help
 	  ELF (Executable and Linkable Format) is a format for libraries and
 	  executables used across different architectures and operating
@@ -269,6 +274,7 @@ config BR2_BINFMT_ELF
 config BR2_BINFMT_FDPIC
 	bool "FDPIC"
 	depends on BR2_bfin
+	select BR2_BINFMT_SUPPORTS_SHARED
 	help
 	  ELF FDPIC binaries are based on ELF, but allow the individual load
 	  segments of a binary to be located in memory independently of each
@@ -307,6 +313,7 @@ config BR2_BINFMT_FLAT_SEP_DATA
 config BR2_BINFMT_FLAT_SHARED
 	bool "Shared binary"
 	depends on BR2_bfin || BR2_m68k
+	select BR2_BINFMT_SUPPORTS_SHARED
 	help
 	  Allow to load and link indiviual FLAT binaries at run time.
 
-- 
2.1.0
