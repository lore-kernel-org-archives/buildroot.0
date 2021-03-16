From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Mar 2021 23:29:38 +0100
Subject: [Buildroot] [PATCH 2/2] support/download: print command used
 for download
In-Reply-To: <20210115150047.6895-2-patrickdepinguin@gmail.com>
References: <20210115150047.6895-1-patrickdepinguin@gmail.com>
 <20210115150047.6895-2-patrickdepinguin@gmail.com>
Message-ID: <20210316222938.GI3443324@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-01-15 16:00 +0100, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Even though that most download commands actually print some output, like
> progress indication or other messages, the actual command used is not. This
> makes it hard to analyze a build log when you are not fully familiar with
> the typical output of said log.
> 
> Update the download helpers to do just that, respecting any quiet/verbose
> flag so that a silent make (make -s) does not get more verbose.
> 
> Note: getting rid of the duplication of the command in the script is not
> straightforward without breaking support for arguments with spaces.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  support/download/bzr  | 3 +++
>  support/download/cvs  | 3 +++
>  support/download/file | 3 +++
>  support/download/git  | 3 +++
>  support/download/hg   | 3 +++
>  support/download/scp  | 3 +++
>  support/download/svn  | 3 +++
>  support/download/wget | 3 +++
>  8 files changed, 24 insertions(+)
> 
> diff --git a/support/download/bzr b/support/download/bzr
> index 7cc6890a30..379a8db753 100755
> --- a/support/download/bzr
> +++ b/support/download/bzr
> @@ -34,6 +34,9 @@ shift $((OPTIND-1)) # Get rid of our options
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
>  _bzr() {
> +    if [ -z "${quiet}" ]; then
> +        echo ${BZR} "${@}"

I've switched away from echo, to use printf instead.

Applied to master with that fixed, thanks.

Regards,
Yann E. MORIN.

> +    fi
>      eval ${BZR} "${@}"
>  }
>  
> diff --git a/support/download/cvs b/support/download/cvs
> index 463d70c220..04f030ff54 100755
> --- a/support/download/cvs
> +++ b/support/download/cvs
> @@ -39,6 +39,9 @@ shift $((OPTIND-1)) # Get rid of our options
>  # ). Since nobody sane will put large code bases in CVS, a timeout of
>  # 10 minutes should do the trick.
>  _cvs() {
> +    if [ -z "${quiet}" ]; then
> +        echo timeout 10m ${CVS} "${@}"
> +    fi
>      eval timeout 10m ${CVS} "${@}"
>  }
>  
> diff --git a/support/download/file b/support/download/file
> index e52fcf2c8c..7870a2f27c 100755
> --- a/support/download/file
> +++ b/support/download/file
> @@ -36,6 +36,9 @@ shift $((OPTIND-1)) # Get rid of our options
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
>  _localfiles() {
> +    if [ -n "${verbose}" ]; then
> +        echo ${LOCALFILES} "${@}"
> +    fi
>      eval ${LOCALFILES} "${@}"
>  }
>  
> diff --git a/support/download/git b/support/download/git
> index 01e0f214cf..369c256f75 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -79,6 +79,9 @@ trap _on_error ERR
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
>  _git() {
> +    if [ -z "${quiet}" ]; then
> +        echo GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
> +    fi
>      eval GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
>  }
>  
> diff --git a/support/download/hg b/support/download/hg
> index c8149c9c91..0dd27d78a2 100755
> --- a/support/download/hg
> +++ b/support/download/hg
> @@ -33,6 +33,9 @@ shift $((OPTIND-1)) # Get rid of our options
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
>  _hg() {
> +    if [ -z "${quiet}" ]; then
> +        echo ${HG} "${@}"
> +    fi
>      eval ${HG} "${@}"
>  }
>  
> diff --git a/support/download/scp b/support/download/scp
> index 636d66c66a..e2c9710992 100755
> --- a/support/download/scp
> +++ b/support/download/scp
> @@ -31,6 +31,9 @@ shift $((OPTIND-1)) # Get rid of our options
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
>  _scp() {
> +    if [ -z "${quiet}" ]; then
> +        echo ${SCP} "${@}"
> +    fi
>      eval ${SCP} "${@}"
>  }
>  
> diff --git a/support/download/svn b/support/download/svn
> index ab9bd85f45..e71ca804aa 100755
> --- a/support/download/svn
> +++ b/support/download/svn
> @@ -40,6 +40,9 @@ shift $((OPTIND-1)) # Get rid of our options
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
>  _svn() {
> +    if [ -z "${quiet}" ]; then
> +        echo ${SVN} "${@}"
> +    fi
>      eval ${SVN} "${@}"
>  }
>  
> diff --git a/support/download/wget b/support/download/wget
> index 1bcb1e4b00..5867f37f6f 100755
> --- a/support/download/wget
> +++ b/support/download/wget
> @@ -33,6 +33,9 @@ shift $((OPTIND-1)) # Get rid of our options
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
>  _wget() {
> +    if [ -z "${quiet}" ]; then
> +        echo ${WGET} "${@}"
> +    fi
>      eval ${WGET} "${@}"
>  }
>  
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
