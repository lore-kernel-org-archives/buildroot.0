From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 22:37:28 +0200
Subject: [Buildroot] [PATCH v2] package/uacme: bump version to 1.2.2
In-Reply-To: <20200418212617.rmizagunxkkzwwom@einstein.dilieto.eu>
References: <20200418212617.rmizagunxkkzwwom@einstein.dilieto.eu>
Message-ID: <20200421223728.6f56ef29@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nicola,

On Sat, 18 Apr 2020 23:26:17 +0200
Nicola Di Lieto <nicola.dilieto@gmail.com> wrote:

> This version includes a new binary named "ualpn", a proxying
> ACMEv2 tls-alpn-01 responder.
> 
> Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>

I've applied, with some changes. See below.

> +if BR2_PACKAGE_UACME
> +
> +config BR2_PACKAGE_UACME_UALPN
> +	bool "enable ualpn"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBEV
> +	default y

We typically don't enable by default sub-options / optional features,
so I've dropped this "default y". It was also generating a "make
check-package" warning due to the ordering of statements.

> -UACME_VERSION = 1.0.22
> +UACME_VERSION = 1.2.2
>  # Released versions are on branch upstream/latest, tagged as
>  # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
>  # include .tarball-version
> @@ -26,4 +26,10 @@ UACME_CONF_OPTS += --with-openssl
>  UACME_DEPENDENCIES += openssl
>  endif
>  
> +ifeq ($(BR2_PACKAGE_UACME_UALPN),y)
> +UACME_DEPENDENCIES += libev

I've added a:

UACME_CONF_OPTS += --with-ualpn

as we like to be explicit when enabling and disabling features.l

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
