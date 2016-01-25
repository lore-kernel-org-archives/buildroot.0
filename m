From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 25 Jan 2016 23:33:02 +0100
Subject: [Buildroot] [PATCH 1/8] libunwind: fix C library dependency
In-Reply-To: <20160125232039.2ef30ef9@free-electrons.com>
References: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453148701-10036-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <56A69ACC.1030505@gmail.com> <20160125232039.2ef30ef9@free-electrons.com>
Message-ID: <56A6A29E.5040709@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Le 25/01/2016 23:20, Thomas Petazzoni a ?crit :
> Romain,
> 
> On Mon, 25 Jan 2016 22:59:40 +0100, Romain Naour wrote:
> 
>>> diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
>>> index 85cb472..6f747ae 100644
>>> --- a/package/libunwind/Config.in
>>> +++ b/package/libunwind/Config.in
>>> @@ -1,15 +1,32 @@
>>> +# libunwind is only available for a certain subset of the
>>> +# architectures (as visible in the list of architectures supported
>>> +# with the glibc C library below).
>>> +#
>>> +# In addition to this, on some architectures libunwind requires the
>>> +# *context() function from the C library, which are only available on
>>> +# certain architectures in uClibc, and not available at all on
>>> +# musl. But on some other architectures, libunwind works without using
>>> +# the *context() functions, which allows it to be built with musl.
>>> +config BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
>>> +	bool
>>> +	default y if BR2_TOOLCHAIN_USES_GLIBC && \
>>> +		(BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_mips64 || \
>>> +		 BR2_mips64el || BR2_powerpc || BR2_sh || BR2_sh64 || BR2_i386 || BR2_x86_64)
>>> +	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
>>> +		(BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || \
>>> +		 BR2_x86_64)
>>> +	default y if BR2_TOOLCHAIN_USES_MUSL && \
>>> +		(BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64)
>>> +
>>>  config BR2_PACKAGE_LIBUNWIND
>>>  	bool "libunwind"
>>>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>>> -	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC) # {g,s}etcontext
>>> -	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_mips64 || \
>>> -		BR2_mips64el || BR2_powerpc || BR2_sh || BR2_sh64 || BR2_i386 || BR2_x86_64
>>> +	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
> 
> Thanks for reviewing!
> 
>> Build tested on musl and x86_64.
>> Checked that libunwind doesn't build with uClibc-snapshot and uClibc-ng.
> 
> I don't get this sentence however. libunwind should build with
> uClibc-ng on the architectures listed in
> BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS, no?

Ha, sorry (missing some context).
I build tested libunwind with uClibc-snapshot on powerpc with the master branch
to verify that it doesn't build.
Then, I switched to your series with a small modification to enable powerpc and
verify that doesn't build as for uClibc-snapshot on the same architecture.

The build error look like:
In file included from ../include/libunwind.h:15:0,
                 from ppc32/Lglobal.c:2:
../include/libunwind-ppc32.h:182:9: erreur: unknown type name ?ucontext_t?
 typedef ucontext_t unw_tdep_context_t;

So your BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS setting is correct.

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
