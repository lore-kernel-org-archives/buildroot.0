From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 22 Jul 2014 20:24:22 +0200
Subject: [Buildroot] [PATCH 3 of 3 v3] uclibc: update-config: preserve
	freshly configured settings
In-Reply-To: <CAAXf6LWEzDfrHsvJpgsFhpgJOydhtDmjFWb6nWXXTJiM_OixoQ@mail.gmail.com>
References: <patchbomb.1405709693@localhost>
 <f8c110cf3b83a4e29146.1405709696@localhost>
 <20140721221755.4e0346f5@free-electrons.com>
 <CAAXf6LWEzDfrHsvJpgsFhpgJOydhtDmjFWb6nWXXTJiM_OixoQ@mail.gmail.com>
Message-ID: <fcbb91be-d7c3-406f-bbe9-251d7fab1280@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire <patrickdepinguin@gmail.com> schreef:
>Hi Thomas,
>
>On Mon, Jul 21, 2014 at 10:17 PM, Thomas Petazzoni
><thomas.petazzoni@free-electrons.com> wrote:
>> Dear Thomas De Schampheleire,
>>
>> On Fri, 18 Jul 2014 20:54:56 +0200, Thomas De Schampheleire wrote:
>>
>>> diff -r 29ba03b43b12 -r f8c110cf3b83 package/uclibc/uclibc.mk
>>> --- a/package/uclibc/uclibc.mk        Sun Jun 22 10:37:22 2014 +0200
>>> +++ b/package/uclibc/uclibc.mk        Mon Jun 16 20:18:23 2014 +0200
>>> @@ -432,7 +432,6 @@
>>>  endef
>>>
>>>  define UCLIBC_CONFIGURE_CMDS
>>> -     $(UCLIBC_FIXUP_DOT_CONFIG)
>>>       $(MAKE1) -C $(UCLIBC_DIR) \
>>>               $(UCLIBC_MAKE_FLAGS) \
>>>               PREFIX=$(STAGING_DIR) \
>>> @@ -537,7 +536,11 @@
>>>  $(UCLIBC_DIR)/.config: $(UCLIBC_CONFIG_FILE) | uclibc-patch
>>>       $(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
>>>
>>> -$(UCLIBC_TARGET_CONFIGURE): $(UCLIBC_DIR)/.config
>>> +$(UCLIBC_DIR)/.stamp_config_fixup_done: $(UCLIBC_DIR)/.config
>>> +     $(UCLIBC_FIXUP_DOT_CONFIG)
>>> +     $(Q)touch $@
>>> +
>>> +$(UCLIBC_TARGET_CONFIGURE): $(UCLIBC_DIR)/.stamp_config_fixup_done
>>>
>>>  uclibc-menuconfig: $(UCLIBC_DIR)/.config
>>>       $(MAKE1) -C $(UCLIBC_DIR) \
>>> @@ -546,9 +549,10 @@
>>>               DEVEL_PREFIX=/usr/ \
>>>               RUNTIME_PREFIX=$(STAGING_DIR)/ \
>>>               menuconfig
>>> -     rm -f $(UCLIBC_DIR)/.stamp_{configured,built,target_installed,staging_installed}
>>> +     rm -f $(UCLIBC_DIR)/.stamp_{config_fixup_done,configured,built}
>>> +     rm -f $(UCLIBC_DIR)/.stamp_{target,staging}_installed
>>>
>>> -uclibc-update-config: $(UCLIBC_DIR)/.stamp_configured
>>> +uclibc-update-config: $(UCLIBC_DIR)/.stamp_config_fixup_done
>>>       cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
>>
>> Is a separate stamp file actually needed here? This patch changes all
>> references to $(UCLIBC_DIR)/.config as dependencies to references to
>> $(UCLIBC_DIR)/.stamp_config_fixup_done as a dependency, and
>> $(UCLIBC_DIR)/.stamp_config_fixup_done is the only target left having a
>> dependency on $(UCLIBC_DIR)/.config. So what prevents from doing:
>>
>> $(UCLIBC_DIR)/.config: $(UCLIBC_CONFIG_FILE) | uclibc-patch
>>         $(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
>>         $(UCLIBC_FIXUP_DOT_CONFIG)
>>
>>  ?
>>
>> I'm probably missing one use case, but I find
>> this .stamp_config_fixup_done stamp file not so nice, so I'd like to
>> really understand why it's needed.
>
>Suppose you go with your suggestion above, then if the user uses
>menuconfig to change the configuration, the .config file is updated by
>the menuconfig rule, but the fixup itself does no longer happen. This
>means that the user could enter a corrupted configuration without it
>being fixed. Same holds when the user manually changes .config.
>I think the fixup should run after menuconfig, to ensure a valid configuration.
>
>Note that you can avoid the extra stamp file by repeating the fixup
>call in several places, but this is not easily extractable in a
>kconfig-package infrastructure.
>The rules as they are can almost be moved verbatim to a pkg-kconfig.mk
>with almost no changes in the uclibc.mk file itself.
>
>Is this convincing to you? Do you see a better way?

Note also that the existence of the extra stamp file will be hidden entirely by the kconfig-package infra that I'm working on...
