From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 12 Jan 2015 23:31:32 +0100
Subject: [Buildroot] [PATCH v2 3/4] dtc: add host build
In-Reply-To: <20150112214233.3f5edf16@free-electrons.com>
References: <1421000166-24963-1-git-send-email-ps.report@gmx.net>
 <1421000166-24963-3-git-send-email-ps.report@gmx.net>,
 <20150112214233.3f5edf16@free-electrons.com>
Message-ID: <trinity-fdc08e6a-dd1c-474f-bef4-0be9886a590e-1421101892810@3capp-gmx-bs16>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Gesendet: Montag, 12. Januar 2015 um 21:42 Uhr
> Von: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net
> Betreff: Re: [Buildroot] [PATCH v2 3/4] dtc: add host build
>
> Dear Peter Seiderer,
> 
> On Sun, 11 Jan 2015 19:16:05 +0100, Peter Seiderer wrote:
> 
> > diff --git a/package/dtc/Config.in.host b/package/dtc/Config.in.host
> > new file mode 100644
> > index 0000000..cbabf0a
> > --- /dev/null
> > +++ b/package/dtc/Config.in.host
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_HOST_DTC
> > +	bool "host dtc"
> > +	help
> > +	  The Device Tree Compiler, dtc, takes as input a device-tree in
> > +	  a given format and outputs a device-tree in another format.
> > +
> > +	  Install host tools: dtc, convert-dtsv0, fdtdump, fdtget and fdtput.
> > +
> > +	  https://git.kernel.org/cgit/utils/dtc/dtc.git
> 
> I'd like to understand a bit more how this is going to be used exactly,
> to see whether there is really a need for a menuconfig option for this
> host package. Most host packages are merely build dependencies for
> another package, and as such, don't need to appear in menuconfig.
> 
> How is host dtc going to be used in your use case?

With the host dtc tools I can build/rebuild (and debug) the needed
dtb files for my Raspberry Pi. With the overlay extension (see next
patch in the series) it is possible do deploy extra overlays
e.g. enable i2c/spi etc. when using Yann's rpi update [1].

I can give a complete example soon, now I have my rpi tft display
runnnig, needed to adjust the videocore dtb to enable the
4 buttons (set gpio pins to pull_up, see [2] for description)
and enable spi with an dtb overlay (see [3] for description)...

[1] http://lists.busybox.net/pipermail/buildroot/2015-January/116918.html
[2] http://www.raspberrypi.org/documentation/configuration/pin-configuration.md
[3] https://github.com/raspberrypi/documentation/blob/master/configuration/device-tree.md

The videcore dbt adjusting could be done with the kernel-tree provided dtc,
the overlay support needs a patched dtc...

> 
> > +# host build
> > +HOST_DTC_DEPENDENCIES = host-bison host-flex
> 
> Not really needed, those dependencies are automatically inherited from
> DTC_DEPENDENCIES.

O.k. thats fine, will remove...
> 
> > +define HOST_DTC_BUILD_CMDS
> > +	$(HOST_CONFIGURE_OPTS)    \
> > +	CFLAGS="$(HOST_CFLAGS)"   \
> 
> Not needed, this definition of CFLAGS is already in
> $(HOST_CONFIGURE_OPTS).
> 

O.k., will remove...

Regards,
Peter

> Otherwise, looks good.
> 
> Thanks,
> 
> Thomas Petazzoni
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
