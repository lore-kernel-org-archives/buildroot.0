From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Oct 2019 22:36:39 +0200
Subject: [Buildroot] [PATCH] package/qemu: enable usb passthrough on
 host variant
In-Reply-To: <20191024202820.18814-1-angelo@amarulasolutions.com>
References: <20191024202820.18814-1-angelo@amarulasolutions.com>
Message-ID: <20191024223639.28125bf8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Oct 2019 22:28:20 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> Usb passthrough is a useful feature while using qemu for debugging
> purpose.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/qemu/qemu.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 1d3759a850..4cf1c60030 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -264,6 +264,11 @@ else
>  HOST_QEMU_OPTS += --disable-virtfs
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBUSB),y)

So, if the target libusb package is enabled...

> +HOST_QEMU_OPTS += --enable-libusb
> +HOST_QEMU_DEPENDENCIES += host-libusb

... you assume the user wants libusb support in host-qemu.

Sorry, but this is not good. Add an option in
package/qemu/Config.in.host to enable USB passthrough, and use that in
qemu.mk.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
