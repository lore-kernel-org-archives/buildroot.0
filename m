From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 22:48:57 +0100
Subject: [Buildroot] [git commit] arch: FDPIC is not supported on m68k
Message-ID: <20141211215300.A703F8032E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c149083f933b7e60f606e6e6ffe478c37538bc37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current binfmt selection in arch/Config.in allows to select FDPIC
on m68k, which is incorrect. This commit fixes that, and makes sure
FDPIC is the default on Blackfin, while FLAT is the default on m68k.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 arch/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

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
