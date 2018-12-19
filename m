From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 19 Dec 2018 14:55:08 -0700
Subject: [Buildroot] [PATCH 1/2] package/systemd: add systemd-boot build
 option
In-Reply-To: <20181219173251.GM24194@scaer>
References: <1545176489-17146-1-git-send-email-james.hilliard1@gmail.com>
 <20181219173251.GM24194@scaer>
Message-ID: <CADvTj4o944R0b9KkXGOtG=Ok=NEXmgwp_s5oNcp8-cwhuq+aEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 19, 2018 at 10:32 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2018-12-19 07:41 +0800, james.hilliard1 at gmail.com spake thusly:
> > From: James Hilliard <james.hilliard1@gmail.com>
>
> This is starting to look nice! Thanks for the respin! :-)
>
> So, this is supposed to replace gummiboot, for which we already do have
> a package, so I'd have expected a further patch last in the series,
> which would get rid of gummiboot.
Well I didn't want to do that yet since it's not exactly a drop in
replacement. Gummiboot was brought under the systemd-boot project
umbrella but because of that the userspace tools became dependent on
systemd.
>
> See also a few comments, below...
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/systemd/Config.in  | 21 +++++++++++++++++++++
> >  package/systemd/systemd.mk |  8 ++++++--
> >  2 files changed, 27 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> > index 25f322e..ff71323 100644
> > --- a/package/systemd/Config.in
> > +++ b/package/systemd/Config.in
> > @@ -77,6 +77,27 @@ if BR2_PACKAGE_SYSTEMD
> >  config BR2_PACKAGE_PROVIDES_UDEV
> >       default "systemd"
> >
> > +config BR2_PACKAGE_SYSTEMD_BOOT
> > +     bool "systemd-boot"
> > +     select BR2_PACKAGE_GNU_EFI
>
> So, you select gnu-efi, but you did not propagate the dependencies from
> it, i.e. you need to add:
>
>     # gnu-efi
>     depends on BR2_ARM_CPU_HAS_ARM || BR2_aarch64 || \
>             BR2_aarch64_be || BR2_i386 || BR2_x86_64
>
> However, gummi-boot is currently only available for x86 and x86_64. Was
> that somehow lifted for systemd-boot?
Appears it also supports arm and
aarch64(https://github.com/systemd/systemd/blob/v239/meson.build#L1245-L1256),
I'll tweak the build to add support for those.
>
> Furthermore, there is no dependency expressed in the systemd.mk file
> (see continuation [0], below...)
>
> > +       systemd-boot operates on the EFI System Partition (ESP)
> > +       only. Configuration file fragments, kernels, initrds, other
> > +       EFI images need to reside on the ESP. Linux kernels need to
> > +       be built with CONFIG_EFI_STUB to be able to be directly
> > +       executed as an EFI image.
> > +
> > +       See the Grub2 help text for details on preparing an EFI
> > +       capable disk image using systemd-boot: the instructions are
> > +       exactly the same, except that the systemd-boot configuration
> > +       files will be located in /loader/ inside the EFI partition.
> > +
> > +       https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/
> > +
> >  config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
> >       bool "HTTP server for journal events"
> >       select BR2_PACKAGE_LIBMICROHTTPD
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index e53f0b6..0fa3b83 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -24,8 +24,6 @@ SYSTEMD_CONF_OPTS += \
> >       -Dman=false \
> >       -Dima=false \
> >       -Dlibcryptsetup=false \
> > -     -Defi=false \
> > -     -Dgnu-efi=false \
> >       -Dldconfig=false \
> >       -Ddefault-dnssec=no \
> >       -Dtests=false \
> > @@ -332,6 +330,12 @@ else
> >  SYSTEMD_CONF_OPTS += -Dhibernate=false
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
>
> [0] ... here, where you probably need something like:
will add that
>
>     SYSTEMD_DEPENDENCIES += gnu-efi
>
> > +SYSTEMD_CONF_OPTS += -Defi=true -Dgnu-efi=true
>
> And once you enable gnu-efi, you also unlock -Dtpm and -Dtpm-pcrindex.
> Would it make sense to at least disable with -Dtpm=false ?
I guess I should probably also add an option for building with tpm support.
>
> Regards,
> Yann E. MORIN.
>
> > +else
> > +SYSTEMD_CONF_OPTS += -Defi=false -Dgnu-efi=false
> > +endif
> > +
> >  SYSTEMD_FALLBACK_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
> >  ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
> >  SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
> > --
> > 2.7.4
> >
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
