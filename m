From: Jan Viktorin <viktorin@rehivetech.com>
Date: Thu, 10 Dec 2015 00:27:28 +0100
Subject: [Buildroot] [PATCH v2 3/3] dpdk: new package
In-Reply-To: <20151209233603.3075670c@free-electrons.com>
References: <1446203156-26848-1-git-send-email-viktorin@rehivetech.com>
 <1449670313-3613-1-git-send-email-viktorin@rehivetech.com>
 <1449670313-3613-4-git-send-email-viktorin@rehivetech.com>
 <20151209233603.3075670c@free-electrons.com>
Message-ID: <20151210002728.635e2562@jvn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 9 Dec 2015 23:36:03 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Jan,
> 
> On Wed,  9 Dec 2015 15:11:53 +0100, Jan Viktorin wrote:
> > This patch introduces support of the DPDK library (www.dpdk.org) into
> > Buildroot. DPDK is a library for high-speed packet sending/receiving
> > while bypassing the Linux Kernel. It allows to reach a high throughput
> > for 10-100 Gbps networks on the x86 platform.  
> 
> Great! I'm not using DPDK myself, but I believe it's good to have this
> supported in Buildroot.

Hello Thomas, thanks for your review...

> 
> > diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
> > new file mode 100644
> > index 0000000..a4935ae
> > --- /dev/null
> > +++ b/package/dpdk/Config.in
> > @@ -0,0 +1,47 @@
> > +config BR2_PACKAGE_DPDK
> > +       bool "dpdk"
> > +       depends on BR2_x86_i686 || BR2_x86_64 || BR2_powerpc_power8 || BR2_ARM_CPU_ARMV7A || BR2_aarch64 || BR2_aarch64_be  
> 
> Why only BR2_x86_i686 ? I'm pretty sure it can work on many other 32
> bits x86 CPUs. Did you want to say "at least i686" ?

Well, I'd say "at least i686", however, the general reason was the list
of default configurations available in DPDK (only gcc-based
configurations are listed):

defconfig_arm64-armv8a-linuxapp-gcc
defconfig_arm64-thunderx-linuxapp-gcc
defconfig_arm64-xgene1-linuxapp-gcc
defconfig_arm-armv7a-linuxapp-gcc
defconfig_i686-native-linuxapp-gcc
defconfig_ppc_64-power8-linuxapp-gcc
defconfig_tile-tilegx-linuxapp-gcc
defconfig_x86_64-ivshmem-linuxapp-gcc
defconfig_x86_64-native-bsdapp-gcc
defconfig_x86_64-native-linuxapp-gcc
defconfig_x86_x32-native-linuxapp-gcc

> 
> Please wrap lines at 72 characters.

I know... ;) I've discovered a great helper today ":set colorcolumn=80".

> 
> > +       depends on BR2_TOOLCHAIN_USES_GLIBC  
> 
> You need a dependency on BR2_LINUX_KERNEL here, since your .mk file is
> building some kernel modules.

OK.

> 
> > +       help
> > +         DPDK is a set of libraries and drivers for fast packet processing. It was designed to run on
> > +         any processors knowing Intel x86 has been the first CPU to be supported. Ports for other CPUs
> > +         like IBM Power 8 and ARM are under progress. It runs mostly in Linux userland. A FreeBSD port
> > +         is now available for a subset of DPDK features.  
> 
> Wrapping please :)

Already fixed internally, thanks.

> 
> > +
> > +	 Notes:
> > +	 * To build the included Linux Kernel drivers, it is necessary to enable CONFIG_PCI_MSI,
> > +	   CONFIG_UIO.
> > +	 * To build the PCAP PMD properly, you need to enable the libpcap manually.
> > +	 * To install the python scripts (dpdk_nic_bind.py, cpu_layout.py), enable
> > +	   the python2 interpreter for the target.
> > +
> > +         http://www.dpdk.org/
> > +
> > +if BR2_PACKAGE_DPDK
> > +
> > +config BR2_PACKAGE_DPDK_CONFIG
> > +	string "Configuration"  
> 
> Why do you make this a visible option? Is there any reason for the user
> to be able to chnage this value ?

DPDK provides a list of default configurations. I can imagine somebody
would like to use a custom one for this (added probably by a custom
patch to Buildroot). Also, DPDK will evolve overtime and this enables to
specify a configuration we didn't have in the list. Moreover, as you can
see from the list of default configurations above, for ARMv8, there are
3 possible configurations...

> 
> > +	default "i686-native-linuxapp-gcc" \
> > +		if BR2_x86_i686
> > +	default "x86_64-native-linuxapp-gcc" \
> > +		if BR2_x86_64
> > +	default "ppc_64-power8-native-linuxapp-gcc" \  
> 
> So it's a PowerPC 64 configuration? BR2_powerpc_power8 by itself
> doesn't say if it's 32 bits or 64 bits, so maybe you need
> BR2_powerpc_power8 && BR2_ARCH_IS_64.

Yes, 64 bits. Anyway, I cannot test this, so it is just a blind shoot.

> 
> > +		if BR2_powerpc_power8  
> 
> > diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
> > new file mode 100644
> > index 0000000..c78ec85
> > --- /dev/null
> > +++ b/package/dpdk/dpdk.hash
> > @@ -0,0 +1,4 @@
> > +# Locally calculated
> > +sha256	f7b322867a45f99afd9c8fbacdc56e1621676f9ca0f046656ec85eb6a99a3440  dpdk-2.1.0.tar.gz
> > +sha256	530074d4eaefe1f717e7411e6a74e4ba0fa619af304c5e74e1097e51d33cc19e  dpdk-2.2.0-rc2.tar.gz
> > +sha256	7caf52554c0f724a09e9342ee6670b324a77dade5cd0b96ff5b66957ed1bc1f9  dpdk-2.2.0-rc3.tar.gz  
> 
> You no longer offer a version choice, so there's no reason to have all
> those hashes. Keep just the one matching the version used in dpdk.mk.

OK. So you don't expect somebody sticks on a certain version of a
package? This happens... It does not make sense for -rc versions, of
course.

> 
> > +DPDK_VERSION = 2.2.0-rc3
> > +DPDK_SITE = http://dpdk.org/browse/dpdk/snapshot
> > +DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.gz
> > +
> > +DPDK_LICENSE = BSD  
> 
> This is not sufficient, since as you said previously, it's not only
> under BSD. Also BSD is not specific enough, it should be BSD-2c or
> BSD-3c.

BSD-3c

Can the DPDK_LICENSE contain more licenses? (RTFM..., I am lazy, maybe tomorrow :).) 

> 
> > +DPDK_LICENSE_FILES = LICENSE.LGPL LICENSE.GPL  
> 
> So those contain the GPL and LGPL texts, but DPDK_LICENSE does not
> reference the GPL and LGPL licenses. And the BSD license text is not
> there. I believe this licensing information needs to be improved a bit.

How? The BSD license text is not in the DPDK upstream, no idea why.

> 
> > +DPDK_INSTALL_STAGING = YES
> > +
> > +DPDK_DEPENDENCIES += linux
> > +
> > +ifeq ($(BR2_PACKAGE_LIBPCAP),y)
> > +DPDK_DEPENDENCIES += libpcap
> > +endif
> > +
> > +ifeq ($(BR2_SHARED_LIBS),y)
> > +define DPDK_ENABLE_SHARED_LIBS
> > +	@echo CONFIG_RTE_BUILD_COMBINE_LIBS=y >> $(@D)/build/.config
> > +	@echo CONFIG_RTE_BUILD_SHARED_LIB=y >> $(@D)/build/.config
> > +endef
> > +
> > +DPDK_POST_CONFIGURE_HOOKS += DPDK_ENABLE_SHARED_LIBS
> > +endif  
> 
> I think this piece of code does not take into account the fact that
> BR2_SHARED_STATIC_LIBS=y means that both shared and static libraries
> must be enabled. Remember that there is a three state choice:
> 
>  - BR2_STATIC_LIBS -> static libraries only (no shared libs)
>  - BR2_SHARED_LIBS -> shared libraries only (no static libs)
>  - BR2_SHARED_STATIC_LIBS -> both static and shared libraries

Does BR2_SHARED_STATIC_LIBSBR2_SHARED_STATIC_LIBS mean, that I MUST
provide both shared and static version? In that case, you are right and
I will have hard time of figure out, how to persuade DPDK to give me
those... But, as I've mentioned in the cover letter, the install system
has changed recently in DPDK, so it's possible I can do this better...

> 
> What does BUILD_COMBINE_LIBS does ?

Good question... My answer is that it magically builds and works
with this option :). I've done this quite a long time ago, I have to
check it again, my bad.

> 
> Also, these >> means that if you do "make dpdk-reconfigure", those
> lines will keep being added and added and added at the end of
> the .config file.

Wow :). Is there a better way to do this? BTW, the fact there is
a .config file does not mean that it is the same system as in the
kconfig. It is not...

> 
> > +# We create symlink named $(DPDK_CONFIG) to the build directory  
> 
> a symlink

OK.

> 
> > +# to avoid calling install which behaves strange in DPDK build system.
> > +define DPDK_CONFIGURE_CMDS
> > +	$(MAKE) -C $(@D) T=$(DPDK_CONFIG) RTE_KERNELDIR=$(LINUX_DIR) CROSS=$(TARGET_CROSS) config
> > +	@ln -sv build $(@D)/$(DPDK_CONFIG)  
> 
> Don't use @ here.

OK.

> 
> > +endef
> > +
> > +define DPDK_BUILD_CMDS
> > +	$(MAKE1) -C $(@D) T=$(DPDK_CONFIG) RTE_KERNELDIR=$(LINUX_DIR) CROSS=$(TARGET_CROSS) install  
> 
> So you're doing the installation during the build step? This is not
> good. But I see that later you're doing the installation manually. What
> is being installed here then? The kernel modules?

Nothing is installed here. Actually, it installs things for itself (not
into standard paths or anything...). This is the only magic sequence
that builds the DPDK in the way I need for Buildroot. Think of it in a
way like s/install/build/. Yes, it is strange. I hope that it is no
more an issue with the recent changes in DPDK.

> 
> Since the package is not "standard", it would probably be good to
> include a few more comments in the .mk file to explain what is going on.

True.

> 
> Also, is the MAKE1 instead of MAKE intentional?

Yes, that is an intention. I have issues with parallel builds.

> 
> > +endef
> > +
> > +ifeq ($(BR2_SHARED_LIBS),n)  
> 
> A BR2_<foo> boolean variable can never be 'n'. It can be 'y' or empty.

OK. This is better (however, less readable):

ifneq ($(BR2_SHARED_LIBS),y)

isn't it?

> 
> > +# Install static libs only (DPDK compiles either *.so or *.a)
> > +define DPDK_INSTALL_STAGING_LIBS
> > +	$(INSTALL) -m 0755 -D -d $(STAGING_DIR)/usr/lib
> > +	$(INSTALL) -m 0644 -D $(@D)/build/lib/*.a $(STAGING_DIR)/usr/lib  
> 
> No -D in this case.

Do you mean only for the second one?

> 
> > +endef
> > +
> > +else
> > +# Install shared libs only (DPDK compiles either *.so or *.a)
> > +define DPDK_INSTALL_STAGING_LIBS
> > +	$(INSTALL) -m 0755 -D -d $(STAGING_DIR)/usr/lib
> > +	$(INSTALL) -m 0644 -D $(@D)/build/lib/*.so* $(STAGING_DIR)/usr/lib
> > +endef  
> 
> This logic again assumes that we install either shared *or* static
> libraries. But if BR2_SHARED_STATIC_LIBS=y, we need to install both.

So my assumption (MUST) on the top of this e-mail is right. But, DPDK
provides either *.so or *.a. Never both. Or, I don't know, how to
configure it for this. In fact, the shared builds are sometimes claimed
(I've seen that written somewhere but it was not in the docs) to be
broken (they work for my cases) and DPDK applications are usually build
statically for x86.

> 
> 
> > +
> > +define DPDK_INSTALL_TARGET_LIBS
> > +	$(INSTALL) -m 0755 -D -d $(STAGING_DIR)/usr/lib  
> 
> Should be $(TARGET_DIR).

OK.

> 
> > +	$(INSTALL) -m 0644 -D $(@D)/build/lib/*.so* $(TARGET_DIR)/usr/lib
> > +endef
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_PYTHON),y)
> > +define DPDK_INSTALL_TARGET_PYSCRIPTS
> > +	$(INSTALL) -m 0755 -D -d $(STAGING_DIR)/usr/bin  
> 
> Not needed (and wrong since you're using STAGING_DIR).

This looks like a copy & paste mistake. Same as above, it should be
TARGET_DIR.

> 
> > +	$(INSTALL) -m 0755 -D $(@D)/tools/dpdk_nic_bind.py $(TARGET_DIR)/usr/bin
> > +	$(INSTALL) -m 0755 -D $(@D)/tools/cpu_layout.py $(TARGET_DIR)/usr/bin  
> 
> Use full paths for the destination.

Do you mean: $(TARGET_DIR)/usr/bin/dpdk_nic_bind.py?

> 
> > +endef
> > +
> > +DPDK_DEPENDENCIES += python
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_DPDK_TOOLS_TESTPMD),y)
> > +define DPDK_INSTALL_TARGET_TESTPMD
> > +	$(INSTALL) -m 0755 -D -d $(TARGET_DIR)/usr/bin  
> 
> Not needed.

OK.

> 
> > +	$(INSTALL) -m 0755 -D $(@D)/build/app/testpmd $(TARGET_DIR)/usr/bin  
> 
> Use a complete path for the destination.

Same as above.

> 
> > +endef
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_DPDK_TOOLS_TEST),y)
> > +define DPDK_INSTALL_TARGET_TEST
> > +	$(INSTALL) -m 0755 -D -d $(TARGET_DIR)/usr/dpdk
> > +	$(INSTALL) -m 0755 -D $(@D)/build/app/test $(TARGET_DIR)/usr/dpdk
> > +	$(INSTALL) -m 0755 -D $(@D)/app/test/*.py $(TARGET_DIR)/usr/dpdk
> > +endef
> > +
> > +ifeq ($(BR2_PACKAGE_PYTHON),y)
> > +DPDK_DEPENDENCIES += python-pexpect  
> 
> Not good, you cannot add a package to the dependencies if it is not
> enabled in the configuration. Is there anyway any point in installing
> the .py files if you don't have a Python interpreter?

No. I think the *.py files can be ommited when there is no Python
interpreter.

> 
> If you really want to handle it this way, you can do:
> 
> 	select BR2_PACKAGE_PYTHON_PEXPECT if BR2_PACKAGE_PYTHON
> 
> under the BR2_PACKAGE_DPDK_TOOLS_TEST option.

So, I'd install the binaries only.

And if there is a python interpreter I add the *.py files. I also
enforce the PEXPECT package in Config.in in that case. This sounds
promising.

> 
> > +define DPDK_INSTALL_STAGING_CMDS
> > +	$(INSTALL) -m 0755 -D -d $(STAGING_DIR)/usr/include
> > +	$(INSTALL) -m 0644 -D $(@D)/build/include/*.h $(STAGING_DIR)/usr/include
> > +	$(DPDK_INSTALL_STAGING_LIBS)
> > +endef
> > +
> > +define DPDK_INSTALL_TARGET_CMDS
> > +	$(DPDK_INSTALL_TARGET_LIBS)
> > +	$(DPDK_INSTALL_TARGET_PYSCRIPTS)
> > +	$(DPDK_INSTALL_TARGET_TESTPMD)
> > +	$(DPDK_INSTALL_TARGET_TEST)
> > +endef
> > +
> > +$(eval $(generic-package))  
> 
> Thanks!
> 
> Thomas

Regards
Jan

-- 
  Jan Viktorin                E-mail: Viktorin at RehiveTech.com
  System Architect            Web:    www.RehiveTech.com
  RehiveTech
  Brno, Czech Republic
