From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Feb 2018 14:46:47 +0100
Subject: [Buildroot] [PATCH v2 12/13] download: git: introduce cache
 feature
In-Reply-To: <20171025201003.16105-13-ps.report@gmx.net>
References: <20171025201003.16105-1-ps.report@gmx.net>
 <20171025201003.16105-13-ps.report@gmx.net>
Message-ID: <20180205144647.5be8d385@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On issue below.

On Wed, 25 Oct 2017 22:10:02 +0200, Peter Seiderer wrote:

> diff --git a/support/download/git b/support/download/git
> index 58a2c6ad9d..5d09cc0d7a 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -39,28 +39,34 @@ _git() {
>      eval ${GIT} "${@}"
>  }
>  
> -# Try a shallow clone, since it is faster than a full clone - but that only
> -# works if the version is a ref (tag or branch). Before trying to do a shallow
> -# clone we check if ${cset} is in the list provided by git ls-remote. If not
> -# we fall back on a full clone.
> -#
> -# Messages for the type of clone used are provided to ease debugging in case of
> -# problems
> -git_done=0
> -if [ -n "$(_git ls-remote "'${uri}'" "'${cset}'" 2>&1)" ]; then
> -    printf "Doing shallow clone\n"
> -    if _git clone ${verbose} "${@}" --depth 1 -b "'${cset}'" "'${uri}'" "'${basename}'"; then
> -        git_done=1
> -    else
> -        printf "Shallow clone failed, falling back to doing a full clone\n"
> +# We want to check if a cache of the git clone of this repo already exists.
> +git_cache="${BR2_DL_DIR}/${basename%%-*}/git"
> +
> +# If the cache directory already exists, don't try to clone.
> +if [ ! -d "${git_cache}" ]; then
> +    # Try a shallow clone, since it is faster than a full clone - but that
> +    # only works if the versionis a ref (tag or branch). Before trying to do a
> +    # shallow clone we check if ${cset} is in the list provided by git
> +    # ls-remote. If not we fall back on a full clone.
> +    #
> +    # Messages for the type of clone used are provided to ease debugging in
> +    # case of problems
> +    git_done=0
> +    if [ -n "$(_git ls-remote "'${uri}'" "'${cset}'" 2>&1)" ]; then
> +        printf "Doing shallow clone\n"
> +        if _git clone ${verbose} "${@}" --depth 1 -b "'${cset}'" "'${uri}'" "'${git_cache}'"; then
> +            git_done=1
> +        else
> +            printf "Shallow clone failed, falling back to doing a full clone\n"
> +        fi
> +    fi
> +    if [ ${git_done} -eq 0 ]; then
> +        printf "Doing full clone\n"
> +        _git clone ${verbose} "${@}" "'${uri}'" "'${git_cache}'"
>      fi
> -fi
> -if [ ${git_done} -eq 0 ]; then
> -    printf "Doing full clone\n"
> -    _git clone ${verbose} "${@}" "'${uri}'" "'${basename}'"
>  fi

This looks all good, except that the rest of the script does:

if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
    printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
fi

And "origin" will be the first remote from which the Git cache was
started, but not necessarily the current Git repository that we should
pull from. This "origin" should be changed to ${uri} it seems.

This is not a problem today because we always clone, so origin is
always ${uri}. But with Git caching, it is no longer the case.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
