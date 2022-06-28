Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66082C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 09:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1B9460D76;
	Tue, 28 Jun 2022 09:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1B9460D76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0EMXpuwrd5IH; Tue, 28 Jun 2022 09:03:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42ED260C0F;
	Tue, 28 Jun 2022 09:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42ED260C0F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 257291BF84C
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 09:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F37DA404A8
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 09:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F37DA404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3pvU_jPj78bi for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 09:03:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B8114049A
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B8114049A
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 09:03:30 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id EFD07BDE1B21;
 Tue, 28 Jun 2022 11:03:27 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 28 Jun 2022 09:03:27 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
In-Reply-To: <CA+_SqVbnBaZL6=DorHZTt-zjtGFHVXPz4kQjovQoJhFRjfW27A@mail.gmail.com>
References: <mailman.2285.1655818273.17960.buildroot@buildroot.org>
 <f68f04d611f75d87d9fae2a0a04a3896@umbiko.net>
 <CA+_SqVbnBaZL6=DorHZTt-zjtGFHVXPz4kQjovQoJhFRjfW27A@mail.gmail.com>
Message-ID: <0461dd83240f84078d7e3341289d3fa5@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.6 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH 4/4] package/busybox: add service to load
 kernel modules at boot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Angelo,

On 2022-06-28 07:56, Angelo Compagnucci wrote:
> On Sat, Jun 25, 2022 at 7:02 AM Andreas Ziegler <br015@umbiko.net>
> wrote:
> 
>> Hi Angelo,
>> 
>> On 2022-06-21 13:31, Angelo Compagnucci
>> <angelo@amarulasolutions.com>
>> wrote:
>> 
>>>> 
>>>> 
>>>> On 20/06/2022 23:40, Angelo Compagnucci wrote:
>>>>> In cases where no hotplug is available (by choice or by the
>> lack of a
>>>>> proper hotplug method for a device), this service can be used
>> to load
>>>>> kernel module drivers by reading the /etc/modules file.
>>>> 
>>>> Do you have a concrete example of something that needs this?
>> It's
>>>> kind
>>>> of a
>>>> hack for e.g. a device connected to a serial port that isn't
>> described
>>>> in
>>>> DT
>>>> (e.g. on an x86 platform), right?
>>>> 
>>> 
>>> Wifi card connected on SDIO with an out of tree kernel module.
>>> 
>>> 
>>>> I'm not altogether sure if it is worth making an init script
>> for
>>>> that.
>>>> 
>>> 
>>> Most distros out there have the /etc/modules loaded at boot time.
>>> 
>>> 
>>>> Also, this would belong to the initscripts package because it
>> would
>>>> also
>>>> be
>>>> needed if busybox isn't used at all (it would of course require
>> kmod).
>>>> 
>>> 
>>> Right, I'll fix it
>>> 
>>> 
>>>> 
>>>> 
>>>>> 
>>>>> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>>>>> ---
>>>>>   package/busybox/S02modules | 56
>> ++++++++++++++++++++++++++++++++++++++
>>>>>   package/busybox/busybox.mk [1] |  2 ++
>>>>>   2 files changed, 58 insertions(+)
>>>>>   create mode 100644 package/busybox/S02modules
>>>>> 
>>>>> diff --git a/package/busybox/S02modules
>> b/package/busybox/S02modules
>> 
>> S02 is a bit early, [mu]dev use S10.
> 
> Can you point me to these  [mu]dev scripts?
> 
>>>>> new file mode 100644
>>>>> index 0000000000..f25712e1ca
>>>>> --- /dev/null
>>>>> +++ b/package/busybox/S02modules
>>>>> @@ -0,0 +1,56 @@
>>>>> +#!/bin/sh
>>>>> +
>>>>> +MODULES="modules"
>>>>> +
>>>>> +load_unload() {
>>>>> +     [ ! -f /etc/${MODULES} ] && echo ' OK' && exit 0
>>>>> +
>>>>> +     while read module args; do
>>>>> +
>>>>> +             case "$module" in
>>>>> +                     ""|"#"*) continue ;;
>>>>> +             esac
>>>>> +
>>>>> +             if [ "$1" = "load" ]; then
>>>>> +                     modprobe -q ${module} ${args} >/dev/null
>> && \
>>>>> +                             printf ' %s success,' "$module"
>> ||
>>>>> +                             printf ' %s failed,' "$module"
>>>>> +             else
>>>>> +                     rmmod ${module} >/dev/null
>>>>> +             fi
>>>>> +
>>>>> +     done < /etc/${MODULES}
>>>>> +}
>>>>> +
>>>>> +start() {
>>>>> +     printf 'Starting %s:' "$MODULES"
>>>>> +
>>>>> +     load_unload load
>>>>> +
>>>>> +     echo ' OK'
>>>>> +}
>>>>> +
>>>>> +stop() {
>>>>> +     printf 'Stopping %s: ' "$MODULES"
>>>>> +
>>>>> +     load_unload unload
>>>>> +
>>>>> +     echo 'OK'
>>>>> +}
>>>>> +
>>>>> +restart() {
>>>>> +     stop
>>>>> +     sleep 1
>>>>> +     start
>>>>> +}
>>>>> +
>>>>> +case "$1" in
>>>>> +     start|stop|restart)
>>>>> +             "$1";;
>>>>> +     reload)
>>>>> +             # Restart, since there is no true "reload"
>> feature.
>>>>> +             restart;;
>>>>> +     *)
>>>>> +             echo "Usage: $0 {start|stop|restart|reload}"
>>>>> +             exit 1
>>>>> +esac
>>>>> diff --git a/package/busybox/busybox.mk [1]
>> b/package/busybox/busybox.mk [1]
>>>>> index 3e49de0a84..40490e866a 100644
>>>>> --- a/package/busybox/busybox.mk [1]
>>>>> +++ b/package/busybox/busybox.mk [1]
>>>>> @@ -382,6 +382,8 @@ define BUSYBOX_INSTALL_TARGET_CMDS
>>>>>       $(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
>>>>>       $(BUSYBOX_INSTALL_ZCIP_SCRIPT)
>>>>>       $(BUSYBOX_INSTALL_MDEV_CONF)
>>>>> +     $(INSTALL) -m 0755 -D package/busybox/S02modules \
>>>>> +                     $(TARGET_DIR)/etc/init.d/S02modules;
>> 
>> Since this is intended for systems without dynamic device handling,
>> you
>> might use an optional script, similar to BUSYBOX_INSTALL_*_SCRIPT:
>> 
>> # Copy S22modules to /etc/init.d if no dynamic device handling is
>> used
>> ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
>> define BUSYBOX_INSTALL_MODULES_SCRIPT
>> $(INSTALL) -m 0755 -D package/busybox/S22modules \
>> $(TARGET_DIR)/etc/init.d/S22modules;
>> endef # BUSYBOX_INSTALL_MODULES_SCRIPT
>> 
>> Probably a default /etc/modules could also be installed.
> 
> Yes, but it is not the only usecase here. A usecase could be a
> userspace software that needs a special kernel module to be loaded on
> boot or a hardware which cannot be hotplugged.

Then a Config.in item to select this feature would be appreciated, since 
most configurations will not need it.

> My usecase was for a wifi card connected via sdio running only with an
> out of tree kernel module. The wifi card is soldered and doesn't have
> a CS to trigger an hotplug event and the only sensible way I found to
> load the module at boot was to have a proper way to load modules at
> boot.

I used something similar initially, until switching to udev.

> I'm not aware normal distros does so much tinkering about loading a
> kernel module at boot: /etc/modules or the newly /etc/modules-load.d/
> for systemd are widely adopted and are usually working out of the box.
> 

Kind regards,
Andreas

>> Kind regards,
>> Andreas
>> 
>>>> 
>>>> This is a sysvinit script, so it should be installed in
>>>> BUSYBOX_INSTALL_INIT_SYSV.
>>>> 
>>>> 
>>>> 
>>>> Regards,
>>>> Arnout
>>>> 
>>>>>   endef
>>>>> 
>>>>>   # Install the sysvinit scripts, for the moment, but not those
>> that
>>>> already
>>>> 
>>> 
>>> 
>>> --
>>> 
>>> Angelo Compagnucci
>>> 
>>> Software Engineer
>>> 
>>> angelo@amarulasolutions.com
>>> __________________________________
>>> Amarula Solutions SRL
>>> 
>>> Via le Canevare 30, 31100 Treviso, Veneto, IT
>>> 
>>> T. +39 (0)42 243 5310
>>> info@amarulasolutions.com
>>> 
>>> www.amarulasolutions.com [2]
>>> [`as] https://www.amarulasolutions.com|
> 
> --
> 
> Angelo Compagnucci
> 
> Software Engineer
> 
> angelo@amarulasolutions.com
> __________________________________
> Amarula Solutions SRL
> 
> Via le Canevare 30, 31100 Treviso, Veneto, IT
> 
> T. +39 (0)42 243 5310
> info@amarulasolutions.com
> 
> www.amarulasolutions.com [3]
> 
> [`as] https://www.amarulasolutions.com|
> 
> Links:
> ------
> [1] http://busybox.mk
> [2] http://www.amarulasolutions.com
> [3] http://www.amarulasolutions.com/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
