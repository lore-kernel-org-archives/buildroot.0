From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jun 2018 22:25:35 +0200
Subject: [Buildroot] [PATCH] qemu: update defconfigs to Linux 4.16.7
In-Reply-To: <20180602200720.GA12765@waldemar-brodkorb.de>
References: <20180602200720.GA12765@waldemar-brodkorb.de>
Message-ID: <20180602222535.2a113cb3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 2 Jun 2018 22:07:20 +0200, Waldemar Brodkorb wrote:
> All linux configs are renamed to a version neutral filename
> to avoid further renaming on kernel bumps.
> 
> Defconfig               Kernel  Qemu            Network Status
> --------------------------------------------------------------
> aarch64_virt            4.16.7   2.12.0           YES     OK
> arm_versatile           4.16.7   2.12.0           YES     OK
> arm_versatile_nommu     4.16.7   2.12.0           YES     OK (3)
> arm_vexpress            4.16.7   2.12.0           YES     OK
> m68k_mcf5208            4.16.7   2.12.0           YES     OK
> m68k_q800               4.16.7   q800-v2.11.0     NO (2)  OK
> microblazebe            4.16.7   2.12.0           YES     OK
> microblazeel            4.16.7   2.12.0           YES     OK
> mips32r2el_malta        4.16.7   2.12.0           YES     OK
> mips32r2_malta          4.16.7   2.12.0           YES     OK
> mips32r6el_malta        4.16.7   2.12.0           YES     OK
> mips32r6_malta          4.16.7   2.12.0           YES     OK
> mips64el_malta          4.16.7   2.12.0           YES     OK
> mips64_malta            4.16.7   2.12.0           YES     OK
> mips64r6el_malta        4.16.7   2.12.0           YES     OK
> mips64r6_malta          4.16.7   2.12.0           YES     OK
> nios2-10m50             4.16.7   2.12.0           NO      OK
> or1k                    4.16.7   2.12.0           NO      OK
> ppc_g3beige             4.16.7   2.12.0           YES     OK
> ppc_mpc8544ds           4.16.7   2.12.0           YES     OK
> ppc_virtex_ml507        4.16.7   2.12.0           NO      OK
> ppc64_pseries           4.16.7   2.12.0           YES     OK
> ppc64le_pseries         4.16.7   2.12.0           YES     OK
> ppc64_e5500             4.16.7   2.12.0           YES     OK
> sh4                     4.16.7   2.12.0           YES     OK
> sh4eb                   4.16.7   2.12.0           NO (1)  OK
> sparc_ss10              4.16.7   2.12.0           YES     OK
> sparc64_sun4u           4.16.7   2.12.0           YES     OK
> x86                     4.16.7   2.12.0           YES     OK
> x86_64                  4.16.7   2.12.0           YES     OK
> xtensa_lx60             4.16.7   2.12.0           YES     OK
> xtensa_lx60_nommu       4.16.7   2.12.0           YES     OK

Thanks for this work! I've applied to master. The renaming of the Linux
kernel configuration files to linux.config is a good idea.

However, it seems you haven't updated the *contents* of the Linux
kernel configuration file. I did bump a few of those defconfigs today,
and running "make linux-update-defconfig" usually generates a few lines
of changes in the defconfig. Be careful: we don't want to have part of
the kernel configuration values that are enforced by Buildroot, such as
initramfs, devtmpfs, CPU_{LITTLE,BIG}_ENDIAN, etc. But there are other
changes that those. For example:

--- a/board/qemu/mips64-malta/linux-4.11.config
+++ b/board/qemu/mips64-malta/linux-4.16.config
@@ -1,14 +1,12 @@
 CONFIG_MIPS_MALTA=y
 CONFIG_CPU_MIPS64_R1=y
 CONFIG_64BIT=y
-CONFIG_MIPS_MT_SMP=y
 CONFIG_NR_CPUS=2
 CONFIG_SYSVIPC=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_PCI=y
-CONFIG_MIPS32_COMPAT=y
 CONFIG_MIPS32_O32=y
 CONFIG_MIPS32_N32=y
 CONFIG_NET=y

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
