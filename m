From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:36:04 +0200
Subject: [Buildroot] [PATCH] libqmi: udev and qmi-over-mbim are optional
In-Reply-To: <20170905100327.21421-1-aleksander@aleksander.es>
References: <20170905100327.21421-1-aleksander@aleksander.es>
Message-ID: <20170905213604.61141da0@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Sep 2017 12:03:27 +0200, Aleksander Morgado wrote:
> Don't always build without udev, as qmi-firmware-update would be very
> very limited in that case. Instead, make it optional: if there is udev
> support in the setup, require libgudev and configure using --with-udev
> explicitly; otherwise just --without-udev.
> 
> Also, add the qmi-over-mbim feature as optional, and require libmbim
> if we're building with it enabled.
> 
> Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
> ---
>  package/libqmi/Config.in | 18 ++++++++++++++++++
>  package/libqmi/libqmi.mk | 18 ++++++++++++++++--
>  2 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libqmi/Config.in b/package/libqmi/Config.in
> index f1d111b7c..a536650b5 100644
> --- a/package/libqmi/Config.in
> +++ b/package/libqmi/Config.in
> @@ -10,6 +10,24 @@ config BR2_PACKAGE_LIBQMI
>  
>  	  http://www.freedesktop.org/wiki/Software/libqmi/
>  
> +if BR2_PACKAGE_LIBQMI
> +
> +config BR2_PACKAGE_LIBQMI_UDEV
> +	bool "qmi-firmware-update udev support"
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	select BR2_PACKAGE_LIBGUDEV

libgudev has plenty of other dependencies that you need to propagate
here.

> +	help
> +	  This option enables udev support in the qmi-firmware-update tool
> +
> +config BR2_PACKAGE_LIBQMI_MBIM_QMUX
> +	bool "QMI-over-MBIM support"
> +	select BR2_PACKAGE_LIBMBIM

... and libmbim also has plenty of dependencies that you need to
propagate here, including BR2_PACKAGE_HAS_UDEV.

All in all, isn't it simpler to get rid of those options, and simply do:

ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
... enable support
else
... disable support
endif

ifeq ($(BR2_PACKAGE_LIBMBIM),y)
... enable support
else
... disable support
endif

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
