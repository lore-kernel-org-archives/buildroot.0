From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 3 Oct 2015 16:46:09 +0200
Subject: [Buildroot] [PATCH 1/6 RFC] core/pkg-generic: allow packages to
 exclude files when extracting
In-Reply-To: <419c992b5ee60036fd6e601f421e92f0ebadffe1.1441233378.git.yann.morin.1998@free.fr>
References: <cover.1441233378.git.yann.morin.1998@free.fr>
 <419c992b5ee60036fd6e601f421e92f0ebadffe1.1441233378.git.yann.morin.1998@free.fr>
Message-ID: <560FEA31.2080404@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 03/09/2015 00:51, Yann E. MORIN a ?crit :
> Currently, packages that need to exclude parts of the archives when
> extracting (e.g. to gain space), like gcc or toolchain-external, have to
> provide custom extract commands, just for the sake of adding a bunch of
> --exclude directives when calling tar.
> 
> Add a new variable that packages may set, to provide a space-separated
> list of patterns to exclude.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain

> ---
>  docs/manual/adding-packages-generic.txt | 4 ++++
>  package/pkg-generic.mk                  | 5 ++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 4c12b42..e7a473c 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -312,6 +312,10 @@ information is (assuming the package name is +libfoo+) :
>    that have more than one leading component to strip, set this
>    variable with the value to be passed to tar. Default: 1.
>  
> +* +LIBFOO_EXCLUDES+ is a space-separated list of patterns to exclude
> +  when extracting the archive. Each item from that list is passed as
> +  a tar's +--exclude+ option. By default, empty.
> +
>  * +LIBFOO_DEPENDENCIES+ lists the dependencies (in terms of package
>    name) that are required for the current target package to
>    compile. These dependencies are guaranteed to be compiled and
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 6a7d97e..d1877a7 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -476,7 +476,10 @@ $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
>  # default extract command
>  $(2)_EXTRACT_CMDS ?= \
>  	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$(DL_DIR)/$$($(2)_SOURCE) | \
> -	$$(TAR) --strip-components=$$($(2)_STRIP_COMPONENTS) -C $$($(2)_DIR) $$(TAR_OPTIONS) -)
> +	$$(TAR) --strip-components=$$($(2)_STRIP_COMPONENTS) \
> +		-C $$($(2)_DIR) \
> +		$$(foreach x,$$($(2)_EXCLUDES),--exclude='$$(x)' ) \
> +		$$(TAR_OPTIONS) -)
>  
>  # pre/post-steps hooks
>  $(2)_PRE_DOWNLOAD_HOOKS         ?=
> 
