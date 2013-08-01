From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Aug 2013 07:35:20 +0200
Subject: [Buildroot] Using the new Ti-gfx with Qt5
In-Reply-To: <CALo-6+jacTWNK9aO4FFCUDAyNtSED5wy3q+hMSvFWM3Jciafdw@mail.gmail.com>
References: <CALo-6+jacTWNK9aO4FFCUDAyNtSED5wy3q+hMSvFWM3Jciafdw@mail.gmail.com>
Message-ID: <20130801073520.622bf499@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Krinke,

On Wed, 31 Jul 2013 13:26:20 -0700, Charles Krinke wrote:
> I am trying to get ti-gfx to configure with last nights build, that
> is, buildroot-20130731.
> 
> I see enabling the kernel compile is necessary and I assume
> "omap2plus_defconfig" is appropriate for an AM3517EVM board.
> 
> I am having trouble finding the combination of settings to get
> buildroot to configure OPENGL_ES and OPENGL_EGL so that ti-gfx will
> become operational.
> 
> Would someone be willing to give me a pointer on the error of my ways, please

A defconfig as below should work (for just ti-gfx, qt5 is not enabled) :

BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109=y
BR2_PACKAGE_TI_GFX=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="omap2plus_defconfig"

The critical part for ti-gfx is that you need to have a (e)glibc
toolchain, not an uClibc toolchain.

Remember that you can discover dependencies of packages by searching
them in menuconfig using '/', and typing the package name. This would
give you the following information:

Symbol: BR2_PACKAGE_TI_GFX [=n]
  ? Type  : boolean
  ? Prompt: ti-gfx
  ?   Defined at package/ti-gfx/Config.in:1
  ?   Depends on: BR2_LINUX_KERNEL [=n] && BR2_TOOLCHAIN_USES_GLIBC [=n] && BR2_arm [=y]
  ?   Location:
  ?     -> Package Selection for the target
  ? (6)   -> Hardware handling
  ?   Selects: BR2_PACKAGE_HAS_OPENGL_EGL [=n] && BR2_PACKAGE_HAS_OPENGL_ES [=n] && BR2_PACKAGE_HAS_POWERVR [=n]

This tells you that the ti-gfx package is available only on ARM (which
is already selected), requires a Linux kernel to be built (not selected
yet) and a toolchain based on glibc (not selected yet).

As far as Qt5 is concerned, I got it running on top of ti-gfx, but I
don't remember if patches were needed. I can dig through my archives if
you're interested.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
