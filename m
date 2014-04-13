From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 13 Apr 2014 12:55:25 +0300
Subject: [Buildroot] [PATCH v2] ne10: bump version to 1.0.0
In-Reply-To: <20140413105415.34ee1b19@skate>
References: <76642160278009c2ccd78c0d6ab5e557fd47e247.1397378036.git.baruch@tkos.co.il>
 <20140413105415.34ee1b19@skate>
Message-ID: <20140413095525.GD4149@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Apr 13, 2014 at 10:54:15AM +0200, Thomas Petazzoni wrote:
> On Sun, 13 Apr 2014 11:33:56 +0300, Baruch Siach wrote:
> > diff --git a/package/ne10/Config.in b/package/ne10/Config.in
> > index d0c4983ed588..fa21cc4f084c 100644
> > --- a/package/ne10/Config.in
> > +++ b/package/ne10/Config.in
> > @@ -1,6 +1,8 @@
> >  config BR2_PACKAGE_NE10
> >  	bool "ne10"
> > -	depends on BR2_arm && BR2_ARM_CPU_HAS_NEON
> > +	depends on BR2_arm
> > +	depends on BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4
> 
> Hum, why BR2_ARM_CPU_HAS_NEON isn't sufficient here? I believe you can
> very well have a root filesystem that is generally built with
> BR2_ARM_FPU_VFPV4 (i.e the default FPU used is VFPv4), but still build
> some software packages to use Neon instructions, as long as
> BR2_ARM_CPU_HAS_NEON is defined.

The ne10 code includes gcc arm_neon.h which requires -mfpu=neon, otherwise you 
get

#error You must enable NEON instructions (e.g. -mfloat-abi=softfp -mfpu=neon) to use arm_neon.h

The -mfpu option is hardcoded in the toolchain wrapper. Is there another way 
to do this?

> > +	depends on BR2_ARM_INSTRUCTIONS_THUMB || BR2_ARM_INSTRUCTIONS_THUMB2
> 
> Same thing here: nothing prevents you from building your root
> filesystem with full ARM instructions (i.e
> BR2_ARM_INSTRUCTIONS_ARM_CHOICE), but still build some software
> packages to use Thumb2 instructions, as long as BR2_ARM_CPU_HAS_THUMB2
> is defined.

In this case -mthumb is hardcoded in CMakeLists.txt. Having -marm in the 
toolchain wrapper confuses the linker as reported by Peter at 
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/81489 .

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
