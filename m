From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 14:51:47 +0100
Subject: [Buildroot] [PATCH 1/1] libdvbpsi: new package
In-Reply-To: <1451482256-11816-1-git-send-email-pieterjan.camerlynck@gmail.com>
References: <1451482256-11816-1-git-send-email-pieterjan.camerlynck@gmail.com>
Message-ID: <20151230145147.7640588b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution! See some comments below.

On Wed, 30 Dec 2015 14:30:56 +0100, Pieterjan Camerlynck wrote:
> libdvbpsi is a library used by vlc for decoding MPEG TS
> 
> Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
> ---
>  package/Config.in                |  1 +
>  package/libdvbpsi/Config.in      |  8 ++++++++
>  package/libdvbpsi/libdvbpsi.hash |  4 ++++
>  package/libdvbpsi/libdvbpsi.mk   | 15 +++++++++++++++
>  package/vlc/vlc.mk               |  7 +++++++

These should be two separate patches:

 - One patch adding the libdvbspi package
 - One patch adding its use to the vlc package

> diff --git a/package/libdvbpsi/Config.in b/package/libdvbpsi/Config.in
> new file mode 100644
> index 0000000..7323466
> --- /dev/null
> +++ b/package/libdvbpsi/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBDVBPSI
> +	bool "libdvbpsi"

No toolchain dependencies on threads, MMU or anything like that? It is
possible indeed, but if you could verify building this library with the
following toolchain configurations, it would be useful:

http://autobuild.buildroot.org/toolchains/configs/bfin-uclinux.config
http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config
http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config

> diff --git a/package/libdvbpsi/libdvbpsi.mk b/package/libdvbpsi/libdvbpsi.mk
> new file mode 100644
> index 0000000..c45ade0
> --- /dev/null
> +++ b/package/libdvbpsi/libdvbpsi.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# libdvbpsi
> +#
> +################################################################################
> +
> +LIBDVBPSI_VERSION = 1.3.0
> +LIBDVBPSI_SITE = http://download.videolan.org/pub/libdvbpsi/$(LIBDVBPSI_VERSION)
> +LIBDVBPSI_SOURCE = libdvbpsi-$(LIBDVBPSI_VERSION).tar.bz2
> +LIBDVBPSI_LICENSE = LGPLv2.1+
> +LIBDVBPSI_LICENSE_FILES = COPYING
> +LIBDVBPSI_AUTORECONF = YES

Why do you need the autoreconf ? There is a pre-generated configure
script in the tarball, so it should be necessary. If it is necessary
for some reason, could you add a comment above this line explaining why?

Other than that, looks good. Could you send an updated version that
takes into account those comments ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
