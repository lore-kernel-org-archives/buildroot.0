From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 16 May 2010 20:08:58 +0200
Subject: [Buildroot] AVR32 support is broken since commit "toolchain:
	add uClibc 0.9.31, mark 0.9.30.x as recent"
In-Reply-To: <AANLkTil2Xm8jJ9AN8C2B7LLDK65GlPkoENsvFJPTuxdQ@mail.gmail.com>
References: <AANLkTilfHmEU3NnpiaWdcYHffhNv7NI07fbNGpkhv3oH@mail.gmail.com>
	<AANLkTil2Xm8jJ9AN8C2B7LLDK65GlPkoENsvFJPTuxdQ@mail.gmail.com>
Message-ID: <AANLkTino7N5_kbUN8Rd4W6fn9850lA0r4-xbSYPT1JlZ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2010/5/16 Bj?rn Forsman <bjorn.forsman@gmail.com>:
> 2010/5/11 Bj?rn Forsman <bjorn.forsman@gmail.com>:
>> Hi all,
>>
>> It seems support for AVR32 is broken since commit
>> 266fa65afb20bf93b813d96421dce537a4dd2742 "toolchain: add uClibc 0.9.31, mark
>> 0.9.30.x as recent". Basically, the toolchain for AVR32 will not build. Steps
>> to reproduce:
>>
>> $ make atngw100_defconfig
>> $ make
>> [snip]
>> /home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/./gcc/xgcc
>> -shared-libgcc -B/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/./gcc
>> -nostdinc++ -L/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/avr32-linux-uclibc/libstdc++-v3/src
>> -L/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/avr32-linux-uclibc/libstdc++-v3/src/.libs
>> -B/usr/avr32-linux-uclibc/bin/ -B/usr/avr32-linux-uclibc/lib/ -isystem
>> /usr/avr32-linux-uclibc/include -isystem
>> /usr/avr32-linux-uclibc/sys-include
>> -I/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/avr32-linux-uclibc/libstdc++-v3/include/avr32-linux-uclibc
>> -I/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/avr32-linux-uclibc/libstdc++-v3/include
>> -I/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5/libstdc++-v3/libsupc++
>> -fno-implicit-templates -Wall -Wextra -Wwrite-strings -Wcast-qual
>> -fdiagnostics-show-location=once -ffunction-sections -fdata-sections
>> -g -Os -c ctype_members.cc ?-fPIC -DPIC -o .libs/ctype_members.o
>> ctype_members.cc: In constructor
>> 'std::ctype_byname<_CharT>::ctype_byname(const char*, size_t) [with
>> _CharT = char]':
>> ctype_members.cc:59: error: invalid use of incomplete type 'struct
>> __uclibc_locale_struct'
>> /home/bjornfor/forks/buildroot/output/staging/usr/include/bits/uClibc_locale.h:85:
>> error: forward declaration of 'struct __uclibc_locale_struct'
>> ctype_members.cc:60: error: invalid use of incomplete type 'struct
>> __uclibc_locale_struct'
>> /home/bjornfor/forks/buildroot/output/staging/usr/include/bits/uClibc_locale.h:85:
>> error: forward declaration of 'struct __uclibc_locale_struct'
>> ctype_members.cc:61: error: invalid use of incomplete type 'struct
>> __uclibc_locale_struct'
>> /home/bjornfor/forks/buildroot/output/staging/usr/include/bits/uClibc_locale.h:85:
>> error: forward declaration of 'struct __uclibc_locale_struct'
>> make[5]: *** [ctype_members.lo] Error 1
>> make[5]: *** Waiting for unfinished jobs....
>> numeric_members.cc: In member function 'void
>> std::numpunct<_CharT>::_M_initialize_numpunct(__uclibc_locale_struct*)
>> [with _CharT = wchar_t]':
>> numeric_members.cc:140: error: invalid use of incomplete type 'struct
>> __uclibc_locale_struct'
>> /home/bjornfor/forks/buildroot/output/staging/usr/include/bits/uClibc_locale.h:85:
>> error: forward declaration of 'struct __uclibc_locale_struct'
>> numeric_members.cc:141: error: invalid use of incomplete type 'struct
>> __uclibc_locale_struct'
>> /home/bjornfor/forks/buildroot/output/staging/usr/include/bits/uClibc_locale.h:85:
>> error: forward declaration of 'struct __uclibc_locale_struct'
>> make[5]: *** [numeric_members.lo] Error 1
>> monetary_members.cc: In member function 'void std::moneypunct<_CharT,
>> _Intl>::_M_initialize_moneypunct(__uclibc_locale_struct*, const char*)
>> [with _CharT = wchar_t, bool _Intl = true]':
>> monetary_members.cc:407: error: invalid use of incomplete type 'struct
>> __uclibc_locale_struct'
>> /home/bjornfor/forks/buildroot/output/staging/usr/include/bits/uClibc_locale.h:85:
>> error: forward declaration of 'struct __uclibc_locale_struct'
>> monetary_members.cc:408: error: invalid use of incomplete type 'struct
>> __uclibc_locale_struct'
>> /home/bjornfor/forks/buildroot/output/staging/usr/include/bits/uClibc_locale.h:85:
>> error: forward declaration of 'struct __uclibc_locale_struct'
>> monetary_members.cc: In member function 'void std::moneypunct<_CharT,
>> _Intl>::_M_initialize_moneypunct(__uclibc_locale_struct*, const char*)
>> [with _CharT = wchar_t, bool _Intl = false]':
>> monetary_members.cc:562: error: invalid use of incomplete type 'struct
>> __uclibc_locale_struct'
>> /home/bjornfor/forks/buildroot/output/staging/usr/include/bits/uClibc_locale.h:85:
>> error: forward declaration of 'struct __uclibc_locale_struct'
>> monetary_members.cc:563: error: invalid use of incomplete type 'struct
>> __uclibc_locale_struct'
>> /home/bjornfor/forks/buildroot/output/staging/usr/include/bits/uClibc_locale.h:85:
>> error: forward declaration of 'struct __uclibc_locale_struct'
>> make[5]: *** [monetary_members.lo] Error 1
>> make[5]: Leaving directory
>> `/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/avr32-linux-uclibc/libstdc++-v3/src'
>> make[4]: *** [all-recursive] Error 1
>> make[4]: Leaving directory
>> `/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/avr32-linux-uclibc/libstdc++-v3'
>> make[3]: *** [all] Error 2
>> make[3]: Leaving directory
>> `/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/avr32-linux-uclibc/libstdc++-v3'
>> make[2]: *** [all-target-libstdc++-v3] Error 2
>> make[2]: Leaving directory
>> `/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final'
>> make[1]: *** [all] Error 2
>> make[1]: Leaving directory
>> `/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final'
>> make: *** [/home/bjornfor/forks/buildroot/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/.compiled]
>> Error 2
>>
>>
>> Are there any toolchain guru's that can fix this issue?
>>
>> (While running git bisect to find the bad commit I also had some
>> builds error out during u-boot build. But that is another thread...)
>
> It turned out to be an easy fix for the toolchain part; just navigate to
> Toolchain ---> uClibc C library version and select 0.9.30.x instead of the new
> 0.9.31.x.
>
> However, there has been a regression in U-boot for AVR32 since commit
> "zlib: Optimize decompression", cd514aeb996e2f7aefbe1f78481965d9d074aed4
> (in the u-boot tree). And BR recently bumped U-Boot to a version that includes
> this commit.
>
> The failing u-boot build:
>
> $ make
> [snip]
> /usr/bin/make -C cpu/at32ap/at32ap700x/
> [snip]
> /home/bjornfor/raid/raid_stuff/forks/buildroot/output/staging/usr/bin/avr32-unknown-linux-uclibc-gcc
> ?-g ?-Os ? -ffixed-r5 -fPIC -mno-init-got -mrelax -mcpu=ap7000
> -ffunction-sections -fdata-sections -D__KERNEL__
> -DTEXT_BASE=0x00000000
> -I/media/raid/bjornfor/raid_stuff/forks/buildroot/output/build/u-boot-2010.03/include
> -fno-builtin -ffreestanding -nostdinc -isystem
> /media/raid/bjornfor/raid_stuff/forks/buildroot/output/staging/usr/bin-ccache/../lib/gcc/avr32-unknown-linux-uclibc/4.2.2/include
> -pipe ?-Wall -Wstrict-prototypes -fno-stack-protector ? -o cache.o
> cache.c -c
> zlib.c:31:27: error: asm/unaligned.h: No such file or directory
> make[2]: *** No rule to make target `.depend', needed by `libgeneric.a'. ?Stop.
> make[2]: Leaving directory
> `/media/raid/bjornfor/raid_stuff/forks/buildroot/output/build/u-boot-2010.03/lib_generic'
> make[1]: *** [lib_generic/libgeneric.a] Error 2
> [snip]
>
> The problem seems to be a missing header file:
> ?zlib.c:31:27: error: asm/unaligned.h: No such file or directory
>
> I'd like to just fix U-Boot, but there is not enough time before the next BR
> release. As a work-around, I will try to write a patch that enables both new
> and old versions of U-Boot to be selected in menuconfig.

BR already supports multiple U-Boot versions in menuconfig (I don't know how
I missed that!), so I'll just send a patch with an updated atngw100_defconfig
that builds. The patch will be send in a new thread.

Best regards,
Bj?rn Forsman
