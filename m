From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 3 Feb 2015 00:22:01 +0100
Subject: [Buildroot] [PATCH 09/16] package/minidlna: improve systemd
	support
In-Reply-To: <CAKErNvpuMEN3jztGodJWJUzBTtc8uYKi6edwkWOhbW_MeWesQw@mail.gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-10-git-send-email-maxtram95@gmail.com>
 <CAHXCMMK3JOMLvyp74gyG7W2GVDocBX8tG6q0Ny+cK-SeRXPxUA@mail.gmail.com>
 <CAKErNvpuMEN3jztGodJWJUzBTtc8uYKi6edwkWOhbW_MeWesQw@mail.gmail.com>
Message-ID: <CAHXCMMJU_6JV9juAMf3XzDUUEUJbiCYPmyO6d5tUx=L9+xve9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxim,

On Mon, Feb 2, 2015 at 10:30 PM, Maxim Mikityanskiy <maxtram95@gmail.com> wrote:
> Hi Samuel,
>
> 2015-02-02 23:12 GMT+02:00 Samuel Martin <s.martin49@gmail.com>:
>> Hi Maxim,
>>
>> On Mon, Jan 19, 2015 at 5:14 PM, Maxim Mikityanskiy <maxtram95@gmail.com> wrote:
>>> Support running minidlna in system-wide mode using systemd:
>>>
>>> 1. Set --with-db-path and --with-log-path configure options to make
>>> default minidlna directories comply with FHS.
>>>
>>> 2. Install suitable minidlna.conf for system-wide mode.
>>>
>>> 3. Install sysctl.d config file to increase inotify watches count.
>>>
>>> 4. Install tmpfiles.d config file to mkdir and chmod necessary
>>> directories for minidlna running in system-wide mode.
>>>
>>> 5. Install sysusers.d config file to create minidlna user when using
>>> systemd.
>>
>> To make minidlna compliant with non-systemd ssytem, you should add the
>> user using _USERS infra [1].
>
> There were two reasons I preferred sysusers over _USERS. At first, my
> patch only adds systemd unit file and doesn't add initscript for
> SysVinit-based systems.

Indeed, but if we are adding initscript for systemd, why not adding it
for sysV as well? ;)

> So minidlna user will be useless on
> non-systemd systems. At second, I've noticed that _USERS create users
> with UID >= 1000. UIDs < 1000 are reserved for system users, and UIDs
>>= 1000 are for real users.

This more a convention, that something enforced by systemd itself or
any program runs as daemon.

> Systemd-sysusers, however, creates users
> with UID < 1000. I think minidlna user should have UID < 1000. So
> should I really replace sysusers with _USERS for creating minidlna
> user here?

The _USERS infra will pick-up a uid >=1000 only if you let the infra
pic-up a uid, if you set it, you can set anything you want ;-)

>
>>>
>>> 6. Install minidlna.service for systemd.
>>>
>>> Note: User=minidlna should be set in minidlna.service, not in
>>> minidlna.conf, because minidlna is unable to drop privileges correctly
>>> by itself: it does not get any privileges provided by groups of minidlna
>>> user. Systemd drops privileges correctly in that case.
>>>
>>> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
>>> ---

[...]

>>
>> We usually prefer minmal default configuration files, with only
>> necessary stuff (i.e. no comments), letting the user browsing the
>> package manual to set all config he/she needs.
>
> OK, I'll consider it. This config has lots of comments because it's
> based on default one shipped with package.
>
>>> diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
>>> index bcbe5fa..fcc9d06 100644
>>> --- a/package/minidlna/minidlna.mk
>>> +++ b/package/minidlna/minidlna.mk
>>> @@ -24,4 +24,41 @@ MINIDLNA_CONF_OPTS = \
>>>         --disable-static
>>>  endif
>>>
>>> +MINIDLNA_CONF_OPTS += \
>>> +       --with-db-path=/var/cache/minidlna \
>>> +       --with-log-path=/var/log/minidlna
>>> +
>>> +define MINIDLNA_INSTALL_CONF_HOOK
>>> +       $(INSTALL) -D -m 644 package/minidlna/minidlna.conf \
>>> +               $(TARGET_DIR)/etc/minidlna.conf
>>> +endef
>>> +
>>> +define MINIDLNA_INSTALL_SYSUSERS_HOOK
>>> +       $(INSTALL) -D -m 644 package/minidlna/minidlna_sysusers.conf \
>>> +               $(TARGET_DIR)/usr/lib/sysusers.d/minidlna.conf
>>> +endef
>>> +
>>> +define MINIDLNA_INSTALL_TMPFILES_HOOK
>>> +       $(INSTALL) -D -m 644 package/minidlna/minidlna_tmpfiles.conf \
>>> +               $(TARGET_DIR)/usr/lib/tmpfiles.d/minidlna.conf
>>> +endef
>>> +
>>> +define MINIDLNA_INSTALL_SYSCTL_HOOK
>>> +       $(INSTALL) -D -m 644 package/minidlna/minidlna_sysctl.conf \
>>> +               $(TARGET_DIR)/usr/lib/sysctl.d/20-minidlna.conf
>>> +endef
>>> +
>>> +ifeq ($(BR2_INIT_SYSTEMD),y)
>>> +MINIDLNA_POST_INSTALL_TARGET_HOOKS += \
>>> +       MINIDLNA_INSTALL_CONF_HOOK \
>>
>> This hook could be run even if init is not systemd, no?
>
> It could be run, but it will be useless because there is no initscript
> for non-systemd systems anyway. Maybe I should resend this patch with
> initscript added.

I think so; so when sysV initscript will be added, the conf will be in
place already.

>
>>> +       MINIDLNA_INSTALL_SYSUSERS_HOOK \
>>> +       MINIDLNA_INSTALL_TMPFILES_HOOK \
>>> +       MINIDLNA_INSTALL_SYSCTL_HOOK
>>
>> Maybe you could put all systemd stuff in 1 and single hook.
>>
>>> +endif
>>> +
>>> +define MINIDLNA_INSTALL_INIT_SYSTEMD
>>> +       $(INSTALL) -D -m 644 package/minidlna/minidlna.service \
>>> +               $(TARGET_DIR)/lib/systemd/system/minidlna.service
>>> +endef
>>> +
>>>  $(eval $(autotools-package))
[...]

Regards,

-- 
Samuel
