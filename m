From: Jan Viktorin <viktorin@rehivetech.com>
Date: Fri, 25 Mar 2016 13:32:40 +0100
Subject: [Buildroot] [PATCH v3 3/3] dpdk: new package
In-Reply-To: <20160322211232.374d47a2@free-electrons.com>
References: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
 <1458642986-32365-4-git-send-email-viktorin@rehivetech.com>
 <20160322211232.374d47a2@free-electrons.com>
Message-ID: <20160325133240.38684e8b@jvn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

I've got some questions about the Config.in...

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
> 
> If that's really needed, please add a blind option like this:
> 
> config BR2_PACKAGE_DPDK_ARCH_SUPPORTS
> 	bool
> 	default y if ...

So, should I move here also the HAS_SYNC checks?

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

The conditiion must be "if all dependencies but BR2_TOOLCHAIN_USES_GLIBC
are met", is it right? So, should I put here the HAS_SYNC_*,
ARCH_SUPPORTS, BR2_LINUX_KERNEL and BR2_LINUX_NEEDS_MODULES?

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

[...]

> 	depends on BR2_LINUX_KERNEL
> 
> in your Config.in, as well as a corresponding comment:
> 
> comment "dpdk needs the Linux kernel to be built"
> 	depends on !BR2_LINUX_KERNEL

The same situation here. Should I test "all && !BR2_LINUX_KERNEL"?

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
> 

[...]

My current state is:

config BR2_PACKAGE_DPDK
	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS                               
	depends on BR2_TOOLCHAIN_USES_GLIBC
	depends on BR2_LINUX_NEEDS_MODULES
        depends on BR2_TOOLCHAIN_HAS_SYNC_1 &&\
                 BR2_TOOLCHAIN_HAS_SYNC_2 &&\
                 BR2_TOOLCHAIN_HAS_SYNC_4 &&\
                 BR2_TOOLCHAIN_HAS_SYNC_8

config BR2_PACKAGE_DPDK_ARCH_SUPPORTS                                           
        bool                                                                    
        default y if (BR2_i386 && !BR2_x86_i386 && !BR2_x86_i486 \              
                         && !BR2_x86_i586 && !BR2_x86_x1000) \                   
                || BR2_ARM_CPU_ARMV7A || BR2_aarch64 || BR2_aarch64_be

comment "dpdk needs a toolchain w/ glibc"
	depends on !BR2_TOOLCHAIN_USES_GLIBC
	depends on ??

comment "dpdk needs the Linux kernel to be built"
	depends on !BR2_LINUX_KERNEL
	depends on ??


Jan

> > +$(eval $(generic-package))  
> 
> Other than that, looks good to me.
> 
> Thomas



-- 
  Jan Viktorin                E-mail: Viktorin at RehiveTech.com
  System Architect            Web:    www.RehiveTech.com
  RehiveTech
  Brno, Czech Republic
