From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Dec 2015 09:54:01 +0100
Subject: [Buildroot] [PATCH v2 3/3] dpdk: new package
In-Reply-To: <20151210002728.635e2562@jvn>
References: <1446203156-26848-1-git-send-email-viktorin@rehivetech.com>
 <1449670313-3613-1-git-send-email-viktorin@rehivetech.com>
 <1449670313-3613-4-git-send-email-viktorin@rehivetech.com>
 <20151209233603.3075670c@free-electrons.com>
 <20151210002728.635e2562@jvn>
Message-ID: <20151210095401.65a23912@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jan,

On Thu, 10 Dec 2015 00:27:28 +0100, Jan Viktorin wrote:

> > > diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
> > > new file mode 100644
> > > index 0000000..a4935ae
> > > --- /dev/null
> > > +++ b/package/dpdk/Config.in
> > > @@ -0,0 +1,47 @@
> > > +config BR2_PACKAGE_DPDK
> > > +       bool "dpdk"
> > > +       depends on BR2_x86_i686 || BR2_x86_64 || BR2_powerpc_power8 || BR2_ARM_CPU_ARMV7A || BR2_aarch64 || BR2_aarch64_be  
> > 
> > Why only BR2_x86_i686 ? I'm pretty sure it can work on many other 32
> > bits x86 CPUs. Did you want to say "at least i686" ?
> 
> Well, I'd say "at least i686", however, the general reason was the list
> of default configurations available in DPDK (only gcc-based
> configurations are listed):
> 
> defconfig_arm64-armv8a-linuxapp-gcc
> defconfig_arm64-thunderx-linuxapp-gcc
> defconfig_arm64-xgene1-linuxapp-gcc
> defconfig_arm-armv7a-linuxapp-gcc
> defconfig_i686-native-linuxapp-gcc
> defconfig_ppc_64-power8-linuxapp-gcc
> defconfig_tile-tilegx-linuxapp-gcc
> defconfig_x86_64-ivshmem-linuxapp-gcc
> defconfig_x86_64-native-bsdapp-gcc
> defconfig_x86_64-native-linuxapp-gcc
> defconfig_x86_x32-native-linuxapp-gcc

For x86, I think you should just exclude the CPUs < i686, like:

	depends on (BR2_i386 && !BR2_x86_i386 && !BR2_x86_i486 && !BR2_x86_i586 && !BR2_x86_x1000) || ...

> > > +if BR2_PACKAGE_DPDK
> > > +
> > > +config BR2_PACKAGE_DPDK_CONFIG
> > > +	string "Configuration"  
> > 
> > Why do you make this a visible option? Is there any reason for the user
> > to be able to chnage this value ?
> 
> DPDK provides a list of default configurations. I can imagine somebody
> would like to use a custom one for this (added probably by a custom
> patch to Buildroot). Also, DPDK will evolve overtime and this enables to
> specify a configuration we didn't have in the list. Moreover, as you can
> see from the list of default configurations above, for ARMv8, there are
> 3 possible configurations...

Ok, makes sense.

> > > +	default "i686-native-linuxapp-gcc" \
> > > +		if BR2_x86_i686
> > > +	default "x86_64-native-linuxapp-gcc" \
> > > +		if BR2_x86_64
> > > +	default "ppc_64-power8-native-linuxapp-gcc" \  
> > 
> > So it's a PowerPC 64 configuration? BR2_powerpc_power8 by itself
> > doesn't say if it's 32 bits or 64 bits, so maybe you need
> > BR2_powerpc_power8 && BR2_ARCH_IS_64.
> 
> Yes, 64 bits. Anyway, I cannot test this, so it is just a blind shoot.

You can decide to not support it.

> > > +		if BR2_powerpc_power8  
> > 
> > > diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
> > > new file mode 100644
> > > index 0000000..c78ec85
> > > --- /dev/null
> > > +++ b/package/dpdk/dpdk.hash
> > > @@ -0,0 +1,4 @@
> > > +# Locally calculated
> > > +sha256	f7b322867a45f99afd9c8fbacdc56e1621676f9ca0f046656ec85eb6a99a3440  dpdk-2.1.0.tar.gz
> > > +sha256	530074d4eaefe1f717e7411e6a74e4ba0fa619af304c5e74e1097e51d33cc19e  dpdk-2.2.0-rc2.tar.gz
> > > +sha256	7caf52554c0f724a09e9342ee6670b324a77dade5cd0b96ff5b66957ed1bc1f9  dpdk-2.2.0-rc3.tar.gz  
> > 
> > You no longer offer a version choice, so there's no reason to have all
> > those hashes. Keep just the one matching the version used in dpdk.mk.
> 
> OK. So you don't expect somebody sticks on a certain version of a
> package? This happens... It does not make sense for -rc versions, of
> course.

I don't understand what you mean here. dpdk.mk references 2.2.0-rc3
only, so only the hash for 2.2.0-rc3 should be in the .hash file. There
is no reason to have hashes for other versions.

> > > +DPDK_VERSION = 2.2.0-rc3
> > > +DPDK_SITE = http://dpdk.org/browse/dpdk/snapshot
> > > +DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.gz
> > > +
> > > +DPDK_LICENSE = BSD  
> > 
> > This is not sufficient, since as you said previously, it's not only
> > under BSD. Also BSD is not specific enough, it should be BSD-2c or
> > BSD-3c.
> 
> BSD-3c
> 
> Can the DPDK_LICENSE contain more licenses? (RTFM..., I am lazy, maybe tomorrow :).) 

Yes, it can contain more licenses. Here is an example from Buildroot:

	ATTR_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)

> > > +DPDK_LICENSE_FILES = LICENSE.LGPL LICENSE.GPL  
> > 
> > So those contain the GPL and LGPL texts, but DPDK_LICENSE does not
> > reference the GPL and LGPL licenses. And the BSD license text is not
> > there. I believe this licensing information needs to be improved a bit.
> 
> How? The BSD license text is not in the DPDK upstream, no idea why.

You can put a source file which carries a BSD license header in
DPDK_LICENSE_FILES. Usually, we try to choose a fairly small source
file.

See for example:

	E2FSPROGS_LICENSE_FILES = COPYING lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h

> > I think this piece of code does not take into account the fact that
> > BR2_SHARED_STATIC_LIBS=y means that both shared and static libraries
> > must be enabled. Remember that there is a three state choice:
> > 
> >  - BR2_STATIC_LIBS -> static libraries only (no shared libs)
> >  - BR2_SHARED_LIBS -> shared libraries only (no static libs)
> >  - BR2_SHARED_STATIC_LIBS -> both static and shared libraries
> 
> Does BR2_SHARED_STATIC_LIBSBR2_SHARED_STATIC_LIBS mean, that I MUST
> provide both shared and static version?

Normally yes. However in practice, not all packages fully comply with
this. BR2_SHARED_LIBS sometimes lead to packages building/installing
both the shared and static variants. What is however non-negotiable is
that BR2_STATIC_LIBS should not build any shared library.

> In that case, you are right and
> I will have hard time of figure out, how to persuade DPDK to give me
> those... But, as I've mentioned in the cover letter, the install system
> has changed recently in DPDK, so it's possible I can do this better...

I think you can do BR2_STATIC_LIBS builds/installs static libs only,
and BR2_STATIC_SHARED_LIBS or BR2_SHARED_LIBS builds/installs shared
libs only. It's probably good enough for now.

> > Also, these >> means that if you do "make dpdk-reconfigure", those
> > lines will keep being added and added and added at the end of
> > the .config file.
> 
> Wow :). Is there a better way to do this? BTW, the fact there is
> a .config file does not mean that it is the same system as in the
> kconfig. It is not...

Even if it is not kconfig based, you can still use the sort of logic as
the KCONFIG_ENABLE_OPT, KCONFIG_SET_OPT and KCONFIG_DISABLE_OPT (see
pkg-utils.mk).

> > > +endef
> > > +
> > > +define DPDK_BUILD_CMDS
> > > +	$(MAKE1) -C $(@D) T=$(DPDK_CONFIG) RTE_KERNELDIR=$(LINUX_DIR) CROSS=$(TARGET_CROSS) install  
> > 
> > So you're doing the installation during the build step? This is not
> > good. But I see that later you're doing the installation manually. What
> > is being installed here then? The kernel modules?
> 
> Nothing is installed here. Actually, it installs things for itself (not
> into standard paths or anything...). This is the only magic sequence
> that builds the DPDK in the way I need for Buildroot. Think of it in a
> way like s/install/build/. Yes, it is strange. I hope that it is no
> more an issue with the recent changes in DPDK.

Just add a comment above to explain this. Thanks :)

> > Also, is the MAKE1 instead of MAKE intentional?
> 
> Yes, that is an intention. I have issues with parallel builds.

Ok.

> > > +ifeq ($(BR2_SHARED_LIBS),n)  
> > 
> > A BR2_<foo> boolean variable can never be 'n'. It can be 'y' or empty.
> 
> OK. This is better (however, less readable):
> 
> ifneq ($(BR2_SHARED_LIBS),y)
> 
> isn't it?

No:

ifeq ($(BR2_SHARED_LIBS),)

or alternatively:

ifeq ($(BR2_STATIC_LIBS),y)

depending on the behavior you want for BR2_SHARED_STATIC_LIBS.

> 
> > 
> > > +# Install static libs only (DPDK compiles either *.so or *.a)
> > > +define DPDK_INSTALL_STAGING_LIBS
> > > +	$(INSTALL) -m 0755 -D -d $(STAGING_DIR)/usr/lib
> > > +	$(INSTALL) -m 0644 -D $(@D)/build/lib/*.a $(STAGING_DIR)/usr/lib  
> > 
> > No -D in this case.
> 
> Do you mean only for the second one?

For both.

> > > +endef
> > > +
> > > +else
> > > +# Install shared libs only (DPDK compiles either *.so or *.a)
> > > +define DPDK_INSTALL_STAGING_LIBS
> > > +	$(INSTALL) -m 0755 -D -d $(STAGING_DIR)/usr/lib
> > > +	$(INSTALL) -m 0644 -D $(@D)/build/lib/*.so* $(STAGING_DIR)/usr/lib
> > > +endef  
> > 
> > This logic again assumes that we install either shared *or* static
> > libraries. But if BR2_SHARED_STATIC_LIBS=y, we need to install both.
> 
> So my assumption (MUST) on the top of this e-mail is right. But, DPDK
> provides either *.so or *.a. Never both. Or, I don't know, how to
> configure it for this. In fact, the shared builds are sometimes claimed
> (I've seen that written somewhere but it was not in the docs) to be
> broken (they work for my cases) and DPDK applications are usually build
> statically for x86.

I think it's OK if BR2_SHARED_STATIC_LIBS is not implemented perfectly
for dpdk. Just assume BR2_SHARED_STATIC_LIBS is like BR2_SHARED_LIBS.

> > > +define DPDK_INSTALL_TARGET_LIBS
> > > +	$(INSTALL) -m 0755 -D -d $(STAGING_DIR)/usr/lib  
> > 
> > Should be $(TARGET_DIR).
> 
> OK.

And no -D here.

> > > +	$(INSTALL) -m 0755 -D $(@D)/tools/dpdk_nic_bind.py $(TARGET_DIR)/usr/bin
> > > +	$(INSTALL) -m 0755 -D $(@D)/tools/cpu_layout.py $(TARGET_DIR)/usr/bin  
> > 
> > Use full paths for the destination.
> 
> Do you mean: $(TARGET_DIR)/usr/bin/dpdk_nic_bind.py?

Yes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
