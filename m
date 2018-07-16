From: Christoph Engelbert <me@noctarius.com>
Date: Mon, 16 Jul 2018 17:15:44 +0200
Subject: [Buildroot] [PATCH 1/1] <wireless-regdb>: Adds the option to
 copy "regulatory.db[.p7s]" to /lib/firmware
In-Reply-To: <CAFGQKxdrSmeWP3Ps9iTo=Os2ZXSZP-i=TUpTWF3TRMPpE8kYQA@mail.gmail.com>
References: <20180713093254.7994-1-me@noctarius.com>
 <CAFGQKxdVqfFizQBeAHHSmc4tW8FQkXZ+6qGZrD0o3njpNHYjZA@mail.gmail.com>
 <1461622C-22FB-41D0-9F25-4F0E8D0961EE@noctarius.com>
 <CAFGQKxdrSmeWP3Ps9iTo=Os2ZXSZP-i=TUpTWF3TRMPpE8kYQA@mail.gmail.com>
Message-ID: <5C37D92F-BEC8-40CE-9C5A-E240EE2B462B@noctarius.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Martin,

For some reason the changed mail became a new thread. Sorry about that :(

Chris

> On 15. Jul 2018, at 20:41, Martin Bark <martin@barkynet.com> wrote:
> 
> Chris,
> 
> On 15 July 2018 at 09:13, Christoph Engelbert <me@noctarius.com> wrote:
>> Hey Martin,
>> 
>> Oh I see, didn?t know it was a general change. Does that mean it would probably make more sense to only install the new files as a new package and deprecate the old one?
> 
> I think the changes look good, i was just saying to tweak the commit message.
> 
> Thanks
> 
> Martin
> 
>> 
>> Chris
>> 
>>> On 14. Jul 2018, at 14:38, Martin Bark <martin@barkynet.com> wrote:
>>> 
>>> Chris,
>>> 
>>> On 13 July 2018 at 10:32, Christoph Engelbert <me@noctarius.com> wrote:
>>>> Certain wireless drivers (like the Broadcom FullMac drivers" expect the regulatory.db and
>>>> regulatory.db.p7s files to be available to be loadable from /lib/firmware. If not available
>>>> the driver still loads but runs on a minimal subset of channels.
>>>> 
>>>> This newly added option gives possibility to have those files copied to the necessary directory.
>>> 
>>> This is a good change but I think the commit message needs changing.
>>> It's not really certain wireless drivers that is the issue, it's that
>>> linux 4.15 added support to load regulatory.db directly without using
>>> crda.  If the kernel can't load regulatory.db directly it will still
>>> try and use crda.  So this change should allow you to stop using crda
>>> for kernels after 4.15
>>> 
>>> Thanks
>>> 
>>> Martin
>>> 
>>>> 
>>>> Signed-off-by: Christoph Engelbert <me@noctarius.com>
>>>> ---
>>>> package/wireless-regdb/wireless-regdb.mk | 4 ++++
>>>> 1 file changed, 4 insertions(+)
>>>> 
>>>> diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
>>>> index e9283a00e2..829374edcf 100644
>>>> --- a/package/wireless-regdb/wireless-regdb.mk
>>>> +++ b/package/wireless-regdb/wireless-regdb.mk
>>>> @@ -15,6 +15,10 @@ define WIRELESS_REGDB_INSTALL_TARGET_CMDS
>>>>               $(TARGET_DIR)/usr/lib/crda/regulatory.bin
>>>>       $(INSTALL) -m 644 -D -T $(@D)/sforshee.key.pub.pem \
>>>>               $(TARGET_DIR)/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem
>>>> +       $(INSTALL) -m 644 -D -T $(@D)/regulatory.db \
>>>> +               $(TARGET_DIR)/lib/firmware/regulatory.db
>>>> +       $(INSTALL) -m 644 -D -T $(@D)/regulatory.db.p7s \
>>>> +               $(TARGET_DIR)/lib/firmware/regulatory.db.p7s
>>>> endef
>>>> 
>>>> $(eval $(generic-package))
>>>> --
>>>> 2.17.1
>>>> 
>>>> 
>>>> _______________________________________________
>>>> buildroot mailing list
>>>> buildroot at busybox.net
>>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>> 
>> 
>> 
> 
