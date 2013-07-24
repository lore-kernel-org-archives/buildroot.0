From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 24 Jul 2013 13:50:55 +0200
Subject: [Buildroot] Problems building for ucLinux/ARM with elf2flt
	enabled
In-Reply-To: <CBB26B88EF85F6489575628B28ECBE6D4328606253@ablexc01.internal.novero.com>
References: <CBB26B88EF85F6489575628B28ECBE6D432860618A@ablexc01.internal.novero.com>
 <CAAXf6LUU_SkD-KSEMgX3t64F=oK=qzuzuQJG5NJ5u2PzE8nZsA@mail.gmail.com>
 <CBB26B88EF85F6489575628B28ECBE6D4328606253@ablexc01.internal.novero.com>
Message-ID: <CAAXf6LVTZW-vPP8riyEJNZT+rRdnJkzbu2LQiSr+RS-SAAEi6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 24, 2013 at 1:39 PM, Anna Fischer (novero/Bochum)
<Anna.Fischer@novero.com> wrote:
>> Subject: Re: [Buildroot] Problems building for ucLinux/ARM with elf2flt
>> enabled
>>
>> Hi Anna,
>>
>> On Wed, Jul 24, 2013 at 12:02 PM, Anna Fischer (novero/Bochum)
>> <Anna.Fischer@novero.com> wrote:
>> > I'm trying to build a ucLinux system for an ARM platform (no-MMU),
>> but when trying to enabled elf2flt in the menuconfig I get the
>> following error:
>> >
>> > /home/buildroot-2013.05/output/build/host-binutils-
>> 2.21.1/bfd/libbfd.a(compress.o): In function
>> `bfd_compress_section_contents':
>> > compress.c:(.text+0x25): undefined reference to `compressBound'
>> > /home//buildroot-2013.05/output/build/host-binutils-
>> 2.21.1/bfd/libbfd.a(compress.o): In function
>> `bfd_get_full_section_contents':
>> > compress.c:(.text+0x226): undefined reference to `inflateEnd'
>> > compress.c:(.text+0x37a): undefined reference to `inflateInit_'
>> > compress.c:(.text+0x3b0): undefined reference to `inflate'
>> > compress.c:(.text+0x3bf): undefined reference to `inflateReset'
>> > collect2: ld returned 1 exit status
>> > make[1]: *** [elf2flt] Error 1
>> > make[1]: Leaving directory `/home/buildroot-
>> 2013.05/output/toolchain/elf2flt'
>> > make: *** [/home/buildroot-2013.05/output/toolchain/elf2flt/elf2flt]
>> > Error 2
>> >
>> > It seems like it is missing libz? But I don't quite understand why,
>> because I definitely have it installed on the system. Anyone ever seen
>> this before?
>> >
>> > I'm using the buildroot internal toolchain, uClibc-0.9.33.2, gcc-
>> 4.7.3, linux-3.8, and this is buildroot-2013.05. I have attached my
>> .config as well. My build host is Ubuntu 64-bit.
>>
>> Do you have the -dev package of zlib? Also for 64-bit?
>>
>> On a CentOS system, I have seen a problem with the static version of
>> zlib missing, when building a static toolchain with crosstool-ng. On
>> CentOS, the static version (libz.a) is distributed as a separate
>> package. I don't know if this is the case on your system.
>
> libz.a and libz.so are installed in output/host/usr/lib in the buildroot system, so apart from the fact that I have it installed as part of my Ubuntu distribution (yes, I have the -dev package installed), it is present in the buildroot output directory. The elf2flt Makefile also references this folder in LDFLAGS. It is not clear to me though if the problem is in elf2flt or in the binutils itself under build/host-binutils-2.21.1/bfd (as referenced by the error message I printed out above)?

Where exactly can you find libz in output/ ?
Since the error is in a host package, there should be such files in output/host/
Any libz files in output/staging are irrelevant, as these are for the
target, not for the host.

If there is no libz in output/host, there may be a missing dependency
to host-zlib in binutils. You could verify this by running 'make
host-zlib' manually first, and then retrying the binutils build.

Best regards,
Thomas
