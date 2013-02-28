From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 28 Feb 2013 23:13:03 +0100
Subject: [Buildroot] [PATCH 08/30] jpeg: convert to a real package
In-Reply-To: <1362007582-14753-9-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362007582-14753-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMLphnmd1K_xMX3QR2pga-ptZK9+vRJ2O-4KeJM8BHTjuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

2013/2/28 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> jpeg is a virtual package, but since it is listed in the dependencies
> of other packages, it should obey to all the normal make rules for
> packages. Notably, the jpeg-show-depends target is mandatory for the
> graph-depends script to work.
>
> Instead to implement such a make target manually, make jpeg a normal
> generic-package, except that it doesn't have any source.
Nice, it also prevents from fault positive match (about the
infrastructure) in the autobuilder stats :)

>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/jpeg/jpeg.mk |   22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
> index 3caacaa..962908d 100644
> --- a/package/jpeg/jpeg.mk
> +++ b/package/jpeg/jpeg.mk
> @@ -1,10 +1,24 @@
>  #############################################################
>  #
> -# jpeg
> +# Virtual jpeg package
>  #
>  #############################################################
>
> -jpeg: $(if $(BR2_PACKAGE_JPEG_TURBO),jpeg-turbo,libjpeg)
> +JPEG_SOURCE =
>
> -host-jpeg: host-libjpeg
Does this change break few packages?
AFAICS, libeet and libevas seem depend on host-jpeg.

> -host-jpeg-source: host-libjpeg-source
> +ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
> +JPEG_DEPENDENCIES += jpeg-turbo
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBJPEG),y)
> +JPEG_DEPENDENCIES += libjpeg
> +endif
> +
> +ifeq ($(JPEG_DEPENDENCIES),)
> +define JPEG_CONFIGURE_CMDS
> +       echo "No JPEG implementation defined. Configuration error"
> +       exit 1
> +endef
> +endif
> +
> +$(eval $(generic-package))
> --

A bit off-topic: this is the first virtual package, it'd be good to
have a clean and known way of handling virtual packages.

Regards,


-- 
Samuel
