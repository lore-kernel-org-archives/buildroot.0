From: daggs <daggs@gmx.com>
Date: Wed, 1 Jun 2016 22:58:21 +0200
Subject: [Buildroot] [PATCH 1/3] libamcodec: new Package
In-Reply-To: <574EDABD.5010801@imgtec.com>
References: <20160601102720.3929-1-daggs@gmx.com>,
 <574EDABD.5010801@imgtec.com>
Message-ID: <trinity-4069dc21-c33b-4998-a162-30b60c43cd0d-1464814701618@3capp-mailcom-bs13>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
> Hello Dagg,
> 
> thanks for your contributions. Below are some comments I would like you
> to read. Please keep scrolling down.
> 
> On 01/06/16 11:27, Dagg wrote:
> > Signed-off-by: Dagg <daggs@gmx.com>
> > ---
> >  package/Config.in                |  1 +
> >  package/libamcodec/Config.in     |  5 +++++
> >  package/libamcodec/libamcodec.mk | 33 +++++++++++++++++++++++++++++++++
> 
> You also need to add a package/libamcodec/libamcodec.hash file.
> 
> >  3 files changed, 39 insertions(+)
> >  create mode 100644 package/libamcodec/Config.in
> >  create mode 100644 package/libamcodec/libamcodec.mk
> > 
> 
> [...]
> 
> > diff --git a/package/libamcodec/Config.in b/package/libamcodec/Config.in
> > new file mode 100644
> > index 0000000..bb2d924
> > --- /dev/null
> > +++ b/package/libamcodec/Config.in
> > @@ -0,0 +1,5 @@
> > +config BR2_PACKAGE_LIBAMCODEC
> > +	bool "libamcodec"
> > +	depends on BR2_arm || BR2_aarch64
> 
> Doesn't work for other architectures? Why?
> 
> > +	help
> > +	    Interface library for Amlogic media codecs
> 
> We usually add the URL here.
> 
> > diff --git a/package/libamcodec/libamcodec.mk b/package/libamcodec/libamcodec.mk
> > new file mode 100644
> > index 0000000..e983192
> > --- /dev/null
> > +++ b/package/libamcodec/libamcodec.mk
> > @@ -0,0 +1,33 @@
> > +################################################################################
> > +#
> > +# libamcodec
> > +#
> > +################################################################################
> > +
> > +LIBAMCODEC_VERSION = ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d
> > +LIBAMCODEC_SITE = https://github.com/mdrjr/c2_aml_libs.git
> 
> 
> You can use out GitHub helper here:
> 
> LIBAMCODEC_SITE = $(call github,mdrjr,c2_aml_libs,$(LIBAMCODEC_VERSION))
> 
> > +LIBAMCODEC_SITE_METHOD = git
> 
> And this line will not be needed since you are using the GitHub helper.
> 
> > +LIBAMCODEC_LICENSE = GPL
> 
> Which version of GPL? Also, no LIBAMCODEC_LICENSE_FILES?
> 
> > +
> > +define LIBAMCODEC_BUILD_CMDS
> > +	$(MAKE) -C $(@D)/amavutils CC="$(TARGET_CC)" LD="$(TARGET_LD)" PREFIX="$(STAGING_DIR)/usr"
> > +	$(MAKE) -C $(@D)/amadec CC="$(TARGET_CC)" LD="$(TARGET_LD)" PREFIX="$(STAGING_DIR)/usr"
> > + 	$(MAKE) -C $(@D)/amcodec CC="$(TARGET_CC)" LD="$(TARGET_LD)" PREFIX="$(STAGING_DIR)/usr"
> 
> You have an extra white space before this line. Remove it.
> 
> Some comments regarding the whole LIBAMCODEC_BUILD_CMDS:
> 
> - Always put $(TARGET_MAKE_ENV) before $(MAKE).
> - Instead of defining CC and LD you could just pass
> $(TARGET_CONFIGURE_OPTS).
> - amavutils and amadec use M_PREFIX instead of PREFIX.
> 
> Something like this would work fine:
> 
> $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/amavutils
> M_PREFIX=$(STAGING_DIR)/usr
> $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/amadec
> M_PREFIX=$(STAGING_DIR)/usr
> $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/amcodec
> PREFIX=$(STAGING_DIR)
> 
> > +endef
> > +
> > +define LIBAMCODEC_INSTALL_STAGING_CMDS
> > +	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(STAGING_DIR)/usr/lib
> > +	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(STAGING_DIR)/usr/lib
> > +	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(STAGING_DIR)/usr/lib
> > +
> > +	mkdir -p $(STAGING_DIR)/usr/include/amcodec
> > +	cp -rf $(@D)/amcodec/include/* $(STAGING_DIR)/usr/include/amcodec
> > +endef
> > +
> > +define LIBAMCODEC_INSTALL_TARGET_CMDS
> > +	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(TARGET_DIR)/usr/lib
> > +	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(TARGET_DIR)/usr/lib
> > +	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(TARGET_DIR)/usr/lib
> > +endef
> > +									    
> 
> You have an extra white space/tab here. Remove it.
> 
> > +$(eval $(generic-package))
> > 
> 
> Now some final comments. You package fails to build with this error:
> 
> /br/output/host/usr/bin/arm-linux-gnueabihf-gcc -O2 -fPIC -g
> -I/br/output/build/libamcodec-ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d/amavutils
> -I/br/output/build/libamcodec-ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d/amavutils/include
> -I/br/output/build/libamcodec-ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d/amavutils/../amcodec/include
> -L/usr/lib -I/usr/include   -c -o amaudioutils.o amaudioutils.c
> arm-linux-gnueabihf-gcc: ERROR: unsafe header/library path used in
> cross-compilation: '/usr/lib'
> 
> This is because your package is using "-L/usr/lib -I/usr/include" which
> are considered unsafe header/library paths (it will use libs and
> includes from the host machine, not from the staging area). And
> Buildroot treats this as an error because
> BR2_COMPILER_PARANOID_UNSAFE_PATH is enabled.
> 
> If you disable BR2_COMPILER_PARANOID_UNSAFE_PATH it will not fail at
> that point, but it will fail later like this:
> 
> /br/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/5.3.1/../../../../arm-linux-gnueabihf/bin/ld:
> skipping incompatible /usr/lib/libpthread.so when searching for -lpthread
> /br/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/5.3.1/../../../../arm-linux-gnueabihf/bin/ld:
> skipping incompatible /usr/lib/libm.so when searching for -lm
> /usr/lib/librt.so: file not recognized: File format not recognized
> 
> This is because is trying to use /usr/lib/librt.so from the host machine
> which has a different architecture than the target. And it's using the
> /usr/lib/librt.so from the host machine because of the explained before
> (the unsafe header/library paths).
> 
> However this problem will be solved when you amend the commands in the
> LIBAMCODEC_BUILD_CMDS as I told you above.
> 
> Now, after this, it will fail with an error like this one:
> 
> audio_out/alsa-out.c:18:28: fatal error: alsa/asoundlib.h: No such file
> or directory
> 
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
> 
> Regards,
> 
> Vincent.
> 

most of the rejects were addressed in the mail to Thomas.
I did compiled it before and it exhibited no failures, while some I understand why I didn't saw issues with it (alsa-lib), others I don't (last issue for example).
thanks for the comments, they were helpful.
I'll post a new patch soon.

Dagg.
