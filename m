From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Apr 2014 12:30:00 +0200
Subject: [Buildroot] [PATCH] Makefile: target-purgelocales: add
	dependencies
In-Reply-To: <CAHkwnC8o4CsbpT9C_G20dRn1vRvb6wcz7gHKT5h6W7ehPZ4YRg@mail.gmail.com>
References: <1398356679-1438-1-git-send-email-fabio.porcedda@gmail.com>
 <20140424184136.572de3d0@skate>
 <CAHkwnC8p7E8inhY7w+WiFcsZ-_mO26rdTFB8xKvgDrG2bSj0Uw@mail.gmail.com>
 <535DEBEC.80605@mind.be>
 <CAHkwnC8o4CsbpT9C_G20dRn1vRvb6wcz7gHKT5h6W7ehPZ4YRg@mail.gmail.com>
Message-ID: <535E2DA8.7090306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/04/14 09:58, Fabio Porcedda wrote:
> On Mon, Apr 28, 2014 at 7:49 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 25/04/14 23:50, Fabio Porcedda wrote:
>>> On Thu, Apr 24, 2014 at 6:41 PM, Thomas Petazzoni
>>> <thomas.petazzoni@free-electrons.com> wrote:
>>>> Dear Fabio Porcedda,
>>>>
>>>> On Thu, 24 Apr 2014 18:24:39 +0200, Fabio Porcedda wrote:
>>>>
>>>>> -target-purgelocales:
>>>>> +target-purgelocales: $(filter-out target-purgelocales,$(TARGETS))
>>>>>       rm -f $(LOCALE_WHITELIST)
>>>>>       for i in $(LOCALE_NOPURGE); do echo $$i >> $(LOCALE_WHITELIST); done
>>>>
>>>> Don't we have several other targets that need to be executed only after
>>>> all packages have been built and installed? Wouldn't it make sense to
>>>> have a common solution for these? Like maybe a dedicated target?
>>>
>>> Can you please give some examples? I know only tatget-purgelocales and
>>> target-finalize.
>>>
>>> About the common solution, i see two possible solutions of the problem:
>>>
>>> 1) all those targets must be listed in a variable like
>>> TARGETS_PRE_ROOTFS, but those targets must be able to be executed in
>>> parallel without a specific order.
>>>
>>> 2) all those targets must be converted in hooks and added to a
>>> variable like PRE_ROOTFS_HOOKS, so those steps are going to be
>>> executed in serial observing a specific order.
>>>
>>> What is the more appropriate solution? The easiest and fastest one is
>>> the first, but i'm not sure if those targets can be executed in
>>> parallel.
>>
>>  My personal preference is to have a single rule (e.g. target-finalize)
>> that performs everything that is post-targets and pre-rootfs. There isn't
>> much that needs to be done so parallelisation doesn't make sense. And I
>> think it's much easier to understand which steps are executed and in
>> which order if they are all put together in a single rule rather than
>> spread out over several.
>>
>>  To make things more readable, we can put the commands into separate
>> variables. For instance:
>>
>> define TARGET_PURGE_LOCALES
>>         rm -f $(LOCALE_WHITELIST)
>>         ...
>> endef
>>
>> define TARGET_PURGE_DEVFILES
>>         rm -rf $(TARGET_DIR)/usr/include ...
>> ...
>> endef
>>
>> ifneq ($(BR2_PACKAGE_GDB),y)
>> define TARGET_PURGE_GDB
>>         rm -rf $(TARGET_DIR)/usr/share/gdb
>> endef
>> endif
>>
>> target-finalize: $(TARGETS)
>>         $(TARGET_PURGE_LOCALES)
>>         $(TARGET_PURGE_DEVFILES)
>>         $(TARGET_PURGE_GDB)
>>         $(TARGET_PURGE_DOC)
>> ...
>>
>>
>>  I'm giving the content of target-finalize as an example here, but it's
>> not immediately needed to convert those into variables. The different
>> target-* steps that are currently added to TARGETS are rather more important.
> 
> It's fine for me.
> So you prefer to list those variables inside the target instead of
> adding them to a hook variable? like e.g. PRE_ROOTFS_HOOK?

 Indeed. The HOOKS way of working is not very clear. The code for calling
the hooks is not easy to understand at first sight, because it contains
this $(foreach ...) and $(sep) stuff. Also, the assignments to the HOOKS
variable are spread out over the Makefiles so it's hard to see which
things will get executed and in which order. And finally, it's not needed
here because we can enumerate all the possible steps - that's different
from the package infrastructure, where the HOOK contents differs from
package to package.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
