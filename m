From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 24 Jun 2020 22:38:59 +0200
Subject: [Buildroot] [PATCH 2/5] package/gcc: add support for gcc 10
In-Reply-To: <20200624215539.078dfb99@windsurf>
References: <20200608221347.2639059-1-romain.naour@gmail.com>
 <20200608221347.2639059-2-romain.naour@gmail.com>
 <20200624215539.078dfb99@windsurf>
Message-ID: <718461ba-d2b5-68a6-7f2a-82410f5e7740@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 24/06/2020 ? 21:55, Thomas Petazzoni a ?crit?:
> On Tue,  9 Jun 2020 00:13:44 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> Keep the same patch as for gcc 9.x fixing a parallel build issue:
>> 58ecbbc3ef18c43ae1c02a5c4bf30aa7ef2d8092.
>>
>> Keep libzstd support disabled for now, it could be used to LTO bytecode.
> 
> "... it could be used for LTO bytecode compression", otherwise it
> doesn't make a lot of sense.
> 
> I've applied, but I have some comments/questions below.
> 
>> +config BR2_GCC_VERSION_10_X
>> +	bool "gcc 10.x"
>> +	# or1k needs binutils >= 2.32
>> +	depends on !(BR2_or1k && BR2_BINUTILS_VERSION_2_31_X)
> 
> Why are we doing this here, instead of in the binutils package ? This
> looks strange.

This dependency was added by [1] when we had a gcc 5 fork for or1k.

[1]
https://git.buildroot.net/buildroot/commit/?id=e0ba09768eb27872e8685754952601bdac9ac75b

It here because it's gcc that require a recent enough binutils version.
Maybe we should consider adding BR2_TOOLCHAIN_BINUTILS_AT_LEAST_xxxx.
I think we already have a problem with new cpu variant that require the latest
binutils version.

> 
>> +	# powerpc spe support has been deprecated since gcc 8.x.
>> +	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
>> +	depends on !BR2_powerpc_SPE
> 
> Should we now drop support for PowerPC SPE ?

If every body is ok, then we can drop it.

> 
>> +	# C-SKY sk610 needs abiv1, which is not supported in
>> +	# upstream gcc. C-SKY gcc upstream support not tested
>> +	# with upstream binutils and glibc.
>> +	depends on !BR2_csky
> 
> We haven't had any news/contribution for C-SKY people for quite a
> while. I know in recent SoC they have used RISC-V cores, but they were
> supposed to continue making C-SKY based SoCs. I am fearing that this
> looks like yet another abandoned CPU architecture :-/

I'm not sure about this, their gitlab is still active:
https://gitlab.com/c-sky/buildroot/-/pipelines

IIRC we had some news from Guo Ren about the upstream qemu support for csky cpus

http://lists.busybox.net/pipermail/buildroot/2020-May/283411.html

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 
