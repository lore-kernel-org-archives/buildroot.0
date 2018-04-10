From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 23:33:36 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: add dependency on elfutils
 to r600 with llvm
In-Reply-To: <542b2d70-23ed-2d85-ba62-82c85118a7f3@smile.fr>
References: <20180410151959.18713-1-valentin.korenblit@smile.fr>
 <20180410175148.71878897@windsurf>
 <542b2d70-23ed-2d85-ba62-82c85118a7f3@smile.fr>
Message-ID: <20180410233336.6f7a0e07@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Apr 2018 18:21:26 +0200, Valentin Korenblit wrote:

> > I don't understand why you have two mutually exclusive options here.
> > Why not instead have a sub-option ?  
> 
> I did this because once you have activated llvm support for Mesa, if
> you select Gallium R600 drivers, they will also need to be compiled
> with llvm support, which requires elfutils and AMDGPU backend as dependencies.

Aah, OK, I understand. This is really crappy (in Mesa3D).

> radeon_llvm_check() in configure.ac from Mesa adds these dependencies.
> 
> Another possibility without creating a new option would be:
> 
> config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
>      bool "Gallium Radeon R600 driver"
>      depends on BR2_i386 || BR2_x86_64
>      depends on (!BR2_PACKAGE_MESA3D_LLVM || \
>                  (BR2_PACKAGE_MESA3D_LLVM && (BR2_TOOLCHAIN_USES_UCLIBC || \
> 		BR2_TOOLCHAIN_USES_GLIBC))  # elfutils
>      select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>      select BR2_PACKAGE_LIBDRM_RADEON
>      select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
>      select BR2_PACKAGE_ELFUTILS if BR2_PACKAGE_MESA3D_LLVM
>      select BR2_PACKAGE_MESA3D_NEEDS_XA
>      help
>        Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs.
>   
> comment "R600 driver needs a uClibc or glibc toolchain w/ llvm support"
>          depends on BR2_PACKAGE_MESA3D_LLVM
> 
>          depends on !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)

This seems like the good solution to me.

Note that there is some work going on to make elfutils compatible with
musl: https://sourceware.org/bugzilla/show_bug.cgi?id=21002, but it
doesn't seem to be ready yet, so in the mean time what you propose
looks good to me.

I think the Config.in comment should be:

comment "R600 driver needs a uClibc or glibc toolchain when llvm is enabled"

I think the "w/ llvm support" that you proposed can be confusing: to me
it means "you need a toolchain with LLVM support". But it's not what's
happening. What's happening is: "if you have enabled LLVM support, then
your toolchain must be using glibc or uClibc".

In addition to the Config.in comment itself, a regular comment would be
good to explain what's going on, because it's really weird.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
