From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Mon, 23 Jun 2008 09:27:57 +0200
Subject: [Buildroot] cris
In-Reply-To: <20080620141152.GG12682@mx.loc>
References: <485A3396.80701@cetrtapot.si> <87iqw5dyyb.fsf@macbook.be.48ers.dk>
	<20080620083646.GB12682@mx.loc> <485B6CF6.7040901@cetrtapot.si>
	<20080620125720.GE12682@mx.loc> <485BAFF8.8090604@cetrtapot.si>
	<20080620141152.GG12682@mx.loc>
Message-ID: <485F507D.5070801@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> [I'm changing the subject to something more suitable]
> On Fri, Jun 20, 2008 at 03:26:16PM +0200, Hinko Kocevar wrote:
>> Bernhard Fischer wrote:
>>> On Fri, Jun 20, 2008 at 10:40:22AM +0200, Hinko Kocevar wrote:
>>>
>>>> With gcc 4.3.1 gcc internal errors went away, so I'm really glad I found the GIT tree!
>>> I have improved (i hope) the cris support, configuration-wise, please
>>> pull and let me know if it suits your needs.
>>>
>> 1. Compilation of uClibc always fails with:
>>
>> make[1]: Entering directory `/work/stage/git.br/toolchain_build_cris/uClibc-0.9.29'
>> make[2]: `conf' is up to date.
>> /usr/bin/make locale_headers
>> make[3]: `conf' is up to date.
>>  CC ldso/ldso/ldso.oS
>>  AS ldso/ldso/cris/resolve.oS
>>  CC ldso/libdl/libdl.oS
>>  CC libcrypt/crypt.os
>>  CC libcrypt/des.os
>> In file included from ./include/sys/param.h:22,
>>                 from libcrypt/des.c:62:
>> ./include/limits.h:124:26: error: limits.h: No such file or directory
>> make[1]: *** [libcrypt/des.os] Error 1
>> make[1]: *** Waiting for unfinished jobs....
>> make[1]: Leaving directory `/work/stage/git.br/toolchain_build_cris/uClibc-0.9.29'
>> make: *** [/home/hinkok/work/stage/git.br/toolchain_build_cris/uClibc-0.9.29/lib/libc.a] Error 2
> 
> I don't see this. Is that uClibc-trunk or something else?

Sorry for not pointing that out earlier  - it's with uClibc 0.9.29. IMHO it might have something to do with sysroot prefix, as I played with toochain settings before.. Also I think it didn't happen when using gcc 4.2.4 ...

>> 2. And later:
>>
>>  CC libm/expf.os
>>  AS libc/sysdeps/linux/cris/syscall.os
>>  CC libm/expm1f.os
>>  CC libc/sysdeps/linux/common/__rt_sigtimedwait.os
>>  CC libm/fabsf.os
>> In file included from /home/hinkok/work/stage/git.br/toolchain_build_cris/linux/include/asm/sigcontext.h:6,
>>                 from ./include/bits/sigcontext.h:28,
>>                 from ./include/signal.h:332,
>>                 from libc/sysdeps/linux/common/__rt_sigtimedwait.c:11:
>> /home/hinkok/work/stage/git.br/toolchain_build_cris/linux/include/asm/ptrace.h:4:29: error: asm/arch/ptrace.h: No such file or directory
> 
> yes, i saw that too. Kernel bug.
>> diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
>> index e1b16a8..b4001d9 100644
>> --- a/toolchain/gcc/gcc-uclibc-4.x.mk
>> +++ b/toolchain/gcc/gcc-uclibc-4.x.mk
>> @@ -234,6 +234,10 @@ $(gcc_initial) $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc: $(GCC_BUILD_D
>> 	# gcc >= 4.3.0 have to also install install-target-libgcc
>> ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
>> 	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc install-target-libgcc
>> +	# This is a must for cris arch at least, or uClibc fails with missing 
>> +	# limits.h header!
>> +	ln -snf $(STAGING_DIR)/usr/lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_OFFICIAL_VER)/include-fixed/limits.h \
>> +	$(STAGING_DIR)/usr/lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_OFFICIAL_VER)/include/limits.h
> 
> i don't think that this is correct, there must me something different
> going on.

Me too, will rebuild with and wo sysroot as I suspect to meka a difference..

>> else
>> 	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc
>> endif
> 
>> diff --git a/toolchain/kernel-headers/kernel-headers-new.makefile b/toolchain/kernel-headers/kernel-headers-new.makefile
>> index 0fca24d..b04d691 100644
>> --- a/toolchain/kernel-headers/kernel-headers-new.makefile
>> +++ b/toolchain/kernel-headers/kernel-headers-new.makefile
>> @@ -74,6 +74,13 @@ $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
>> 		HOSTCXX="$(HOSTCXX)" \
>> 		INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install; \
>> 	)
>> +ifeq ($(BR2_ARCH),"cris")
>> +	 cp -a $(LINUX_HEADERS_UNPACK_DIR)/include/linux/user.h $(LINUX_HEADERS_DIR)/include/linux
>> +	 cp -a $(LINUX_HEADERS_UNPACK_DIR)/include/asm-cris/user.h $(LINUX_HEADERS_DIR)/include/asm
>> +	 cp -a $(LINUX_HEADERS_UNPACK_DIR)/include/asm-cris/elf.h $(LINUX_HEADERS_DIR)/include/asm
>> +	 cp -a $(LINUX_HEADERS_UNPACK_DIR)/include/asm-cris/arch-v10 $(LINUX_HEADERS_DIR)/include/asm/arch
>> +	 sed -i -e "/^#include <asm\/page\.h>/d" $(LINUX_HEADERS_DIR)/include/asm/user.h
> 
> as you can see this wouldn't work for v8 and generally should be fixed
> in the kernel (also fails with 2.6.git).

This problem is because include/asm-cris/Kbuild does not include the correct headers when the kernel source is not configured. Both include/asm-cris/arch-vXX directories are left behind when install_headers goes through header-y target. 

I'll let Axis people sort it out (if ever), till then I guess we are stuck with the hack..

regards,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
