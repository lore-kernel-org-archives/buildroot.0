From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 May 2020 19:06:53 +0200
Subject: [Buildroot] [PATCH] package/modem-manager: use libqmi and
 libmbim if they are selected
In-Reply-To: <20200419230056.7df2d309@windsurf.home>
References: <20191104124844.8112-1-unixmania@gmail.com>
 <20200419230056.7df2d309@windsurf.home>
Message-ID: <20200505170653.GG12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Aleksander, All,

On 2020-04-19 23:00 +0200, Thomas Petazzoni spake thusly:
> Hello Carlos, Aleksander, Yegor,
> 
> On Mon,  4 Nov 2019 09:48:44 -0300
> unixmania at gmail.com wrote:
> 
> > If we have a cnfiguration like this
> > 
> >     BR2_PACKAGE_MODEM_MANAGER=y
> >     # BR2_PACKAGE_MODEM_MANAGER_LIBMBIM is not set
> >     BR2_PACKAGE_MODEM_MANAGER_LIBQMI=y
> >     [...]
> >     BR2_PACKAGE_LIBMBIM=y
> 
> I had a new look at this. We need a new iteration of this patch, since
> the build issue doesn't exist anymore.
> 
> However, I would suggest to take a simpler approach:
> 
>  - Keep the BR2_PACKAGE_MODEM_MANAGER_LIBMBIM and
>    BR2_PACKAGE_MODEM_MANAGER_LIBQMI options.
> 
>  - Change modem-manager.mk to test BR2_PACKAGE_LIBMBIM and
>    BR2_PACKAGE_QMI instead of BR2_PACKAGE_MODEM_MANAGER_LIBMBIM and
>    BR2_PACKAGE_MODEM_MANAGER_LIBQMI.

Sorry, but I disagree here: a user who elects to not enable 'MBIM
support' in modem-manager, but otherwise has libmbim enabled (for
whatever reason) will in fact get a modem-mamanger that has support for
MBIM. This is definitely counter-intuitive.

Ditto libqmi.

So I would rather agree with the original patch from Carlos (except for
the legacy handling, which is indeed not needed).

> Also, as was pointed out during the discussion, it would be good to
> change the network-manager package to not force the modem-manager
> MBIM/QMI support when modem-manager support is enabled. I.e, remove the
> following lines:
> 
>         select BR2_PACKAGE_MODEM_MANAGER_LIBMBIM
>         select BR2_PACKAGE_MODEM_MANAGER_LIBQMI
> 
> from package/network-manager/Config.in

I do agree with that too, which must be done in a separate patch.

Regards,
Yann E. MORIN.

> Could one of you have a look ?
> 
> Thanks a lot!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
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
