From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 17 May 2011 10:15:39 +0200
Subject: [Buildroot] u-boot compiler issue
In-Reply-To: <20110517090130.7aae0ca7@surf>
References: <4DCBEC13.2050802@visionsystems.de> <20110517090130.7aae0ca7@surf>
Message-ID: <4DD22EAB.70508@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>> I was building u-boot with buildroots created toolchain. Everything was working except
>> that pointer passed via r8 was not writable (RAM was not configured
>> etc.).
> Could you give more details about this analysis ?

#define DECLARE_GLOBAL_DATA_PTR     register volatile gd_t *gd asm ("r8")

in file arch/arm/cpu/arm_cortexa8/omap3/emif4.c:

int dram_init(void)
{
        DECLARE_GLOBAL_DATA_PTR;
        unsigned int size0 = 0, size1 = 0;

        size0 = get_sdr_cs_size(CS0);

        /*
         * If a second bank of DDR is attached to CS1 this is
         * where it can be started.  Early init code will init
         * memory on CS0.
         */
        if ((sysinfo.mtype == DDR_COMBO) || (sysinfo.mtype == DDR_STACKED))
                size1 = get_sdr_cs_size(CS1);

        gd->bd->bi_dram[0].start = PHYS_SDRAM_1;

        gd->bd->bi_dram[0].size = size0;  <----- this assignment has no effect, afterwards the size is 0

        gd->bd->bi_dram[1].start = PHYS_SDRAM_1 + get_sdr_cs_offset(CS1);
        gd->bd->bi_dram[1].size = size1;

        return 0;
}

with CodeSourcery 's compiler the size will be correctly assigned.

>> But if the same code was compiled with CodeSourcery everything
>> was working. Here gcc configuration from buidroot:
> Does the U-Boot compilation fails, or the compilation works but U-Boot
> fails to run on the device ? If it's the latter, then which version of
> U-Boot are you using ? Only recent versions of U-Boot work well with
> gcc 4.5.

This is u-boot 2010.06 from ARAGO project (http://arago-project.org/wiki/index.php/Main_Page). Git tree:
http://arago-project.org/git/projects/?p=u-boot-omap3.git;a=summary

U-Boot compiles correctly in the sense that I get u-boot.bin and it also runs: I get command prompt and can execute various commands. The only things that fail are those that require RAM address and size like bootm and so on.

I hope this info will help.

P.S. I've got a hint that enabling __cxa_atexit would possibly solve the problem. So I added this setting to the toolchain, but it didn't help.

COLLECT_GCC=arm-linux-gcc
COLLECT_LTO_WRAPPER=/home/YegorYefremov/projects/versioned/tests/buildroot/output/host/usr/libexec/gcc/arm-unknown-linux-uclibcgnueabi/4.5.2/lto-wrapper
Target: arm-unknown-linux-uclibcgnueabi
Configured with: /home/YegorYefremov/projects/versioned/tests/buildroot/output/toolchain/gcc-4.5.2/configure --prefix=/home/YegorYefremov/projects/versioned/tests/buildroot/output/host/usr --build=x86_64-unknown-linux-gnu --host=x86_64-unknown-linux-gnu --target=arm-unknown-linux-uclibcgnueabi --enable-languages=c,c++ --with-sysroot=/home/YegorYefremov/projects/versioned/tests/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot --with-build-time-tools=/home/YegorYefremov/projects/versioned/tests/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/bin --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --disable-libssp --disable-multilib --disable-tls --enable-shared --with-gmp=/home/YegorYefremov/projects/versioned/tests/buildroot/output/host/usr --with-mpfr=/home/YegorYefremov/projects/versioned/tests/buildroot/output/host/usr --with-mpc=/home/YegorYefremov/projects/versioned/tests/buildroot/output/host/usr --disable-nls --enable-threads
--disable-decimal-float --with-float=soft --with-abi=aapcs-linux --with-arch=armv7-a --with-tune=cortex-a8 --enable-__cxa_atexit --with-pkgversion='Buildroot 2011.05-git-00157-gf4c06f4-dirty' --with-bugurl=http://bugs.buildroot.net/
Thread model: posix
gcc version 4.5.2 (Buildroot 2011.05-git-00157-gf4c06f4-dirty)

--disable-__cxa_atexit

--disable-__cxa_atexit
