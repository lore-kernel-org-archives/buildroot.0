From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Dec 2016 10:40:42 +0100
Subject: [Buildroot] [PATCH] usbip: add a new package
In-Reply-To: <CAFDyS3PkxwNSVxDRoK5Fe7fU+RxMrc126rUYYY9cGQXPrKSzBg@mail.gmail.com>
References: <1481272671-6491-1-git-send-email-tal.shorer@gmail.com>
 <20161211135617.GB3599@free.fr>
 <CAFDyS3ON-Wc-wzKZ4Le81Ak7z0wOpxYbH0hURobu38S87gXUcg@mail.gmail.com>
 <3fae2ec3-3be6-e839-f854-210b223b65af@mind.be>
 <CAFDyS3OMjwAEh7g80FTH3P3H=zb6sw6=oU7+L27PQcZC5bmmVg@mail.gmail.com>
 <20161211220520.GH3599@free.fr>
 <CAFDyS3OZzOuh=wpnUSBZp7f-31jGVOiN7GH8n+JG9gTynMNKKA@mail.gmail.com>
 <20161211222056.GI3599@free.fr>
 <CAFDyS3PkxwNSVxDRoK5Fe7fU+RxMrc126rUYYY9cGQXPrKSzBg@mail.gmail.com>
Message-ID: <401bd78e-f466-95f7-6cc8-caa5b15af34f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-12-16 23:30, Tal Shorer wrote:
> On Mon, Dec 12, 2016 at 12:20 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Tal, All,
>>
>> On 2016-12-12 00:11 +0200, Tal Shorer spake thusly:
>>> On Mon, Dec 12, 2016 at 12:05 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>>> Tal, Arnout, All,
>>>>
>>>> On 2016-12-11 23:46 +0200, Tal Shorer spake thusly:
>>>>> On Sun, Dec 11, 2016 at 9:59 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>> [--SNIP--]
>>>>>>  However, doesn't something like this work? Or is it considered too much of a hack?
>>>>>>
>>>>>> # Before v3.17 it was in staging.
>>>>>> # USBIP_SITE is only used inside rules, after linux has already been extracted.
>>>>>> USBIP_SITE = $(wildcard \
>>>>>>         $(LINUX_DIR)/tools/usb/usbip \
>>>>>>         $(LINUX_DIR)/drivers/staging/usbip/userspace)
>>>>> It doesn't,
>>>>
>>>> Weird, it does work here:
>>>>
>>>>     USBIP_SITE= $(wildcard \
>>>>         $(LINUX_DIR)/tools/usb/usbip \
>>>>         $(LINUX_DIR)/drivers/staging/usbip/userspace)
>>>>     USBIP_SITE_METHOD = local
>>>>     USBIP_PATCH_DEPENDENCIES = linux
>>>>
>>>>     define USBIP_CONFIGURE_CMDS
>>>>         @echo 'USBIP_SITE="$(USBIP_SITE)"'
>>>>     endef
>>>>
>>>>     $(eval $(generic-package))
>>>>
>>>> And then:
>>>>
>>>>     $ make usbip-configure
>>>>     [--SNIP--]
>>>>     USBIP_SITE="/home/ymorin/dev/buildroot/O/build/linux-4.8.13/tools/usb/usbip"
>>>>
>>>> Quid? ;-)
>>> Notice how it says "Extracting" in the "snip". That's a hint that it
>>> doesn't understand it needs to rsync.
>>
>> Oh dang, stupid me...

 No, stupid *me*. I saw this:
ifeq ($$($(2)_OVERRIDE_SRCDIR),)

and I figured that it wasn't empty because we assigned something to it. But of
course it _is_ empty when you evaluate it.

>>
>>> In the top Make, we can find:
>>> ########
>>> include $(sort $(wildcard package/*/*.mk))
>>>
>>> include boot/common.mk
>>> include linux/linux.mk
>>> include fs/common.mk
>>> ########
>>> so pkg-autotools evaluates the wildcard before LINUX_DIR is defined
>>
>> And contrary to what Arnout said, _SITE *is* evaluated outside of rules,
>> but soon-enough in pkg-generic.mk, before LINUX_DIR had a change to be
>> defined.
>>
>> Good catch, Tal.
>>
>> So, back to squarte one. You have two options, then:
>>
>>   - adding a kconfig option, like your latest patch provides,
>>
>>   - not supporting kernels <= 3.16, like you also suggested.
>>
> Both don't deal with source-check, though. I think we should consider
> linux-tools again at this point, since it doesn't have any of these
> problems (it has its own problems, but I'm beginning to think I'd
> rather deal with those). If nobody objects to this approach I'll

 +1 to that approach.

 Regards,
 Arnout

> conjure something up tomorrow since it's getting pretty late in the
> GMT+2 part of the world :)
>> I'm fine with either solution.
>>
>> Regards,
>> Yann E. MORIN.
>>
>> --
>> .-----------------.--------------------.------------------.--------------------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>> '------------------------------^-------^------------------^--------------------'

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
