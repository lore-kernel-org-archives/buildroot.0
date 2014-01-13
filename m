From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 13 Jan 2014 15:18:06 +0100
Subject: [Buildroot] [PATCH 2/6] pkg-infra: move git download helper to
 a script
In-Reply-To: <add407fe211f2032f76fda6442b06b7d8a3af2cc.1389569992.git.yann.morin.1998@free.fr>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <add407fe211f2032f76fda6442b06b7d8a3af2cc.1389569992.git.yann.morin.1998@free.fr>
Message-ID: <52D3F59E.5090004@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> The git download helper is getting a bit more complex, and does not
> raise an error when a PKG_VERSION is a sha1 that does not exist in
> the repository. Instead, it generates an empty archive.
>
> Fixing it in the Makefile proves to be challenging, to say the least.
>
> Move it into a shell script in support/download/git, which will make
> it much easier to read, maintain, fix an enhance in the future.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This is a very welcome change, thanks for caring!

Just a minor note below, but looks ok anyway:
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>


> ---
>   package/pkg-download.mk | 16 +++-------------
>   support/download/git    | 36 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 39 insertions(+), 13 deletions(-)
>   create mode 100755 support/download/git
>
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index c00689b..8e6f7a3 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -12,7 +12,7 @@ WGET := $(call qstrip,$(BR2_WGET)) $(QUIET)
>   SVN := $(call qstrip,$(BR2_SVN))
>   CVS := $(call qstrip,$(BR2_CVS))
>   BZR := $(call qstrip,$(BR2_BZR))
> -GIT := $(call qstrip,$(BR2_GIT))
> +export GIT := $(call qstrip,$(BR2_GIT))
>   HG := $(call qstrip,$(BR2_HG)) $(QUIET)
>   SCP := $(call qstrip,$(BR2_SCP)) $(QUIET)
>   SSH := $(call qstrip,$(BR2_SSH)) $(QUIET)
> @@ -84,18 +84,8 @@ github = https://github.com/$(1)/$(2)/tarball/$(3)
>   # problems
>   define DOWNLOAD_GIT
>   	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
> -	(pushd $(DL_DIR) > /dev/null && \
> -	 ((test "`git ls-remote $($(PKG)_SITE) $($(PKG)_DL_VERSION)`" && \
> -	   echo "Doing shallow clone" && \
> -	   $(GIT) clone --depth 1 -b $($(PKG)_DL_VERSION) --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME)) || \
> -	  (echo "Doing full clone" && \
> -	   $(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME))) && \
> -	pushd $($(PKG)_BASE_NAME) > /dev/null && \
> -	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
> -		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
> -	popd > /dev/null && \
> -	rm -rf $($(PKG)_DL_DIR) && \
> -	popd > /dev/null)
> +	$(EXTRA_ENV) support/download/git $($(PKG)_SITE) $($(PKG)_DL_VERSION) \
> +					  $($(PKG)_BASE_NAME)/ $(DL_DIR)/$($(PKG)_SOURCE)
>   endef
>
>   # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
> diff --git a/support/download/git b/support/download/git
> new file mode 100755
> index 0000000..99ea1b2
> --- /dev/null
> +++ b/support/download/git
> @@ -0,0 +1,36 @@
> +#!/bin/sh
> +set -e
> +
> +# Download helper for git
> +# Call it with:
> +#   $1: git repo
> +#   $2: git cset
> +#   $3: prefix/
> +#   $4: output file
> +# And this environment:
> +#   GIT      :  the git command to call
> +#   BUILD_DIR:  path to Buildroot's build dir
> +
> +repo="${1}"
> +cset="${2}"
> +prefix="${3}"
> +output="${4}"
> +
> +pushd "${BUILD_DIR}" >/dev/null
> +rm -rf .git-tmp-repo    # In case a previous attempt was interrupted

This rm did not exist in the original version. I would move this into a
separate commit.

> +
> +if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
> +    printf "Doing shallow clone\n"
> +    ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" .git-tmp-repo
> +else
> +    printf "Doing full clone\n"
> +    ${GIT} clone --bare "${repo}" .git-tmp-repo
> +fi
> +
> +pushd .git-tmp-repo >/dev/null
> +${GIT} archive --prefix="${prefix}" --format=tar "${cset}"  \
> +|gzip -c >"${output}"
> +popd >/dev/null
> +
> +rm -rf .git-tmp-repo
> +popd >/dev/null
>


-- 
Luca
