From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Mar 2021 23:27:42 +0100
Subject: [Buildroot] [PATCH 1/2] support/download: rename internal
 'verbose' variable where applicable
In-Reply-To: <20210115150047.6895-1-patrickdepinguin@gmail.com>
References: <20210115150047.6895-1-patrickdepinguin@gmail.com>
Message-ID: <20210316222742.GH3443324@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-01-15 16:00 +0100, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Most 'verbose' variable inside the download helpers actually mean 'quiet'.
> I.e. they are assigned in case quiet operation is requested, and empty in
> case of non-quiet operation. Using the name 'verbose' for such a variable is
> confusing, especially when you want to test the variable on emptiness or
> non-emptiness (in a subsequent commit).
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/download/bzr  | 6 +++---
>  support/download/cvs  | 6 +++---
>  support/download/git  | 4 ++--
>  support/download/hg   | 8 ++++----
>  support/download/scp  | 6 +++---
>  support/download/svn  | 6 +++---
>  support/download/wget | 6 +++---
>  7 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/support/download/bzr b/support/download/bzr
> index 5289a421cd..7cc6890a30 100755
> --- a/support/download/bzr
> +++ b/support/download/bzr
> @@ -16,10 +16,10 @@ set -e
>  #   BZR      : the bzr command to call
>  
>  
> -verbose=
> +quiet=
>  while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
> -    q)  verbose=-q;;
> +    q)  quiet=-q;;
>      o)  output="${OPTARG}";;
>      u)  uri="${OPTARG}";;
>      c)  cset="${OPTARG}";;
> @@ -53,6 +53,6 @@ if [ ${bzr_version} -ge ${bzr_min_version} ]; then
>      timestamp_opt="--per-file-timestamps"
>  fi
>  
> -_bzr export ${verbose} --root="'${basename}/'" --format=tgz \
> +_bzr export ${quiet} --root="'${basename}/'" --format=tgz \
>      ${timestamp_opt} - "${@}" "'${uri}'" -r "'${cset}'" \
>      >"${output}"
> diff --git a/support/download/cvs b/support/download/cvs
> index 9d0dc3cb3a..463d70c220 100755
> --- a/support/download/cvs
> +++ b/support/download/cvs
> @@ -16,10 +16,10 @@ set -e
>  # Environment:
>  #   CVS      : the cvs command to call
>  
> -verbose=
> +quiet=
>  while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
> -    q)  verbose=-Q;;
> +    q)  quiet=-Q;;
>      o)  output="${OPTARG}";;
>      u)  uri="${OPTARG#*://}";;
>      c)  rev="${OPTARG}";;
> @@ -57,7 +57,7 @@ if [[ ! "${uri}" =~ ^: ]]; then
>  fi
>  
>  export TZ=UTC
> -_cvs ${verbose} -z3 -d"'${uri}'" \
> +_cvs ${quiet} -z3 -d"'${uri}'" \
>       co "${@}" -d "'${basename}'" ${select} "'${rev}'" -P "'${rawname}'"
>  
>  tar czf "${output}" "${basename}"
> diff --git a/support/download/git b/support/download/git
> index fa98198fe0..01e0f214cf 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -50,11 +50,11 @@ _on_error() {
>      exec "${myname}" "${OPTS[@]}" || exit ${ret}
>  }
>  
> -verbose=
> +quiet=
>  recurse=0
>  while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
> -    q)  verbose=-q; exec >/dev/null;;
> +    q)  quiet=-q; exec >/dev/null;;
>      r)  recurse=1;;
>      o)  output="${OPTARG}";;
>      u)  uri="${OPTARG}";;
> diff --git a/support/download/hg b/support/download/hg
> index efb515fca5..c8149c9c91 100755
> --- a/support/download/hg
> +++ b/support/download/hg
> @@ -15,10 +15,10 @@ set -e
>  # Environment:
>  #   HG       : the hg command to call
>  
> -verbose=
> +quiet=
>  while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
> -    q)  verbose=-q;;
> +    q)  quiet=-q;;
>      o)  output="${OPTARG}";;
>      u)  uri="${OPTARG}";;
>      c)  cset="${OPTARG}";;
> @@ -36,8 +36,8 @@ _hg() {
>      eval ${HG} "${@}"
>  }
>  
> -_hg clone ${verbose} "${@}" --noupdate "'${uri}'" "'${basename}'"
> +_hg clone ${quiet} "${@}" --noupdate "'${uri}'" "'${basename}'"
>  
> -_hg archive ${verbose} --repository "'${basename}'" --type tgz \
> +_hg archive ${quiet} --repository "'${basename}'" --type tgz \
>              --prefix "'${basename}'" --rev "'${cset}'" \
>              - >"${output}"
> diff --git a/support/download/scp b/support/download/scp
> index 80cf495c4e..636d66c66a 100755
> --- a/support/download/scp
> +++ b/support/download/scp
> @@ -14,10 +14,10 @@ set -e
>  # Environment:
>  #   SCP       : the scp command to call
>  
> -verbose=
> +quiet=
>  while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
> -    q)  verbose=-q;;
> +    q)  quiet=-q;;
>      o)  output="${OPTARG}";;
>      f)  filename="${OPTARG}";;
>      u)  uri="${OPTARG}";;
> @@ -37,4 +37,4 @@ _scp() {
>  # Remove any scheme prefix
>  uri="${uri##scp://}"
>  
> -_scp ${verbose} "${@}" "'${uri}/${filename}'" "'${output}'"
> +_scp ${quiet} "${@}" "'${uri}/${filename}'" "'${output}'"
> diff --git a/support/download/svn b/support/download/svn
> index 839dccaf62..ab9bd85f45 100755
> --- a/support/download/svn
> +++ b/support/download/svn
> @@ -22,10 +22,10 @@ set -e
>  
>  . "${0%/*}/helpers"
>  
> -verbose=
> +quiet=
>  while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
> -    q)  verbose=-q;;
> +    q)  quiet=-q;;
>      o)  output="${OPTARG}";;
>      u)  uri="${OPTARG}";;
>      c)  rev="${OPTARG}";;
> @@ -43,7 +43,7 @@ _svn() {
>      eval ${SVN} "${@}"
>  }
>  
> -_svn export ${verbose} "${@}" "'${uri}@${rev}'" "'${basename}'"
> +_svn export ${quiet} "${@}" "'${uri}@${rev}'" "'${basename}'"
>  
>  # Get the date of the revision, to generate reproducible archives.
>  # The output format is YYYY-MM-DDTHH:MM:SS.mmmuuuZ (i.e. always in the
> diff --git a/support/download/wget b/support/download/wget
> index c69e6071aa..1bcb1e4b00 100755
> --- a/support/download/wget
> +++ b/support/download/wget
> @@ -15,10 +15,10 @@ set -e
>  # Environment:
>  #   WGET     : the wget command to call
>  
> -verbose=
> +quiet=
>  while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
> -    q)  verbose=-q;;
> +    q)  quiet=-q;;
>      o)  output="${OPTARG}";;
>      f)  filename="${OPTARG}";;
>      u)  url="${OPTARG}";;
> @@ -40,4 +40,4 @@ _wget() {
>  # mirror
>  [ -n "${encode}" ] && filename=${filename//\?/%3F}
>  
> -_wget ${verbose} "${@}" -O "'${output}'" "'${url}/${filename}'"
> +_wget ${quiet} "${@}" -O "'${output}'" "'${url}/${filename}'"
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
