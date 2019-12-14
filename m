From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 23:55:27 +0100
Subject: [Buildroot] [PATCH 3/3] package/libnfc: add configs to select
 which driver to support
In-Reply-To: <20191209215923.28945-3-aussedat.louis@gmail.com>
References: <20191209215923.28945-1-aussedat.louis@gmail.com>
 <20191209215923.28945-3-aussedat.louis@gmail.com>
Message-ID: <20191214235527.59cc91e7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Louis,

On Mon,  9 Dec 2019 22:59:23 +0100
Louis Aussedat <aussedat.louis@gmail.com> wrote:

> By default, arygon and pn53x_usb are activated,
> to keep old configuration.

I've improved a bit the commit log:

    package/libnfc: add sub-options to enable individual drivers
    
    Until now, the arygon and pn53x_usb were unconditionally enabled, and
    there were no options to choose other drivers. Therefore, we had
    sub-options for each individual driver, keeping arygon and pn53x_usb
    enabled by default to preserve backward compatibility.
    
    Also, due to this, the BR2_TOOLCHAIN_HAS_THREADS dependency on the
    libnfc package is no longer needed, and is only needed for some of the
    sub-options.

Also, see below some comments.

> diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
> index c8fe251459..9a1c8103ec 100644
> --- a/package/libnfc/Config.in
> +++ b/package/libnfc/Config.in
> @@ -1,8 +1,6 @@
>  config BR2_PACKAGE_LIBNFC
>  	bool "libnfc"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb

This dependency was no longer needed, as it was due to libusb, so it
has to be moved down to the sub-options that select libusb.

> -	select BR2_PACKAGE_LIBUSB
> -	select BR2_PACKAGE_LIBUSB_COMPAT
>  	help
>  	  Public platform independent Near Field Communication (NFC)
>  	  library.
> @@ -11,6 +9,59 @@ config BR2_PACKAGE_LIBNFC
>  
>  if BR2_PACKAGE_LIBNFC
>  
> +config BR2_PACKAGE_LIBNFC_ACR122_PCSC
> +	bool "acr122_pcsc driver"
> +	default ""

default "" doesn't make much sense for a boolean option, and the
default value for a boolean is to be disabled, so there is nothing to
do. I just removed all default "" lines.

> +	select BR2_PACKAGE_PCSC_LITE

You can't select options like this: you need to replicate their
dependencies.

I fixed up the above issues, and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
