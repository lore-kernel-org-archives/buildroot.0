From: Cody P Schafer <cody@linux.vnet.ibm.com>
Date: Mon, 12 May 2014 17:33:18 -0700
Subject: [Buildroot] [PATCH v3 3/8] powerpc: add BR2_POWERPC_CPU_HAS_SPE to
	replace adhoc deps/checks
In-Reply-To: <1399941203-8282-1-git-send-email-cody@linux.vnet.ibm.com>
References: <1399941203-8282-1-git-send-email-cody@linux.vnet.ibm.com>
Message-ID: <1399941203-8282-4-git-send-email-cody@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>
---
 arch/Config.in.powerpc | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index ae70a8a..56360d7 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -1,3 +1,6 @@
+config BR2_POWERPC_CPU_HAS_SPE
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_powerpc
@@ -62,8 +65,10 @@ config BR2_powerpc_970
 	bool "970"
 config BR2_powerpc_8540
 	bool "8540 / e500v1"
+	select BR2_POWERPC_CPU_HAS_SPE
 config BR2_powerpc_8548
 	bool "8548 / e500v2"
+	select BR2_POWERPC_CPU_HAS_SPE
 config BR2_powerpc_e300c2
 	bool "e300c2"
 config BR2_powerpc_e300c3
@@ -75,17 +80,17 @@ endchoice
 choice
 	prompt "Target ABI"
 	depends on BR2_powerpc
-	default BR2_powerpc_SPE if BR2_powerpc_8540 || BR2_powerpc_8548
+	default BR2_powerpc_SPE if BR2_POWERPC_CPU_HAS_SPE
 	default BR2_powerpc_CLASSIC
 	help
 	  Application Binary Interface to use
 
 config BR2_powerpc_CLASSIC
 	bool "Classic"
-	depends on !(BR2_powerpc_8540 || BR2_powerpc_8548)
+	depends on !BR2_POWERPC_CPU_HAS_SPE
 config BR2_powerpc_SPE
 	bool "SPE"
-	depends on BR2_powerpc_8540 || BR2_powerpc_8548
+	depends on BR2_POWERPC_CPU_HAS_SPE
 endchoice
 
 config BR2_POWERPC_SOFT_FLOAT
-- 
1.9.3
