From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Dec 2010 10:26:39 +0100
Subject: [Buildroot] [PATCH] Add libmodbus to buildroot.
In-Reply-To: <1292937354-20879-1-git-send-email-marek.belisko@open-nandra.com>
References: <1292937354-20879-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <20101223102639.23672613@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marek,

Thanks for proposing this package! I have a few comments below.

On Tue, 21 Dec 2010 14:15:54 +0100
Marek Belisko <marek.belisko@open-nandra.com> wrote:

> diff --git a/package/Config.in b/package/Config.in
> index 80aca2a..b29113c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -203,6 +203,7 @@ source "package/usbmount/Config.in"
>  source "package/usbutils/Config.in"
>  source "package/wipe/Config.in"
>  source "package/xfsprogs/Config.in"
> +source "package/libmodbus/Config.in"
>  endmenu

libmodbus sounds like a networking library rather than a hardware
handling utility. Therefore, could you move it to "Libraries ->
Networking" ?

Moreover, the entries in each category are alphabetically sorted, so
please put libmodbus at the right location.

> +LIBMODBUS_VERSION:=2.0.3
> +LIBMODBUS_SOURCE:=libmodbus-$(LIBMODBUS_VERSION).tar.gz
> +LIBMODBUS_SITE:=http://github.com/downloads/stephane/libmodbus/$(LIBMODBUS_SOURCE)

Unfortunately, this redirects to a https site, with an invalid
certificate:

ERROR: certificate common name `*.github.com' doesn't match requested
host name `github.com'.

So I had to add --no-check-certificate to wget's command line options.
Not sure what we should do about this :

 *) Always use --no-check-certificate for all downloads

 *) Add a new <pkg>_WGET_NO_CERTIFICATE=YES option to the package
    infrastructure.

 *) Something else ?

Moreover, this package being a library, you certainly want:

LIBMODBUS_INSTALL_STAGING=YES

in order to install headers, pkgconfig file and other stuff to the
$(STAGING_DIR).

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
