From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Oct 2019 23:09:28 +0200
Subject: [Buildroot] [PATCH 2/2] package/gcc: add support for D language
In-Reply-To: <20191007091021.216e00b5@windsurf.home>
References: <20190929165601.20269-1-eric.le.bihan.dev@free.fr>
 <20190929165601.20269-3-eric.le.bihan.dev@free.fr>
 <20190930230422.7a7d1173@windsurf.home> <20191001055614.GA31145@ned>
 <20191001085605.501edf8e@windsurf.home> <20191006151228.GA5258@ned>
 <20191007091021.216e00b5@windsurf.home>
Message-ID: <663f4e52-ac32-1375-c135-0f7c3fa12803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/10/2019 09:10, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 6 Oct 2019 17:12:28 +0200
> Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:
> 
>> Looking at libphobos/libdruntime/core/sys/posix/sys/types.d turned out
>> to be very informative. It contains a list of definitions per C-runtime
>> mapped to architecture/OS. Bionic, uclibc and musl are supported but
>> only for a limited set of architectures. For some of them,
>> __SIZEOF_PTHREAD_ATTR_T and friends are redefined.
>>
>> ARM is supported for uclibc, but Aarch64 is not (hence the build
>> failure). Adding the missing definitions from
>> libpthread/nptl/sysdeps/unix/sysv/linux/aarch64/bits/pthreadtypes.h is
>> trivial, but then the build chokes on siginfo_t not being correct. So
>> deep work is required.
>>
>> Even some combinations defined in types.d fail to build (e.g.
>> x86_64+musl or ARM/uclibc).
>>
>> In the end, glibc turns out to be the only C-runtime covering most of
>> the architectures supported by Buildroot: x86_64, Aarch64, ARM,
>> MIPS{32,64}, PPC{,64}, RISCV32 and SPARC64.
> 
> OK.
> 
>> In order to restrict the supported architectures, should
>> package/gcc/Config.in.host be updated to look like this?
>>
>> ```
>> config BR2_TOOLCHAIN_BUILDROOT_DLANG
>> 	bool "Enable D language support"
>> 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
>> 	depends on BR2_TOOLCHAIN_USES_GLIBC
>> 	depends on !BR2_arc
>> 	depends on !BR2_csky
>> 	depends on !BR2_m68k
>> 	depends on !BR2_microblaze
>> 	depends on !BR2_nds32
>> 	depends on !BR2_nios2
>> 	depends on !BR2_or1k
>> 	depends on !BR2_sparc
>> 	depends on !BR2_xtensa
> 
> I'd rather use some positive logic. In toolchain/Config.in, maybe
> something like this:
> 
> config BR2_TOOLCHAIN_CAN_SUPPORT_DLANG
> 	bool
> 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
> 	depends on BR2_TOLCHAIN_USES_GLIBC
> 	default y if BR2_arm
> 	default y if BR2_x86_64
> 	default y if ...
> 
> and then re-use that for both the internal and external toolchain cases.

 Nack that. An external toolchain may use a gcc branch that does support
additional architectures or a different libc or a gcc version < 9. So for the
external toolchain, there should just be a BR2_TOOLCHAIN_EXTERNAL_CUSTOM_DLANG
that is user-settable (and verified with a compiler test).

 Also, there should be a hidden BR2_TOOLCHAIN_HAS_DLANG option that gets
selected by BR2_TOOLCHAIN_BUILDROOT_DLANG and
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_DLANG (and possibly by other external toolchains
in the future).


 Regards,
 Arnout


> 
> Thanks!
> 
> Thomas
> 
