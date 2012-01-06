From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 6 Jan 2012 17:40:08 -0600
Subject: [Buildroot] [PATCH] Improved git download method performance.
In-Reply-To: <54DB0A5039192D48A770D406992C75BC28EC825859@DFW1MBX21.mex07a.mlsrvr.com>
References: <54DB0A5039192D48A770D406992C75BC28EC825859@DFW1MBX21.mex07a.mlsrvr.com>
Message-ID: <201201061740.10676.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri January 6 2012, Theodore Witkamp wrote:
> 
> Instead of cloning the a complete repository, git archive is used first.
> If git archive fails because the remote host does not support it, git clone is
> used with with --depth 1 so only minimal history is copied.
> 
> Also the $($(PKG)_SOURCE) default is changed to .tar instead of .tar.gz.
> This removes unneeded compression and decompression.
>

But some parts of the world charge per/byte still.

So maybe you want to offer a Wallet/CPU-Cycles preference or choice. 
;-)

Mike 
> Relative file paths are now relative to $(TOPDIR) not $(DL_DIR).
> ---
>  package/Makefile.package.in |   35 ++++++++++++++++++++---------------
>  1 files changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> index e85eb15..14f1ba1 100644
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -146,14 +146,14 @@ domainseparator=$(if $(1),$(1),/)
>  
>  define DOWNLOAD_GIT
>  	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
> -	(pushd $(DL_DIR) > /dev/null && \
> -	$(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
> -	pushd $($(PKG)_BASE_NAME) > /dev/null && \
> -	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
> -		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
> -	popd > /dev/null && \
> -	rm -rf $($(PKG)_DL_DIR) && \
> -	popd > /dev/null)
> +	$(GIT) archive --format=tar --remote $($(PKG)_SITE) --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) \
> +	> $(DL_DIR)/$($(PKG)_SOURCE) || \
> +	( \
> +	$(GIT) clone   -v --depth 1 --bare $($(PKG)_SITE) $($(PKG)_DL_DIR)   &&  \
> +	$(GIT) archive --format=tar --remote $($(PKG)_DL_DIR) --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) \
> +	> $(DL_DIR)/$($(PKG)_SOURCE) && \
> +	rm -rf $($(PKG)_DL_DIR)  \
> +	)
>  endef
>  
>  # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
> @@ -504,13 +504,6 @@ ifneq ($$($(2)_OVERRIDE_SRCDIR),)
>  $(2)_VERSION = custom
>  endif
>  
> -ifndef $(2)_SOURCE
> - ifdef $(3)_SOURCE
> -  $(2)_SOURCE = $($(3)_SOURCE)
> - else
> -  $(2)_SOURCE			?= $$($(2)_BASE_NAME).tar.gz
> - endif
> -endif
>  
>  ifndef $(2)_PATCH
>   ifdef $(3)_PATCH
> @@ -536,6 +529,18 @@ ifndef $(2)_SITE_METHOD
>   endif
>  endif
>  
> +ifndef $(2)_SOURCE
> + ifdef $(3)_SOURCE
> +  $(2)_SOURCE = $($(3)_SOURCE)
> + else
> +  ifeq ($$($(2)_SITE_METHOD),git)
> +   $(2)_SOURCE			?= $$($(2)_BASE_NAME).tar
> +  else
> +   $(2)_SOURCE			?= $$($(2)_BASE_NAME).tar.gz
> +  endif
> + endif
> +endif
> +
>  ifeq ($$($(2)_SITE_METHOD),local)
>  ifeq ($$($(2)_OVERRIDE_SRCDIR),)
>  $(2)_OVERRIDE_SRCDIR = $($(2)_SITE)
