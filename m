From: Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Mon, 12 Oct 2020 05:28:07 +0000
Subject: [Buildroot] [PATCH v2 1/6] toolchain/buildroot: allow uclibc-ng
 for riscv
References: <BL0PR04MB6514D553FD92664443869465E7070@BL0PR04MB6514.namprd04.prod.outlook.com>
 <88BDE1EF-DAE2-404C-8680-AB5D227AB629@openadk.org>
Message-ID: <BL0PR04MB6514545300186372BA41FEF7E7070@BL0PR04MB6514.namprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020/10/12 14:19, Waldemar Brodkorb wrote:
> Hi,
> Uclibc-Ng doesn?t support riscv32!

That's a simple explanation for the problem :)
Solved !

Thanks.

Thomas,

I think we just need to patch buildroot config to prevent rv32 builds with
uclibc. Something like this:

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 494758bd9d..e59fef3c69 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -107,7 +107,6 @@ config BR2_UCLIBC_TARGET_ARCH
        default "i386"     if BR2_i386
        default "x86_64"   if BR2_x86_64
        default "riscv64"  if BR2_RISCV_64
-       default "riscv32"  if BR2_RISCV_32

 config BR2_UCLIBC_MIPS_ABI
        string
diff --git a/toolchain/toolchain-buildroot/Config.in
b/toolchain/toolchain-buildroot/Config.in
index f34dd84c29..ba2f2cec9b 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -31,7 +31,7 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
                   BR2_arm     || BR2_armeb    || \
                   BR2_i386    || BR2_m68k   || BR2_microblaze || \
                   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-                  BR2_or1k    || BR2_powerpc || BR2_riscv || BR2_sh2a   || \
+                  BR2_or1k    || BR2_powerpc || BR2_RISCV_64|| BR2_sh2a   || \
                   BR2_sh4     || BR2_sh4eb   || BR2_sparc || BR2_xtensa || \
                   BR2_x86_64
        select BR2_TOOLCHAIN_USES_UCLIBC

Totally untested.


> Best regards
>  Waldemar 
> 
>> Am 12.10.2020 um 07:00 schrieb Damien Le Moal <damien.lemoal@wdc.com>:
>>
>> ?On 2020/10/09 4:33, Thomas Petazzoni wrote:
>>> Hello Damien,
>>>
>>>> On Tue, 6 Oct 2020 23:40:12 +0200
>>>> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>>>>
>>>> And applied with some small improvements to the commit log as well.
>>>
>>> So it turns out that the riscv32 uClibc-ng toolchain doesn't build. It
>>> fails in the uClibc-ng build with:
>>>
>>> In file included from ./include/sys/procfs.h:34,
>>>                 from ./libpthread/nptl/../nptl_db/thread_db.h:28,
>>>                 from ./libpthread/nptl/descr.h:30,
>>>                 from ./libpthread/nptl/pthreadP.h:25,
>>>                 from <stdin>:2:
>>> ./include/sys/user.h:32:3: error: unknown type name '__uint128_t'
>>>   32 |   __uint128_t  vregs[32];
>>>      |   ^~~~~~~~~~~
>>>
>>> You can see a more complete build log at:
>>>
>>> https://gitlab.com/bootlin/toolchains-builder/-/jobs/776340188
>>>
>>> The defconfig being built is just:
>>>
>>> BR2_riscv=y
>>> BR2_RISCV_32=y
>>> BR2_KERNEL_HEADERS_5_4=y
>>> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
>>> BR2_PTHREAD_DEBUG=y
>>> BR2_BINUTILS_VERSION_2_34_X=y
>>> BR2_GCC_VERSION_10_X=y
>>> BR2_TOOLCHAIN_BUILDROOT_CXX=y
>>> BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y
>>> BR2_INIT_NONE=y
>>> BR2_SYSTEM_BIN_SH_NONE=y
>>> # BR2_PACKAGE_BUSYBOX is not set
>>> BR2_PACKAGE_GDB=y
>>> # BR2_TARGET_ROOTFS_TAR is not set
>>>
>>> Do you have some idea of what could be wrong here ?
>>
>> No clue. This is very weird since this vregs thing is declared only in
>> libc/sysdeps/linux/aarch64/sys/user.h. So ARM64, not riscv.
>>
>> The file libc/sysdeps/linux/riscv64/sys/user.h exists but does not use
>> __uint128_t, it is in fact empty. And this file does not exist for riscv32, the
>> entire libc/sysdeps/linux/riscv32 directory does not exist.
>>
>> Something funky is going on with the arch dependent definitions...
>>
>> Alistair,
>>
>> Any idea ?
>>
>>
>>>
>>> Thanks a lot,
>>>
>>> Thomas
>>>
>>
>>
>> -- 
>> Damien Le Moal
>> Western Digital Research
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Damien Le Moal
Western Digital Research
