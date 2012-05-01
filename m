From: Paul Chavent <paul.chavent@fnac.net>
Date: Tue, 01 May 2012 17:24:48 +0200
Subject: [Buildroot] Running linux with mmu disabled on arm (AT91).
Message-ID: <4FA00040.8000207@fnac.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

I'd like to try linux on an AT91SAM9G20 (i have a linuxstamp board), with MMU disabled (the Hyok-Sung Choi & Hee-Chul Yun paper demonstrate that it could be possible).

All the code seems to be present in the kernel...
So i would like to share my experience.

(1) I had to make two little changes in the kernel code :
     - I'm not able to change the REMAP_VECTOR_TO_DRAM. I have submitted the problem to the kbuild mailing list (http://www.spinics.net/lists/linux-kbuild/msg06153.html).
     - The soc_detect code that init the at91_soc_initdata structure is never called. Later this structure is used unitialized.
     I'm currently using the joined patch as a workaround. Someone can review it please ?

(2) I used to run the module with a "classic system" based on linux + eglibc, and i needed only one toolchain (arm-xxx-linux-gnueabi) for the kernel and the userspace apps.
     I found that for the nommu case i wasn't able to build the kernel with the userspace toolchain.
     So I had to build 2 toolchain, based on binutils 2.22, gcc 4.7, uclibc 0.9.33.1 and linux 3.2.14 :
       - an arm-xxx-eabi toolchain for the kernel
       - an arm-xxx-uclinux-uclibceabi for the userspace apps
     Do you confirm that it is not possible to compile the kernel with arm-xxx-uclinux-uclibceabi ? Or, may i have misconfigured the toolchain (i join the toolchain build procedure) ?

(3) The arm-xxx-uclinux-uclibceabi with elf2flt seems to produce running bins only if it is build with the uClibc DOPIC not set.
     Is it required to disable DOPIC ?
     Moreover, i can't run bins produced with a arm-xxx-linux-uclibceabi toolchain and -Wl,-elf2flt (not uclinux one). Is it the expected behavior ?

(4) The elf2flt needs to be updated to be aware of the exidx section, and some reloc types. I join the patch i currently use.

Given these observations, i've been able to run a linux with an hello world as the /init process.

My next tests will be to run threaded programs, c++ programs, then busybox.


Thanks for your attention.

Paul.

-------------- next part --------------
diff -abBruN linux-3.2.14.orig/arch/arm/Kconfig-nommu linux-3.2.14.mod/arch/arm/Kconfig-nommu
--- linux-3.2.14.orig/arch/arm/Kconfig-nommu	2012-04-02 18:53:31.000000000 +0200
+++ linux-3.2.14.mod/arch/arm/Kconfig-nommu	2012-04-15 12:52:05.000000000 +0200
@@ -34,8 +34,7 @@
 	  used instead of the auto-probing which utilizes the register.
 
 config REMAP_VECTORS_TO_RAM
-	bool 'Install vectors to the beginning of RAM' if DRAM_BASE
-	depends on DRAM_BASE
+	bool 'Install vectors to the beginning of RAM'
 	help
 	  The kernel needs to change the hardware exception vectors.
 	  In nommu mode, the hardware exception vectors are normally
diff -abBruN linux-3.2.14.orig/arch/arm/mm/nommu.c linux-3.2.14.mod/arch/arm/mm/nommu.c
--- linux-3.2.14.orig/arch/arm/mm/nommu.c	2012-04-02 18:53:31.000000000 +0200
+++ linux-3.2.14.mod/arch/arm/mm/nommu.c	2012-04-16 15:50:47.000000000 +0200
@@ -31,12 +31,23 @@
 {
 }
 
+static void __init devicemaps_init(struct machine_desc *mdesc)
+{
+	/*
+	 * Ask the machine support to map in the statically mapped devices.
+	 */
+	if (mdesc->map_io)
+		mdesc->map_io();
+}
+
 /*
  * paging_init() sets up the page tables, initialises the zone memory
  * maps, and sets up the zero page, bad page and bad page tables.
  */
 void __init paging_init(struct machine_desc *mdesc)
 {
+	devicemaps_init(mdesc);
+
 	bootmem_init();
 }
 
-------------- next part --------------
