From: Tal Shorer <tal.shorer@gmail.com>
Date: Mon, 12 Dec 2016 00:11:27 +0200
Subject: [Buildroot] [PATCH] usbip: add a new package
In-Reply-To: <20161211220520.GH3599@free.fr>
References: <1481272671-6491-1-git-send-email-tal.shorer@gmail.com>
 <20161211135617.GB3599@free.fr>
 <CAFDyS3ON-Wc-wzKZ4Le81Ak7z0wOpxYbH0hURobu38S87gXUcg@mail.gmail.com>
 <3fae2ec3-3be6-e839-f854-210b223b65af@mind.be>
 <CAFDyS3OMjwAEh7g80FTH3P3H=zb6sw6=oU7+L27PQcZC5bmmVg@mail.gmail.com>
 <20161211220520.GH3599@free.fr>
Message-ID: <CAFDyS3OZzOuh=wpnUSBZp7f-31jGVOiN7GH8n+JG9gTynMNKKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 12, 2016 at 12:05 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Tal, Arnout, All,
>
> On 2016-12-11 23:46 +0200, Tal Shorer spake thusly:
>> On Sun, Dec 11, 2016 at 9:59 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> [--SNIP--]
>> >  However, doesn't something like this work? Or is it considered too much of a hack?
>> >
>> > # Before v3.17 it was in staging.
>> > # USBIP_SITE is only used inside rules, after linux has already been extracted.
>> > USBIP_SITE = $(wildcard \
>> >         $(LINUX_DIR)/tools/usb/usbip \
>> >         $(LINUX_DIR)/drivers/staging/usbip/userspace)
>> It doesn't,
>
> Weird, it does work here:
>
>     USBIP_SITE= $(wildcard \
>         $(LINUX_DIR)/tools/usb/usbip \
>         $(LINUX_DIR)/drivers/staging/usbip/userspace)
>     USBIP_SITE_METHOD = local
>     USBIP_PATCH_DEPENDENCIES = linux
>
>     define USBIP_CONFIGURE_CMDS
>         @echo 'USBIP_SITE="$(USBIP_SITE)"'
>     endef
>
>     $(eval $(generic-package))
>
> And then:
>
>     $ make usbip-configure
>     [--SNIP--]
>     USBIP_SITE="/home/ymorin/dev/buildroot/O/build/linux-4.8.13/tools/usb/usbip"
>
> Quid? ;-)
Notice how it says "Extracting" in the "snip". That's a hint that it
doesn't understand it needs to rsync. In the top Make, we can find:
########
include $(sort $(wildcard package/*/*.mk))

include boot/common.mk
include linux/linux.mk
include fs/common.mk
########
so pkg-autotools evaluates the wildcard before LINUX_DIR is defined
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
