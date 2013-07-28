From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 19:22:27 +0200
Subject: [Buildroot] [PATCH] uclibc/arm: don't install ldd.host and
 ldconfig.host if !HAVE_SHARED
In-Reply-To: <CAFRkauAQFyQCn1S=yUuzhCmCNdjMn1jTU-zzgG=eLAL-P7Hy3A@mail.gmail.com>
References: <1375030117.13990.1.camel@phoenix> <20130728185932.5142e4b2@skate>
 <CAFRkauAQFyQCn1S=yUuzhCmCNdjMn1jTU-zzgG=eLAL-P7Hy3A@mail.gmail.com>
Message-ID: <20130728192227.708e6c2c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Mon, 29 Jul 2013 01:17:00 +0800, Axel Lin wrote:

> Below is my settings.
> I'm pretty new in using buildroot, below is my settings.
> I hope my description here is clear.
> 
> $ make menuconfig
> 
> mainly with below settings:
> ARM, arm7tdmi, uClibc,
> BR2_USE_MMU is not set
> 
> $ make uclibc-menuconfig
> 
> ARCH_HAS_MMU is not set
> UCLIBC_FORMAT_FLAT=y
> ARCH_HAS_NO_SHARED=y
> When ARCH_HAS_NO_SHARED=y, HAVE_SHARED is automatically set to "not set".

As soon as you customize the uClibc configuration with
uclibc-menuconfig, then we cannot support all the possible build
failures that you will get.

So the solution to this problem is to improve the ARM noMMU support in
Buildroot, making sure that:

 1/ The uClibc configuration is automatically adjusted appropriately.

 2/ The uClibc tools are not installed.


> However, in package/uclibc/uclibc.mk, it always install ldd.host and
> ldconfig.host if $(BR2_BINFMT_FLAT) is not set.

BR2_BINFMT_FLAT should be set when ARM noMMU is used, because I don't
think ELF binaries are supported on ARM noMMU.

I know Gustavo is working on improving the ARM noMMU, hopefully he will
post patches soon.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
