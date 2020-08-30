From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 30 Aug 2020 17:52:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/mrp: new package
In-Reply-To: <20200830083845.1402501-1-horatiu.vultur@microchip.com>
References: <20200830083845.1402501-1-horatiu.vultur@microchip.com>
Message-ID: <CAKcgs2w58TBPMAB5-V7wi3S5N-PLxwOGOy1DYFt47LWUmxPksA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Horatiu,

thanks for your contribution.
Please find a few comments below.

Le dim. 30 ao?t 2020 ? 10:39, Horatiu Vultur via buildroot
<buildroot@busybox.net> a ?crit :
>
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  DEVELOPERS            |  1 +
>  package/Config.in     |  1 +
>  package/mrp/Config.in | 11 +++++++++++
>  package/mrp/mrp.hash  |  3 +++
>  package/mrp/mrp.mk    | 13 +++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/mrp/Config.in
>  create mode 100644 package/mrp/mrp.hash
>  create mode 100644 package/mrp/mrp.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index b86e5f8169..fb09775cc5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1120,6 +1120,7 @@ F:        package/squeezelite/
>
>  N:     Horatiu Vultur <horatiu.vultur@microchip.com>
>  F:     package/easyframes/
> +F:     package/mrp/
This patch will not apply because the easyframes package is not in master yet.
You need to rebase to master before sending your patch.

>
>  N:     Ian Haylock <haylocki@yahoo.co.uk>
>  F:     package/python-rpi-gpio/
> diff --git a/package/Config.in b/package/Config.in
> index b1df81d7f1..0b9ffbad25 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2129,6 +2129,7 @@ menu "Networking applications"
>         source "package/mosh/Config.in"
>         source "package/mosquitto/Config.in"
>         source "package/mrouted/Config.in"
> +       source "package/mrp/Config.in"
>         source "package/mtr/Config.in"
>         source "package/nbd/Config.in"
>         source "package/ncftp/Config.in"
> diff --git a/package/mrp/Config.in b/package/mrp/Config.in
> new file mode 100644
> index 0000000000..a175e42288
> --- /dev/null
> +++ b/package/mrp/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_MRP
> +       bool "Media Redundancy Protocol"
> +       select BR2_PACKAGE_LIBEV
> +       select BR2_PACKAGE_LIBMNL
> +       select BR2_PACKAGE_LIBNL
libnl needs threads so mrp inherits its dependency (depends on
BR2_TOOLCHAIN_HAS_THREADS)

> +       help
> +         This is the userspace application that configures the kernel
> +         to run MRP protocol. The userspace application is made of 2
> +         applications, one deamon and a client.
> +
> +         https://github.com/microchip-ung/mrp
> diff --git a/package/mrp/mrp.hash b/package/mrp/mrp.hash
> new file mode 100644
> index 0000000000..8e416feb47
> --- /dev/null
> +++ b/package/mrp/mrp.hash
> @@ -0,0 +1,3 @@
> +# locally calculated
> +sha256 1a6c76d058bb425a7ec8b69a65de797650961161ec016b51ac8a1965e1ac304f mrp-1.1.tar.gz
> +sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE
In the lines above, the three fields need to be separated by two spaces.

> diff --git a/package/mrp/mrp.mk b/package/mrp/mrp.mk
> new file mode 100644
> index 0000000000..54efe54c55
> --- /dev/null
> +++ b/package/mrp/mrp.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# mrp
> +#
> +################################################################################
> +
> +MRP_VERSION = 1.1
> +MRP_SITE = $(call github,microchip-ung,mrp,v$(MRP_VERSION))
> +MRP_DEPENDENCIES = libev libmnl libnl
> +MRP_LICENSE = GPLv2
I would say it is GPLv2+ ("or any later version"), but I can never
tell to be honest

> +MRP_LICENSE_FILES = LICENSE
> +
> +$(eval $(cmake-package))
> --
> 2.27.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
Did you run the "test-pkg" script to check for potential issues
revealed by some architectures or build options?

Can you please send a v2 with the fixes mentioned above?
thanks
Gilles.
