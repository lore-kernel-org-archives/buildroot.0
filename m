From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Apr 2021 15:15:50 +0200
Subject: [Buildroot] [PATCH 2/2] package: add kmscon
In-Reply-To: <DZ_khlMLS7ElBO-RugCaKTq7GSwoRSec11vXyQ1bDzBCaD4ZVEj39iTQyxp37uQila1SHNg2k5CN50OR3z4i07WQvg0itb74fceeX18yFiE=@protonmail.com>
References: <DZ_khlMLS7ElBO-RugCaKTq7GSwoRSec11vXyQ1bDzBCaD4ZVEj39iTQyxp37uQila1SHNg2k5CN50OR3z4i07WQvg0itb74fceeX18yFiE=@protonmail.com>
Message-ID: <20210404131550.GJ2252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"qblade", All,

Thanks for your contribution! :-) Please see below a few comments...

On 2021-04-03 14:17 +0000, qblade via buildroot spake thusly:
> From fe3afe752b75094eaa1e67d3130a78b82487ccac Mon Sep 17 00:00:00 2001
> From: qblade <qblade@protonmail.com>
> Date: Sat, 3 Apr 2021 14:10:11 +0000
> Subject: [PATCH 2/2] package: add kmscon
> 
> Signed-off-by: qblade <qblade@protonmail.com>

We will need you to submit using your real name, please, both as the
author of the commit (i.e. as the mail From:) and in the Signed-off-by
line.

> ---
>  package/Config.in          |  1 +
>  package/kmscon/Config.in   | 13 +++++++++++++
>  package/kmscon/kmscon.hash |  2 ++
>  package/kmscon/kmscon.mk   | 14 ++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/kmscon/Config.in
>  create mode 100644 package/kmscon/kmscon.hash
>  create mode 100644 package/kmscon/kmscon.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index ca86e3dd2e..4d689a88b4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -321,6 +321,7 @@ comment "Graphic libraries"
>  	source "package/freerdp/Config.in"
>  	source "package/graphicsmagick/Config.in"
>  	source "package/imagemagick/Config.in"
> +        source "package/kmscon/Config.in"
>  	source "package/linux-fusion/Config.in"
>  	source "package/lite/Config.in"
>  	source "package/mesa3d/Config.in"
> diff --git a/package/kmscon/Config.in b/package/kmscon/Config.in
> new file mode 100644
> index 0000000000..356d5f497d
> --- /dev/null
> +++ b/package/kmscon/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_KMSCON
> +	bool "kmscon"
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_TOOLCHAIN_HAS_SSP

The order of dependencies are:
  - architeciture dependencies (none here)
  - toolchain dependencies (SSP; threads, see below)
  - system dependencies (udev)
  - other packages (none here)

> +	select BR2_PACKAGE_LIBDRM

libdrm dependends on threads, so you need to propagate that dependency:
    depends on BR2_TOOLCHAIN_HAS_THREADS  # libdrm

> +	select BR2_PACKAGE_LIBTSM
> +	select BR2_PACKAGE_XKEYBOARD_CONFIG # keyboard layout support

No need for the comment, except as it is a runtime dependency:

    select BR2_PACKAGE_XKEYBOARD_CONFIG # runtime

> +	help
> +	  Kmscon is a simple terminal emulator based on linux kernel
> +	  mode setting (KMS). It is an attempt to replace the in-kernel
> +	  VT implementation with a userspace console.
> +
> +	https://www.freedesktop.org/wiki/Software/kmscon/

This there are dependencies on toolchain fetures, you will want to add a
comment:

    comment "kmscon needs udev, and a toolchain w/ SSP, threads"
        depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_SSP \
                || !BR2_PACKAGE_HAS_UDEV

> diff --git a/package/kmscon/kmscon.hash b/package/kmscon/kmscon.hash
> new file mode 100644
> index 0000000000..134e39285b
> --- /dev/null
> +++ b/package/kmscon/kmscon.hash
> @@ -0,0 +1,2 @@
> +sha256 9f4a8c643dc8c7f551cf0f1bd4c6059a019c162c147178aa00a5c09eff8b9fbe  kmscon-01dd0a231e2125a40ceba5f59fd945ff29bf2cdc.tar.gz
> +sha256 bf738bc59e8608b783e35d61f49705cdbf668b611d13a32483d734c38dc289f9  COPYING
> diff --git a/package/kmscon/kmscon.mk b/package/kmscon/kmscon.mk
> new file mode 100644
> index 0000000000..03e075f019
> --- /dev/null
> +++ b/package/kmscon/kmscon.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# kmscon
> +#
> +################################################################################
> +
> +KMSCON_VERSION = 01dd0a231e2125a40ceba5f59fd945ff29bf2cdc
> +KMSCON_SITE = $(call github,Aetf,kmscon,$(KMSCON_VERSION))
> +KMSCON_AUTORECONF = YES
> +KMSCON_DEPENDENCIES = host-automake host-autoconf host-libtool libxkbcommon libtsm udev libdrm

host-automake, host-autoconf, and host-libtool are already implied by
the autootls-package infrastructure. Keep the other dependencies in
alphabetical order.

Care to address the above and respin a new iteration, please?

Regards,
Yann E. MORIN.

> +KMSCON_LICENSE = MIT, LGPL-2.1+, BSD-2-Clause, GPL-2.0+
> +KMSCON_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))
> --
> 2.31.1
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
