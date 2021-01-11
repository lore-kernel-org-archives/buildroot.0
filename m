From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Mon, 11 Jan 2021 20:49:21 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/uclibc: add backtrace
 support option
In-Reply-To: <20210111171441.GY3044608@scaer>
References: <20210111130705.25005-1-andrea.ricchi@amarulasolutions.com>
 <20210111171441.GY3044608@scaer>
Message-ID: <CABNF3=ZESct_f8X5mULEzwupkXgDZaXK0awjxrZatBqx+mWczg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Jan 11, 2021 at 6:14 PM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Andrea, All,
>
> On 2021-01-11 14:07 +0100, Andrea Ricchi spake thusly:
> > Add toolchain configuration to support execinfo.h and backtrace
> > features.
> >
> > Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
> > ---
> > Changes v2 -> v3:
> >   - Remove BR2_USE_BACKTRACE selection (suggested by Angelo Compagnucci)
>
> Ah, you noticed already, good. :-)
>
> I did not see the review mail by Angelo, so internal review I guess. In
> that case, it would have been nice that you Cc-ed him on the v3, with a
>  Cc: tag right below your own SoB line, so that git sends the Cc
> automatically. Basically, it is customary to add people that provided a
> review as Cc of your respins.
>
> Thanks!
>
> Regards,
> Yann E. MORIN.
>

Understood. This is my first patch and I'm getting used to this review
process.
Let me know if other changes are needed.

Thanks!

Andrea Ricchi.


> > Changes v1 -> v2:
> >   - add shared library dependency (suggested by Yann Morin)
> >
> >  package/uclibc/Config.in |  7 +++++++
> >  package/uclibc/uclibc.mk | 11 +++++++++++
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> > index e59fef3c69..dedd58f940 100644
> > --- a/package/uclibc/Config.in
> > +++ b/package/uclibc/Config.in
> > @@ -39,6 +39,13 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
> >         Enable this option if you want your toolchain to support
> >         localization and internationalization.
> >
> > +config BR2_TOOLCHAIN_BUILDROOT_BACKTRACE
> > +     bool "Enable backtrace support"
> > +     depends on !BR2_STATIC_LIBS
> > +     help
> > +       Enable this option if you want your toolchain to support
> > +       execinfo.h and backtrace features.
> > +
> >  choice
> >       prompt "Thread library implementation"
> >       help
> > diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> > index 53983e852d..b6f6c0f824 100644
> > --- a/package/uclibc/uclibc.mk
> > +++ b/package/uclibc/uclibc.mk
> > @@ -359,6 +359,16 @@ else
> >  UCLIBC_SHARED_LIBS_CONFIG = $(call KCONFIG_ENABLE_OPT,HAVE_SHARED)
> >  endif
> >
> > +#
> > +# backtrace support
> > +#
> > +
> > +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_BACKTRACE),y)
> > +UCLIBC_BACKTRACE_CONFIG = $(call
> KCONFIG_ENABLE_OPT,UCLIBC_HAS_BACKTRACE)
> > +else
> > +UCLIBC_BACKTRACE_CONFIG = $(call
> KCONFIG_DISABLE_OPT,UCLIBC_HAS_BACKTRACE)
> > +endif
> > +
> >  #
> >  # Commands
> >  #
> > @@ -401,6 +411,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
> >       $(UCLIBC_LOCALE_CONFIG)
> >       $(UCLIBC_WCHAR_CONFIG)
> >       $(UCLIBC_SHARED_LIBS_CONFIG)
> > +     $(UCLIBC_BACKTRACE_CONFIG)
> >  endef
> >
> >  define UCLIBC_BUILD_CMDS
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210111/b0527cca/attachment.html>
