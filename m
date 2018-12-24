From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Dec 2018 22:30:40 +0100
Subject: [Buildroot] [PATCH 1/2] package/systemd: add systemd-boot build
 option
In-Reply-To: <CADvTj4o944R0b9KkXGOtG=Ok=NEXmgwp_s5oNcp8-cwhuq+aEQ@mail.gmail.com>
References: <1545176489-17146-1-git-send-email-james.hilliard1@gmail.com>
 <20181219173251.GM24194@scaer>
 <CADvTj4o944R0b9KkXGOtG=Ok=NEXmgwp_s5oNcp8-cwhuq+aEQ@mail.gmail.com>
Message-ID: <20181224213040.GH2703@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James,

On 2018-12-19 14:55 -0700, James Hilliard spake thusly:
> On Wed, Dec 19, 2018 at 10:32 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2018-12-19 07:41 +0800, james.hilliard1 at gmail.com spake thusly:
> > > From: James Hilliard <james.hilliard1@gmail.com>
> >
> > This is starting to look nice! Thanks for the respin! :-)

I did a few other comments in your second patch, that may have an impact
on that one.

> > So, this is supposed to replace gummiboot, for which we already do have
> > a package, so I'd have expected a further patch last in the series,
> > which would get rid of gummiboot.
> Well I didn't want to do that yet since it's not exactly a drop in
> replacement. Gummiboot was brought under the systemd-boot project
> umbrella but because of that the userspace tools became dependent on
> systemd.

Yes, Ok, so it is not a 100% replacement, so it makes sense to still
keep gummiboot for now.

> > See also a few comments, below...
> >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > >  package/systemd/Config.in  | 21 +++++++++++++++++++++
> > >  package/systemd/systemd.mk |  8 ++++++--
> > >  2 files changed, 27 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> > > index 25f322e..ff71323 100644
> > > --- a/package/systemd/Config.in
> > > +++ b/package/systemd/Config.in
> > > @@ -77,6 +77,27 @@ if BR2_PACKAGE_SYSTEMD
> > >  config BR2_PACKAGE_PROVIDES_UDEV
> > >       default "systemd"
> > >
> > > +config BR2_PACKAGE_SYSTEMD_BOOT
> > > +     bool "systemd-boot"
> > > +     select BR2_PACKAGE_GNU_EFI
> >
> > So, you select gnu-efi, but you did not propagate the dependencies from
> > it, i.e. you need to add:
> >
> >     # gnu-efi
> >     depends on BR2_ARM_CPU_HAS_ARM || BR2_aarch64 || \
> >             BR2_aarch64_be || BR2_i386 || BR2_x86_64
> >
> > However, gummi-boot is currently only available for x86 and x86_64. Was
> > that somehow lifted for systemd-boot?
> Appears it also supports arm and
> aarch64(https://github.com/systemd/systemd/blob/v239/meson.build#L1245-L1256),
> I'll tweak the build to add support for those.

As I said when reviewing patch 2, limit yourself to the architecture you
are isnterestd in, and that you can actually test.

If someone else is intrerested in adding support for another arch,
they'll submit a patch.

[--SNIP--]
> > > +SYSTEMD_CONF_OPTS += -Defi=true -Dgnu-efi=true
> >
> > And once you enable gnu-efi, you also unlock -Dtpm and -Dtpm-pcrindex.
> > Would it make sense to at least disable with -Dtpm=false ?
> I guess I should probably also add an option for building with tpm support.

Unless you can use and test it, just default it to false for now. And in
anycase, that should be a separate patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
