From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 29 Jan 2018 09:50:24 +0100
Subject: [Buildroot] [PATCH] imx-m4fwloader: new package
In-Reply-To: <87inbmfjp5.fsf@dell.be.48ers.dk>
References: <20180124171050.11445-1-gary.bisson@boundarydevices.com>
 <87inbmfjp5.fsf@dell.be.48ers.dk>
Message-ID: <20180129085024.GA9423@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sun, Jan 28, 2018 at 09:53:26AM +0100, Peter Korsgaard wrote:
> >>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:
> 
>  > This package provides a tool to load a firmware to the Cortex-M4 core
>  > available in some i.MX processors such as i.MX6SX or i.MX7.
> 
>  > This package was tested on a i.MX7D Nitrogen7 platform:
>  >  # imx-m4fwloader hello_world.bin 0x007F8000
> 
>  > Upstream repository:
>  > https://github.com/codeauroraforum/imx-m4fwloader
> 
>  > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>  > ---
>  >  package/freescale-imx/Config.in                    |  1 +
>  >  package/freescale-imx/imx-m4fwloader/Config.in     |  9 +++++++++
>  >  .../imx-m4fwloader/imx-m4fwloader.hash             |  2 ++
>  >  .../freescale-imx/imx-m4fwloader/imx-m4fwloader.mk | 22 ++++++++++++++++++++++
>  >  4 files changed, 34 insertions(+)
>  >  create mode 100644 package/freescale-imx/imx-m4fwloader/Config.in
>  >  create mode 100644 package/freescale-imx/imx-m4fwloader/imx-m4fwloader.hash
>  >  create mode 100644 package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk
> 
>  > diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
>  > index e1dbdfb3e2..b5e5ab23dc 100644
>  > --- a/package/freescale-imx/Config.in
>  > +++ b/package/freescale-imx/Config.in
>  > @@ -72,6 +72,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
>  >  source "package/freescale-imx/imx-codec/Config.in"
>  >  source "package/freescale-imx/imx-kobs/Config.in"
>  >  source "package/freescale-imx/imx-lib/Config.in"
>  > +source "package/freescale-imx/imx-m4fwloader/Config.in"
>  >  source "package/freescale-imx/imx-parser/Config.in"
>  >  source "package/freescale-imx/imx-uuc/Config.in"
>  >  source "package/freescale-imx/imx-vpu/Config.in"
>  > diff --git a/package/freescale-imx/imx-m4fwloader/Config.in b/package/freescale-imx/imx-m4fwloader/Config.in
>  > new file mode 100644
>  > index 0000000000..b5d27a6856
>  > --- /dev/null
>  > +++ b/package/freescale-imx/imx-m4fwloader/Config.in
>  > @@ -0,0 +1,9 @@
>  > +config BR2_PACKAGE_IMX_M4FWLOADER
>  > +	bool "imx-m4fwloader"
>  > +	depends on BR2_arm # Only relevant for i.MX
> 
> What about the the m4's on mx8? It doesn't look supported yet though.

Exactly, the version will be bumped once i.MX8 will be supported. At
that point the dependency will be updated too.

Anyway the whole freescale-imx folder will need an upgrade to support
i.MX8 properly.

Maybe we should create a BR2_PACKAGE_FREESCALE_IMX_HAS_M4 macro so that
the package only appears when a supported platform is selected.

> > +	help
>  > +	  This package provides a tool to load a firmware to the
>  > +	  Cortex-M4 core available in some i.MX processors.
>  > +
>  > +	  Upstream repository:
>  > +	  https://github.com/codeauroraforum/imx-m4fwloader
> 
> We normally don't mention 'Upstream repository' before the URL, so I've
> dropped this.

Ok, thanks.

> > diff --git a/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.hash
>  > b/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.hash
>  > new file mode 100644
>  > index 0000000000..0331fd0880
>  > --- /dev/null
>  > +++ b/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.hash
>  > @@ -0,0 +1,2 @@
>  > +# Locally computed
>  > +sha256
>  > fb6334900972fe389e808845417dd9045fb0f7eb47952fc22a00f4cdaf94af1a
>  > imx-m4fwloader-8cf4d17a09ba23250d43381b49ba00d92406fad9.tar.gz
> 
> It would be nice to add the hash of the license file as well, so I've
> done that.

Ok, thanks, I'll do that next time.

>  > +define IMX_M4FWLOADER_INSTALL_TARGET_CMDS
>  > +	$(INSTALL) -D -m 755 $(@D)/imx-m4fwloader \
>  > +		$(TARGET_DIR)/usr/bin/imx-m4fwloader
> 
> The code accesses /dev/mem and a number of hardware registers, so it
> looks like you need to be root to use it - So I have moved it to
> /usr/sbin.

Makes sense.

> Committed with these fixes, thanks.

Thank you!

Gary
