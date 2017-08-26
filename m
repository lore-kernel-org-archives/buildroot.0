From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Aug 2017 10:16:06 +0200
Subject: [Buildroot] [PATCH 1/1] add package for pdmenu
In-Reply-To: <20170825173358.7fd6f8bc@brock-desktop>
References: <20170825173358.7fd6f8bc@brock-desktop>
Message-ID: <20170826101606.6072a31e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks a lot for your contribution! Your patch looks mostly good,
there are only a few nits, see below. Could you address them and send
an updated version ?

On Fri, 25 Aug 2017 17:33:58 -0600, Brock Williams wrote:
> Signed-off-by: Brock Williams <brock@cottonwoodcomputer.com>
> ---
>  package/Config.in        | 1 +
>  package/pdmenu/Config.in | 9 +++++++++
>  package/pdmenu/pdmenu.mk | 9 +++++++++

Please add an entry to the top-level DEVELOPERS file for this package.
Also, please add a package/pdmenu/pdmenu.hash file.

> diff --git a/package/Config.in b/package/Config.in
> index a512827..8df01a0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1847,6 +1847,7 @@ comment "Utilities"
>         source "package/which/Config.in"
>         source "package/xmlstarlet/Config.in"
>         source "package/xxhash/Config.in"
> +       source "package/pdmenu/Config.in"

Use alphabetic ordering for the list of packages.

> diff --git a/package/pdmenu/Config.in b/package/pdmenu/Config.in
> new file mode 100644
> index 0000000..df78c23
> --- /dev/null
> +++ b/package/pdmenu/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PDMENU
> +       bool "pdmenu"
> +       depends on BR2_PACKAGE_SLANG

Use "select" instead of "depends on" here. As a consequence, you have
to replicate the "depends of" that BR2_PACKAGE_SLANG has. So:

	depends on BR2_USE_MMU # slang
	select BR2_PACKAGE_SLANG

> +       help
> +               Pdmenu is a full screen menuing system for Unix. It is designed to be easy to use, and is suitable as a login shell for inexperienced users, or it can just be ran at the command line as a handy menu.
> +
> +               Pdmenu features color support and GPM mouse support at the Linux console. It was developed on Linux, and has now been compiled on many other unixes without problems.
> +
> +               https://joeyh.name/code/pdmenu/

You should have run your package through ./utils/check-package, it
would have told you that the indentation for the help text is one tab +
two spaces, and that lines should be wrapped at the 72th column.

> diff --git a/package/pdmenu/pdmenu.mk b/package/pdmenu/pdmenu.mk
> new file mode 100644
> index 0000000..29ab510
> --- /dev/null
> +++ b/package/pdmenu/pdmenu.mk
> @@ -0,0 +1,9 @@

Please add the comment header that we have in all packages. Yes, it's
useless and silly, but we have it everywhere :)

> +PDMENU_VERSION = 1.3.4
> +PDMENU_SOURCE = pdmenu_$(PDMENU_VERSION).tar.gz
> +PDMENU_SITE = http://http.debian.net/debian/pool/main/p/pdmenu
> +PDMENU_LICENSE = GPL-2.0+
> +PDMENU_LICENSE_FILES = COPYING.GPLv2
> +PDMENU_DEPENDENCIES = slang
> +PDMENU_INSTALL_TARGET_OPTS = INSTALL_PREFIX=$(TARGET_DIR) install
> +
> +$(eval $(autotools-package))

Otherwise, looks good. Could you send an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
