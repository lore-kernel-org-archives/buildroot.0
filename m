From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jul 2017 11:31:53 +0200
Subject: [Buildroot] [git commit] xvisor: fix build on AArch64
In-Reply-To: <20170705202947.AB27B81F86@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Wed, 5 Jul 2017 22:30:55 +0200")
References: <20170705202947.AB27B81F86@busybox.osuosl.org>
Message-ID: <87fue9ykqe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=117fd5dfbc756c4f2b4aef97fc2b568528c66df7
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Xvisor was failing to build on AArch64 with:

 > package/xvisor/xvisor.mk:60: *** No Xvisor defconfig name specified, check your BR2_PACKAGE_XVISOR_DEFCONFIG setting.  Stop.

 > The first problem is that the Config.in file had a typo: it was using
 > BR2_AARCH64 instead of BR2_aarch64, and therefore the
 > BR2_PACKAGE_XVISOR_DEFCONFIG variable had no value.

 > Once this is fixed, another problem occurs: the ARCH variable needs to
 > be specified as "arm" for XVisor, for both ARM and AArch64. Therefore,
 > a XVISOR_ARCH variable is introduced, which is calculated according to
 > the Buildroot configuration options. Only x86-64, arm and aarch64 are
 > supported by Xvisor currently, so it remains simple.

 > Fixes:

 >   http://autobuild.buildroot.net/results/1719a63ff257f13634a06a14327abfb327984101/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/xvisor/Config.in |  2 +-
 >  package/xvisor/xvisor.mk | 10 +++++++++-
 >  2 files changed, 10 insertions(+), 2 deletions(-)

 > diff --git a/package/xvisor/Config.in b/package/xvisor/Config.in
 > index 1f8fd1f..c9f7429 100644
 > --- a/package/xvisor/Config.in
 > +++ b/package/xvisor/Config.in
 > @@ -35,7 +35,7 @@ config BR2_PACKAGE_XVISOR_DEFCONFIG
 >  	default "generic-v5" if BR2_ARM_CPU_ARMV5
 >  	default "generic-v6" if BR2_ARM_CPU_ARMV6
 >  	default "generic-v7" if BR2_ARM_CPU_ARMV7A
 > -	default "generic-v8" if BR2_AARCH64
 > +	default "generic-v8" if BR2_aarch64
 >  	default "x86_64_generic" if BR2_x86_64
 >  	depends on BR2_PACKAGE_XVISOR_USE_DEFCONFIG
 >  	help
 > diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
 > index 141a0e3..8be4be9 100644
 > --- a/package/xvisor/xvisor.mk
 > +++ b/package/xvisor/xvisor.mk
 > @@ -26,8 +26,16 @@ XVISOR_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE))
 >  endif
 >  XVISOR_KCONFIG_EDITORS = menuconfig
 
 > +ifeq ($(BR2_x86_64),y)
 > +XVISOR_ARCH = x86
 > +else ifeq ($(BR2_arm)$(BR2_aarch64),y)
 > +XVISOR_ARCH = arm
 > +else
 > +$(error "Architecture not supported by XVisor")
 > +endif

That's no good - This now breaks building anything for all other archs
than these. I guess the $(error) should be within a BR_BUILDING +
BR2_PACKAGE_XVISOR conditional.

BR_BUILDING so sources.b.org will be able to download the tarball (it
currently uses the default arch, E.G. x86).

-- 
Bye, Peter Korsgaard
