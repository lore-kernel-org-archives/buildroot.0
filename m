From: Gergely Imreh <imrehg@gmail.com>
Date: Wed, 20 May 2015 10:48:31 +0800
Subject: [Buildroot] [PATCH] busybox: add option to install ntp startup
	script
In-Reply-To: <555AF32A.60403@je-eigen-domein.nl>
References: <1431979101-25367-1-git-send-email-bos@je-eigen-domein.nl>
 <CAJ3iQcrTBMLEU8zeQYFXmP9ugvrLyD4J1aKfcUmUyJhKtOwB5A@mail.gmail.com>
 <555AF32A.60403@je-eigen-domein.nl>
Message-ID: <CAJ3iQcofdvwPnzN__hUtRLps7bwaO367K_kF1bOaBvino62AXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19 May 2015 at 16:24, Floris Bos <bos@je-eigen-domein.nl> wrote:
> Hi,
>
>
> On 05/19/2015 05:08 AM, Gergely Imreh wrote:
>>
>> On 19 May 2015 at 03:58, Floris Bos <bos@je-eigen-domein.nl> wrote:
>>>
>>> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
>>> ---
>>>   package/busybox/Config.in  |  6 ++++++
>>>   package/busybox/S49ntp     | 34 ++++++++++++++++++++++++++++++++++
>>>   package/busybox/busybox.mk | 15 +++++++++++++++
>>>   package/busybox/ntp.conf   |  2 ++
>>>   4 files changed, 57 insertions(+)
>>>   create mode 100644 package/busybox/S49ntp
>>>   create mode 100644 package/busybox/ntp.conf
>>>
>>> diff --git a/package/busybox/Config.in b/package/busybox/Config.in
>>> index b4f949f..0b74536 100644
>>> --- a/package/busybox/Config.in
>>> +++ b/package/busybox/Config.in
>>> @@ -26,6 +26,12 @@ config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>>>            Show packages in menuconfig that are potentially also provided
>>>            by busybox.
>>>
>>> +config BR2_PACKAGE_BUSYBOX_NTP
>>> +       bool "Install the ntp startup script"
>>> +       help
>>> +         Install the ntp daemon startup script, that by default operates
>>> in
>>> +         client-only mode and synchronizes the system time with
>>> pool.ntp.org.
>>> +
>>
>> Should this section be wrapped in an "if BR2_PACKAGE_NTP" / "endif"
>> block? I guess there's no point showing the option if the NTP package
>> is not selected.
>>
>> On a higher level, wouldn't it make sense to add this option to the
>> NTP package itself, instead of busybox?
>
>
> Note that this patch is about enabling the ntpd applet included in Busybox,
> as a light-weight alternative to the full blown standalone NTP package.
> So no, it does not depend on BR2_PACKAGE_NTP.
>
> BR2_PACKAGE_NTP and BR2_PACKAGE_OPENNTPD already have startup scripts of
> their own.
> But if you just want your device to retrieve the time because it lacks a RTC
> (as opposed to playing server and providing the time to others), installing
> those is overkill in my opinion.

Ah, sorry, it's my bad then! It wasn't really obvious to me that
there's an NTP within busybox.

>
>
>>   Especially because NTP is not the only ntp client supported by busybox,
>> there's also chrony.
>
>>Ideally that should also have an option for default setup and startup
>> script, just like the this patch aims to do for ntp.
>
> Chrony is a standalone buildroot package, and not an applet provided by
> busybox.
> Doesn't it install a startup script implicity, if you select it in
> buildroot?
>
>>> +++ b/package/busybox/ntp.conf
>>> @@ -0,0 +1,2 @@
>>> +server 0.pool.ntp.org
>>> +server 1.pool.ntp.org
>>
>> Isn't 2 servers too few in general? If there's a default conf, maybe
>> use the same setup as the NTP Pool project page's simple setup at
>> http://www.pool.ntp.org/en/use.html
>
>
> It is the same we currently have for the standalone ntp package in
> package/ntp/ntpd.etc.conf
> Am open to change that, but I do think the standalone ntp config should be
> changed too then.

Looking at package/ntp/ntpd.etc.conf and it's just similar, but not
the same. It's similar in the sense that it only uses two servers, but
different that "iburst" is not used, and no other settings are in
there.

By the way, one more data point for choosing more than 2 NTP servers:
the RedHat knowledgebase also recommends at least 4:
https://access.redhat.com/solutions/58025


>
> --
> Yours sincerely,
>
> Floris Bos
>
