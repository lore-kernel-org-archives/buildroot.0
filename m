From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Tue, 5 Aug 2014 20:48:36 +0200 (CEST)
Subject: [Buildroot] [PATCH 1/1] rpi-userland: Fix vcfiled startup
In-Reply-To: <20140804203352.310380a2@free-electrons.com>
References: <1407176456-13473-1-git-send-email-benoit.thebaudeau@advansee.com>
 <20140804203352.310380a2@free-electrons.com>
Message-ID: <1996668400.1722731.1407264516425.JavaMail.zimbra@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Monday, August 4, 2014 8:33:52 PM, Thomas Petazzoni wrote:
> Dear Beno?t Th?baudeau,
> 
> On Mon,  4 Aug 2014 20:20:56 +0200, Beno?t Th?baudeau wrote:
> > The VideoCore file server daemon SysV startup script installed from this
> > package
> > is not compatible with BuildRoot (because of its naming and other Debian
> > dependencies), which prevented vcfiled from starting. Hence, prevent this
> > package from installing its vcfiled startup script, and install a vcfiled
> > SysV
> > startup script suitable for BuildRoot.
> > 
> > Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
> 
> Thanks for this patch. Experts in rpi stuff will comment, but I have
> one question below:
> 
> 
> > diff --git a/package/rpi-userland/S97vcfiled
> > b/package/rpi-userland/S97vcfiled
> > new file mode 100755
> > index 0000000..87c4e76
> > --- /dev/null
> > +++ b/package/rpi-userland/S97vcfiled
> > @@ -0,0 +1,100 @@
> > +#! /bin/sh
> > +### BEGIN INIT INFO
> > +# Provides:          vcfiled
> > +# Required-Start:    udev
> > +# Required-Stop:     udev
> > +# Short-Description: VideoCore file server daemon
> > +### END INIT INFO
> 
> I don't think we need this header in Buildroot, since neither the
> Busybox init nor the sysvinit are making any use of it.

Right. I had kept this script as close as possible to the original script from
the package, but this is indeed not needed. I will drop that and simplify this
script as per Yann's comments.

> However, it indicates a dependency on udev, while the rpi-userland
> package certainly does not depend on udev.

Nothing in rpi-userland needs udev at build time, but vcfiled needs to access
/dev/vchiq at runtime, so something has to bring up this node. Whether it is a
static /dev, devtmpfs, udev or something else does not matter, so I don't think
that a dependency to udev should be added here.

> Also, this daemon was until not running on any rpi configuration
> according to what you said. So what it is useful for? Should it be
> mandatory for all rpi-userland installations, or optional?

I'm not certain here. This daemon sets up an interface giving the GPU access to
the file systems, but I don't know what applications use that if any. On some
forums, omxplayer or the hello_pi examples from rpi-userland are said to require
vcfiled, but I've tested them, and I couldn't make them fail without vcfiled.

I would need an RPi expert to answer this. Perhaps there was such a requirement
in the past that is less used nowadays. Anyway, this daemon is still installed
and started on Raspbian, so BuildRoot should probably do the same, all the more
this is part of the rpi-userland installation rules.

Best regards,
Beno?t
