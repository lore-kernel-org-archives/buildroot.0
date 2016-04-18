From: Jan Viktorin <viktorin@rehivetech.com>
Date: Mon, 18 Apr 2016 10:23:15 +0200
Subject: [Buildroot] [PATCH v5] dpdk: new package
In-Reply-To: <20160417230607.75d32331@free-electrons.com>
References: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
 <1460826490-15614-1-git-send-email-viktorin@rehivetech.com>
 <20160417163814.03b67f53@free-electrons.com>
 <20160417155607.5861459.38806.3255@rehivetech.com>
 <20160417213544.2960f7cf@free-electrons.com>
 <20160417205607.5861459.29884.3259@rehivetech.com>
 <20160417230607.75d32331@free-electrons.com>
Message-ID: <20160418102315.169c22ad@jvn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Apr 2016 23:06:07 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Sun, 17 Apr 2016 22:56:07 +0200, Jan Viktorin wrote:
> 
> > Well, your config is for ARMv7 so no kmods are built because all
> > current drivers require PCI which is hardly to see on this platform
> > (I know just about Armada).  
> 
> Indeed mvebu_v7 is for Marvell Armada. Is DPDK only for PCI NICs? Can't
> it be used for the internal NICs of certain ARM SoCs ?

Yes. DPDK up to 16.04 supports only PCI devices. We are going to change
this for 16.07 (the next release).

> 
> > Ok. I don't know what would be the use case for dropping dependency
> > on the kernel. Building just the rootfs without the kernel?  
> 
> For example, yes. Another benefit of not having the mandatory kernel
> dependency is that the autobuilders would be able to test the DPDK
> package.

I have no clue about this. Does kernel dependency prevent some
auto-testing?

> 
> > That means to check whether the kernel is enabled. And if it is then
> > to enable building of the DPDK kernel modules. Right?  
> 
> Correct.

I would implement this in Buildroot by a list of configuration keys
naming certain drivers. If the kernel is disabled, I'd disable all of
them during configure phase. Otherwise, I'd leave them untouched (to
have the current configuration as is). So, I'd put in dpdk.mk
something like:

ifeq ($(BR2_LINUX_KERNEL),y)
DPDK_DEPENDENCIES += linux
else
DPDK_KMODS = EAL_IGB_UIO KNI_KMOD LIBRTE_XEN_DOM0

define DPDK_DISABLE_KMODS
$(foreach m,$(DPDK_KMODS),\
	$(call KCONFIG_DISABLE_OPT,CONFIG_RTE_$(m),$(@D)/build/.config))
endef

DPDK_POST_CONFIGURE_HOOKS += DPDK_DISABLE_KMODS
endif

Probably, I can improve it by testing whether a module is present
in the DPDK config and then setting the dependency on linux.

Anyway, it seems to be quite complex...

> 
> > This can be done but I am afraid I have to disable certain modules by
> > name from the current configuration. This is not very generic
> > (consider adding a new out-of-tree kernel module or removing an
> > obsolete one from the DPDK, custom DPDK tree with third party
> > modules) but there are only few of them so it might be a working
> > solution. I will check if there is a more generic way but I don't
> > think so.  
> 
> I'm not sure what you mean here. If the default configuration on a
> given architecture builds kernel modules, then on this architecture,
> DPDK should depend on the kernel to be built. If the default
> configuration on another architecture does not build kernel modules,
> then there is no need to depend on the kernel.
> 
> That being said, if only ARM does not build any kernel module, maybe we
> can simply do as you do right now, and depend on the kernel
> unconditionally, to keep things simple.

Yes, this would work for the existing defconfigs. What about a custom
one? E.g. I want some DPDK kernel modules for the Armada with a
PCI-E NIC. So, I need a custom DPDK configuration at the moment.
Fortunately, this is a rare case.

There is also a Xen module in DPDK that is not built by default so you
have to create a custom configuration (or alter an existing one) to
enable it.

I understand that you'd like to keep it as simple as possible. I'd like
to keep it simple too but also providing enough flexibility for easy
customizations. That's why I don't consider the ARMv7 configuration to
be "without kernel modules" as it is possible to enable some if needed.

Regards
Jan

> 
> Thanks!
> 
> Thomas



-- 
  Jan Viktorin                E-mail: Viktorin at RehiveTech.com
  System Architect            Web:    www.RehiveTech.com
  RehiveTech
  Brno, Czech Republic
