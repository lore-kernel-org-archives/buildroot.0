From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 11 Jun 2014 11:14:38 +0200
Subject: [Buildroot] [PATCH] system: move system.mk recipes inside the
 "target-finalize" rule
In-Reply-To: <20140610223358.69a70e6e@free-electrons.com>
References: <1402390367-25418-1-git-send-email-fabio.porcedda@gmail.com>
 <20140610223358.69a70e6e@free-electrons.com>
Message-ID: <CAHkwnC8N3v9ULfbqUeyjtCnb3Cpd6y=PPnwgjXBwSme6hywM5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
thanks for reviewing the patch.

On Tue, Jun 10, 2014 at 10:33 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Tue, 10 Jun 2014 10:52:47 +0200, Fabio Porcedda wrote:
>
>>  target-finalize: $(TARGETS)
>>       @$(call MESSAGE,"Finalizing target directory")
>> +     $(TARGET_FINALIZE_GENERIC_SECURETTY)
>> +     $(TARGET_FINALIZE_GENERIC_HOSTNAME)
>> +     $(TARGET_FINALIZE_GENERIC_ISSUE)
>> +     $(TARGET_FINALIZE_ROOT_PASSWD)
>> +     $(TARGET_FINALIZE_GENERIC_GETTY)
>> +     $(TARGET_FINALIZE_GENERIC_REMOUNT_RW)
>
> I agree with the principle, but I'd like to have a better
> implementation, which is really long overdue to stop cluttering
> target-finalize with more and more crap. Could we implement
> target-finalize as just:
>
> target-finalize: $(TARGETS)
>         $(foreach hook,$(TARGET_FINALIZE_HOOKS),$(call $(hook),end,$(1),$($(PKG)_NAME))$(sep))
>
> And then:
>
>> +ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
>> +define TARGET_FINALIZE_GENERIC_SECURETTY
>>       grep -q '^$(TARGET_GENERIC_GETTY_PORT)$$' $(TARGET_DIR)/etc/securetty || \
>>               echo '$(TARGET_GENERIC_GETTY_PORT)' >> $(TARGET_DIR)/etc/securetty
>> +endef
>
> TARGET_FINALIZE_HOOKS += TARGET_FINALIZE_GENERIC_SECURETTY
>
> Then we can also use this to move the Python, Perl and other
> package-specific target-finalize logic down to the specific packages.
> Of course, I'm not asking you to do all of this work. But at least,
> post a patch introducing the TARGET_FINALIZE_HOOKS, and use it for
> those targets you were converting in your original patch.
>
> We should go towards *removing* stuff from the main Makefile, not
> adding more :-)

Using hooks was my initial proposition but Arnout suggested the above
solution and you and Perer liked it.
Have you changed your mind about using hooks?

This is a copy of the previous thread:
On Mon, Apr 28, 2014 at 6:10 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Peter, Arnout,
>
> On Mon, 28 Apr 2014 11:36:15 +0200, Peter Korsgaard wrote:
>
>>  >  My personal preference is to have a single rule (e.g. target-finalize)
>>  > that performs everything that is post-targets and pre-rootfs. There isn't
>>  > much that needs to be done so parallelisation doesn't make sense. And I
>>  > think it's much easier to understand which steps are executed and in
>>  > which order if they are all put together in a single rule rather than
>>  > spread out over several.
>>
>>  >  To make things more readable, we can put the commands into separate
>>  > variables. For instance:
>>
>>  > define TARGET_PURGE_LOCALES
>>  >    rm -f $(LOCALE_WHITELIST)
>>  >    ...
>>  > endef
>>
>>  > define TARGET_PURGE_DEVFILES
>>  >    rm -rf $(TARGET_DIR)/usr/include ...
>>  > ...
>>  > endef
>>
>>  > ifneq ($(BR2_PACKAGE_GDB),y)
>>  > define TARGET_PURGE_GDB
>>  >         rm -rf $(TARGET_DIR)/usr/share/gdb
>>  > endef
>>  > endif
>>
>>  > target-finalize: $(TARGETS)
>>  >    $(TARGET_PURGE_LOCALES)
>>  >    $(TARGET_PURGE_DEVFILES)
>>  >    $(TARGET_PURGE_GDB)
>>  >    $(TARGET_PURGE_DOC)
>>  > ...
>>
>> Yes, that looks nice and clear to me too.
>
> Yes, agreed, this looks a lot nicer than a long chain of targets that
> simply depend on each other to avoid any parallelization.

Best regards
-- 
Fabio Porcedda
