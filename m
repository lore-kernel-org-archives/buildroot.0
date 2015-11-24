From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 24 Nov 2015 14:33:18 +0000
Subject: [Buildroot] [PATCH] minizip: new package
In-Reply-To: <1448316362-19184-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1448316362-19184-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <5654752E.1040009@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 23/11/15 22:06, gustavo.zacarias at free-electrons.com wrote:

[snip]

> diff --git a/package/minizip/Config.in b/package/minizip/Config.in
> new file mode 100644
> index 0000000..7205e00
> --- /dev/null
> +++ b/package/minizip/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_MINIZIP
> +	bool "minizip"
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  Enables to extract files from a .zip archive file.
> +	  It is compatible with PKZip 2.04g, WinZip, InfoZip,
> +	  MimarSinan Codex Suite 2002 tools, and compatible sofware.
> +
> +	  https://github.com/nmoinvaz/minizip
> +
> +config BR2_PACKAGE_MINIZIP_DEMOS
> +	bool "miniunzip/minizip"

Personally I would write something more obvious like "Install tools".

> +	depends on BR2_PACKAGE_MINIZIP
> +	help
> +	  Enable miniunzip/minizip binary tools.
> diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
> new file mode 100644
> index 0000000..aa77c56
> --- /dev/null
> +++ b/package/minizip/minizip.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# minizip
> +#
> +################################################################################
> +
> +MINIZIP_VERSION = 977afb22966e6ab0ee401293a8e85fe808133f9a
> +MINIZIP_SITE = https://github.com/nmoinvaz/minizip.git

Why not using the github helper?

MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))

> +MINIZIP_SITE_METHOD = git

Not needed if you use the github helper, although I'm sure you already
know that.

> +MINIZIP_DEPENDENCIES = zlib
> +MINIZIP_AUTORECONF = YES
> +MINIZIP_INSTALL_STAGING = YES
> +MINIZIP_CONF_OPTS = $(if $(BR2_PACKAGE_MINIZIP_DEMOS),--enable-demos)
> +MINIZIP_LICENSE = zlib license
> +MINIZIP_LICENSE_FILES = LICENSE
> +
> +$(eval $(autotools-package))
> 

And you forgot to add a hash file like this:

# Locally calculated
sha256 b39158bdf3d8bf81d3a7412dc761851fda398bc93d8989d5e940ed4ae5bbb52c
 minizip-977afb22966e6ab0ee401293a8e85fe808133f9a.tar.gz

Regards,

Vincent.
