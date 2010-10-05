From: Konrad Eisele <konrad@gaisler.com>
Date: Tue,  5 Oct 2010 12:50:36 +0200
Subject: [Buildroot] [PATCH 1/3] config: Add sparc-leon processors. Readd V7,
	8 part of BR2_SPARC_TYPE. Add BR2_GCC_TARGET_CPU. Remove depricated
	v9 Sparc type.
In-Reply-To: <4CAB0299.2010903@gaisler.com>
References: <4CAB0299.2010903@gaisler.com>
Message-ID: <1286275838-5226-1-git-send-email-konrad@gaisler.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the Sparc processor variants hfleon (fpu,v7), hfleonv8 (fpu,v8),
sfleon (softfpu,v7) sfleonv8 (softfpu,v8). Readd the prevously removed BR2_SPARC_TYPE
entry for V7 and V8 as for it is used by uclibc to destinguish between v7 and v8.
Also add entry BR2_GCC_TARGET_CPU that is later used by toolchain/gcc/gcc-uclibc-4.x.mk
to add possblity for adding --with-cpu to gcc's configure. As for V9 seems to be removed
also removed the V9 targets from the choice selection.

Signed-off-by: Konrad Eisele <konrad@gaisler.com>
---
 target/Config.in.arch |   31 +++++++++++++++++++------------
 1 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index e08ce5b..d828501 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -304,6 +304,14 @@ config BR2_sparc_cypress
 	bool "cypress"
 config BR2_sparc_v8
 	bool "v8"
+config BR2_sparc_sparchfleon
+	bool "hfleon"
+config BR2_sparc_sparchfleonv8
+	bool "hfleonv8"
+config BR2_sparc_sparcsfleon
+	bool "sfleon"
+config BR2_sparc_sparcsfleonv8
+	bool "sfleonv8"
 config BR2_sparc_supersparc
 	bool "supersparc"
 config BR2_sparc_sparclite
@@ -320,20 +328,13 @@ config BR2_sparc_sparclet
 	bool "sparclet"
 config BR2_sparc_tsc701
 	bool "tsc701"
-config BR2_sparc_v9
-	bool "v9"
-config BR2_sparc_v9a
-	bool "v9a"
-config BR2_sparc_v9b
-	bool "v9b"
-config BR2_sparc_ultrasparc
-	bool "ultrasparc"
-config BR2_sparc_ultrasparc3
-	bool "ultrasparc3"
-config BR2_sparc_niagara
-	bool "niagara"
 endchoice
 
+config BR2_SPARC_TYPE
+	string
+	default V7	if BR2_sparc_v7 || BR2_sparc_cypress || BR2_sparc_sparclite || BR2_sparc_f930 || BR2_sparc_f934 || BR2_sparc_sparclite86x || BR2_sparc_sparclet || BR2_sparc_tsc701 || BR2_sparc_sparchfleon || BR2_sparc_sparcsfleon
+	default V8	if BR2_sparc_v8 || BR2_sparc_supersparc || BR2_sparc_hypersparc || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleonv8
+
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_xtensa
@@ -666,3 +667,9 @@ config BR2_GCC_TARGET_ABI
 	default ibmlongdouble	if BR2_powerpc && BR2_PPC_ABI_ibmlongdouble
 	default ieeelongdouble	if BR2_powerpc && BR2_PPC_ABI_ieeelongdouble
 
+config BR2_GCC_TARGET_CPU
+	string
+	default sparchfleon	if BR2_sparc_sparchfleon
+	default sparchfleonv8	if BR2_sparc_sparchfleonv8
+	default sparcsfleon	if BR2_sparc_sparcsfleon
+	default sparcsfleonv8	if BR2_sparc_sparcsfleonv8
-- 
1.6.3.2
