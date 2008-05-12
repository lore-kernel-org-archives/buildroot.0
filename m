From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 12 May 2008 05:43:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20080512124357.F1E4A3C5FA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-05-12 05:43:57 -0700 (Mon, 12 May 2008)
New Revision: 21972

Log:
toolchain: fix mips abi selection

Based on commit 0e2ab in aldot's tree.


Modified:
   trunk/buildroot/target/Config.in.arch


Changeset:
Modified: trunk/buildroot/target/Config.in.arch
===================================================================
--- trunk/buildroot/target/Config.in.arch	2008-05-11 06:55:04 UTC (rev 21971)
+++ trunk/buildroot/target/Config.in.arch	2008-05-12 12:43:57 UTC (rev 21972)
@@ -148,6 +148,8 @@
 	bool "mips 32r2"
 config BR2_mips_64
 	bool "mips 64"
+config BR2_mips_64r2
+	bool "mips 64r2"
 config BR2_mips_16
 	bool "mips 16"
 endchoice
@@ -156,16 +158,30 @@
 choice
 	prompt "Target ABI"
 	depends BR2_mips || BR2_mipsel
-	default BR2_MIPS_EABI
+	default BR2_MIPS_OABI32 if BR_mips_32 || BR_mips_32r2
+	default BR2_MIPS_ABI32 if BR_mips_64 || BR_mips_64r2
 	help
 	  Application Binary Interface to use
 
-config BR2_MIPS_OABI
-	bool "OABI"
+config BR2_MIPS_OABI32
+	bool "o32"
+config BR2_MIPS_ABI32
+	bool "n32"
+	depends BR2_mips_3 || BR2_mips_4 || BR2_mips_64 || BR2_mips_64r2 || BR2_mips_16
 config BR2_MIPS_EABI
-	bool "EABI"
+	bool "eabi"
+	depends BR2_mips_3 || BR2_mips_4 || BR2_mips_64 || BR2_mips_64r2 || BR2_mips_16
 config BR2_MIPS_ABI64
-	bool "N64"
+	bool "n64"
+	depends BR2_mips_3 || BR2_mips_4 || BR2_mips_64 || BR2_mips_64r2 || BR2_mips_16
+config BR2_MIPS_OABI64
+	bool "o64"
+	depends BR2_mips_3 || BR2_mips_4 || BR2_mips_64 || BR2_mips_64r2 || BR2_mips_16
+config BR2_MIPS_ABI_none
+	bool "unspecified"
+	depends BR2_mips_16
+	help
+	  Unspecified ABI leaves ABI selection blank.
 endchoice
 
 choice
@@ -594,6 +610,7 @@
 	default mips32		if BR2_mips_32
 	default mips32r2	if BR2_mips_32r2
 	default mips64		if BR2_mips_64
+	default mips64r2	if BR2_mips_64r2
 	default mips16		if BR2_mips_16
 	default 401		if BR2_powerpc_401
 	default 403		if BR2_powerpc_403
@@ -694,11 +711,11 @@
 	default aapcs		if BR2_arm_dunno
 	default aapcs-linux	if BR2_arm_dunno
 	default iwmmxt		if BR2_iwmmxt
-	default 32		if BR2_mipsel && BR2_MIPS_OABI
-	default n32		if BR2_mipsel && BR2_MIPS_EABI
-	default o64		if BR2_mips && BR2_MIPS_OABI
-	default eabi		if BR2_mips && BR2_MIPS_EABI
-	default 64		if BR2_mips && BR2_MIPS_ABI64
+	default 32		if BR2_MIPS_OABI32
+	default n32		if BR2_MIPS_ABI32
+	default eabi		if BR2_MIPS_EABI
+	default o64		if BR2_MIPS_OABI64
+	default n64		if BR2_MIPS_ABI64
 	default mmixware	if BR2_mmix && BR2_MMIX_ABI_native
 	default gnu		if BR2_mmix && !BR2_MMIX_ABI_native
 	default altivec		if BR2_powerpc && BR2_PPC_ABI_altivec
