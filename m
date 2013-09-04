From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 04 Sep 2013 10:44:27 +0800
Subject: [Buildroot] [PATCH 2/2] arch/Config.in: Allow ARM to select
	BR2_BINFMT_FLAT
In-Reply-To: <1378262598.32360.5.camel@phoenix>
References: <1378262598.32360.5.camel@phoenix>
Message-ID: <1378262667.32360.6.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some noMMU ARM platforms need to select BR2_BINFMT_FLAT.
Most ARM platforms have MMU, thus set default to BR2_BINFMT_ELF for ARM.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 arch/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 14899ca..31c23ec 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -223,8 +223,9 @@ config BR2_GCC_TARGET_MODE
 # Set up target binary format
 choice
 	prompt "Target Binary Format"
-	depends on BR2_bfin || BR2_m68k
-	default BR2_BINFMT_FDPIC
+	depends on BR2_arm || BR2_bfin || BR2_m68k
+	default BR2_BINFMT_ELF if BR2_arm
+	default BR2_BINFMT_FDPIC if (BR2_bfin || BR2_m68k)
 
 config BR2_BINFMT_ELF
 	bool "ELF"
@@ -245,7 +246,7 @@ config BR2_BINFMT_FDPIC
 
 config BR2_BINFMT_FLAT
 	bool "FLAT"
-	depends on BR2_bfin || BR2_m68k
+	depends on BR2_arm || BR2_bfin || BR2_m68k
 	select BR2_PREFER_STATIC_LIB
 	help
 	  FLAT binary is a relatively simple and lightweight executable format
-- 
1.8.1.2
