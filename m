From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 15 Feb 2018 22:34:43 +0100
Subject: [Buildroot] [PATCH 1/2] sunxi-mali-driver-mainline: new package
In-Reply-To: <87lgfum0aq.fsf@dell.be.48ers.dk>
References: <1511648569-18855-1-git-send-email-giulio.benetti@micronovasrl.com>
 <87lgfum0aq.fsf@dell.be.48ers.dk>
Message-ID: <6f81dc33-b3a2-223e-1628-aed8a2e1e747@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 15/02/2018 22:05, Peter Korsgaard ha scritto:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:
> 
>   > Added kernel allwinner mali driver package.
>   > Used combined with userspace Allwinner openGL libraries,
>   > it gives possibility to use 3D openGL SoC acceleration.
> 
>   > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>   > ---
>   >  DEVELOPERS                                         |  3 ++
>   >  package/Config.in                                  |  1 +
>   >  package/sunxi-mali-driver-mainline/Config.in       | 38 ++++++++++++++++++++++
>   >  .../sunxi-mali-driver-mainline.mk                  | 30 +++++++++++++++++
> 
> I've renamed this to sunxi-mali-mainline-driver to better match
> sunxi-mali-mainline and so it sorts after that package.
> 
>> +++ b/package/sunxi-mali-driver-mainline/Config.in
>   > @@ -0,0 +1,38 @@
>   > +comment "sunxi-mali-driver-mainline needs a Linux kernel to be built"
>   > +	depends on !BR2_LINUX_KERNEL
>   > +
>   > +config BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE
>   > +	bool "sunxi-mali-driver-mainline"
>   > +	depends on BR2_LINUX_KERNEL
>   > +	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
> 
> This package doesn't make any sense without the binary user space
> component, so I've changed it to also depend on
> BR2_PACKAGE_SUNXI_MALI_MAINLINE. With that added, the package is only
> visible if that package is enabled and the Linux kernel is getting
> built, so it makes sense to enable this package by default, so I've
> added 'default y'.
> 
> 
>> +	help
>   > +	  This package builds and installs the Linux kernel driver for
>   > +	  the Mali GPU on Allwinner platforms, compatible with recent
>   > +	  Linux kernels (>= 4.4). Note that it should be installed
>   > +	  together with the corresponding userspace OpenGL libraries,
>   > +	  which are provided as binaries only at:
>   > +	  https://github.com/free-electrons/mali-blobs
>   > +
>   > +	  sunxi-mali-driver-mainline requires a Linux kernel >= 4.4 with the
>   > +	  following options enabled:
>   > +
>   > +	  - CONFIG_CMA
>   > +	  - CONFIG_DMA_CMA
>   > +	  - CONFIG_DRM_FBDEV_OVERALLOC >= 200 for double buffer or more
> 
> I've dropped this last line as suggested by Maxime.
> 
> For the CMA options it makes sense to automatically enable these kernel
> options, so I've added the needed logic in linux.mk to do so.

New thing learnt.

> 
> 
>   > +if BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE
>   > +
>   > +choice
>   > +	prompt "Version"
>   > +	default BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE_R6P2
>   > +	help
>   > +	  Select the version of the kernel module.
>   > +
>   > +config BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE_R6P2
>   > +	bool "r6p2"
> 
> The user space and kernel driver has to use the same version, so it
> doesn't make sense to have an independent version selection here.
> 
> I've dropped this and instead changed the .mk file to use the
> SUNXI_MALI_MAINLINE_REV variable from that package.

Right.

Thank you very much for helping me on this,
it was not so easy as first package to me.

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

> 
> Committed to next with that fixed, thanks.
> 
