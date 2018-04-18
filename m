From: =?utf-8?Q?Micha=C5=82_Kalbarczyk?= <michal@gamecodehq.com>
Date: Wed, 18 Apr 2018 18:13:21 +0200
Subject: [Buildroot] [PATCH] add Radeon SI driver to mesa3d package
In-Reply-To: <3b815480-8436-8b94-ff8d-37701c2b34da@gmail.com>
References: <9C4B57AF-E8C0-4BC6-80C7-C72006371825@gamecodehq.com>
 <3b815480-8436-8b94-ff8d-37701c2b34da@gmail.com>
Message-ID: <9279D07B-70D6-46B8-AB05-90C8F2DB8151@gamecodehq.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Romain,

it should select select BR2_PACKAGE_LIBDRM_AMDGPU instead of radeon, will fix that, and generate patch following the tutorial.

best regards,
Micha?



> On 18 Apr 2018, at 00:01, Romain Naour <romain.naour@gmail.com> wrote:
> 
> Hi Michal,
> 
> Thanks for your contribution!
> 
> Please follow the manual for submitting patches [1] and add your SoB line [2]
> otherwise Buildroot maintainers can't merge your patch.
> 
> The commit title should be "package/mesa3d: add Radeon SI support"
> 
> [1] http://nightly.buildroot.org/manual.html#submitting-patches <http://nightly.buildroot.org/manual.html#submitting-patches>
> [2]
> http://nightly.buildroot.org/manual.html#_format_and_licensing_of_the_package_patches <http://nightly.buildroot.org/manual.html#_format_and_licensing_of_the_package_patches>
> 
> Le 17/04/2018 ? 22:55, Micha? Kalbarczyk a ?crit :
>> Hi, after lates changes in mesa3d package, there is easy way to add radeonsi driver.
>> 
>> This is a diff:
>> 
>> diff --git a/var/folders/f0/4ht96w1s5rd7gqvlml56p71c0000gn/T//WhRTic_Config.in b/package/mesa3d/Config.in
>> index bd3d050e29..3670ee455c 100644
>> --- a/var/folders/f0/4ht96w1s5rd7gqvlml56p71c0000gn/T//WhRTic_Config.in
>> +++ b/package/mesa3d/Config.in
>> @@ -114,6 +114,26 @@ comment "R600 driver needs a uClibc or glibc toolchain when llvm is enabled"
>> 	depends on BR2_PACKAGE_MESA3D_LLVM
>> 	depends on !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
>> 
>> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
>> +	bool "Gallium Radeon SI driver"
>> +	depends on BR2_i386 || BR2_x86_64
>> +	depends on !BR2_PACKAGE_MESA3D_LLVM || \
>> +		(BR2_PACKAGE_MESA3D_LLVM && (BR2_TOOLCHAIN_USES_UCLIBC || \
>> +			BR2_TOOLCHAIN_USES_GLIBC)) # elfutils
>> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>> +	select BR2_PACKAGE_LIBDRM_RADEON
> 
> what's about a "select BR2_PACKAGE_LIBDRM_AMDGPU" ?
> mesa3d is checking for both.
> 
> Otherwise, the patch looks good.
> Can you send an updated version?
> 
> Best regards,
> Romain
> 
>> +	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
>> +	select BR2_PACKAGE_ELFUTILS if BR2_PACKAGE_MESA3D_LLVM
>> +	select BR2_PACKAGE_MESA3D_NEEDS_XA
>> +	help
>> +	  Driver for ATI/AMD Radeon HD7000/HD8000/Rx200 GPUs.
>> +
>> +# Radeon SI needs libelf when Mesa3D is built with LLVM support
>> +# musl is not currently compatible with elfutils
>> +comment "Radeon SI driver needs a uClibc or glibc toolchain when llvm is enabled"
>> +	depends on BR2_PACKAGE_MESA3D_LLVM
>> +	depends on !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
>> +
>> config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
>> 	bool "Gallium vmware svga driver"
>> 	depends on BR2_i386 || BR2_x86_64
>> diff --git a/var/folders/f0/4ht96w1s5rd7gqvlml56p71c0000gn/T//OPIX1a_mesa3d.mk b/package/mesa3d/mesa3d.mk
>> index 506f84274f..e89b895c18 100644
>> --- a/var/folders/f0/4ht96w1s5rd7gqvlml56p71c0000gn/T//OPIX1a_mesa3d.mk
>> +++ b/package/mesa3d/mesa3d.mk
>> @@ -80,6 +80,7 @@ endif
>> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv imx
>> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
>> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
>> +MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
>> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
>> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
>> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net <mailto:buildroot@busybox.net>
>> http://lists.busybox.net/mailman/listinfo/buildroot <http://lists.busybox.net/mailman/listinfo/buildroot>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180418/affc337f/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: Message signed with OpenPGP
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180418/affc337f/attachment.asc>
