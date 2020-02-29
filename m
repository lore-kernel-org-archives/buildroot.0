From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 29 Feb 2020 09:13:21 -0300
Subject: [Buildroot] [PATCH] package/openrc: needs kmod
In-Reply-To: <20200229093859.GK8743@scaer>
References: <20200228202552.14788-1-yann.morin.1998@free.fr>
 <CAJ4jsaffqEWdUMwgd6WHS2zsX1H5q9K8JZan2ZFK+fpGDCx2_w@mail.gmail.com>
 <20200229093859.GK8743@scaer>
Message-ID: <CAJ4jsaeKLdVr5gGFyKXks+jj8xXD+o3Rsv5UFKie4uWE4rcYxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 29, 2020 at 6:39 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> On 2020-02-28 18:47 -0300, Carlos Santos spake thusly:
> > On Fri, Feb 28, 2020 at 5:26 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > >
> > > openrc provides scritps that have been written for the big-gun kmod, and
> > > so use options unknown to the biusybox' provided applets:
> > >
> > >   - Busybox modprobe does not have a "--first-time" option,
> > >   - the "--verbose" option is just "-v",
> > >   - the "--use-blacklist" option is just "-b". Also blacklist support is
> > >     not selected in our default busybox configuration.
> > >
> > > One of two options, is to "fix" or "adapt" openrc's scripts to busybox,
> > > which means for the openrc package to go peek into files from the
> > > busybox package, which is not nice, and can't work because that is not
> > > available by the time we scan our Makefiles.
> > >
> > > The other option, which this patch implements, is to just add a
> > > dependency onto kmod and its tools.
> > >
> > > Reported-by: Carlos Santos <unixmania@gmail.com>
> > > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > > Cc: Peter Korsgaard <peter@korsgaard.com>
> > > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > > ---
> > >  package/openrc/Config.in | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/package/openrc/Config.in b/package/openrc/Config.in
> > > index 796858f404..4691be63a2 100644
> > > --- a/package/openrc/Config.in
> > > +++ b/package/openrc/Config.in
> > > @@ -3,6 +3,9 @@ config BR2_PACKAGE_OPENRC
> > >         depends on BR2_USE_MMU # fork()
> > >         depends on !BR2_STATIC_LIBS
> > >         depends on BR2_INIT_OPENRC
> > > +       select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod tools
> > > +       select BR2_PACKAGE_KMOD # runtime
> > > +       select BR2_PACKAGE_KMOD_TOOLS # runtime
> > >         select BR2_PACKAGE_NCURSES
> > >         help
> > >           Init that works on top of pid 1 (for example
> > > --
> > > 2.20.1
> > >
> >
> > What about doing the opposite?
> >
> > 1. Always patch openrc to support busybox.' modprobe.
>
> That is akin to a feature patch, so should have to be done upstream
> first. Otherwise, we'd have to endlessly maintain that patch...
>
> > 2. In busybox, select modprobe+blacklist if openrc is selected but
> > kmod tools are not selected.
>
> Or just tweak our default busybox config to enable modprobe + blacklist
> and be done with that. And we don't care about kmod being enabled or
> not, because kmod will always win against busybox in any case.
>
> > This would be cleaner and seems to be reasonable, since busybox
> > already sets several configurations based on the selection of other
> > packages.
>
> The only one that is dependent on another package is PAM support, and
> that one is special. All other config tweaks only depend on architecture
> (e.g. MMU support), system settings (e.g. mdev for /dev handling), or on
> busybox' own config in Buildroot (e.g. support for individual binaries).
>
> Furthermore, for the imminent release, this is currently the simplest
> solution we have. We can refine it afterwards.
>
> Regards,
> Yann E. MORIN.

OK, I submitted a pull request upstream:

    https://github.com/OpenRC/openrc/pull/354

Meanwhile,

Tested-by: Carlos Santos <unixmania@gmail.com>
