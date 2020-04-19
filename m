From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 23:00:56 +0200
Subject: [Buildroot] [PATCH] package/modem-manager: use libqmi and
 libmbim if they are selected
In-Reply-To: <20191104124844.8112-1-unixmania@gmail.com>
References: <20191104124844.8112-1-unixmania@gmail.com>
Message-ID: <20200419230056.7df2d309@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos, Aleksander, Yegor,

On Mon,  4 Nov 2019 09:48:44 -0300
unixmania at gmail.com wrote:

> If we have a cnfiguration like this
> 
>     BR2_PACKAGE_MODEM_MANAGER=y
>     # BR2_PACKAGE_MODEM_MANAGER_LIBMBIM is not set
>     BR2_PACKAGE_MODEM_MANAGER_LIBQMI=y
>     [...]
>     BR2_PACKAGE_LIBMBIM=y

I had a new look at this. We need a new iteration of this patch, since
the build issue doesn't exist anymore.

However, I would suggest to take a simpler approach:

 - Keep the BR2_PACKAGE_MODEM_MANAGER_LIBMBIM and
   BR2_PACKAGE_MODEM_MANAGER_LIBQMI options.

 - Change modem-manager.mk to test BR2_PACKAGE_LIBMBIM and
   BR2_PACKAGE_QMI instead of BR2_PACKAGE_MODEM_MANAGER_LIBMBIM and
   BR2_PACKAGE_MODEM_MANAGER_LIBQMI.

Also, as was pointed out during the discussion, it would be good to
change the network-manager package to not force the modem-manager
MBIM/QMI support when modem-manager support is enabled. I.e, remove the
following lines:

        select BR2_PACKAGE_MODEM_MANAGER_LIBMBIM
        select BR2_PACKAGE_MODEM_MANAGER_LIBQMI

from package/network-manager/Config.in

Could one of you have a look ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
