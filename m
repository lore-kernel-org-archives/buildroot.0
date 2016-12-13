From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Dec 2016 18:35:24 +0100
Subject: [Buildroot] [PATCH] usbip: add a new package
In-Reply-To: <CAFDyS3P=SMKSnoBi5QFR=PrTTsNiOK05yeAEdw7OHVW-D5Z1qA@mail.gmail.com>
References: <CAFDyS3ON-Wc-wzKZ4Le81Ak7z0wOpxYbH0hURobu38S87gXUcg@mail.gmail.com>
 <3fae2ec3-3be6-e839-f854-210b223b65af@mind.be>
 <CAFDyS3OMjwAEh7g80FTH3P3H=zb6sw6=oU7+L27PQcZC5bmmVg@mail.gmail.com>
 <20161211220520.GH3599@free.fr>
 <CAFDyS3OZzOuh=wpnUSBZp7f-31jGVOiN7GH8n+JG9gTynMNKKA@mail.gmail.com>
 <20161211222056.GI3599@free.fr>
 <CAFDyS3PkxwNSVxDRoK5Fe7fU+RxMrc126rUYYY9cGQXPrKSzBg@mail.gmail.com>
 <401bd78e-f466-95f7-6cc8-caa5b15af34f@mind.be>
 <20161212172501.GA3509@free.fr>
 <CAFDyS3P=SMKSnoBi5QFR=PrTTsNiOK05yeAEdw7OHVW-D5Z1qA@mail.gmail.com>
Message-ID: <20161213173524.GA3546@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tal, All,

On 2016-12-13 00:17 +0200, Tal Shorer spake thusly:
> On Mon, Dec 12, 2016 at 7:25 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Tal, Arnout, All,
> >
> > On 2016-12-12 10:40 +0100, Arnout Vandecappelle spake thusly:
> >> On 11-12-16 23:30, Tal Shorer wrote:
> >> > Both don't deal with source-check, though. I think we should consider
> >> > linux-tools again at this point, since it doesn't have any of these
> >> > problems (it has its own problems, but I'm beginning to think I'd
> >> > rather deal with those). If nobody objects to this approach I'll
> >>
> >>  +1 to that approach.
> >
> > Still, I don't like the custom autotools commands we'll have to have.
> > What about (mock-up, just for the sake of the example):
> >
> >     ###############
> >     # usbip
> >     ###############
> >
> >     # No USBIP_SITE, no USB_VERSION, we vampirise the code from the
> >     # linux kernel
> >     USBIP_PATCH_DEPENDENCIES = linux
> >
> >     USBIP_SRC_DIR = $)(wildcard \
> >         $(LINUX_DIR)/tools/usb/usbip \
> >         $(LINUX_DIR)/drivers/staging/blabla)
> >
> >     define USBIP_EXTRACT_CMDS
> >         if [ -z "$(USB_SRC_DIR)" ]; then \
> >             echo "No usbip source in your kernel tree" 2>&1; \
> >             exit 1; \
> >         fi
> >         rsync $(USB_SRC_DIR) $(@D)
> >     endef
> >
> >     $(eval $(autotools-package))
> >
> > This way, we still have a proper autotools package, we don;t fail on
> > source-check, and we re-use the kernel sources.
> This works after some modifications.

Yes, it was definitely buggy, it was just a mock-up...

> We end up duplicating the rsync
> command from pkg-generic, but the argument that this is better than
> duplicating the configure command is easily made.

Yes, the rsync command is duplicated, but that one is easier to maintain
than the autotools commands (configure, build, target-install, and
staging-isntall).

> I'll send a new patch

Thanks, I'll review it now.

Regards,
Yann E. MORIN.

> >
> > Regards,
> > Yann E. MORIN.
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
