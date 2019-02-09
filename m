From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Feb 2019 22:53:19 +0100
Subject: [Buildroot] [PATCHv3 2/7] support/download/hg: implement
 source-check
In-Reply-To: <20190209202350.4984-2-patrickdepinguin@gmail.com>
References: <20190209202350.4984-1-patrickdepinguin@gmail.com>
 <20190209202350.4984-2-patrickdepinguin@gmail.com>
Message-ID: <20190209215319.GH3079@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-02-09 21:23 +0100, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Note: the implementation is different (better) than what used to be in
> Buildroot before source-check was removed.
> 
> The original implementation:
>     hg incoming --force -l1 <URL>
> would only verify that the repository exists, not that the requested
> revision is present.
> 
> An already better implementation is:
>     hg incoming --force -l1 -r <revision> <URL>
> but compared to the next solution it has a large resource consumption on the
> local machine. In the background, the full repository is first downloaded.
> 
> The implemented solution is:
>     hg identify -r <revision> <URL>
> which operates directly on the remote repository.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  support/download/hg | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> v3: no changes
> 
> diff --git a/support/download/hg b/support/download/hg
> index efb515fca5..ed8dcfbcff 100755
> --- a/support/download/hg
> +++ b/support/download/hg
> @@ -7,6 +7,7 @@ set -e
>  #
>  # Options:
>  #   -q          Be quiet.
> +#   -C          Only check that the changeset exists in the remote repository.
>  #   -o FILE     Generate archive in FILE.
>  #   -u URI      Clone from repository at URI.
>  #   -c CSET     Use changeset (or revision) CSET.
> @@ -19,6 +20,7 @@ verbose=
>  while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
>      q)  verbose=-q;;
> +    C)  checkonly=1;;

I've come to like an alternate solution to handle boolean options:

    checkonly=false
    while getopts ...; do
        case "${OPT}" in
            C)  checkonly=true;;
        esac
    done

Which allows to write nicer conditions:

    if ${checkonly}; then
        ...
    fi

>      o)  output="${OPTARG}";;
>      u)  uri="${OPTARG}";;
>      c)  cset="${OPTARG}";;
> @@ -36,6 +38,11 @@ _hg() {
>      eval ${HG} "${@}"
>  }
>  
> +if [ -n "${checkonly}" ]; then
> +    _hg identify ${verbose} "${@}" --rev "'${cset}'" "'${uri}'" > /dev/null
> +    exit ${?}

Incorrect use of exit. The script has a 'set -e' at the beginning, so a
command that exits in error will cause the script to abort. So, if the
script reaches the exit clause, it means the call to _hg did not fail.
Ditto the other backends, of course.

Also, I think it always makes sense to check that the revision exists,
even if doing the actual download: it allows for a fastpath even in case
the user wants to do the actual download anyway:

    if ! _hg identify ${verbose} "${@}" --rev "'${cset}'" "'${uri}'" > /dev/null; then
        printf 'error blabla no such revision blabla\n'
        exit 1
    fi
    if ${checkonly}; then exit 0; fi

Note that we did use to have a similar test with git, but it was nt
reliable (i.e. old git servers and/or configuration of git server that
did not behave when ls-remote was fed some forms of refs, like a sha1 or
susch)

Regards,
Yann E. MORIN.

> +fi
> +
>  _hg clone ${verbose} "${@}" --noupdate "'${uri}'" "'${basename}'"
>  
>  _hg archive ${verbose} --repository "'${basename}'" --type tgz \
> -- 
> 2.19.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
