From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Mar 2019 16:17:51 +0100
Subject: [Buildroot] [PATCH] mtree: new package
In-Reply-To: <20190319114344.11138-1-esben.haabendal@gmail.com>
References: <20190319114344.11138-1-esben.haabendal@gmail.com>
Message-ID: <20190319161751.0daebda7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Esben,

Nice to see you on the Buildroot mailing list :-)

On Tue, 19 Mar 2019 12:43:44 +0100
Esben Haabendal <esben.haabendal@gmail.com> wrote:

>  package/Config.in       |  1 +
>  package/mtree/Config.in | 10 ++++++++++
>  package/mtree/mtree.mk  | 15 +++++++++++++++

Please add an entry to the DEVELOPERS file.

> diff --git a/package/mtree/Config.in b/package/mtree/Config.in
> new file mode 100644
> index 000000000000..97e1cf614972
> --- /dev/null
> +++ b/package/mtree/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_MTREE
> +	bool "mtree"
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  mtree - utility for creating and verifying file hierarchies.
> +
> +	  Port of the mtree utility, originally only available in BSD
> +	  distributions, to Linux and other operating systems.
> +
> +	  https://github.com/archiecobbs/mtree-port
> diff --git a/package/mtree/mtree.mk b/package/mtree/mtree.mk
> new file mode 100644
> index 000000000000..b828dd53ffe3
> --- /dev/null
> +++ b/package/mtree/mtree.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# mtree
> +#
> +################################################################################
> +
> +MTREE_VERSION = 1.0.4
> +MTREE_SOURCE = mtree-$(MTREE_VERSION).tar.gz
> +MTREE_SITE = https://s3.amazonaws.com/archie-public/mtree-port
> +MTREE_LICENSE = BSD-3-Clause
> +MTREE_LICENSE_FILES = COPYING

You need:

MTREE_DEPENDENCIES = openssl

otherwise you have no guarantee that openssl will be built before
mtree. You can test your package by doing "./utils/test-pkg -p mtree",
it will test it with a number of toolchain configurations that we have
chosen as they often exhibit a number of issues. This testing would
have also revealed the missing openssl dependency.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
