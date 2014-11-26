From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Nov 2014 22:35:34 +0100
Subject: [Buildroot] [PATCH v4 next 1/5] support/download: silence git
 if it is a silent build
In-Reply-To: <1416837422-1977-2-git-send-email-fabio.porcedda@gmail.com>
References: <1416837422-1977-1-git-send-email-fabio.porcedda@gmail.com>
 <1416837422-1977-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20141126213534.GA4260@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2014-11-24 14:56 +0100, Fabio Porcedda spake thusly:
> If it is a silent build (make -s -> QUIET=-q) silence the git download
> helper using "git clone -q" just like others download helpers,
> e.g. wget.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
> 
> Notes:
>     v3:
>      - add this patch
> 
>  package/pkg-download.mk |  3 ++-
>  support/download/git    | 14 ++++++++++----
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index f3409bd..95175d6 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -99,7 +99,8 @@ define DOWNLOAD_GIT
>  		$(DL_DIR)/$($(PKG)_SOURCE) \
>  		$($(PKG)_SITE) \
>  		$($(PKG)_DL_VERSION) \
> -		$($(PKG)_BASE_NAME)
> +		$($(PKG)_BASE_NAME) \
> +		$(QUIET)
>  endef
>  
>  # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
> diff --git a/support/download/git b/support/download/git
> index 5d36ca4..4ce9030 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -9,6 +9,7 @@ set -e
>  #   $2: git repo
>  #   $3: git cset
>  #   $4: package's basename (eg. foobar-1.2.3)
> +#   $5: "-q", optional quiet flag

I am not a big fan of this.

I would prefer we pass the quiet flag through the environment, something
like this, for example:

    diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
    index 9643a30..0399b73 100644
    --- a/package/pkg-generic.mk
    +++ b/package/pkg-generic.mk
    @@ -69,7 +69,7 @@ endif
     ################################################################################

     # Retrieve the archive
    -$(BUILD_DIR)/%/.stamp_downloaded:
    +$(BUILD_DIR)/%/.stamp_downloaded: export BR_QUIET=$(if $(QUIET),1,0)
        $(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
     ifeq ($(DL_MODE),DOWNLOAD)
     # Only show the download message if it isn't already downloaded

Then the scripts would just check if ${BR_QUIET} is non 0.

Also, in retrospect, QUIET was not a really good name for this variable
in the Makefile. It would have been better if it were named BR_QUIET.
But that was introduced way before we decided on a variable naming
convention... :-/

>  # And this environment:
>  #   GIT      : the git command to call
>  
> @@ -16,21 +17,26 @@ output="${1}"
>  repo="${2}"
>  cset="${3}"
>  basename="${4}"
> +quiet="${5}"
>  
>  # Try to see if we can do a shallow clone, since it is faster
>  # than a full clone.
>  git_done=0
>  if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
> -    printf "Doing shallow clone\n"
> -    if ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" "${basename}"; then
> +    if [ -z "${quiet}" ]; then
> +	printf "Doing shallow clone\n";
> +    fi
> +    if ${GIT} clone ${quiet} --depth 1 -b "${cset}" --bare "${repo}" "${basename}"; then
>          git_done=1
>      else
>          printf "Shallow clone failed, falling back to doing a full clone\n"
>      fi
>  fi
>  if [ ${git_done} -eq 0 ]; then
> -    printf "Doing full clone\n"
> -    ${GIT} clone --bare "${repo}" "${basename}"
> +    if [ -z "${quiet}" ]; then
> +	printf "Doing full clone\n";
> +    fi
> +    ${GIT} clone ${quiet} --bare "${repo}" "${basename}"
>  fi
>  
>  GIT_DIR="${basename}" \
> -- 
> 2.1.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
