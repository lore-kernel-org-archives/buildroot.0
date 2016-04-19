From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Apr 2016 21:30:10 +0200
Subject: [Buildroot] [PATCH v5] dpdk: new package
In-Reply-To: <20160419142744.5b2651db@pcviktorin.fit.vutbr.cz>
References: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
 <1460826490-15614-1-git-send-email-viktorin@rehivetech.com>
 <20160417163814.03b67f53@free-electrons.com>
 <20160417155607.5861459.38806.3255@rehivetech.com>
 <20160417213544.2960f7cf@free-electrons.com>
 <20160417205607.5861459.29884.3259@rehivetech.com>
 <20160417230607.75d32331@free-electrons.com> <20160418102315.169c22ad@jvn>
 <571564B3.3030906@mind.be> <20160419142744.5b2651db@pcviktorin.fit.vutbr.cz>
Message-ID: <57168742.7090806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/19/16 14:27, Jan Viktorin wrote:
> Hello Arnout,
>
> thanks for your comments...
>
> On Tue, 19 Apr 2016 00:50:27 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
>
>> On 04/18/16 10:23, Jan Viktorin wrote:
>>> On Sun, 17 Apr 2016 23:06:07 +0200
>>> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>>>
>>>> Hello,
>>>>
>>>> On Sun, 17 Apr 2016 22:56:07 +0200, Jan Viktorin wrote:
>>>>
>> [snip]
>>>>> Ok. I don't know what would be the use case for dropping dependency
>>>>> on the kernel. Building just the rootfs without the kernel?
>>>>
>>>> For example, yes. Another benefit of not having the mandatory kernel
>>>> dependency is that the autobuilders would be able to test the DPDK
>>>> package.
>>>
>>> I have no clue about this. Does kernel dependency prevent some
>>> auto-testing?
>>
>>    The base configs used in the autobuilders don't include a kernel (or
>> bootloader or rootfs). Therefore, any package depending on the kernel is never
>> built.
>>
>>    We _could_ actually add a couple of base configs that do include a kernel. But
>> someone has to do it :-)
>
> I have no idea how to access the autobuilder nor what kind of complexity
> is connected with this...

  git://git.buildroot.net/buildroot-test/


>>> I would implement this in Buildroot by a list of configuration keys
>>> naming certain drivers. If the kernel is disabled, I'd disable all of
>>> them during configure phase. Otherwise, I'd leave them untouched (to
>>> have the current configuration as is). So, I'd put in dpdk.mk
>>> something like:
>>>
>>> ifeq ($(BR2_LINUX_KERNEL),y)
>>> DPDK_DEPENDENCIES += linux
>>> else
>>> DPDK_KMODS = EAL_IGB_UIO KNI_KMOD LIBRTE_XEN_DOM0
>>>
>>> define DPDK_DISABLE_KMODS
>>> $(foreach m,$(DPDK_KMODS),\
>>
>>    Small nit: indent with tab here.
>
> OK, it was just an ad hoc example. I'd rather know whether I can implement it this way.

  Yes it can.

  If you don't disable these options, what will the dpdk build system do? Error 
out? Or try to use the build system's kernel? Ideally there would be a way to 
globally tell it not to build modules. Manually maintaining a list of config 
options to disable is a bit cumbersome.


>
>>
>>> 	$(call KCONFIG_DISABLE_OPT,CONFIG_RTE_$(m),$(@D)/build/.config))
>>> endef
>>>
>>> DPDK_POST_CONFIGURE_HOOKS += DPDK_DISABLE_KMODS
>>
>>    Is dpdk using Kconfig? In that case, please use the kconfig-package infra. It
>> gives you simple primitives for disabling and enabling options. Consult the manual.
>
> Unfortunately, there is no kconfig. It just looks this way. The buildsystem is custom.

  So you have to manually create a config file with lines like
# CONFIG_FOO is not set
? How uncomfortable...

>
>>
>>> endif
>>>
>>> Probably, I can improve it by testing whether a module is present
>>> in the DPDK config and then setting the dependency on linux.
>>
>>    That's not possible: DEPENDENCIES must be declared when the makefiles are
>> parsed, but the tarball containing .config is only extracted afterwards.
>
> OK, it was just an idea.

  We can also still revert to depending on linux unconditionally like you have 
now. How likely is it that dpdk will be used in practice with no kernel modules? 
Or is this going to be more likely in the future, with heavier use of UIO and 
device tree?


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
