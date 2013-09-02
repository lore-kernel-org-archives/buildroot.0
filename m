From: Markos Chandras <markos.chandras@gmail.com>
Date: Mon, 2 Sep 2013 12:36:04 +0100
Subject: [Buildroot] [PATCH v3] libsecret: New package
In-Reply-To: <1377685417-5813-1-git-send-email-markos.chandras@imgtec.com>
References: <1377685417-5813-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <CAG2jQ8j2SmMtG1o4e4xhcDyScU-Gz_61Ri-oUOOyaVN6jJ6r5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28 August 2013 11:23, Markos Chandras <markos.chandras@imgtec.com> wrote:
> libsecret is a library for storing and retrieving passwords
> and other secrets. It communicates with the "Secret Service"
> using DBus. gnome-keyring and ksecretservice are both
> implementations of a Secret Service.
>
> libsecret replaces libgnome-keyring.
>
> https://wiki.gnome.org/Libsecret
>
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
> Changes since v2:
> - Drop BR2_PACKAGE_LIBSECRET_CRYPTO and enable encryption if
> libgcrypt is selected
>
> Changes since v1:
> - depend on USE_WCHAR and TOOLCHAIN_HAS_THREADS which are required by libglib2
> http://lists.busybox.net/pipermail/buildroot/2013-August/076565.html
> ---
>  package/Config.in              |  1 +
>  package/libsecret/Config.in    | 15 +++++++++++++++
>  package/libsecret/libsecret.mk | 24 ++++++++++++++++++++++++
>  3 files changed, 40 insertions(+)
>  create mode 100644 package/libsecret/Config.in
>  create mode 100644 package/libsecret/libsecret.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 7069d77..93e280d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -423,6 +423,7 @@ source "package/libassuan/Config.in"
>  source "package/libmcrypt/Config.in"
>  source "package/libmhash/Config.in"
>  source "package/libnss/Config.in"
> +source "package/libsecret/Config.in"
>  source "package/libsha1/Config.in"
>  source "package/nettle/Config.in"
>  source "package/openssl/Config.in"
> diff --git a/package/libsecret/Config.in b/package/libsecret/Config.in
> new file mode 100644
> index 0000000..a15f995
> --- /dev/null
> +++ b/package/libsecret/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LIBSECRET
> +       bool "libsecret"
> +       select BR2_PACKAGE_LIBGLIB2
> +       depends on BR2_USE_WCHAR # gettext dep in libglib2
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +       help
> +         libsecret is a library for storing and retrieving passwords and other
> +         secrets. It communicates with the "Secret Service" using DBus.
> +         gnome-keyring and ksecretservice are both implementations of a Secret
> +         Service.
> +
> +         https://wiki.gnome.org/Libsecret
> +
> +comment "libsecret requires a toolchain with WCHAR and threading support."
> +       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
> new file mode 100644
> index 0000000..ebdfe11
> --- /dev/null
> +++ b/package/libsecret/libsecret.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# libsecret
> +#
> +################################################################################
> +
> +LIBSECRET_VERSION = 0.15
> +LIBSECRET_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsecret/$(LIBSECRET_VERSION)
> +LIBSECRET_SOURCE = libsecret-$(LIBSECRET_VERSION).tar.xz
> +LIBSECRET_LICENSE = LGPLv2.1+
> +LIBSECRET_LICENSE_FILES = COPYING
> +LIBSECRET_INSTALL_STAGING = YES
> +
> +LIBSECRET_DEPENDENCIES = libglib2
> +LIBSECRET_CONF_OPT = --disable-manpages --disable-strict --disable-coverage --enable-vala=no
> +
> +ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
> +       LIBSECRET_DEPENDENCIES += libgcrypt
> +       LIBSECRET_CONF_OPT += --enable-gcrypt
> +else
> +       LIBSECRET_CONF_OPT += --disable-gcrypt
> +endif
> +
> +$(eval $(autotools-package))
> --
> 1.8.3.2
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Ping? :) This package is needed for newer webkits which I intend to
submit a patch for it when libsecret package
is committed.

-- 
Regards,
Markos Chandras
