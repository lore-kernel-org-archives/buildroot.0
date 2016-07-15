From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Jul 2016 17:54:35 +0200
Subject: [Buildroot] [PATCH v2 1/6] support/download: Add support to
 pass options directly to downloaders
In-Reply-To: <1468315820-9341-2-git-send-email-romain.perier@free-electrons.com>
References: <1468315820-9341-1-git-send-email-romain.perier@free-electrons.com>
 <1468315820-9341-2-git-send-email-romain.perier@free-electrons.com>
Message-ID: <20160715155435.GC3692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-07-12 11:30 +0200, Romain Perier spake thusly:
> This adds support to pass options to the underlying command that is used
> by downloader. Useful for retrieving data with server-side checking for
> user login or passwords, use a proxy or use specific options for cloning
> a repository via git and hg.
> 
> Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
> ---
[--SNIP--]
> diff --git a/support/download/bzr b/support/download/bzr
> index e18b01f..9443e03 100755
> --- a/support/download/bzr
> +++ b/support/download/bzr
> @@ -25,6 +25,7 @@ output="${1}"
>  repo="${2}"
>  rev="${3}"
>  basename="${4}"
> +dl_opts="${5}"

With Thomas, we've recently discussed the way we currently pass options
to the download helpers.

As you could experience first-hand, it is not trivial to add new options
to those helpers, because they expect their arguments to be non-otions:
URL, version, site... They only accept a single option, that nust be the
first argument shen calling them.

Instead, Thomas suggested, and I concur, that we should change them all
so that we pass them those as options. For example:

  - for bzr:
    -o output-file
    -r repo-url
    -R revision
    -n basename

  - for cp:
    -o output-file
    -s soruce-file

  - for cvs;
    -o output-file
    -r repo-url
    -R revision
    -N rawname
    -n basename

  - for git:
    -o output-file  # Do you see a pattern here? ;-)
    -r repo-url     # and here? ;-)
    -c cset
    -n basenamne

and so on...

That way, adding more options will be dead easy.

Regards,
Yann E. MORIN.

>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
> @@ -49,5 +50,5 @@ if [ ${bzr_version} -ge ${bzr_min_version} ]; then
>  fi
>  
>  _bzr export ${verbose} --root="'${basename}/'" --format=tgz \
> -    ${timestamp_opt} - "'${repo}'" -r "'${rev}'" \
> +    ${timestamp_opt} - "${dl_opts}" "'${repo}'" -r "'${rev}'" \
>      >"${output}"
> diff --git a/support/download/cp b/support/download/cp
> index 09ce3d1..8864a9d 100755
> --- a/support/download/cp
> +++ b/support/download/cp
> @@ -27,6 +27,7 @@ shift $((OPTIND-1))
>  
>  output="${1}"
>  source="${2}"
> +dl_opts="${3}"
>  
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
> @@ -34,4 +35,4 @@ _localfiles() {
>      eval ${LOCALFILES} "${@}"
>  }
>  
> -_localfiles ${verbose} "'${source}'" "'${output}'"
> +_localfiles ${verbose} "${dl_opts}""'${source}'" "'${output}'"
> diff --git a/support/download/cvs b/support/download/cvs
> index 7980389..e02c58e 100755
> --- a/support/download/cvs
> +++ b/support/download/cvs
> @@ -25,6 +25,7 @@ repo="${2}"
>  rev="${3}"
>  rawname="${4}"
>  basename="${5}"
> +dl_opts="${6}"
>  
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
> @@ -48,6 +49,6 @@ fi
>  
>  export TZ=UTC
>  _cvs ${verbose} -z3 -d"'${repo}'" \
> -     co -d "'${basename}'" ${select} "'${rev}'" -P "'${rawname}'"
> +     co "${dl_opts}" -d "'${basename}'" ${select} "'${rev}'" -P "'${rawname}'"
>  
>  tar czf "${output}" "${basename}"
> diff --git a/support/download/git b/support/download/git
> index 314b388..7fd7563 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -24,6 +24,7 @@ output="${1}"
>  repo="${2}"
>  cset="${3}"
>  basename="${4}"
> +dl_opts="${5}"
>  
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
> @@ -49,7 +50,7 @@ if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
>  fi
>  if [ ${git_done} -eq 0 ]; then
>      printf "Doing full clone\n"
> -    _git clone ${verbose} --mirror "'${repo}'" "'${basename}'"
> +    _git clone ${verbose} "${dl_opts}" --mirror "'${repo}'" "'${basename}'"
>  fi
>  
>  GIT_DIR="${basename}" \
> diff --git a/support/download/hg b/support/download/hg
> index 25cb4e9..04ca7a0 100755
> --- a/support/download/hg
> +++ b/support/download/hg
> @@ -24,6 +24,7 @@ output="${1}"
>  repo="${2}"
>  cset="${3}"
>  basename="${4}"
> +dl_opts="${5}"
>  
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
> @@ -31,7 +32,7 @@ _hg() {
>      eval ${HG} "${@}"
>  }
>  
> -_hg clone ${verbose} --noupdate "'${repo}'" "'${basename}'"
> +_hg clone ${verbose} "${dl_opts}" --noupdate "'${repo}'" "'${basename}'"
>  
>  _hg archive ${verbose} --repository "'${basename}'" --type tgz \
>              --prefix "'${basename}'" --rev "'${cset}'" \
> diff --git a/support/download/scp b/support/download/scp
> index 95cf502..7ecc0d0 100755
> --- a/support/download/scp
> +++ b/support/download/scp
> @@ -22,6 +22,7 @@ shift $((OPTIND-1))
>  
>  output="${1}"
>  url="${2}"
> +dl_opts="${3}"
>  
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
> @@ -29,4 +30,4 @@ _scp() {
>      eval ${SCP} "${@}"
>  }
>  
> -_scp ${verbose} "'${url}'" "'${output}'"
> +_scp ${verbose} "${dl_opts}" "'${url}'" "'${output}'"
> diff --git a/support/download/svn b/support/download/svn
> index 4dcdd06..695762e 100755
> --- a/support/download/svn
> +++ b/support/download/svn
> @@ -24,6 +24,7 @@ output="${1}"
>  repo="${2}"
>  rev="${3}"
>  basename="${4}"
> +dl_opts="${5}"
>  
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
> @@ -31,6 +32,6 @@ _svn() {
>      eval ${SVN} "${@}"
>  }
>  
> -_svn export ${verbose} "'${repo}@${rev}'" "'${basename}'"
> +_svn export ${verbose} "${dl_opts}" "'${repo}@${rev}'" "'${basename}'"
>  
>  tar czf "${output}" "${basename}"
> diff --git a/support/download/wget b/support/download/wget
> index 0fc7ffa..95019dc 100755
> --- a/support/download/wget
> +++ b/support/download/wget
> @@ -6,7 +6,7 @@ set -e
>  # Download helper for wget, to be called from the download wrapper script
>  #
>  # Call it as:
> -#   .../wget [-q] OUT_FILE URL
> +#   .../wget [-q] OUT_FILE URL [DL_OPTS]
>  #
>  # Environment:
>  #   WGET     : the wget command to call
> @@ -22,6 +22,7 @@ shift $((OPTIND-1))
>  
>  output="${1}"
>  url="${2}"
> +dl_opts="${3}"
>  
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
> @@ -29,4 +30,4 @@ _wget() {
>      eval ${WGET} "${@}"
>  }
>  
> -_wget ${verbose} -O "'${output}'" "'${url}'"
> +_wget ${verbose} "${dl_opts}" -O "'${output}'" "'${url}'"
> -- 
> 2.8.1
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
