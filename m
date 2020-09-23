From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:17:57 +0200
Subject: [Buildroot] [PATCH 1/2] packages/librelp: new package.
In-Reply-To: <20200921165834.7514-2-dgouarin@gmail.com>
References: <20200921165834.7514-1-dgouarin@gmail.com>
 <20200921165834.7514-2-dgouarin@gmail.com>
Message-ID: <20200923221757.473e4407@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

Thanks for this contribution! I applied it, but after a number of
changes. See below.

On Mon, 21 Sep 2020 18:58:33 +0200
David GOUARIN <dgouarin@gmail.com> wrote:

> Reliable Logging Protocol library.
> 
> Signed-off-by: David GOUARIN <dgouarin@gmail.com>
> ---
>  package/Config.in            |  1 +
>  package/librelp/Config.in    | 10 ++++++++++
>  package/librelp/librelp.hash |  6 ++++++
>  package/librelp/librelp.mk   | 14 ++++++++++++++
>  4 files changed, 31 insertions(+)

You hard forgotten to add an entry in the DEVELOPERS file, so I've done
so.

>  create mode 100644 package/librelp/Config.in
>  create mode 100644 package/librelp/librelp.hash
>  create mode 100644 package/librelp/librelp.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 0282a2069f..5c1001cf7f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1806,6 +1806,7 @@ menu "Networking"
>  	source "package/zeromq/Config.in"
>  	source "package/zmqpp/Config.in"
>  	source "package/zyre/Config.in"
> +	source "package/librelp/Config.in"

This broke the alphabetic ordering.

> diff --git a/package/librelp/Config.in b/package/librelp/Config.in
> new file mode 100644
> index 0000000000..3bfe466bfa
> --- /dev/null
> +++ b/package/librelp/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_LIBRELP
> +	bool "librelp"
> +	select BR2_PACKAGE_GNUTLS

gnutls is not at all a mandatory dependency of librelp. So I made it
optional, and dropped the depends on !BR2_STATIC_LIBS and BR2_USE_WCHAR.

> diff --git a/package/librelp/librelp.mk b/package/librelp/librelp.mk
> new file mode 100644
> index 0000000000..6265a627cb
> --- /dev/null
> +++ b/package/librelp/librelp.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# librelp
> +#
> +################################################################################
> +
> +LIBRELP_VERSION = 1.2.16

I updated to 1.2.18

> +LIBRELP_SITE = http://download.rsyslog.com/librelp/librelp-1.2.16.tar.gz

This shouldn't be the full URL, but just the directory containing the
tarball.

> +LIBRELP_LICENSE = GPL-3.0

License is GPL-3.0+

> +LIBRELP_LICENSE_FILES = COPYING
> +LIBRELP_INSTALL_STAGING = YES
> +LIBRELP_DEPENDENCIES = gnutls

So I changed that to:

ifeq ($(BR2_PACKAGE_GNUTLS),y)
LIBRELP_DEPENDENCIES += gnutls host-pkgconf
LIBRELP_CONF_OPTS += --enable-tls
else
LIBRELP_CONF_OPTS += --disable-tls
endif

And applied with all those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
