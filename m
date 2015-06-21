From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Sun, 21 Jun 2015 07:28:56 -0300
Subject: [Buildroot] [PATCH] kvmtool: add new package
In-Reply-To: <5585D3D3.4060708@mind.be>
References: <1434652188-30662-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <5585D3D3.4060708@mind.be>
Message-ID: <558691E8.5020001@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/06/15 17:57, Arnout Vandecappelle wrote:

>   Could you add a hash file?

I didn't know we were adding hashes to git sources, it's bad for a 
couple of reasons.

>>   	source "package/irda-utils/Config.in"
>>   	source "package/iucode-tool/Config.in"
>>   	source "package/kbd/Config.in"
>> +	source "pacakge/kvmtool/Config.in"
>                     ^^
>                     Excuse me? :-)

Yeah, that's what happens when you move a backport into current and 
you're still ill/running a fever.
And it should also belong in System apps rather than Hardware.

>> +	# No MADV_HUGEPAGE define in uClibc(-ng)
>
>   That's weird, it comes from kernel headers and I do see it in
> asm-generic/mman-common.h. But that is not included by sys/mman.h, so you need
> to include asm/mman.h...

I don't think that's correct, it may work, but the madvise manpages says 
that only sys/mman.h is required.
The MADV_ defines in uclibc are in bits/mman.h, like on glibc and musl, 
so basically they're incomplete/old and a patch to uclibc would be the 
correct way to fix this.

>> +comment "kvmtool needs a (e)glibc or musl toolchain"
>> +	depends on BR2_USE_MMU
>> +	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
>> +	depends on !(BR2_aarch64 || BR2_arm || BR2_armeb)
>
>   This should depend on the supported architectures. Since the arm ones are
> excluded, it would be just BR2_i386 || BR2_mips || BR2_x86_64

Ack.

>> +#KVMTOOL_VERSION = 0fc7018d0be707c3f48fe78ef6276636d7eae65a
>
>   Remove.

Ack.

>   Makefile tells me there's an optional dependency on libgtk3 as well.

Yes, but only for x86, whatever that means (ARCH_HAS_FRAMEBUFFER).
Fixed, though only build tested.
I'll send v2 shortly.
Regards.
