From: =?UTF-8?Q?Adrien_Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Mon, 20 Apr 2020 09:52:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/nftables: use --with-mini-gmp
 when gmp is not selected
In-Reply-To: <20200419220038.GF5035@scaer>
References: <20200417133643.1756986-1-adrien@gallouet.fr>
 <20200419220038.GF5035@scaer>
Message-ID: <CAFtSRGC9e3tKJyZ5z9MsF0M-Aj7SiF28FeVu59Gn_mdAxjG74A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 20, 2020 at 12:00 AM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:
>
> Adrien, All,
>
> On 2020-04-17 13:36 +0000, Adrien Gallou?t spake thusly:
> > Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
>
> Applied to master with two small changes:
>   - explicitly disable mini-gmp when full one is enabled
>   - reword and extend commit log
>
> Thanks!

Thanks to you :)

>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/nftables/Config.in   | 1 -
> >  package/nftables/nftables.mk | 8 +++++++-
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/nftables/Config.in b/package/nftables/Config.in
> > index 6452ab4f52..8d172b7256 100644
> > --- a/package/nftables/Config.in
> > +++ b/package/nftables/Config.in
> > @@ -2,7 +2,6 @@ config BR2_PACKAGE_NFTABLES
> >       bool "nftables"
> >       depends on BR2_USE_WCHAR
> >       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
> > -     select BR2_PACKAGE_GMP
> >       select BR2_PACKAGE_LIBMNL
> >       select BR2_PACKAGE_LIBNFTNL
> >       help
> > diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
> > index 210e950c11..1fac9dd3bf 100644
> > --- a/package/nftables/nftables.mk
> > +++ b/package/nftables/nftables.mk
> > @@ -7,12 +7,18 @@
> >  NFTABLES_VERSION = 0.9.3
> >  NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
> >  NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
> > -NFTABLES_DEPENDENCIES = gmp libmnl libnftnl host-bison host-flex \
> > +NFTABLES_DEPENDENCIES = libmnl libnftnl host-bison host-flex \
> >       host-pkgconf $(TARGET_NLS_DEPENDENCIES)
> >  NFTABLES_LICENSE = GPL-2.0
> >  NFTABLES_LICENSE_FILES = COPYING
> >  NFTABLES_CONF_OPTS = --disable-man-doc --disable-pdf-doc
> >
> > +ifeq ($(BR2_PACKAGE_GMP),y)
> > +NFTABLES_DEPENDENCIES += gmp
> > +else
> > +NFTABLES_CONF_OPTS += --with-mini-gmp
> > +endif
> > +
> >  ifeq ($(BR2_PACKAGE_READLINE),y)
> >  NFTABLES_DEPENDENCIES += readline
> >  NFTABLES_LIBS += -lncurses
> > --
> > 2.25.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
>
.-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There
is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
conspiracy.  |
>
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200420/6fd3445e/attachment.html>
