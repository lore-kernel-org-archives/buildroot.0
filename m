From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 23 Jan 2014 09:48:04 +0100 (CET)
Subject: [Buildroot] [PATCH 1/3] Makefile: use absolute paths to
 BR2_EXTERNAL
In-Reply-To: <44e6c31931f55e79eec713be1a202f2c170667b7.1390424303.git.yann.morin.1998@free.fr>
Message-ID: <1628424372.4635064.1390466884782.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all

----- Mail original -----
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Using a relative path for BR2_EXTERNAL, and using an external
> defconfig,
> such as in (from a Buildroot top-dir):
>     make O=.. BR2_EXTERNAL=.. foo_defconfig
> 
> is broken. It is unclear why the %_defconfig rule recurses in that
> case,
> but using relative paths is inherently broken.
> 
> This patch makes BR2_EXTERNAL canonical (ie. makes it an absolute
> path),
> and checks the directory exists.
> 
> The manual is updated to discourage using relative paths.
> 
> Reported-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Romain Naour <romain.naour@openwide.fr>
> ---
>  Makefile                             |  9 +++++++++
>  docs/manual/customize-outside-br.txt | 12 +++++++-----
>  2 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 9dfb1e0..64fa138 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -118,6 +118,15 @@ ifeq ($(BR2_EXTERNAL),)
>    override BR2_EXTERNAL = support/dummy-external
>    $(shell rm -f $(BR2_EXTERNAL_FILE))
>  else
> +  _BR2_EXTERNAL = $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
> +  ifeq ($(_BR2_EXTERNAL),)
> +    ifeq ($(patsubst /%,/,$(BR2_EXTERNAL)),/)
> +      $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist)
> +    else
> +      $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist,
> relatively to $(TOPDIR))
> +    endif
> +  endif
> +  BR2_EXTERNAL := $(_BR2_EXTERNAL)

you need an override keyword here.

once this is added, the patch works correctly.


>    $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) >
>    $(BR2_EXTERNAL_FILE))
>  endif
>  
> diff --git a/docs/manual/customize-outside-br.txt
> b/docs/manual/customize-outside-br.txt
> index 19257e6..53d88d7 100644
> --- a/docs/manual/customize-outside-br.txt
> +++ b/docs/manual/customize-outside-br.txt
> @@ -32,16 +32,18 @@ removed by passing an empty value.
>  
>  The +BR2_EXTERNAL+ path can be either an absolute or a relative
>  path,
>  but if it's passed as a relative path, it is important to note that
>  it
> -is interpreted relatively to the main Buildroot source directory,
> not
> -the Buildroot output directory.
> +is interpreted relative to the main Buildroot source directory, not
> +the Buildroot output directory. Using relative paths can lead to
> various
> +broken setups, and thus is highly discouraged in favour of using
> +absolute paths.
>  
>  Some examples:
>  
>  -----
> - buildroot/ $ make BR2_EXTERNAL=../foobar menuconfig
> + buildroot/ $ make BR2_EXTERNAL=/path/to/foobar menuconfig
>  -----
>  
> -Starting from now on, external definitions from the +../foobar+
> +Starting from now on, external definitions from the
> +/path/to/foobar+
>  directory will be used:
>  
>  -----
> @@ -52,7 +54,7 @@ directory will be used:
>  We can switch to another external definitions directory at any time:
>  
>  -----
> - buildroot/ $ make BR2_EXTERNAL=../barfoo xconfig
> + buildroot/ $ make BR2_EXTERNAL=/where/we/have/barfoo xconfig
>  -----
>  
>  Or disable the usage of external definitions:
> --
> 1.8.1.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
