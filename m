From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 20:37:51 +0200
Subject: [Buildroot] [PATCH 1/1] upmpdcli: new package
In-Reply-To: <1405371167-25884-1-git-send-email-jkrause@posteo.de>
References: <1405371167-25884-1-git-send-email-jkrause@posteo.de>
Message-ID: <20140716203751.5ccab1c6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joerg Krause,

On Mon, 14 Jul 2014 22:52:47 +0200, Joerg Krause wrote:
> This patch adds support for the package upmpdcli. 
> 
> Signed-off-by: Joerg Krause <jkrause@posteo.de>

Thanks, I've applied your patch, but there were a number of issues.

> ---
>  package/upmpdcli/Config.in   | 16 ++++++++++++++++

This file was never included in package/Config.in, so there was no way
to enable the package.

>  package/upmpdcli/S99upmpdcli | 40 ++++++++++++++++++++++++++++++++++++++++
>  package/upmpdcli/upmpdcli.mk | 22 ++++++++++++++++++++++
>  3 files changed, 78 insertions(+)
>  create mode 100644 package/upmpdcli/Config.in
>  create mode 100644 package/upmpdcli/S99upmpdcli
>  create mode 100644 package/upmpdcli/upmpdcli.mk
> 
> diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
> new file mode 100644
> index 0000000..d878bfc
> --- /dev/null
> +++ b/package/upmpdcli/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_UPMPDCLI
> +	bool "upmpdcli"
> +	select BR2_PACKAGE_EXPAT
> +	select BR2_PACKAGE_LIBUPNP
> +	select BR2_PACKAGE_LIBMPDCLIENT
> +	depends on BR2_INSTALL_LIBSTDCPP

As Yann pointed out, missing dependencies inherited from libupnp.


> diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
> new file mode 100644
> index 0000000..fa03fd4
> --- /dev/null
> +++ b/package/upmpdcli/upmpdcli.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# upmpdcli
> +#
> +################################################################################
> +
> +UPMPDCLI_VERSION = 0.7.1
> +UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
> +UPMPDCLI_LICENSE = GPLv2

License was GPLv2+.

> +UPMPDCLI_LICENSE_FILES = COPYING
> +UPMPDCLI_DEPENDENCIES = expat libupnp libmpdclient
> +
> +# Upmpdcli only runs if user upmpdcli exists
> +define UPMPDCLI_USERS
> +	upmpdcli -1 upmpdcli -1 * - - - Upmpdcli: MPD UPnP Renderer Front-End

I removed the colon from the description, as suggested by Yann.

> +endef
> +
> +define UPMPDCLI_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 package/upmpdcli/S99upmpdcli $(TARGET_DIR)/etc/init.d/

We normally use the -D option of $(INSTALL) and use a complete path as
the destination.

> +endef

I've also added the installation of a default configuration file (from
the upmpdcli sources). And the most annoying thing is that you
apparently never tested building upmpdcli with uClibc, and there were a
number of build failures that I had to fix.

Anyway, thanks a lot for your contribution! Looking forward to see more
patches from you, maybe to update or improve the upmpdcli package!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
