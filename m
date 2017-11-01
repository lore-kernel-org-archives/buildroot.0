From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Nov 2017 14:05:16 +0100
Subject: [Buildroot] [PATCH 1/1] cups: add dependency on threads
In-Reply-To: <20171101102438.6086-1-olivier.schonken@gmail.com>
References: <20171101102438.6086-1-olivier.schonken@gmail.com>
Message-ID: <20171101140516.112d3502@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Nov 2017 12:24:38 +0200, Olivier Schonken wrote:
> Add myself as CUPS maintainer in DEVELOPERS list
> Fixes
> http://autobuild.buildroot.net/results/0f1cb8d72d0a78eb8b5c46548bc7c7bade93c674
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  DEVELOPERS             | 1 +
>  package/cups/Config.in | 6 ++++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 862399b45a..6c1319ccc4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1168,6 +1168,7 @@ F:	package/ijs/
>  F:	package/poppler/
>  F:	package/qpdf/
>  F:	package/openjpeg/
> +F:  package/cups/

This should have been a separate patch. Also, the indentation is wrong,
and you broke alphabetic ordering. I've fixed this and applied as a
separate patch.

Remember: independent changes should be made in separate patches.

> diff --git a/package/cups/Config.in b/package/cups/Config.in
> index 3f5460c11b..635c0273c5 100644
> --- a/package/cups/Config.in
> +++ b/package/cups/Config.in
> @@ -2,6 +2,8 @@ config BR2_PACKAGE_CUPS
>  	bool "cups"
>  	# needs libstdcpp for ppdc
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	# needs threads for ippserver
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	# needs fork()
>  	depends on BR2_USE_MMU
>  	help
> @@ -9,5 +11,5 @@ config BR2_PACKAGE_CUPS
>  
>  	  http://www.cups.org
>  
> -comment "cups needs a toolchain w/ C++"
> -	depends on !BR2_INSTALL_LIBSTDCPP
> +comment "cups needs a toolchain w/ C++, threads"
> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)

We generally use:

	depends on !foo || !bar

instead, so I've fixed that and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
