From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Tue, 10 Apr 2018 18:21:26 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: add dependency on elfutils
 to r600 with llvm
In-Reply-To: <20180410175148.71878897@windsurf>
References: <20180410151959.18713-1-valentin.korenblit@smile.fr>
 <20180410175148.71878897@windsurf>
Message-ID: <542b2d70-23ed-2d85-ba62-82c85118a7f3@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 10/04/2018 17:51, Thomas Petazzoni wrote:
> Hello Valentin,
>
> On Tue, 10 Apr 2018 17:19:59 +0200, Valentin Korenblit wrote:
>
>> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
>> index 1476b39acc..391a1cbaed 100644
>> --- a/package/mesa3d/Config.in
>> +++ b/package/mesa3d/Config.in
>> @@ -97,13 +97,28 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
>>   config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
>>   	bool "Gallium Radeon R600 driver"
>>   	depends on BR2_i386 || BR2_x86_64
>> +	depends on !BR2_PACKAGE_MESA3D_LLVM
> Why ?
>
>>   	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>>   	select BR2_PACKAGE_LIBDRM_RADEON
>> -	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
>>   	select BR2_PACKAGE_MESA3D_NEEDS_XA
>>   	help
>>   	  Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs.
>>   
>> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600_LLVM
>> +	bool "Gallium Radeon R600 driver with LLVM support"
>> +	depends on BR2_i386 || BR2_x86_64
>> +	depends on BR2_PACKAGE_MESA3D_LLVM
>> +	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
>> +		BR2_TOOLCHAIN_USES_GLIBC # elfutils
>> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>> +	select BR2_PACKAGE_LIBDRM_RADEON
>> +	select BR2_PACKAGE_LLVM_AMDGPU
>> +	select BR2_PACKAGE_ELFUTILS
>> +	select BR2_PACKAGE_MESA3D_NEEDS_XA
>> +	help
>> +	  Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs
>> +	  with LLVM support.
> I don't understand why you have two mutually exclusive options here.
> Why not instead have a sub-option ?

I did this because once you have activated llvm support for Mesa, if
you select Gallium R600 drivers, they will also need to be compiled
with llvm support, which requires elfutils and AMDGPU backend as dependencies.

radeon_llvm_check() in configure.ac from Mesa adds these dependencies.


Another possibility without creating a new option would be:

config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
     bool "Gallium Radeon R600 driver"
     depends on BR2_i386 || BR2_x86_64
     depends on (!BR2_PACKAGE_MESA3D_LLVM || \
                 (BR2_PACKAGE_MESA3D_LLVM && (BR2_TOOLCHAIN_USES_UCLIBC || \
		BR2_TOOLCHAIN_USES_GLIBC))  # elfutils
     select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
     select BR2_PACKAGE_LIBDRM_RADEON
     select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
     select BR2_PACKAGE_ELFUTILS if BR2_PACKAGE_MESA3D_LLVM
     select BR2_PACKAGE_MESA3D_NEEDS_XA
     help
       Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs.
  
comment "R600 driver needs a uClibc or glibc toolchain w/ llvm support"
         depends on BR2_PACKAGE_MESA3D_LLVM

         depends on !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)

> Something like:
>
> config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
>          bool "Gallium Radeon R600 driver"
>          depends on BR2_i386 || BR2_x86_64
>          select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>          select BR2_PACKAGE_LIBDRM_RADEON
>          select BR2_PACKAGE_MESA3D_NEEDS_XA
>          help
>            Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs.
>
> config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600_LLVM
> 	bool "Enable LLVM support in R600 driver"
> 	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
> 	depends on BR2_PACKAGE_MESA3D_LLVM
> 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
> 	select BR2_PACKAGE_LLVM_AMDGPU
> 	select BR2_PACKAGE_ELFUTILS
>
> Best regards,
>
> Thomas

Best regards,

Valentin
