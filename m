From: Patrick Noffke <patrick@noffke.me>
Date: Tue, 21 Jul 2015 12:41:38 -0500
Subject: [Buildroot] [PATCH 1/1] Toolchain - Add option to enable Ada
 language.
In-Reply-To: <20150720233935.37e53e86@free-electrons.com>
References: <1459893.m3stRD3lTI@noffke.mortara.com>
 <20150720233935.37e53e86@free-electrons.com>
Message-ID: <55AE8452.4030507@noffke.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 07/20/2015 04:39 PM, Thomas Petazzoni wrote:
> Dear Patrick Noffke,
>
> Sorry for the long response time. However, unless I missed it, you
> never resent your patch with git send-email. Can you do this? Also, see
> some comments below.

I did resend it from another PC on 08 April 2015 at 11:05 a.m. my time.  
But it did not address all of your below comments.  I will resend again.

>
> On Tue, 07 Apr 2015 14:10:28 -0500, Patrick Noffke wrote:
>>  From d429cdacd2584e561c754bc7d7cf0eb78d7c03f0 Mon Sep 17 00:00:00 2001
>> From: Patrick Noffke <patrick@noffke.me>
>> Date: Tue, 7 Apr 2015 09:04:45 -0500
>> Subject: [PATCH 1/1] Toolchain - Add option to enable Ada language.
>>
>> Signed-off-by: Patrick Noffke <patrick@noffke.me>
>> ---
>>   package/gcc/Config.in.host         | 10 ++++++++++
>>   package/gcc/gcc-final/gcc-final.mk |  9 +++++++++
>>   toolchain/toolchain-common.in      |  3 +++
>>   3 files changed, 22 insertions(+)
>>
>> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
>> index cf96c73..be55b4f 100644
>> --- a/package/gcc/Config.in.host
>> +++ b/package/gcc/Config.in.host
>> @@ -108,6 +108,16 @@ config BR2_TOOLCHAIN_BUILDROOT_CXX
>>   	  C++ language and you want C++ libraries to be installed on
>>   	  your target system.
>>   
>> +config BR2_TOOLCHAIN_BUILDROOT_ADA
>> +	bool "Enable Ada support"
>> +	select BR2_INSTALL_LIBADA
> Technically speaking, this hidden boolean will only become necessary
> when some packages will need Ada support. We've recently added Fortran
> support, without a similar boolean. I guess we'll have to add it only
> when some packages will start using Fortran support.
>
>> +	depends on !(BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 && \
> This gcc version has since then been remove.
>
>> +		     BR2_TOOLCHAIN_BUILDROOT_LOCALE)
> So a toolchain with locale support cannot have Ada support? This seems
> weird, can you add a comment that explains why?
>
>> +	help
>> +	  Enable this option if you want your toolchain to support the
>> +	  Ada language and you want Ada libraries to be installed on
>> +	  your target system.
>> +
>>   config BR2_GCC_ENABLE_TLS
>>   	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>>   	default y
>> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
>> index d76eb31..7defb97 100644
>> --- a/package/gcc/gcc-final/gcc-final.mk
>> +++ b/package/gcc/gcc-final/gcc-final.mk
>> @@ -44,6 +44,7 @@ endef
>>   # Languages supported by the cross-compiler
>>   GCC_FINAL_CROSS_LANGUAGES-y = c
>>   GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
>> +GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBADA) += ada
>>   GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
>>   
>>   HOST_GCC_FINAL_CONF_OPTS = \
>> @@ -65,6 +66,10 @@ else
>>   HOST_GCC_FINAL_CONF_OPTS += --disable-libgomp
>>   endif
>>   
>> +ifeq ($(BR2_INSTALL_LIBADA),y)
>> +HOST_GCC_FINAL_CONF_OPTS += --enable-libada
>> +endif
>> +
>>   # End with user-provided options, so that they can override previously
>>   # defined options.
>>   HOST_GCC_FINAL_CONF_OPTS += \
>> @@ -125,6 +130,10 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
>>   HOST_GCC_FINAL_USR_LIBS += libstdc++
>>   endif
>>   
>> +ifeq ($(BR2_INSTALL_LIBADA),y)
>> +#HOST_GCC_FINAL_USR_LIBS += libgnat
>> +endif
> This is commented out, why? If you need some library on the target to
> run Ada programs, you indeed need to add something to
> HOST_GCC_FINAL_USR_LIBS.
>
> Also, if I understood correctly, building the Ada support in gcc
> requires having an already working Ada compiler on your machine. Is
> this correct? If it is, then support/dependencies/dependencies.sh need
> to be adjusted to also check for an Ada compiler when Ada support is
> selected in the toolchain.
>
> Could you work on these issues and submit an updated version of your
> patch? In the mean time, I'll mark your patch as "Changes Requested" in
> our patch tracking system.
>
> Thanks a lot!
>
> Thomas

Thanks,
Patrick
