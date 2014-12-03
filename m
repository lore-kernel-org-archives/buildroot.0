From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Dec 2014 22:41:30 +0100
Subject: [Buildroot] [PATCH 3/8] arch: FDPIC is not supported on m68k
In-Reply-To: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417642895-29606-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current binfmt selection in arch/Config.in allows to select FDPIC
on m68k, which is incorrect. This commit fixes that, and makes sure
FDPIC is the default on Blackfin, while FLAT is the default on m68k.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 2779ab6..3bac187 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -255,7 +255,8 @@ config BR2_ARCH_HAS_ATOMICS
 choice
 	prompt "Target Binary Format"
 	depends on BR2_bfin || BR2_m68k
-	default BR2_BINFMT_FDPIC
+	default BR2_BINFMT_FDPIC if BR2_bfin
+	default BR2_BINFMT_FLAT if BR2_m68k
 
 config BR2_BINFMT_ELF
 	bool "ELF"
@@ -267,7 +268,7 @@ config BR2_BINFMT_ELF
 
 config BR2_BINFMT_FDPIC
 	bool "FDPIC"
-	depends on BR2_bfin || BR2_m68k
+	depends on BR2_bfin
 	help
 	  ELF FDPIC binaries are based on ELF, but allow the individual load
 	  segments of a binary to be located in memory independently of each
-- 
2.1.0
