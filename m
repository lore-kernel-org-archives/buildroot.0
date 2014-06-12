From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 12 Jun 2014 09:20:41 +0200
Subject: [Buildroot] [PATCH] system: move system.mk recipes inside the
 "target-finalize" rule
In-Reply-To: <539884A4.5060705@mind.be>
References: <1402390367-25418-1-git-send-email-fabio.porcedda@gmail.com>
 <20140610223358.69a70e6e@free-electrons.com>
 <CAHkwnC8N3v9ULfbqUeyjtCnb3Cpd6y=PPnwgjXBwSme6hywM5w@mail.gmail.com>
 <539884A4.5060705@mind.be>
Message-ID: <CAHkwnC-dnWUJf=QR-6DEBwmkEoOoUuwDAWRj0EcQt5Cx8fOX0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 11, 2014 at 6:32 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 06/11/14 11:14, Fabio Porcedda wrote:
>> Hi Thomas,
>> thanks for reviewing the patch.
>>
>> On Tue, Jun 10, 2014 at 10:33 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>> Dear Fabio Porcedda,
>>>
>>> On Tue, 10 Jun 2014 10:52:47 +0200, Fabio Porcedda wrote:
>>>
>>>>  target-finalize: $(TARGETS)
>>>>       @$(call MESSAGE,"Finalizing target directory")
>>>> +     $(TARGET_FINALIZE_GENERIC_SECURETTY)
>>>> +     $(TARGET_FINALIZE_GENERIC_HOSTNAME)
>>>> +     $(TARGET_FINALIZE_GENERIC_ISSUE)
>>>> +     $(TARGET_FINALIZE_ROOT_PASSWD)
>>>> +     $(TARGET_FINALIZE_GENERIC_GETTY)
>>>> +     $(TARGET_FINALIZE_GENERIC_REMOUNT_RW)
>>>
>>> I agree with the principle, but I'd like to have a better
>>> implementation, which is really long overdue to stop cluttering
>>> target-finalize with more and more crap. Could we implement
>>> target-finalize as just:
>>>
>>> target-finalize: $(TARGETS)
>>>         $(foreach hook,$(TARGET_FINALIZE_HOOKS),$(call $(hook),end,$(1),$($(PKG)_NAME))$(sep))
>
>  I like this idea. Though it should actually be
>
> $(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
>
> (the call is redundant, the end is redundant, and $(1) and $(PKG) are not
> available).
>
>>>
>>> And then:
>>>
>>>> +ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
>>>> +define TARGET_FINALIZE_GENERIC_SECURETTY
>>>>       grep -q '^$(TARGET_GENERIC_GETTY_PORT)$$' $(TARGET_DIR)/etc/securetty || \
>>>>               echo '$(TARGET_GENERIC_GETTY_PORT)' >> $(TARGET_DIR)/etc/securetty
>>>> +endef
>>>
>>> TARGET_FINALIZE_HOOKS += TARGET_FINALIZE_GENERIC_SECURETTY
>>>
>>> Then we can also use this to move the Python, Perl and other
>>> package-specific target-finalize logic down to the specific packages.
>>> Of course, I'm not asking you to do all of this work. But at least,
>>> post a patch introducing the TARGET_FINALIZE_HOOKS, and use it for
>>> those targets you were converting in your original patch.
>>>
>>> We should go towards *removing* stuff from the main Makefile, not
>>> adding more :-)
>>
>> Using hooks was my initial proposition but Arnout suggested the above
>> solution and you and Perer liked it.
>> Have you changed your mind about using hooks?
>
>  Actually, your initial proposition was:
>
> -target-purgelocales:
> +target-purgelocales: $(filter-out target-purgelocales,$(TARGETS))
>
>  And my comment was that I don't like this splitting of target-finalize over
> several make targets. It is that remark that lead to the thread below.
>
>  With the hooks, you'll still have a single target-finalize rule that performs
> all the finalization and that simply depends on $(TARGETS).

You are right that my initial proposal was to use the "filter-out"
function, to be precise using hooks was my third proposal, and you
disliked it, see the previous thread for reference:
http://lists.busybox.net/pipermail/buildroot/2014-April/095213.html

On Mon, Apr 28, 2014 at 12:30 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 28/04/14 09:58, Fabio Porcedda wrote:
>> On Mon, Apr 28, 2014 at 7:49 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>> On 25/04/14 23:50, Fabio Porcedda wrote:
>>>> On Thu, Apr 24, 2014 at 6:41 PM, Thomas Petazzoni
>>>> <thomas.petazzoni@free-electrons.com> wrote:
>>>>> Dear Fabio Porcedda,
>>>>>
>>>>> On Thu, 24 Apr 2014 18:24:39 +0200, Fabio Porcedda wrote:
>>>>>
>>>>>> -target-purgelocales:
>>>>>> +target-purgelocales: $(filter-out target-purgelocales,$(TARGETS))
>>>>>>       rm -f $(LOCALE_WHITELIST)
>>>>>>       for i in $(LOCALE_NOPURGE); do echo $$i >> $(LOCALE_WHITELIST); done
>>>>>
>>>>> Don't we have several other targets that need to be executed only after
>>>>> all packages have been built and installed? Wouldn't it make sense to
>>>>> have a common solution for these? Like maybe a dedicated target?
>>>>
>>>> Can you please give some examples? I know only tatget-purgelocales and
>>>> target-finalize.
>>>>
>>>> About the common solution, i see two possible solutions of the problem:
>>>>
>>>> 1) all those targets must be listed in a variable like
>>>> TARGETS_PRE_ROOTFS, but those targets must be able to be executed in
>>>> parallel without a specific order.
>>>>
>>>> 2) all those targets must be converted in hooks and added to a
>>>> variable like PRE_ROOTFS_HOOKS, so those steps are going to be
>>>> executed in serial observing a specific order.
>>>>
>>>> What is the more appropriate solution? The easiest and fastest one is
>>>> the first, but i'm not sure if those targets can be executed in
>>>> parallel.
>>>
>>>  My personal preference is to have a single rule (e.g. target-finalize)
>>> that performs everything that is post-targets and pre-rootfs. There isn't
>>> much that needs to be done so parallelisation doesn't make sense. And I
>>> think it's much easier to understand which steps are executed and in
>>> which order if they are all put together in a single rule rather than
>>> spread out over several.
>>>
>>>  To make things more readable, we can put the commands into separate
>>> variables. For instance:
>>>
>>> define TARGET_PURGE_LOCALES
>>>         rm -f $(LOCALE_WHITELIST)
>>>         ...
>>> endef
>>>
>>> define TARGET_PURGE_DEVFILES
>>>         rm -rf $(TARGET_DIR)/usr/include ...
>>> ...
>>> endef
>>>
>>> ifneq ($(BR2_PACKAGE_GDB),y)
>>> define TARGET_PURGE_GDB
>>>         rm -rf $(TARGET_DIR)/usr/share/gdb
>>> endef
>>> endif
>>>
>>> target-finalize: $(TARGETS)
>>>         $(TARGET_PURGE_LOCALES)
>>>         $(TARGET_PURGE_DEVFILES)
>>>         $(TARGET_PURGE_GDB)
>>>         $(TARGET_PURGE_DOC)
>>> ...
>>>
>>>
>>>  I'm giving the content of target-finalize as an example here, but it's
>>> not immediately needed to convert those into variables. The different
>>> target-* steps that are currently added to TARGETS are rather more important.
>>
>> It's fine for me.
>> So you prefer to list those variables inside the target instead of
>> adding them to a hook variable? like e.g. PRE_ROOTFS_HOOK?
>
>  Indeed. The HOOKS way of working is not very clear. The code for calling
> the hooks is not easy to understand at first sight, because it contains
> this $(foreach ...) and $(sep) stuff. Also, the assignments to the HOOKS
> variable are spread out over the Makefiles so it's hard to see which
> things will get executed and in which order. And finally, it's not needed
> here because we can enumerate all the possible steps - that's different
> from the package infrastructure, where the HOOK contents differs from
> package to package.
>
>
>  Regards,
>  Arnout

I still prefer to use hooks so because now we all agree to use hooks
it's perfect :)

My first patch will be like this:

diff --git a/Makefile b/Makefile
index dc86060..f8e446d 100644
--- a/Makefile
+++ b/Makefile
@@ -525,13 +525,14 @@ define TARGET_PURGE_LOCALES
                done; \
        done
 endef
+TARGET_FINALIZE_HOOKS += TARGET_PURGE_LOCALES
 endif

 $(TARGETS_ROOTFS): target-finalize

 target-finalize: $(TARGETS)
        @$(call MESSAGE,"Finalizing target directory")
-       $(TARGET_PURGE_LOCALES)
+       $(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
        rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
                $(TARGET_DIR)/usr/lib/pkgconfig
$(TARGET_DIR)/usr/share/pkgconfig \
                $(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake


I will send an updated patch set that will use hooks.

Best regards
--
Fabio Porcedda
