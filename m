From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 3 Nov 2020 22:13:21 +0100
Subject: [Buildroot] [PATCH 1/2] package/util-linux: select
 BR2_PACKAGE_UTIL_LINUX_LIBS
In-Reply-To: <20201103205814.GK2887157@scaer>
References: <20201101150619.1709959-1-fontaine.fabrice@gmail.com>
 <20201103205814.GK2887157@scaer>
Message-ID: <CAPi7W80__j4FSgZHNb7ZgE0322P_qqRMdvyQy2k9Jk7QnYeQsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mar. 3 nov. 2020 ? 21:58, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Fabrice, All,
>
> +Thomas, +Peter, +Arnout, further reading and input from you required
> below...
>
> On 2020-11-01 16:06 +0100, Fabrice Fontaine spake thusly:
> > When util-linux is enabled, select BR2_PACKAGE_UTIL_LINUX_LIBS as
> > suggested by Yann E. Morin in
> > https://patchwork.ozlabs.org/project/buildroot/patch/20201101121536.1089498-1-fontaine.fabrice at gmail.com/
>
> I think there is quite some misunderstanding in what I said; sorry, I
> was probably not completely clear in what I said...
>
> > As a result, drop BR2_PACKAGE_UTIL_LINUX_LIBS workaround from libglib2
> > and drop select of BR2_PACKAGE_UTIL_LINUX_LIBS from eudev and systemd
>
> Quite the opposite; it is what all packages should do.
>
> The rule should be:
>
>   - need util-linux tools?
>     -> select BR2_PACKAGE_UTIL_LINUX (and the subset of required tools,
>        if needed)
>
>   - need util-linux' libraries?
>     -> select BR2_PACKAGE_UTIL_LINUX_LIBS and the needed libraries
>
I sent a v2 with these changes thanks to your reply on the other thread.
> So, to complement my previous reply:
>
>   - the BR2_PACKAGE_UTIL_LINUX_LIBMOUNT (for example) should berndn option
>     of util-linux-libs, so that the library is built by util-linux
>
>   - those options are what packages should select
>
> However, there is acatch, which we need to be careful about:
>
>   - if both util-linux and util-linux-libs install libraries, then that
>     would cause grief because that break the rule that no two packages
>     should install the same file in target/
>
>   - AFAICS, there is no (trivial) way to tell util-linux to only install
>     libs or programs, not both.
>
> One way around that would be to:
>
>   - ensure that both util-linux and util-linux-libs really build the
>     exact same libraries
>
>   - if util-linux is enabled, install it in target only, and install
>     util-linux-libs only in staging
>
>   - if util-linux is not enabled, install util-linux-libs in both
>     staging and target
>
> Yes, this is kinda a hack, so we'd need further input before actually
> comitting to this...
I'll wait for your feedback concerning this part however it should be
noted that we already have build failures due to util-linux circular
dependencies.
I fixed libglib2 by adding this ugly util-linux or util-linux-libs
dependency "hack" but I also spotted the same issue in the
autobuilders for fontconfig and cryptsetup:

fontconfig -> util-linux -> udev -> systemd -> polkit ->
gobject-introspection -> cairo -> fontconfig
cryptsetup -> util-linux -> udev -> systemd -> cryptsetup

>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/eudev/Config.in      | 1 -
> >  package/libglib2/libglib2.mk | 4 ----
> >  package/systemd/Config.in    | 1 -
> >  package/util-linux/Config.in | 1 +
> >  4 files changed, 1 insertion(+), 6 deletions(-)
> >
> > diff --git a/package/eudev/Config.in b/package/eudev/Config.in
> > index 0e5bd0cee9..b0ce76171a 100644
> > --- a/package/eudev/Config.in
> > +++ b/package/eudev/Config.in
> > @@ -7,7 +7,6 @@ config BR2_PACKAGE_EUDEV
> >       select BR2_PACKAGE_HAS_UDEV
> >       select BR2_PACKAGE_UDEV_GENTOO_SCRIPTS if BR2_INIT_OPENRC
> >       select BR2_PACKAGE_UTIL_LINUX
> > -     select BR2_PACKAGE_UTIL_LINUX_LIBS
> >       select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> >       select BR2_PACKAGE_KMOD
> >       help
> > diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> > index 6e9dbd7b26..43fcb27fae 100644
> > --- a/package/libglib2/libglib2.mk
> > +++ b/package/libglib2/libglib2.mk
> > @@ -86,12 +86,8 @@ endif
> >
> >  ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
> >  LIBGLIB2_CONF_OPTS += -Dlibmount=enabled
> > -ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS),y)
> >  LIBGLIB2_DEPENDENCIES += util-linux-libs
> >  else
> > -LIBGLIB2_DEPENDENCIES += util-linux
> > -endif
> > -else
> >  LIBGLIB2_CONF_OPTS += -Dlibmount=disabled
> >  endif
> >
> > diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> > index ec34478e3d..9188876d49 100644
> > --- a/package/systemd/Config.in
> > +++ b/package/systemd/Config.in
> > @@ -29,7 +29,6 @@ menuconfig BR2_PACKAGE_SYSTEMD
> >       select BR2_PACKAGE_DBUS # runtime dependency only
> >       select BR2_PACKAGE_LIBCAP
> >       select BR2_PACKAGE_UTIL_LINUX
> > -     select BR2_PACKAGE_UTIL_LINUX_LIBS
> >       select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
> >       select BR2_PACKAGE_UTIL_LINUX_AGETTY
> >       select BR2_PACKAGE_UTIL_LINUX_MOUNT
> > diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> > index 1f33eb5514..cee4649f67 100644
> > --- a/package/util-linux/Config.in
> > +++ b/package/util-linux/Config.in
> > @@ -1,5 +1,6 @@
> >  menuconfig BR2_PACKAGE_UTIL_LINUX
> >       bool "util-linux"
> > +     select BR2_PACKAGE_UTIL_LINUX_LIBS
> >       help
> >         Various useful/essential linux libraries and utilities.
> >
> > --
> > 2.28.0
> >
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
Best Regards,

Fabrice
