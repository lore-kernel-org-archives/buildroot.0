From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 17:49:24 +0200
Subject: [Buildroot] [PATCH v2] glibc: remove version choice
In-Reply-To: <20170610205337.GA15034@waldemar-brodkorb.de>
References: <20170610205337.GA15034@waldemar-brodkorb.de>
Message-ID: <20170624174924.19b6549c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Jun 2017 22:53:37 +0200, Waldemar Brodkorb wrote:
> We do not support uClibc-ng/musl C library version choice support,
> do the same for GNU C Library.
> Add me as Maintainer for the package.
> No legacy handling required as only version choice is removed.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

I've applied, but after doing a few changes, see below.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1e87d3a..1af8d75 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1688,9 +1688,10 @@ F:	arch/Config.in.bfin
>  F:	arch/Config.in.m68k
>  F:	arch/Config.in.or1k
>  F:	arch/Config.in.sparc
> +F:	package/glibc/
> +F:	package/mksh/
>  F:	package/uclibc/
>  F:	package/uclibc-ng-test/
> -F:	package/mksh/

This is mixing two changes (alphabetic ordering and adding you as a
developer for the glibc package) in a patch that is otherwise
relatively unrelated. So I've moved these changes to separate patches.

> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 115388e..e5d0d5c 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -3,35 +3,8 @@ if BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  config BR2_PACKAGE_GLIBC
>  	bool
>  	default y
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2

A "depends on" on a prompt-less option is quite useless, because it
doesn't prevent anyone from select-ing this option, unless you
propagate this depends on of course (which you don't do).

> -comment "glibc-2.24+ needs kernel headers >= 3.2"
> -	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2

And we're loosing the comment about glibc now requiring headers >= 3.2.

So, instead, I've moved the dependency to
toolchain/toolchain-buildroot/Config.in, option
BR2_TOOLCHAIN_BUILDROOT_GLIBC, where we already had
the !BR2_STATIC_LIBS dependency. And I've updated the existing
Config.in comment to mention the need for headers >= 3.2.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
