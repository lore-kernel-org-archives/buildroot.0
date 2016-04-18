From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 18 Apr 2016 11:38:00 +0200
Subject: [Buildroot] [PATCH v2] imx-uuc: add new package
In-Reply-To: <20160417225045.26b26138@free-electrons.com>
References: <1460544052-31608-1-git-send-email-gary.bisson@boundarydevices.com>
 <20160417225045.26b26138@free-electrons.com>
Message-ID: <CAAMH-yusq577jhLtDEHaJbYRpBD4KsLwGDzqDU1tD_k2fkie4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sun, Apr 17, 2016 at 10:50 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> The commit title should have been:
>
>         imx-uuc: new package
>
> (yes that's nitpicking)

No that's good to know, next time I'll make sure to name it like this.

> On Wed, 13 Apr 2016 12:40:52 +0200, Gary Bisson wrote:
> > diff --git a/package/freescale-imx/imx-uuc/Config.in b/package/freescale-imx/imx-uuc/Config.in
> > new file mode 100644
> > index 0000000..75e4c87
> > --- /dev/null
> > +++ b/package/freescale-imx/imx-uuc/Config.in
> > @@ -0,0 +1,19 @@
> > +config BR2_PACKAGE_IMX_UUC
> > +     bool "imx-uuc"
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS
> > +     depends on BR2_arm # Only relevant for i.MX
> > +     select BR2_PACKAGE_HOST_DOSFSTOOLS
> > +     help
> > +       This package provides the Universal Adapter user-space utility
> > +       that is used to receive commands from the Manufacturing Tool
> > +       using the Freescale UTP Protocol.
> > +
> > +       It requires a Freescale/NXP kernel whose configuration contains
> > +       the CONFIG_FSL_UTP option.
> > +
> > +       This package is provided by Freescale/NXP as-is and doesn't have
> > +       an upstream.
>
> Some of those lines were slightly too long, so I rewrapped.

What number of characters would you like to see? I always go by the
80-character line rule.

> > +
> > +comment "imx-uuc needs a toolchain w/ threads"
> > +     depends on BR2_ARM
>
> BR2_arm, not BR2_ARM.
>
> > +     depends on !BR2_TOOLCHAIN_HAS_THREADS
> > diff --git a/package/freescale-imx/imx-uuc/S80imx-uuc b/package/freescale-imx/imx-uuc/S80imx-uuc
> > new file mode 100644
> > index 0000000..8d6d8c1
> > --- /dev/null
> > +++ b/package/freescale-imx/imx-uuc/S80imx-uuc
> > @@ -0,0 +1,28 @@
> > +#!/bin/sh
> > +
> > +NAME=uuc
> > +DAEMON=/usr/bin/$NAME
> > +
> > +case "$1" in
> > +  start)
> > +    printf "Starting $NAME: "
> > +    start-stop-daemon -S -q -b -p /var/run/${NAME}.pid -x $DAEMON
> > +    echo "OK"
>
> I've added missing error checking here.
>
> > +    ;;
> > +  stop)
> > +    printf "Stopping $NAME: "
> > +    start-stop-daemon -K -q -p /var/run/${NAME}.pid
> > +    echo "OK"
>
> And here. I've also re-indented the init script to match the
> indentation used in S50dropbear (which I believe is more or less our
> reference).

Good to know too, I actually randomly copied one init script already
present (S53neard).

> > diff --git a/package/freescale-imx/imx-uuc/imx-uuc.hash b/package/freescale-imx/imx-uuc/imx-uuc.hash
> > new file mode 100644
> > index 0000000..aab9ea8
> > --- /dev/null
> > +++ b/package/freescale-imx/imx-uuc/imx-uuc.hash
> > @@ -0,0 +1 @@
> > +sha256 95d7f7b075f58fedc07602fbc0e5bf5212d28deea3d09cdbcbd80992dcd18482  imx-uuc-0.5.1.tar.gz
>
> Missing source for the hash, so I've assumed it had been locally
> calculated, and added the usual comment.

Yes it was locally, thanks.

> Applied with those changes, thanks!

No problem, I just want to add one thing that I discovered last week,
there's a Linux equivalent of the MFGTools developed by Ixonos:
https://github.com/ixonos/utp_com

It allows to do the same thing, send flashing scripts, executing
commands, flashing partitions etc... I might add it to the host
packages some day but it unfortunately depends on libsgutils2-dev for
the scsi headers in order to build. Not sure what the best approach
is.

Thanks,
Gary
