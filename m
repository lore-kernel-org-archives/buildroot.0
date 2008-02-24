From: Shinya Kuribayashi <skuribay@ruby.dti.ne.jp>
Date: Sun, 24 Feb 2008 12:36:54 +0900
Subject: [Buildroot] How to build MIPS cross compiler
In-Reply-To: <47BAEFC5.9080609@ich-geh-kaputt.de>
References: <f185607a0802190354v51d3e721ib9678782e72252f1@mail.gmail.com>
	<47BAEFC5.9080609@ich-geh-kaputt.de>
Message-ID: <47C0E656.2080707@ruby.dti.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kai Moritz wrote:
> Mile Davidovic schrieb:
>> Hello,
>> I am trying to build MIPS based toolchain, but unfortunately I got
>> error with unsupported ABI.
>>   
> Hi Mile,
> 
> I have the same problem.
> I have tried out all available combinations of mips and ABI.
> None of them worked...
> 
> Bernhard Fischer (rep.dot.nop at gmail.com) send me a link to his personal 
> git-Branch of buildroot, which is slightly older than trunk from svn.
> That branch worked for me.
> But I do not know, if it will be merged back into trunk, or when...

Here's the workable patch suggested by Elizabeth Oldham[1], back in Oct
2007. Bernhard also posted a patch[2], but that didn't work due to
`--with-abi=o32' for OABI. Do we need --with-abi=32, instead?
            ^

Bernhard, Elizabeth, do you have any time to fix this up?

  Shinya

[1] http://buildroot.uclibc.org/lists/buildroot/2007-October/005742.html
[2] http://buildroot.uclibc.org/lists/buildroot/2007-October/005743.html

Index: target/Config.in.arch
===================================================================
--- target/Config.in.arch	(revision 21094)
+++ target/Config.in.arch	(working copy)
@@ -148,24 +148,25 @@
 	bool "mips 32r2"
 config BR2_mips_64
 	bool "mips 64"
-config BR2_mips_16
-	bool "mips 16"
+config BR2_mips_64r2
+	bool "mips 64r2"
 endchoice
 
 
 choice
 	prompt "Target ABI"
 	depends BR2_mips || BR2_mipsel
-	default BR2_MIPS_EABI
+	default BR_mips_ABI_O32 if BR_mips_32 || BR_mips_32r2
+	default BR_mips_ABI_N32 if BR_mips_64 || BR_mips_64r2
 	help
 	  Application Binary Interface to use
 
-config BR2_MIPS_OABI
-	bool "OABI"
-config BR2_MIPS_EABI
-	bool "EABI"
-config BR2_MIPS_ABI64
-	bool "N64"
+config BR2_MIPS_ABI_O32
+	bool "o32"
+config BR2_MIPS_ABI_N32
+	bool "n32"
+config BR2_MIPS_ABI_N64
+	bool "n64"
 endchoice
 
 choice
@@ -589,7 +590,7 @@
 	default mips32		if BR2_mips_32
 	default mips32r2	if BR2_mips_32r2
 	default mips64		if BR2_mips_64
-	default mips16		if BR2_mips_16
+	default mips64r2	if BR2_mips_64r2
 	default 401		if BR2_powerpc_401
 	default 403		if BR2_powerpc_403
 	default 405		if BR2_powerpc_405
@@ -689,11 +690,9 @@
 	default aapcs		if BR2_arm_dunno
 	default aapcs-linux	if BR2_arm_dunno
 	default iwmmxt		if BR2_iwmmxt
-	default 32		if BR2_mipsel && BR2_MIPS_OABI
-	default n32		if BR2_mipsel && BR2_MIPS_EABI
-	default o64		if BR2_mips && BR2_MIPS_OABI
-	default eabi		if BR2_mips && BR2_MIPS_EABI
-	default 64		if BR2_mips && BR2_MIPS_ABI64
+	default 32		if BR2_MIPS_ABI_O32
+	default n32		if BR2_MIPS_ABI_N32
+	default 64		if BR2_MIPS_ABI_N64
 	default mmixware	if BR2_mmix && BR2_MMIX_ABI_native
 	default gnu		if BR2_mmix && !BR2_MMIX_ABI_native
 	default altivec		if BR2_powerpc && BR2_PPC_ABI_altivec
