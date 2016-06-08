From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Jun 2016 00:08:43 +0200
Subject: [Buildroot] [PATCH 1/1] support/download/git: add --reference
 option to git clone.
In-Reply-To: <1464789807-26407-1-git-send-email-julien.rosener@digital-scratch.org>
References: <1464789807-26407-1-git-send-email-julien.rosener@digital-scratch.org>
Message-ID: <20160608220843.GC3694@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2016-06-01 16:03 +0200, Julien Rosener spake thusly:
> In case of big Git repositories stored over very slow network, git clone can
> take hours to be done. The option --reference can be used to specify a local
> cache directory which contains mirrors.
> 
> The cache directory is a bare git repository:
>   git init --bare
> All mirrored repositories are added into this repository:
>   git remote add <repo_name> <repo_url>
> The full cache directory can be periodically updated:
>   git fetch --all
> 
> It does not matter if the cache directory is not fully up to date because Git
> will take the last changes from the real remote repository. If a repository is
> not in the cache, git will do a full remote clone without error.

OK. so, what should I say?

WEEE! That's actually pretty venom. I love that. :-)

However, see a little comment, below...

> A buildroot variable was added to specify the path of the cache directory
> (BR2_GIT_CACHE) at the "Build options >> Commands >> git" menu entry level. The
> value is passed to the Git download helper script as an argument and is used if
> defined (indeed in this case every calls to git clone will be using the cache
> directory).
> 
> Signed-off-by: Julien Rosener <julien.rosener@digital-scratch.org>
> ---
>  Config.in               | 6 ++++++
>  package/pkg-download.mk | 3 ++-
>  support/download/git    | 9 ++++++---
>  3 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index 9bc8e51..f2bb5a6 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -96,6 +96,12 @@ config BR2_GIT
>  	string "Git command"
>  	default "git"
>  
> +config BR2_GIT_CACHE
> +	string "Git cache directory"
> +	default ""
> +	help
> +	  Path of Git cache directory (usefull to speed up git clone).
> +
>  config BR2_CVS
>  	string "CVS command"
>  	default "cvs"
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index a0f694d..5c017ca 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -80,7 +80,8 @@ define DOWNLOAD_GIT
>  		-- \
>  		$($(PKG)_SITE) \
>  		$($(PKG)_DL_VERSION) \
> -		$($(PKG)_BASE_NAME)
> +		$($(PKG)_BASE_NAME) \
> +		$(BR2_GIT_CACHE)
>  endef
>  
>  # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
> diff --git a/support/download/git b/support/download/git
> index 314b388..e461916 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -6,7 +6,7 @@ set -e
>  # Download helper for git, to be called from the download wrapper script
>  #
>  # Call it as:
> -#   .../git [-q] OUT_FILE REPO_URL CSET BASENAME
> +#   .../git [-q] OUT_FILE REPO_URL CSET BASENAME REFERENCE
>  #
>  # Environment:
>  #   GIT      : the git command to call
> @@ -24,6 +24,9 @@ output="${1}"
>  repo="${2}"
>  cset="${3}"
>  basename="${4}"
> +if [ -n "${5}" ]; then
> +    reference="--reference \"${5}\""

Please, use --dissociate as well, so that the new clone does only borrow
objects from the cache for the purpose of cloning.

(Yes, we trash the new repo right after making a tarball, but I often
play with my other git repositories while a BR build is on-going, so I
would not like to break the build in that case.)

Regards,
Yann E. MORIN.

> +fi
>  
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
> @@ -41,7 +44,7 @@ _git() {
>  git_done=0
>  if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
>      printf "Doing shallow clone\n"
> -    if _git clone ${verbose} --depth 1 -b "'${cset}'" --bare "'${repo}'" "'${basename}'"; then
> +    if _git clone ${verbose} ${reference} --depth 1 -b "'${cset}'" --bare "'${repo}'" "'${basename}'"; then
>          git_done=1
>      else
>          printf "Shallow clone failed, falling back to doing a full clone\n"
> @@ -49,7 +52,7 @@ if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
>  fi
>  if [ ${git_done} -eq 0 ]; then
>      printf "Doing full clone\n"
> -    _git clone ${verbose} --mirror "'${repo}'" "'${basename}'"
> +    _git clone ${verbose} ${reference} --mirror "'${repo}'" "'${basename}'"
>  fi
>  
>  GIT_DIR="${basename}" \
> -- 
> 2.5.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
