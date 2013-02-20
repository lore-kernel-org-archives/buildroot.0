From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 20 Feb 2013 13:08:32 +0200
Subject: [Buildroot] Advice on buildroot implementation
In-Reply-To: <718DFA7882181D45B8BD18F31C46D55427A6A997@MBX204.domain.local>
References: <718DFA7882181D45B8BD18F31C46D55427A6A8E3@MBX204.domain.local>,
 <5124085A.1080903@mind.be>
 <718DFA7882181D45B8BD18F31C46D55427A6A997@MBX204.domain.local>
Message-ID: <5124AEB0.5080808@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

20.2.2013 3:24, Gregory Perry kirjoitti:
> Thank you Arnout!
> ________________________________________
> From: Arnout Vandecappelle [arnout at mind.be]
> Sent: Tuesday, February 19, 2013 6:18 PM
> To: Gregory Perry
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] Advice on buildroot implementation
>
> On 20/02/13 00:03, Gregory Perry wrote:
>> Hello again,
>>
>> Does anyone have some advice on using buildroot to create a LiveCD filesystem?
>>
>> Here are the requirements:
>>
>> 1) Universal boot support on any x86 hardware platform;
>> 2) Read only (UnionFS or OverlayFS); and
>> 2) NFS root capabilities after kernel/initrd launch (if the ISO is PXE-boostrapped)
>   On x86, I find the easiest approach to use a cpio initramfs, with a
> syslinux boot loader. But if universal boot is required, it means you
> have to stuff all the modules bloat in the cpio image...

Grub is nice bootloader too ;-)

If every kernel module is needed it will take about 50 MB and if every
firmware is needed then it will take another 60 MB.

However, there is a git-tree of using LTO (Link time optimization) with
Linux kernel to make at least modules smaller.

https://github.com/andikleen/linux-misc/commits/lto

Besides those patches you need at least gcc 4.7.2 or greater and buld
with --enable-gold=yes --enable-lto and
also H.J. Lu's (man who had his part of doing glibc ABI specification,
or so I read) version of binutils (latest version is 2.23.51.0.9)
https://www.kernel.org/pub/linux/devel/binutils/
which also needs to be compiled with --enable-gold=yes --enable-lto

Then after those three requirements (patched kernel, latest gcc with
proper configure switches and HJ Lu's binutils with configure switches)
are met then activating LTO compiling by giving the following CFLAGS and
LDFLAGS:

CFLAGS = -flto -fwhole-program
LDFLAGS= -flto -fuse-linker-plugin

It could be also possible to compile whole system to make it smaller but
it is very delicate and experimental process and some packages
don't like some flags at all (For example zlib 1.2.7 does not like
-fwhole-program).

So Im asking everyone here:

How can I filter out flags-per-package ?
And also enable flags-per-package?
I would like to enable globally those LTO flags and filter some/all
flags from problematic packages.

Regards
Stefan
