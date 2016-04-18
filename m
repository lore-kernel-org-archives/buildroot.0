From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Apr 2016 00:50:27 +0200
Subject: [Buildroot] [PATCH v5] dpdk: new package
In-Reply-To: <20160418102315.169c22ad@jvn>
References: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
 <1460826490-15614-1-git-send-email-viktorin@rehivetech.com>
 <20160417163814.03b67f53@free-electrons.com>
 <20160417155607.5861459.38806.3255@rehivetech.com>
 <20160417213544.2960f7cf@free-electrons.com>
 <20160417205607.5861459.29884.3259@rehivetech.com>
 <20160417230607.75d32331@free-electrons.com> <20160418102315.169c22ad@jvn>
Message-ID: <571564B3.3030906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/18/16 10:23, Jan Viktorin wrote:
> On Sun, 17 Apr 2016 23:06:07 +0200
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>
>> Hello,
>>
>> On Sun, 17 Apr 2016 22:56:07 +0200, Jan Viktorin wrote:
>>
[snip]
>>> Ok. I don't know what would be the use case for dropping dependency
>>> on the kernel. Building just the rootfs without the kernel?
>>
>> For example, yes. Another benefit of not having the mandatory kernel
>> dependency is that the autobuilders would be able to test the DPDK
>> package.
>
> I have no clue about this. Does kernel dependency prevent some
> auto-testing?

  The base configs used in the autobuilders don't include a kernel (or 
bootloader or rootfs). Therefore, any package depending on the kernel is never 
built.

  We _could_ actually add a couple of base configs that do include a kernel. But 
someone has to do it :-)

>
>>
>>> That means to check whether the kernel is enabled. And if it is then
>>> to enable building of the DPDK kernel modules. Right?
>>
>> Correct.
>
> I would implement this in Buildroot by a list of configuration keys
> naming certain drivers. If the kernel is disabled, I'd disable all of
> them during configure phase. Otherwise, I'd leave them untouched (to
> have the current configuration as is). So, I'd put in dpdk.mk
> something like:
>
> ifeq ($(BR2_LINUX_KERNEL),y)
> DPDK_DEPENDENCIES += linux
> else
> DPDK_KMODS = EAL_IGB_UIO KNI_KMOD LIBRTE_XEN_DOM0
>
> define DPDK_DISABLE_KMODS
> $(foreach m,$(DPDK_KMODS),\

  Small nit: indent with tab here.

> 	$(call KCONFIG_DISABLE_OPT,CONFIG_RTE_$(m),$(@D)/build/.config))
> endef
>
> DPDK_POST_CONFIGURE_HOOKS += DPDK_DISABLE_KMODS

  Is dpdk using Kconfig? In that case, please use the kconfig-package infra. It 
gives you simple primitives for disabling and enabling options. Consult the manual.

> endif
>
> Probably, I can improve it by testing whether a module is present
> in the DPDK config and then setting the dependency on linux.

  That's not possible: DEPENDENCIES must be declared when the makefiles are 
parsed, but the tarball containing .config is only extracted afterwards.


  Regards,
  Arnout

>
> Anyway, it seems to be quite complex...
>
>>
>>> This can be done but I am afraid I have to disable certain modules by
>>> name from the current configuration. This is not very generic
>>> (consider adding a new out-of-tree kernel module or removing an
>>> obsolete one from the DPDK, custom DPDK tree with third party
>>> modules) but there are only few of them so it might be a working
>>> solution. I will check if there is a more generic way but I don't
>>> think so.
>>
>> I'm not sure what you mean here. If the default configuration on a
>> given architecture builds kernel modules, then on this architecture,
>> DPDK should depend on the kernel to be built. If the default
>> configuration on another architecture does not build kernel modules,
>> then there is no need to depend on the kernel.
>>
>> That being said, if only ARM does not build any kernel module, maybe we
>> can simply do as you do right now, and depend on the kernel
>> unconditionally, to keep things simple.
>
> Yes, this would work for the existing defconfigs. What about a custom
> one? E.g. I want some DPDK kernel modules for the Armada with a
> PCI-E NIC. So, I need a custom DPDK configuration at the moment.
> Fortunately, this is a rare case.
>
> There is also a Xen module in DPDK that is not built by default so you
> have to create a custom configuration (or alter an existing one) to
> enable it.
>
> I understand that you'd like to keep it as simple as possible. I'd like
> to keep it simple too but also providing enough flexibility for easy
> customizations. That's why I don't consider the ARMv7 configuration to
> be "without kernel modules" as it is possible to enable some if needed.



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
