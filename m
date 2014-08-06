From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Wed, 6 Aug 2014 19:40:48 +0200 (CEST)
Subject: [Buildroot] [PATCH v2 3/3] rpi-userland: Fix vcfiled startup
In-Reply-To: <20140806173351.GF3891@free.fr>
References: <1407332350-27220-1-git-send-email-benoit.thebaudeau@advansee.com>
 <1407332350-27220-3-git-send-email-benoit.thebaudeau@advansee.com>
 <20140806173351.GF3891@free.fr>
Message-ID: <1234544963.1762589.1407346848783.JavaMail.zimbra@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wednesday, August 6, 2014 7:33:51 PM, Yann E. MORIN wrote:
> Benoit, All,
> 
> On 2014-08-06 15:39 +0200, Beno?t Th?baudeau spake thusly:
> > The VideoCore file server daemon startup script installed from this package
> > is
> > not compatible with BuildRoot (because of its naming and other Debian
> > dependencies), which prevented vcfiled from starting. Hence, prevent this
> > package from installing its vcfiled startup script, and install a vcfiled
> > SysV
> > init script suitable for BuildRoot.
> 
> I'm not sure I would be happy that the GPU is allowed uncontrolled
> access to the filesystem.
> 
> Please, make this an option, defaulting to 'n', so the user can
> willingly choose to install it or not.

Will do.

> Otherwise, see below...
> 
> > Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
> [--SNIP--]
> > diff --git a/package/rpi-userland/S94vcfiled
> > b/package/rpi-userland/S94vcfiled
> > new file mode 100755
> > index 0000000..25a0fcd
> > --- /dev/null
> > +++ b/package/rpi-userland/S94vcfiled
> > @@ -0,0 +1,47 @@
> > +#!/bin/sh
> > +
> > +NAME=vcfiled
> > +DESC="VideoCore file server daemon $NAME"
> > +DAEMON="/usr/sbin/$NAME"
> > +DAEMON_ARGS=""
> > +CFGFILE="/etc/default/$NAME"
> > +PIDFILE="/var/run/$NAME/$NAME"
> 
> Are you sure about the path to the PID file?
> What about:
>     PIDFILE="/var/run/$NAME.pid"

Yes, sure, this is the path used by vcfiled, which creates its PID file itself
rather than relying on start-stop-daemon -m for that.

> Othwerwise, looks good after a casual look. Ditto your previous patches,
> I'll try to find some time tonight to test it.

Thanks.

[...]

Regards,
Beno?t
