From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Aug 2014 23:09:37 +0200
Subject: [Buildroot] [PATCH v5 2/2] apply-patches.sh: don't print
 anything when "make -s" is used
In-Reply-To: <1407399309-5926-3-git-send-email-fabio.porcedda@gmail.com>
References: <1407399309-5926-1-git-send-email-fabio.porcedda@gmail.com>
 <1407399309-5926-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140815210937.GF25897@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2014-08-07 10:15 +0200, Fabio Porcedda spake thusly:
> The make "-s" option is used to enable the "Silent operation" so if that
> option is used don't print anything as far as there isn't any error.
> 
> Add the "-s" option to "apply-patches.sh" to enable silent operation.
> 
> Also add the "BR_SILENT" variable the contain "YES" when "make -s" is
> used so others parts can use it to silence the build as well.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

For -next.

Regards,
Yann E. MORIN.

> ---
>  Makefile                         |  2 ++
>  package/Makefile.in              |  2 +-
>  support/scripts/apply-patches.sh | 17 ++++++++++++++---
>  3 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index c82b07f..dfb49be 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -198,6 +198,8 @@ else
>    Q = @
>  endif
>  
> +BR_SILENT = $(if $(filter s -s,$(MAKEFLAGS)),YES)
> +
>  # we want bash as shell
>  SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
>  	 else if [ -x /bin/bash ]; then echo /bin/bash; \
> diff --git a/package/Makefile.in b/package/Makefile.in
> index bf22123..6ef3c3d 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -222,7 +222,7 @@ FLEX := $(shell which flex || type -p flex)
>  BISON := $(shell which bison || type -p bison)
>  SED := $(shell which sed || type -p sed) -i -e
>  
> -APPLY_PATCHES = support/scripts/apply-patches.sh
> +APPLY_PATCHES = support/scripts/apply-patches.sh $(if $(BR_SILENT),-s)
>  
>  HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
>  HOST_CFLAGS   ?= -O2
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index 37f2d81..16e0b41 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -6,6 +6,8 @@
>  # (c) 2002 Erik Andersen <andersen@codepoet.org>
>  #
>  # Parameters:
> +# - "-s",optional. Silent operation, don't print anything if there
> +# isn't any error.
>  # - the build directory, optional, default value is '.'. The place where are
>  # the package sources.
>  # - the patch directory, optional, default '../kernel-patches'. The place
> @@ -28,6 +30,13 @@
>  # applied. The list of the patches applied is stored in '.applied_patches_list'
>  # file in the build directory.
>  
> +silent=
> +if [ "$1" = "-s" ] ; then
> +    # add option to be used by the patch tool
> +    silent=-s
> +    shift
> +fi
> +
>  # Set directories from arguments, or use defaults.
>  builddir=${1-.}
>  patchdir=${2-../kernel-patches}
> @@ -77,14 +86,16 @@ function apply_patch {
>  	return 0
>  	;;
>      esac
> -    echo ""
> -    echo "Applying $patch using ${type}: "
> +    if [ -z "$silent" ] ; then
> +	echo ""
> +	echo "Applying $patch using ${type}: "
> +    fi
>      if [ ! -e "${path}/$patch" ] ; then
>  	echo "Error: missing patch file ${path}/$patch"
>  	exit 1
>      fi
>      echo $patch >> ${builddir}/.applied_patches_list
> -    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N
> +    ${uncomp} "${path}/$patch" | patch $silent -g0 -p1 -E -d "${builddir}" -t -N
>      if [ $? != 0 ] ; then
>          echo "Patch failed!  Please fix ${patch}!"
>  	exit 1
> -- 
> 2.0.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
