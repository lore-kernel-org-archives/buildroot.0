From: Kevin Chadwick <ma1l1ists@yahoo.co.uk>
Date: Mon, 20 Aug 2012 17:27:49 +0100
Subject: [Buildroot] Best way of building for unknown architecture
In-Reply-To: <20120817194310.25198340@skate>
References: <760828.46392.bm@smtp116.mail.ukl.yahoo.com>
 <20120817194310.25198340@skate>
Message-ID: <12889.25157.bm@smtp148.mail.ukl.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Aug 2012 19:43:10 +0200
Thomas Petazzoni wrote:

> > 	Openembedded, T2 and NuttX seem to support arm7-m (cortex-m3)
> > 	but I like buildroot. Is the best way of building to use Little
> > 	endian generic and the GCC compiler or is it fairly easy to add
> > 	a new architecture variant that I could possibly send a diff
> > 	for later.  
> 
> Adding a new target architecture variant just requires a few lines of
> code in target/Config.in.arch. If you give some hints, I'm pretty sure
> someone will be kind enough to help you making the necessary changes.
> 

This patch seems to add the --with-arch="armv7-m" and
--with-tune="cortex-m3" when cortex-m3 is selected.


--- target/Config.in.arch.old	2012-08-15 11:11:48.000000000 +0100
+++ target/Config.in.arch	2012-08-20 07:48:03.224810072 +0100
@@ -172,6 +172,8 @@
 	bool "arm1176jz-s"
 config BR2_arm1176jzf_s
 	bool "arm1176jzf-s"
+config BR2_cortex_m3
+	bool "cortex-m3"
 config BR2_cortex_a8
 	bool "cortex-A8"
 config BR2_cortex_a9
@@ -204,6 +206,7 @@
 	default ARM_SA1100	if BR2_sa1100
 	default ARM_XSCALE	if BR2_xscale
 	default ARM_IWMMXT	if BR2_iwmmxt
+	default ARM_CORTEXM3	if BR2_cortex_m3
 	default ARM_CORTEXA8	if BR2_cortex_a8
 	default ARM_CORTEXA9	if BR2_cortex_a9
 
@@ -734,6 +737,7 @@
 	default arm1136jf-s	if BR2_arm1136jf_s
 	default arm1176jz-s	if BR2_arm1176jz_s
 	default arm1176jzf-s	if BR2_arm1176jzf_s
+	default cortex-m3	if BR2_cortex_m3
 	default cortex-a8	if BR2_cortex_a8
 	default cortex-a9	if BR2_cortex_a9
 	default strongarm110	if BR2_sa110
@@ -841,6 +845,7 @@
 	default armv6j		if BR2_arm1136jf_s
 	default armv6zk		if BR2_arm1176jz_s
 	default armv6zk		if BR2_arm1176jzf_s
+	default armv7-m		if BR2_cortex_m3
 	default armv7-a		if BR2_cortex_a8
 	default armv7-a		if BR2_cortex_a9
 	default armv4		if BR2_sa110


www.linux-arm.org/LinuxKernel/LinuxM3 suggests that the following should
be added to build busybox


-mthumb -Wl,-elf2flt=-s -Wl,-elf2flt=16384

and I think

-mfloat-abi=soft might be a good idea for this cpu too


I have successfully built arm binaries with the inbuilt toolchain
manually using

-march=armv7-m -mtune=cortex-m3 -mthumb -mfloat-abi=soft

but the -Wl linker option flags fail and I am not sure how to add
-mthumb and -mfloat-abi=soft to buildroot though it does already have
--with-float=soft enabled?

________________________________________________________________________

I wanted to test it so I extracted a fresh buildroot and pointed the
external chain to the already built uclibc internal toolchain
(built before patching with above) where I had selected NO_MMU before
building.

When I ran make I got

Checking external toolchain settings
MMU support available in C library, please enable BR2_USE_MMU

This chip has no MMU but does have an MPU, do I need to rebuild the
toolchain with this patch, bypass/fix this error or enable MMU and
select not to use MMU or something else?

Thanks,

	Kc
