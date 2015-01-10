From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 10 Jan 2015 22:58:35 +0100
Subject: [Buildroot] [PATCH] Linux kernel module for Waveshare 3.2inch
 RPi LCD (B) V3 touch controller
In-Reply-To: <trinity-cbe01d4d-fd87-49aa-8ede-917724c6d5a9-1420922210427@3capp-gmx-bs51>
References: <trinity-cbe01d4d-fd87-49aa-8ede-917724c6d5a9-1420922210427@3capp-gmx-bs51>
Message-ID: <20150110215835.GD3934@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-01-10 21:36 +0100, Peter Seiderer spake thusly:
> On Sat, Jan 10, 2015 at 12:03:01PM +0100, Yann E. MORIN wrote:
> >     $ xz --version
> >     xz (XZ Utils) 5.1.0alpha
> >     liblzma 5.1.0alpha
> $  xz --version
> xz (XZ Utils) 5.0.7
> liblzma 5.0.7
> 
> $ unxz --single-stream
> unxz: unrecognized option '--single-stream'
> unxz: Try `unxz --help' for more information.
> 
> Seems xz package on openSUSE 13.2 is not up to date....

Damn, then you need to build host-xz in Buidroot.

> > > it possible to run mkknlimg automatically (with buildroot host/usr/bin path)
> > > to avoid such errors (and avoid someone installing zImage without running
> > > mkknlimg)?
> > 
> > OK, so it seems you do not have xz on your host, and that you rely on
> > the one built by Buildroot, right?
> > 
> > And no, it is not possible to do it in the current Buildroot
> > infrastructure:
> > 
> >   - there's no way a package can declare hook (whichever) for another
> >     package,
> > 
> >   - we do not want to add anything platform-specific to the kernel.
> >
> 
> But for other tools buildroot provides host support packages?
> 
> Would something like the following be feasible with buildroot (host-xz
> has to be done, totally untested):

Well, we already have host-xz.

> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -12,7 +12,7 @@ RPI_FIRMWARE_INSTALL_TARGET = NO
>  RPI_FIRMWARE_INSTALL_IMAGES = YES
>  
>  ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
> -RPI_FIRMWARE_DEPENDENCIES += host-rpi-firmware
> +RPI_FIRMWARE_DEPENDENCIES += host-rpi-firmware host-xz linux
>  # Override the version in this case.
>  RPI_FIRMWARE_VERSION = e42ddc0b04353cc292ce5215eea81484d72c5d09
>  define RPI_FIRMWARE_INSTALL_DTB
> @@ -40,6 +40,7 @@ HOST_RPI_FIRMWARE_DEPENDENCIES =
>  
>  define HOST_RPI_FIRMWARE_INSTALL_CMDS
>         $(INSTALL) -D -m 0755 package/rpi-firmware/mkknlimg $(HOST_DIR)/usr/bin/mkknlimg
> +       $(HOST_DIR)/usr/bin/mkknlimg $(BINARIES_DIR)/zImage $(BINARIES_DIR)/rpi_zImage
>  endef

That does not work, because the kernel may well be built outside of
Buildroot, in which case the user would have to do it all by himself
anyway.

So, I'd prefer we do not dwelve too much on the side of what can easily
be done in a post-build script.

Script which we could provide, of course. ;-) I'll propose something
shortly...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
