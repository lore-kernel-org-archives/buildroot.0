From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 23:26:30 +0100
Subject: [Buildroot] [PATCH 1/1] Add a new package udftools,
 third time is the charm
In-Reply-To: <20180113003122.2375-1-skenton@ou.edu>
References: <20180113003122.2375-1-skenton@ou.edu>
Message-ID: <20180115232630.02292c2e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution! There are a few issues in your submission
that need to be fixed however.

First, the commit title should be just "udftools: new package". We
don't want your "third time is the charm" message to become part of
Buildroot Git history forever :-)

On Fri, 12 Jan 2018 18:31:22 -0600, Steve Kenton wrote:
> Signed-off-by: Steve Kenton <skenton@ou.edu>
> ---
>  Try 2: fix stupid copy paste error in Config.in
>  Try 3: remove duplicate/misplaced addition to master Config.in
>  I wish I could see these issues  when I first look the patch over - sigh

This changelog is good, and is the right place for such information.

> 
> package/Config.in              |  1 +
>  package/udftools/Config.in     | 13 +++++++++++++
>  package/udftools/udftools.hash |  2 ++
>  package/udftools/udftools.mk   | 13 +++++++++++++

Please add an entry to the DEVELOPERS file for this package.

> diff --git a/package/udftools/Config.in b/package/udftools/Config.in
> new file mode 100644
> index 0000000..b217cd2
> --- /dev/null
> +++ b/package/udftools/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_UDFTOOLS
> +	bool "udftools"
> +	depends on BR2_PACKAGE_READLINE

Should be a select, not a depends on.

> +	help
> +	  Tools for creating UDF filesystems
> +	  Maintained fork of the 2004 Sourcforge package
> +
> +	  https://github.com/pali/udftools/releases/tag/2.0

Please use the main site, not the specific 2.0 page.

> +
> +comment "udftools needs a toolchain w/ wchar"
> +	depends on !BR2_USE_WCHAR

If it depends on wchar, then you should have a "depends on
BR2_USE_WCHAR" for the main BR2_PACKAGE_UDFTOOLS option.

> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256	67fe428d452901215cfad8049d250540c97114b1a20dd63277b91c2c4fae8292	udftools-2.0.tar.gz

Adding the hash for the license file would be good.

> diff --git a/package/udftools/udftools.mk b/package/udftools/udftools.mk
> new file mode 100644
> index 0000000..7cc8d9a
> --- /dev/null
> +++ b/package/udftools/udftools.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# udftools
> +#
> +################################################################################
> +
> +UDFTOOLS_VERSION = 2.0
> +UDFTOOLS_SITE = https://github.com/pali/udftools/releases/download/$(UDFTOOLS_VERSION)
> +UDFTOOLS_LICENSE = GPL-2.0

The license is GPL-2.0+. Indeed, all source files I checked have the
"or later" statement.

> +UDFTOOLS_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))

Could you fix those issues and send an updated version ?

Also, it would be nice to make sure that:

 - Your package does not have any warnings reported
   by ./utils/check-package package/udftools/*

 - Your package builds properly with the different toolchain
   configurations tested by ./utils/test-pkg.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
