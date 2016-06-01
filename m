From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 15:20:51 +0200
Subject: [Buildroot] [PATCH 1/3] libamcodec: new Package
In-Reply-To: <574EDABD.5010801@imgtec.com>
References: <20160601102720.3929-1-daggs@gmx.com> <574EDABD.5010801@imgtec.com>
Message-ID: <20160601152051.37e8128a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Jun 2016 13:53:17 +0100, Vicente Olivert Riera wrote:

> > +config BR2_PACKAGE_LIBAMCODEC
> > +	bool "libamcodec"
> > +	depends on BR2_arm || BR2_aarch64  
> 
> Doesn't work for other architectures? Why?

Because this library is specific to Amlogic SoCs, so showing it on ARM
and AArch64 only makes sense.

> $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/amavutils
> M_PREFIX=$(STAGING_DIR)/usr
> $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/amadec
> M_PREFIX=$(STAGING_DIR)/usr
> $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/amcodec
> PREFIX=$(STAGING_DIR)

No, PREFIX=$(STAGING_DIR) is wrong, as I stated in my review. Unless
PREFIX is used in a non-standard way by this package, which is possible
(but in this case it should be explained by a comment).

> This is because your package needs alsa-lib in order to be built, so you
> have depend on it.
> 
> Add "select BR2_PACKAGE_ALSA_LIB" to the Config.in, and don't forget to
> propagate alsa-lib' dependencies, so also add "depends on
> BR2_TOOLCHAIN_HAS_THREADS # alsa-lib". And this will make necessary to
> add a comment section to the Config.in as well, like this:
> 
> 
> comment "libamcodec needs a toolchain w/ threads"
> 	depends on !BR2_TOOLCHAIN_HAS_THREADS
> 
> And in the libamcodec.mk you need to add the alsa-lib dependency as well
> to make sure it will be built before your package. That way the alsa-lib
> headers and libs will be ready to use in the $(STAGING_DIR):
> 
> LIBAMCODEC_DEPENDENCIES = alsa-lib
> 
> After all of that your package will fail again to build with an error
> like this one:
> 
> make[1]: Entering directory
> '/br/output/build/libamcodec-ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d/amcodec'
> MAKE audio_ctl
> make[2]: Entering directory
> '/br/output/build/libamcodec-ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d/amcodec/audio_ctl'
> make[2]: Leaving directory
> '/vr/output/build/libamcodec-ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d/amcodec/audio_ctl'
> make[2]: Entering directory
> '/vr/output/build/libamcodec-ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d/amcodec/audio_ctl'
> CC  audio_ctrl.c
> audio_ctrl.c: In function 'audio_basic_init':
> audio_ctrl.c:26:5: warning: implicit declaration of function
> 'audio_decode_basic_init' [-Wimplicit-function-declaration]
>      audio_decode_basic_init();
>      ^
> LD build-in.o
> ld: audio_ctrl.o: Relocations in generic ELF (EM: 40)
> ld: audio_ctrl.o: Relocations in generic ELF (EM: 40)
> ld: audio_ctrl.o: Relocations in generic ELF (EM: 40)
> ld: audio_ctrl.o: Relocations in generic ELF (EM: 40)
> ld: audio_ctrl.o: Relocations in generic ELF (EM: 40)
> audio_ctrl.o: error adding symbols: File in wrong format
> 
> I let you fix this one and the others that may appear.

Thanks for doing some testing, I only did a review and did not go all
the way to testing, so this is definitely appreciated. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
