From: Aleksander Morgado <aleksander@aleksander.es>
Date: Mon, 4 Nov 2019 15:36:01 +0100
Subject: [Buildroot] [PATCH] package/modem-manager: use libqmi and
 libmbim if they are selected
In-Reply-To: <CAJ4jsae0hh6p=eRUKO8459JiGWc5-X2XfmkwwwAzSEJFZ4-tPA@mail.gmail.com>
References: <20191104124844.8112-1-unixmania@gmail.com>
 <CAAP7uc+4wKRfD1ZEKLVEbOGOiyzGGM317P_NntBhXhqFiQFuVA@mail.gmail.com>
 <CAJ4jsae0hh6p=eRUKO8459JiGWc5-X2XfmkwwwAzSEJFZ4-tPA@mail.gmail.com>
Message-ID: <CAAP7ucJJJz8CQoNhp7wiuiXukk6bp1ihhDMk4pnduHcnNAA3Ng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Carlos!

> > > If we have a cnfiguration like this
> > >
> > >     BR2_PACKAGE_MODEM_MANAGER=y
> > >     # BR2_PACKAGE_MODEM_MANAGER_LIBMBIM is not set
> > >     BR2_PACKAGE_MODEM_MANAGER_LIBQMI=y
> > >     [...]
> > >     BR2_PACKAGE_LIBMBIM=y
> > >
> > > then libqmi is configured with --enable-mbim-qmux and requires libmbim
> > > so ModemManager must be configured --with-mbim otherwise it fails to
> > > link due to missing libmbim symbols required by libqmi:
> > >
> > >     qmi-endpoint-mbim.c:(.text+0x158): undefined reference to `mbim_device_close_finish'
> > >
> >
> > Wouldn't this Libs.private fix in libqmi solve this specific build
> > problem? See http://lists.busybox.net/pipermail/buildroot/2019-October/264787.html
>
> Yes, but it passed below my radar due to ETOOMUCHMAIL. :-)
>
> > > Prevent this kind of error by using a simpler approach:
> > >
> > > - Always enable MBIM support if libmbim is selected
> > > - Drop BR2_PACKAGE_MODEM_MANAGER_LIBMBIM and add a legacy option that
> > >   selects BR2_PACKAGE_LIBMBIM
> > > - Always enable QMI support if libqmi is selected
> > > - Drop BR2_PACKAGE_MODEM_MANAGER_LIBQMI and add a legacy option that
> > >   selects BR2_PACKAGE_LIBQMI
> > > - Update the help text explaining how to enable MBIM and QMI
> > >
> >
> > It is true that the current setup may lead to a strange configuration
> > where ModemManager may be built with only QMI support and no explicit
> > MBIM support while at the same time libqmi is built with MBIM support.
> > That would not be any problem per se, it would just be weird.
> >
> > I'm not totally sure how these settings are usually preferred in
> > buildroot, truth be told. Maybe someone with more experience in
> > buildroot itself could suggest how to best handle this? Is it better
> > to have a setting in the ModemManager package to enable/disable
> > features explicitly? Or is it better to implicitly enable/disable
> > those features based on whether some other packages are also included
> > in the build? I guess the question would be whether we want to have a
> > non-QMI non-MBIM capable ModemManager installed at the same time as
> > libqmi+qmicli/libmbim+mbimcli. I have absolutely no idea whether this
> > is a real usecase for anyone or not, truth be told. If it is (or may
> > be) a real usecase, then I don't think this patch should go in.
>
> The main client of ModemManager is NetworkManager, which always
> selects MBIM and QMI support, so I don't believe it would make much
> difference, in practice.
>

If you ask me, the NetworkManager package should not select
BR2_PACKAGE_MODEM_MANAGER_LIBMBIM or BR2_PACKAGE_MODEM_MANAGER_LIBQMI.
The ModemManager API that NetworkManager uses doesn't in any way
change based on whether QMI/MBIM support is enabled, it's really
orthogonal.
@Yegor Yefremov what's your take on this?

-- 
Aleksander
https://aleksander.es
