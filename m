From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 28 Jun 2017 08:44:41 +0200
Subject: [Buildroot] [PATCH] rauc: new package
In-Reply-To: <20170628060724.12026-1-yurovsky@gmail.com>
References: <20170628060724.12026-1-yurovsky@gmail.com>
Message-ID: <CAGm1_ku6JnQPcWnOUjFno98Lp51A_FEE-HWLFwO5su9vgLzbvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andrey,

thanks for your contribution.

On Wed, Jun 28, 2017 at 8:07 AM, Andrey Yurovsky <yurovsky@gmail.com> wrote:
> RAUC is the Robust Auto-Update Controller developed by the folks at
> Penguintronix. It supports updating embedded systems from the network
> (ex: HawkBit) or from a disk and provides a d-bus interface.
>
> Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
> ---
>  package/rauc/Config.in | 18 ++++++++++++++++++
>  package/rauc/rauc.hash |  2 ++
>  package/rauc/rauc.mk   | 19 +++++++++++++++++++

An entry to the DEVELOPERS and package/Config.in files is missing.

>  3 files changed, 39 insertions(+)
>  create mode 100644 package/rauc/Config.in
>  create mode 100644 package/rauc/rauc.hash
>  create mode 100644 package/rauc/rauc.mk
>
> diff --git a/package/rauc/Config.in b/package/rauc/Config.in
> new file mode 100644
> index 0000000..8a210a4
> --- /dev/null
> +++ b/package/rauc/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_RAUC
> +       bool "rauc"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2
> +       depends on BR2_USE_WCHAR # glib2
> +       depends on BR2_USE_MMU # glib2
> +       select BR2_PACKAGE_LIBGLIB2
> +       select BR2_PACKAGE_DBUS
> +       select BR2_PACKAGE_DBUS_GLIB
> +       select BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_LIBCURL
> +       select BR2_PACKAGE_JSON_GLIB
> +       select BR2_PACKAGE_UTIL_LINUX
> +       select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
> +       help
> +         RAUC controls the update process on embedded Linux systems.
> +         See the documentation at
> +         https://rauc.readthedocs.io/en/latest/ for more
> +         information.

Though you have depends statements you don't provide a corresponding
message for the case where these dependencies are not met. See
package/modem-manager/Config.in for example.

> diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
> new file mode 100644
> index 0000000..7ee9798
> --- /dev/null
> +++ b/package/rauc/rauc.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  d867a81b9e414c8db9268851011fb2d404a3ee60ae297c007a2f140abfa607d1 rauc-v0.1.1.tar.gz
> diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
> new file mode 100644
> index 0000000..e036387
> --- /dev/null
> +++ b/package/rauc/rauc.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# rauc
> +#
> +################################################################################
> +
> +RAUC_VERSION = v0.1.1
> +RAUC_SITE = $(call github,rauc,rauc,$(RAUC_VERSION))
> +RAUC_LICENSE = GPL-2.1
> +RAUC_LICENSE_FILES = COPYING
> +RAUC_AUTORECONF = YES
> +RAUC_DEPENDENCIES = libcurl openssl libglib2 json-glib dbus-glib host-pkgconf \
> +                                       dbus util-linux
> +
> +HOST_RAUC_DEPENDENCIES = host-pkgconf
> +HOST_RAUC_CONF_OPTS = --disable-network --disable-json

Could you elaborate more on why rauc requires a host variant?

Yegor

> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> --
> 2.9.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
