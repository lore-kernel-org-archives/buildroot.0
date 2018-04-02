From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Mon, 2 Apr 2018 12:36:05 +0200
Subject: [Buildroot] [PATCH v4 10/11] package/mesa3d: enable OpenCL
 support
In-Reply-To: <20180401233226.76803d73@windsurf>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-11-valentin.korenblit@smile.fr>
 <20180401233226.76803d73@windsurf>
Message-ID: <e0869b48-09ec-54f4-5b77-3f086d9e636d@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello Thomas,

On 01/04/2018 23:32, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 29 Mar 2018 13:33:45 +0200, Valentin Korenblit wrote:
>
>> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
>> index e99e737d31..bad7ac4339 100644
>> --- a/package/mesa3d/Config.in
>> +++ b/package/mesa3d/Config.in
>> @@ -33,6 +33,22 @@ config BR2_PACKAGE_MESA3D_LLVM
>>   comment "mesa3d w/ llvm needs llvm"
>>   	depends on !BR2_PACKAGE_LLVM_ARCH_SUPPORTS
>>   
>> +config BR2_PACKAGE_MESA3D_OPENCL
>> +	bool "mesa3d OpenCL"
> Just:
>
> 	bool "OpenCL"
>
>> +	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
> This is certainly not really understanding how OpenCL works, but why do
> you need this Gallium driver compiled in? Does the result only works on
> a system with an AMD GPU ?

Mesa's OpenCL implementation works only on AMD GPUs using Gallium Drivers.

>> +	depends on BR2_PACKAGE_MESA3D_LLVM
>> +	depends on BR2_USE_WCHAR #elfutils
>> +	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC
>> +	depends on !BR2_bfin #elfutils
>> +	select BR2_PACKAGE_ELFUTILS
> Interesting that elfutils is needed here.
>
>> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
>> index 498ad57eed..1df28c43cb 100644
>> --- a/package/mesa3d/mesa3d.mk
>> +++ b/package/mesa3d/mesa3d.mk
>> @@ -233,4 +233,13 @@ else
>>   MESA3D_CONF_OPTS += --disable-lmsensors
>>   endif
>>   
>> +# Clover requires libelf
> Comment not really useful, it's obvious from the code below.
>
>> +ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
>> +MESA3D_DEPENDENCIES += clang elfutils libclc
>> +MESA3D_CONF_OPTS += --enable-opencl \
>> +	--with-clang-libdir=$(STAGING_DIR)/usr/lib
>> +else
>> +MESA3D_CONF_OPTS += --disable-opencl
>> +endif
>> +
>>   $(eval $(autotools-package))
> Thanks!
>
> Thomas
