From: Aleksander Morgado <aleksander@aleksander.es>
Date: Wed, 6 May 2020 15:09:01 +0200
Subject: [Buildroot] [PATCH] package/modem-manager: use libqmi and
 libmbim if they are selected
In-Reply-To: <20200505170653.GG12536@scaer>
References: <20191104124844.8112-1-unixmania@gmail.com>
 <20200419230056.7df2d309@windsurf.home>
 <20200505170653.GG12536@scaer>
Message-ID: <CAAP7ucJ1XRa4EkPhM2+bhBX_9J9DwzpYzsFVxhub75musfQozA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Yann,

> > >     BR2_PACKAGE_MODEM_MANAGER=y
> > >     # BR2_PACKAGE_MODEM_MANAGER_LIBMBIM is not set
> > >     BR2_PACKAGE_MODEM_MANAGER_LIBQMI=y
> > >     [...]
> > >     BR2_PACKAGE_LIBMBIM=y
> >
> > I had a new look at this. We need a new iteration of this patch, since
> > the build issue doesn't exist anymore.
> >
> > However, I would suggest to take a simpler approach:
> >
> >  - Keep the BR2_PACKAGE_MODEM_MANAGER_LIBMBIM and
> >    BR2_PACKAGE_MODEM_MANAGER_LIBQMI options.
> >
> >  - Change modem-manager.mk to test BR2_PACKAGE_LIBMBIM and
> >    BR2_PACKAGE_QMI instead of BR2_PACKAGE_MODEM_MANAGER_LIBMBIM and
> >    BR2_PACKAGE_MODEM_MANAGER_LIBQMI.
>
> Sorry, but I disagree here: a user who elects to not enable 'MBIM
> support' in modem-manager, but otherwise has libmbim enabled (for
> whatever reason) will in fact get a modem-mamanger that has support for
> MBIM. This is definitely counter-intuitive.
>
> Ditto libqmi.
>
> So I would rather agree with the original patch from Carlos (except for
> the legacy handling, which is indeed not needed).
>

I have very mixed feelings here. I do agree with you in the sense that
yes, if the software allows the possibility of having the system with
libmbim installed *and* ModemManager *without MBIM* support installed,
then why not allow that? It even gets more complicated than that
actually, because libqmi may also be compiled with or without MBIM
support (for the QMI over MBIM transport), so if we're up to adding
lots of config options, we could even handle that as well, otherwise
why even bother with the MM config options. In MM 1.14 there is also
going to be the possibility to select which plugins to build and
install, if users only need some. Really, we can make it as complex as
we want build config wise.

But, on the other hand, I truly fail to see a case where a user may
want to have libmbim installed and MM built without MBIM support (I
haven't seen such a use case myself, and believe me I've seen lots of
use cases!). Or both libmbim and libqmi installed but MM only built
with QMI support and not MBIM. And what if MM wants to have MBIM and
QMI support but libqmi hasn't been built with MBIM support? I think we
would be making it complex for the sake of complexity, instead of just
making it simple. The fact that MM was built with the possibility to
disable MBIM support was really thought for the case where the system
isn't going to have ever a MBIM device so you can "save" the kernel
driver, the libmbim library, and still have MM to handle e.g. AT
modems. Simplifying the config I think is good, and I kind of liked
Thomas' suggestion here.

If I have to select among both points of view, I would really prefer
simplifying, because it really just makes sense to have MBIM support
in both libqmi and ModemManager if libmbim is installed, and same for
libqmi. If we don't do that, I'm sure we'll get lots of users
selecting the wrong configurations and having to debug why the hell MM
isn't processing the QMI modem if libqmi and qmicli can happily talk
to the device, for example. Removing config options isn't always bad,
sometimes it's actually better in the long run.

This is just my opinion, and as I said, is not a strong one :D

> > Also, as was pointed out during the discussion, it would be good to
> > change the network-manager package to not force the modem-manager
> > MBIM/QMI support when modem-manager support is enabled. I.e, remove the
> > following lines:
> >
> >         select BR2_PACKAGE_MODEM_MANAGER_LIBMBIM
> >         select BR2_PACKAGE_MODEM_MANAGER_LIBQMI
> >
> > from package/network-manager/Config.in
>
> I do agree with that too, which must be done in a separate patch.
>

There's a separate patch doing that already, it's also in the mailing list.

Cheers!

-- 
Aleksander
https://aleksander.es
