From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 12 Jan 2018 11:45:58 +0100
Subject: [Buildroot] [PATCH 1/1] Added lldpad (LLDP Agent Daemon)
 package.
In-Reply-To: <20180112103508.17334-1-laurent_pubs@yahoo.com>
References: <20180112103508.17334-1-laurent_pubs@yahoo.com>
Message-ID: <CAGm1_ktAgP8eh_65Hf-A+E-Bx-DAHi2-F_dL8HJnV9XrZQ=VBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Laurent,

On Fri, Jan 12, 2018 at 11:35 AM, Laurent Charpentier
<laurent_pubs@yahoo.com> wrote:
> The lldpad package comes with utilities to manage an LLDP interface with
> support for reading and configuring TLVs. TLVs and interfaces are individual
> controlled allowing flexible configuration for TX only, RX only, or TX/RX
> modes per TLV.
>
> http://open-lldp.org/
>
> Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>
> ---
>  package/Config.in                                  |  1 +
>  .../open-lldp/0001-lldpad-vdptool-getline.patch    | 10 +++++++++
>  package/open-lldp/Config.in                        | 11 +++++++++
>  package/open-lldp/open-lldp.hash                   |  2 ++
>  package/open-lldp/open-lldp.mk                     | 26 ++++++++++++++++++++++

Please also add an entry to the DEVELOPERS file.

>  5 files changed, 50 insertions(+)
>  create mode 100644 package/open-lldp/0001-lldpad-vdptool-getline.patch
>  create mode 100644 package/open-lldp/Config.in
>  create mode 100644 package/open-lldp/open-lldp.hash
>  create mode 100644 package/open-lldp/open-lldp.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 01f4095be5..37e1e753e3 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1760,6 +1760,7 @@ endif
>         source "package/odhcp6c/Config.in"
>         source "package/odhcploc/Config.in"
>         source "package/olsr/Config.in"
> +       source "package/open-lldp/Config.in"
>         source "package/open-plc-utils/Config.in"
>         source "package/openntpd/Config.in"
>         source "package/openobex/Config.in"
> diff --git a/package/open-lldp/0001-lldpad-vdptool-getline.patch b/package/open-lldp/0001-lldpad-vdptool-getline.patch
> new file mode 100644
> index 0000000000..ac2e62ff16
> --- /dev/null
> +++ b/package/open-lldp/0001-lldpad-vdptool-getline.patch
> @@ -0,0 +1,10 @@
> +--- open-lldp-036e314/vdptool.c 2015-08-24 19:31:59.000000000 +0200
> ++++ open-lldp-036e314_patched/vdptool.c 2018-01-10 10:16:24.096431555 +0100
> +@@ -36,6 +36,7 @@
> +  * set and query VSI profile settings.
> +  */
> +
> ++#define _GNU_SOURCE
> + #include <stdlib.h>
> + #include <stdio.h>
> + #include <unistd.h>

The patch should be git formatted, have a proper commit log and your
Signed-off-by tag.

> diff --git a/package/open-lldp/Config.in b/package/open-lldp/Config.in
> new file mode 100644
> index 0000000000..84b24702c7
> --- /dev/null
> +++ b/package/open-lldp/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_OPEN_LLDP
> +        bool "open-lldp"
> +        select BR2_PACKAGE_LIBCONFIG
> +        select BR2_PACKAGE_LIBNL
> +        select BR2_PACKAGE_LIBTOOL
> +        select BR2_PACKAGE_READLINE
> +        help
> +         This package contains the Linux user space daemon and configuration
> +         tool for Intel LLDP Agent with Enhanced Ethernet support for the
> +         Data Center.
> +

Projects URL missing.

> diff --git a/package/open-lldp/open-lldp.hash b/package/open-lldp/open-lldp.hash
> new file mode 100644
> index 0000000000..6fef5b2999
> --- /dev/null
> +++ b/package/open-lldp/open-lldp.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 217124f24ac57d3191ab33c53fccf5d7319e83f9029610be3c3cb71392480a2a  open-lldp-036e314.tar.gz

checksum for licence file (README) is missing.

> diff --git a/package/open-lldp/open-lldp.mk b/package/open-lldp/open-lldp.mk
> new file mode 100644
> index 0000000000..5a69595b4f
> --- /dev/null
> +++ b/package/open-lldp/open-lldp.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# open-lldp
> +#
> +################################################################################
> +
> +OPEN_LLDP_VERSION = 036e314
> +OPEN_LLDP_SITE = git://open-lldp.org/open-lldp.git
> +OPEN_LLDP_SITE_METHOD = git
> +OPEN_LLDP_DEPENDENCIES = libconfig host-pkgconf libtool

What about libnl?

> +OPEN_LLDP_LICENSE = GPL-2.0
> +OPEN_LLDP_LICENSE_FILES = README
> +
> +OPEN_LLDP_AUTORECONF = YES
> +OPEN_LLDP_INSTALL_STAGING = YES
> +
> +OPEN_LLDP_CONF_OPTS = \
> +        --disable-static
> +
> +define OPEN_LLDP_BOOTSTRAP
> +        (cd $(@D) && ./bootstrap.sh)
> +endef

Why is this needed? Isn't OPEN_LLDP_AUTORECONF = YES sufficient?

Yegor

> +
> +OPEN_LLDP_PRE_CONFIGURE_HOOKS += OPEN_LLDP_BOOTSTRAP
> +
> +$(eval $(autotools-package))
> --
> 2.14.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
