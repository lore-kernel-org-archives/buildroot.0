From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Feb 2019 23:00:07 +0100
Subject: [Buildroot] [PATCH] make printvars: avoid invalid calls when
 arguments are missing
In-Reply-To: <468427c5e6854794aa8a97373bfdaf30@ginzinger.com>
References: <20190223161108.22819-1-martin.kepplinger@ginzinger.com>
 <20190223174157.28e41088@windsurf.home>
 <468427c5e6854794aa8a97373bfdaf30@ginzinger.com>
Message-ID: <20190225220007.GA15265@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2019-02-25 07:09 +0000, Kepplinger Martin spake thusly:
> (sorry for the horrible email format)
> 
> my patch does not break the build. In fact, it *adds* host-tar to my build (for the first time
> ever it seems because it just downloaded).
> 
> My impression is that what's *below* the $(1) expression in support/dependencies/dependencies.mk
> didn't get defined... (host-tar).
> 
> I've built successfully. Still, the kind of change doesn't look very beautiful.
> 
> Maybe there someone who sees the mistake at first sight :)

I agree with Thomas: the patch as it is, is not correct. As Thomas
explained, at the exact moment you evaluate $(1) to test if it is empty,
you are outside the macro. However, $(1) only ever makes sense in a
macro, because it is the first parameter of a macro.

So, it means the test will aways fail: $(1) is always empty outside a
macro, so   ifneq ($(1),)   is always false.

As a consequnce, as Thomas said, the two macros enclosed in the ifneq
will never be defined.

Instead, what you want is to do the test inside the macro, like:

    define suitable-host-package
    ifneq ($(1),)
    $(shell support/dependencies/check-host-$(1).sh $(2))
    endif
    endef

Or:

    try-run = $(if $(1), ...
        ...
        )

And so on...

I've marked the patch as "Changes Requested" in patchwork while waiting
for the next iteration. Thanks! :-)

Regards,
Yann E. MORIN.

> On Sat, 23 Feb 2019 17:11:08 +0100
> Martin Kepplinger <martin.kepplinger@ginzinger.com> wrote:
> 
> > diff --git a/package/Makefile.in b/package/Makefile.in
> > index dc818a2c18..f4f3864e8d 100644
> > --- a/package/Makefile.in
> > +++ b/package/Makefile.in
> > @@ -232,6 +232,7 @@ HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
> >  # Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
> >  # Exit code chooses option. "$$TMP" is can be used as temporary file and
> >  # is automatically cleaned up.
> > +ifneq ($(1),)
> 
> $(1) only makes sense inside the macro itself. Outside the macro $(1)
> does not make sense at all, and will always be empty I believe. Are you
> sure your patch is working, and does not break the build ?
> 
> Indeed, I believe the two macros you enclose in ifneq tests will in
> fact no longer be defined.
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
> 
> 
> ________________________________________
> 
> Ginzinger electronic systems GmbH
> Gewerbegebiet Pirath 16
> 4952 Weng im Innkreis
> www.ginzinger.com
> 
> Firmenbuchnummer: FN 364958d
> Firmenbuchgericht: Ried im Innkreis
> UID-Nr.: ATU66521089
> 
> 
> Diese Nachricht ist vertraulich und darf nicht an andere Personen weitergegeben oder von diesen verwendet werden. Verst?ndigen Sie uns, wenn Sie irrt?mlich eine Mitteilung empfangen haben.
> 
> This message is confidential. It may not be disclosed to, or used by, anyone other than the addressee. If you receive this message by mistake, please advise the sender.



> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
