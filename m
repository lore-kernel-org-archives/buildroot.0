From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Dec 2017 23:11:00 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain-external: bump version of
 Linaro ARM toolchain to 7.2-2017.11
In-Reply-To: <20171221225837.24a615b0@windsurf.lan>
References: <20171221182119.27682-1-romain.naour@gmail.com>
 <20171221225837.24a615b0@windsurf.lan>
Message-ID: <20171221221100.GA4638@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-12-21 22:58 +0100, Thomas Petazzoni spake thusly:
> On Thu, 21 Dec 2017 19:21:17 +0100, Romain Naour wrote:
> > https://releases.linaro.org/components/toolchain/binaries/7.2-2017.11
> > 
> > Tested with qemu_arm_vexpress_defconfig.
> > 
> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> > ---
> >  .../toolchain-external/toolchain-external-linaro-arm/Config.in | 10 ++++------
> >  .../toolchain-external-linaro-arm.hash                         |  4 ++--
> >  .../toolchain-external-linaro-arm.mk                           |  6 +++---
> >  3 files changed, 9 insertions(+), 11 deletions(-)
> > 
> > diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
> > index 3acc060131..d383273c1b 100644
> > --- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
> > +++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
> > @@ -1,13 +1,11 @@
> >  comment "Linaro toolchains available for Cortex-A + EABIhf"
> >  	depends on BR2_arm
> > -	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
> >  	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
> >  	depends on !BR2_STATIC_LIBS
> >  
> >  config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
> >  	bool "Linaro ARM 2017.11"
> >  	depends on BR2_arm
> > -	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
> 
> Hum, this is something I didn't think of when merging the series from
> Yann regarding those options. You are now removing this dependency
> because the toolchain uses gcc 7.x. However, it means that as soon as
> we introduce BR2_ARCH_NEEDS_GCC_AT_LEAST_8, we will have to go and edit
> each and every toolchain that uses gcc 7.x to add
> a !BR2_ARCH_NEEDS_GCC_AT_LEAST_8 dependency. Not very practical :-/

Indeed, but we already have a similar problem for kernel headers.

In Buildroot 2017.11, the most recent headers we know of are 4.13, and
since we check the validity of the version, this precludes using kernel
4.14 or above in Buildroot 2017.11.

As for the gcc version, I believe this is more manageable, because we do
not add new architectures or new variants every days... So, yes, this
will be a bit cumbersome to handle, but we should manage...

At the very least, when we add gcc version N+1, we can search for all
occurences of "select BR2_TOOLCHAIN_GCC_AT_LEAST_(N)" and update them
with a new "depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_(N+1)".

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
