From: Jan Viktorin <viktorin@rehivetech.com>
Date: Wed, 23 Mar 2016 13:50:32 +0100
Subject: [Buildroot] [PATCH v3 3/3] dpdk: new package
In-Reply-To: <20160322211232.374d47a2@free-electrons.com>
References: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
 <1458642986-32365-4-git-send-email-viktorin@rehivetech.com>
 <20160322211232.374d47a2@free-electrons.com>
Message-ID: <20160323135032.45a26cf4@pcviktorin.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,,

thank you for comments. You can find your previous review here:

[1] http://lists.busybox.net/pipermail/buildroot/2015-December/146614.html
[2] http://lists.busybox.net/pipermail/buildroot/2015-December/146630.html

On Tue, 22 Mar 2016 21:12:32 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Tue, 22 Mar 2016 11:36:26 +0100, Jan Viktorin wrote:
> 
> > diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
> > new file mode 100644
> > index 0000000..a42271e
> > --- /dev/null
> > +++ b/package/dpdk/Config.in
> > @@ -0,0 +1,53 @@
> > +config BR2_PACKAGE_DPDK
> > +       bool "dpdk"  
> 
> Indentation of properties should be done with one tab (ditto in the
> following lines)
> 
> > +       depends on (BR2_i386 && !BR2_x86_i386 && !BR2_x86_i486 \
> > +		      && !BR2_x86_i586 && !BR2_x86_x1000) \
> > +                  || BR2_ARM_CPU_ARMV7A || BR2_aarch64 || BR2_aarch64_be  
> 
> I'm wondering why you have this list of architecture dependencies. Is
> it because there is really some architecture specific code, or is it a
> left-over from the times we didn't had the BR2_TOOLCHAIN_HAS_x
> options ?

Shortly: i686+ | ARMv7-a | AArch64, based on your suggestion [2]. Should
I put a comment there?

> 
> If that's really needed, please add a blind option like this:
> 
> config BR2_PACKAGE_DPDK_ARCH_SUPPORTS
> 	bool
> 	default y if ...

OK, seems reasonable.

> 
> That you can re-use as a dependency, both for the comment (see below)
> and the main option.
> 
> > +       depends on BR2_TOOLCHAIN_USES_GLIBC  
> 
> Then you need to have a comment like:
> 
> comment "dpdk needs a toolchain w/ glibc"
> 	depends on !BR2_TOOLCHAIN_USES_GLIBC
> 	depends on BR2_TOOLCHAIN_HAS_SYNC_...

OK, will fix.

> 
> > +       depends on BR2_TOOLCHAIN_HAS_SYNC_1
> > +       depends on BR2_TOOLCHAIN_HAS_SYNC_2
> > +       depends on BR2_TOOLCHAIN_HAS_SYNC_4
> > +       depends on BR2_TOOLCHAIN_HAS_SYNC_8  
> 
> Cosmetic nit, but I would prefer to see:
> 
> 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && \
> 		BR2_TOOLCHAIN_HAS_SYNC_2 && \
> 		BR2_TOOLCHAIN_HAS_SYNC_4 && \
> 		BR2_TOOLCHAIN_HAS_SYNC_8

Well, no problem, I just wonder why... as it's less readable and quite
ugly :).

> 
> 	
> 
> > +       help
> > +	 DPDK is a set of libraries and drivers for fast packet processing. It
> > +	 was designed to run on any processors, however, Intel x86 has been the
> > +	 first CPU to be supported. Ports for other CPUs like IBM Power 8 and
> > +	 ARM are under progress. It runs mostly in Linux userland. A FreeBSD
> > +	 port is now available for a subset of DPDK features.  
> 
> Indentation of the help text should be one tab + *two* spaces.

The help text is right tab+ss, but the options are accidently indented
by spaces. Will fix.

> 
> > +
> > +	 Notes:
> > +	 * To build the included Linux Kernel drivers, it is necessary to
> > +	   enable CONFIG_PCI_MSI, CONFIG_UIO.
> > +	 * To build the PCAP PMD properly, you need to enable the libpcap
> > +	   manually.
> > +	 * You may need to install the python2 interpreter if you want to use
> > +	   scripts dpdk_nic_bind.py and cpu_layout.py
> > +
> > +         http://www.dpdk.org/
> > +
> > +if BR2_PACKAGE_DPDK
> > +
> > +config BR2_PACKAGE_DPDK_CONFIG
> > +	string "Configuration"
> > +	default "i686-native-linuxapp-gcc" \
> > +		if BR2_x86_i686
> > +	default "x86_64-native-linuxapp-gcc" \
> > +		if BR2_x86_64
> > +	default "arm-armv7a-linuxapp-gcc" \
> > +		if BR2_ARM_CPU_ARMV7A
> > +	default "arm64-armv8a-linuxapp-gcc" \
> > +		if BR2_aarch64 || BR2_aarch64_be  
> 
> I don't remember if we discussed this: is there any reason to make this
> configurable? I.e is it necessary to make it a visible Config.in option
> as opposed to a blind one?

You've already agreed on this [2] and it seems to be a good compromise.
There are multiple configurations per CPU architecture and a user might
want to use a custom one.

> 
> > +
> > +config BR2_PACKAGE_DPDK_TEST
> > +	bool "Install tests suite"
> > +	select BR2_PACKAGE_PYTHON_PEXPECT if BR2_PACKAGE_PYTHON
> > +	help
> > +	  Install all DPDK tests. If you want to run the tests by the included
> > +	  autotest.py script you need to enable python manually.  
> 
> Is the test suite usable without Python ?

Yes, it's compiled as a single binary _test_. I use it that way. The
python scripts are helpful for automatization.

> 
> > diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
> > new file mode 100644
> > index 0000000..02860fd
> > --- /dev/null
> > +++ b/package/dpdk/dpdk.mk
> > @@ -0,0 +1,109 @@
> > +################################################################################
> > +#
> > +# dpdk
> > +#
> > +################################################################################
> > +
> > +DPDK_VERSION = 16.04-rc1  
> 
> We normally don't package release candidate / beta version. Are you
> confident that the final 16.04 release will be done before Buildroot
> ships its own release at the end of May ?

The release of 16.04 should be out early in April
(http://dpdk.org/dev/roadmap).

> 
> > +DPDK_SITE = http://dpdk.org/browse/dpdk/snapshot
> > +DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.gz  
> 
> Not needed, that's the default value.

OK.

> 
> > +
> > +DPDK_LICENSE = BSD (core), GPLv2+ (Linux drivers)  
> 
> BSD should be more specific, like BSD-2c, BSD-3c, etc.

BSD-3c, thanks.

> 
> > +DPDK_LICENSE_FILES = GNUmakefile LICENSE.GPL
> > +DPDK_INSTALL_STAGING = YES
> > +
> > +DPDK_DEPENDENCIES += linux  
> 
> If you need the Linux kernel to be built, then you need to also have:
> 
> 	depends on BR2_LINUX_KERNEL
> 
> in your Config.in, as well as a corresponding comment:
> 
> comment "dpdk needs the Linux kernel to be built"
> 	depends on !BR2_LINUX_KERNEL

OK.

> 
> > +
> > +ifeq ($(BR2_PACKAGE_LIBPCAP),y)
> > +DPDK_DEPENDENCIES += libpcap
> > +endif
> > +
> > +ifeq ($(BR2_SHARED_LIBS),y)
> > +define DPDK_ENABLE_SHARED_LIBS
> > +	$(call KCONFIG_ENABLE_OPT,CONFIG_RTE_BUILD_SHARED_LIB,\
> > +			$(@D)/build/.config)
> > +endef
> > +
> > +DPDK_POST_CONFIGURE_HOOKS += DPDK_ENABLE_SHARED_LIBS
> > +endif
> > +
> > +# We're building a kernel module without using the kernel-module infra,
> > +# so we need to tell we want module support in the kernel
> > +ifeq ($(BR2_PACKAGE_DPDK),y)
> > +LINUX_NEEDS_MODULES = y
> > +endif  
> 
> This is no longer the "right" way of doing this. Just select
> BR2_LINUX_NEEDS_MODULES in Config.in.

Cool, I didn't know that.

> 
> > +
> > +DPDK_CONFIG = $(call qstrip,$(BR2_PACKAGE_DPDK_CONFIG))
> > +
> > +ifeq ($(BR2_PACKAGE_DPDK_EXAMPLES),y)
> > +# Build of DPDK examples is not very straight-forward. It requires to have
> > +# the SDK and runtime installed on same place to reference it by RTE_SDK.
> > +# We place it locally in the build directory.
> > +define DPDK_BUILD_EXAMPLES
> > +	$(MAKE) -C $(@D) DESTDIR=$(@D)/examples-sdk \
> > +		CROSS=$(TARGET_CROSS) install-sdk install-runtime
> > +	$(MAKE) -C $(@D) RTE_KERNELDIR=$(LINUX_DIR) CROSS=$(TARGET_CROSS) \
> > +		RTE_SDK=$(@D)/examples-sdk/usr/local/share/dpdk \
> > +		T=$(DPDK_CONFIG) examples
> > +endef
> > +
> > +DPDK_EXAMPLES_PATH = $(@D)/examples-sdk/usr/local/share/dpdk/examples
> > +
> > +# Installation of examples is not supported in DPDK so we do it explicitly
> > +# here. As the binaries and libraries do not have a single or regular location
> > +# where to find them after build, we search for them by find.
> > +define DPDK_INSTALL_EXAMPLES
> > +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/local/bin
> > +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/local/lib  
> 
> In Buildroot, everything is installed in /usr, not /usr/local. Why

Just testing the reviewers here :). Well, at first I wanted to easily
check that it installs the right binaries and this is better checked in
an empty directory then in the /usr/bin with a great amount of other
things. I will put those into /usr/bin.

> should this package be different? Also, to create directories, we
> typically use mkdir -p.

Will use mkdir -p.

> 
> > +	for f in `find $(DPDK_EXAMPLES_PATH) -executable -type f   \
> > +			-name '[a-z]*.so*' | grep '\/lib\/.*'`; do \
> > +		$(INSTALL) -m 0755 -D $$f                          \
> > +			$(TARGET_DIR)/usr/local/lib/`basename $$f`;\
> > +	done
> > +	for f in `find $(DPDK_EXAMPLES_PATH) -executable -type f   \
> > +			! -name '*.so*' | grep '\/app\/.*'`; do    \
> > +		$(INSTALL) -m 0755 -D $$f                          \
> > +			$(TARGET_DIR)/usr/local/bin/`basename $$f`;\
> > +	done  
> 
> It's a bit annoying to have this logic. Could it be simplified to use
> -path instead of -name and avoid the grep ?

OK, will try.

> 
> Also, you need to add || exit 1 after the $(INSTALL) to exit the for
> loop in case of failure.

OK, will fix.

> 
> Ideally (but separately from this patch), you could contribute to
> upstream dpdk a way to install examples.

True. First of all, I am happy to do it automatically at the moment. Of
course, this is not the right place to solve it.

I'll try to patch this upstream and/or move this into a DPDK patch
temporarily.

> 
> > +endef
> > +
> > +# Build of the power example is broken (at least for 16.04).
> > +define DPDK_DISABLE_POWER
> > +	$(call KCONFIG_DISABLE_OPT,CONFIG_RTE_LIBRTE_POWER,\
> > +			$(@D)/build/.config)
> > +endef
> > +
> > +DPDK_POST_CONFIGURE_HOOKS += DPDK_DISABLE_POWER
> > +endif
> > +
> > +define DPDK_CONFIGURE_CMDS
> > +	$(MAKE) -C $(@D) T=$(DPDK_CONFIG) RTE_KERNELDIR=$(LINUX_DIR) \
> > +			   CROSS=$(TARGET_CROSS) config
> > +endef
> > +
> > +define DPDK_BUILD_CMDS
> > +	$(MAKE) -C $(@D) RTE_KERNELDIR=$(LINUX_DIR) CROSS=$(TARGET_CROSS)
> > +	$(DPDK_BUILD_EXAMPLES)
> > +endef
> > +
> > +define DPDK_INSTALL_STAGING_CMDS
> > +	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) prefix=/usr \
> > +		 CROSS=$(TARGET_CROSS) install-sdk
> > +endef
> > +
> > +ifeq ($(BR2_PACKAGE_DPDK_TEST),y)
> > +define DPDK_INSTALL_TARGET_TEST
> > +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/dpdk
> > +	$(INSTALL) -m 0755 -D $(@D)/build/app/test $(TARGET_DIR)/usr/dpdk
> > +	$(INSTALL) -m 0755 -D $(@D)/app/test/*.py $(TARGET_DIR)/usr/dpdk
> > +endef
> > +endif
> > +
> > +define DPDK_INSTALL_TARGET_CMDS
> > +	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) prefix=/usr \
> > +		CROSS=$(TARGET_CROSS) install-runtime
> > +	$(DPDK_INSTALL_TARGET_TEST)
> > +	$(DPDK_INSTALL_EXAMPLES)
> > +endef
> > +
> > +$(eval $(generic-package))  
> 
> Other than that, looks good to me.

Thank you!
Jan

> 
> Thomas



-- 
   Jan Viktorin                  E-mail: Viktorin at RehiveTech.com
   System Architect              Web:    www.RehiveTech.com
   RehiveTech
   Brno, Czech Republic
