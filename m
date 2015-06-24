From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Wed, 24 Jun 2015 15:27:31 -0300
Subject: [Buildroot] [PATCH v2] kvmtool: new package
In-Reply-To: <55894DE8.8060706@mind.be>
References: <1434979398-30311-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <55894DE8.8060706@mind.be>
Message-ID: <558AF693.90307@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/06/15 09:15, Arnout Vandecappelle wrote:

>> +	depends on \
>> +		BR2_aarch64 || BR2_arm       || BR2_armeb || BR2_i386 || \
>> +		BR2_mips    || BR2_x86_64
>
>   Line splitting, whitespace and ordering is a bit weird I think, why not
>
> 	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_mips || \
> 		BR2_i386 || BR2_x86_64

Hi Arnout.
At first the architecture list was longer but i started chopping off 
because of build failures for architectures that weren't my target and 
this particular piece of software doesn't work in general with qemu 
(since it normally doesn't emulate kvm features of the processors, so no 
kvm-in-kvm facility to test with).
The weird indentation was from some other $random package, though i 
don't recall which one it was.

>> +comment "kvmtool needs a (e)glibc or musl toolchain"
>> +	depends on BR2_USE_MMU
>> +	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
>> +	depends on BR2_i386 || BR2_mips || BR2_x86_64
>
>   It makes more sense to put the arch-depends together, so the arches just after MMU.

Ok.

>> +comment "kvmtool needs a (e)glibc or musl toolchain w/ dynamic library"
>> +	depends on BR2_USE_MMU
>> +        depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
>     ^^^^^^^^ spaces iso. tab.
>
>   Also, glibc can't be static, but probably the way you have it here is clearer.

Yes, i tried to minimize the amount of comments and conditionals here.

>> +		BR2_STATIC_LIBS
>> +	depends on BR2_aarch64 || BR2_arm || BR2_armeb
>
>   Same here: arches just after MMU.

Ok.

>> +# Disable -Werror, otherwise musl is not happy
>> +KVMTOOL_MAKE_OPTS = \
>> +	CROSS_COMPILE="$(TARGET_CROSS)" \
>> +	LDFLAGS="$(TARGET_LDFLAGS) $(KVMTOOL_EXTRA_LDFLAGS)" \
>> +	WERROR=0
>
>   Shouldn't we pass TARGET_CFLAGS and friends as well? Perhaps put
> TARGET_CONFIGURE_OPTS in the environment?

Depending on the architecture this package changes target ABI and even 
builds a BIOS stub for x86/x86_64 (changing for instance cpu target), 
forcing CFLAGS/LDFLAGS on it is a bad idea in general which causes build 
failures for certain combinations, at least for x86*.
It's by far the sickest package i've met regarding toolchain tricks, 
with the static-in-dynamic init helper converted via ld as an example.
Regards.
