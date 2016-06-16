From: Martin Bark <martin@barkynet.com>
Date: Thu, 16 Jun 2016 21:59:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: correct systemd
 service install
In-Reply-To: <20160616201425.GH3665@free.fr>
References: <1466097338-19149-1-git-send-email-martin@barkynet.com>
 <20160616201425.GH3665@free.fr>
Message-ID: <CAFGQKxd30Vb0tu2zdVQDjeJOFzCkVTMrfgCp+rn9A86KOXmBDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On 16 June 2016 at 21:14, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Martin, All,
>
> On 2016-06-16 18:15 +0100, Martin Bark spake thusly:
>> Commit d732fa4 add the BLUEZ5_UTILS_INSTALL_INIT_SYSTEMD rule, however,
>> it is not correct.  The [Install] section of bluetooth.service is as
>> follows:
>>
>>  [Install]
>>  WantedBy=bluetooth.target
>>  Alias=dbus-org.bluez.service
>>
>> hence there are currently two mistakes:
>>  1) bluetooth.service is wanted by bluetooth.target not multi-user.target
>>  2) dbus-org.bluez.service is a missing alias to bluetooth.service
>>
>> This commit fixes both these issues.
>>
>> Signed-off-by: Martin Bark <martin@barkynet.com>
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> However, the way we handle the systemd units is not tenable in the long
> run. If the next version of bluez changes this unit, we'd have to keep
> in sync. And so on for *all* packages.
>
> I'd pretty much prefer we get something that automatically installs the
> units in their correct location.
>
> So, maybe we'd need a kind of cross systemctl helper, to provide us with
> the means to install/remove units in $(O)/target/ instead of duplicating
> the effort in all our packages...
>
> I think a simple parser that interprets WantedBy, Alias and the likes
> would be relatively easy to write...
>
> Brought to you by the same "Famous Last Words (TM)" company that brought
> you the cross ldconfig earlier!  ;-] )

Yes i agree, i was thinking the exact same thing.  The
XXX_INSTALL_INIT_SYSTEMD should be automatic since it's just mimicking
systemctl enable <service>.

Thanks

Martin

>
> Regards,
> Yann E. MORIN.
>
>> ---
>>  package/bluez5_utils/bluez5_utils.mk | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
>> index ddc8c45..49cc7c2 100644
>> --- a/package/bluez5_utils/bluez5_utils.mk
>> +++ b/package/bluez5_utils/bluez5_utils.mk
>> @@ -77,9 +77,11 @@ BLUEZ5_UTILS_CONF_OPTS += --disable-systemd
>>  endif
>>
>>  define BLUEZ5_UTILS_INSTALL_INIT_SYSTEMD
>> -     mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
>> +     mkdir -p $(TARGET_DIR)/etc/systemd/system/bluetooth.target.wants
>>       ln -fs ../../../../usr/lib/systemd/system/bluetooth.service \
>> -             $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/bluetooth.service
>> +             $(TARGET_DIR)/etc/systemd/system/bluetooth.target.wants/bluetooth.service
>> +     ln -fs ../../../../usr/lib/systemd/system/bluetooth.service \
>> +             $(TARGET_DIR)/etc/systemd/system/dbus-org.bluez.service
>>  endef
>>
>>  $(eval $(autotools-package))
>> --
>> 2.7.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
