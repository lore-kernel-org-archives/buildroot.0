From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jul 2014 23:40:22 +0200
Subject: [Buildroot] [PATCH 5/5] support/download: rationalise naming
 and use of the temporary files
In-Reply-To: <68fe3038dcc98bd803b0fe01a3d26cf95be97d4b.1404681878.git.yann.morin.1998@free.fr>
References: <cover.1404681878.git.yann.morin.1998@free.fr>
 <68fe3038dcc98bd803b0fe01a3d26cf95be97d4b.1404681878.git.yann.morin.1998@free.fr>
Message-ID: <20140706214022.GG3684@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Doing a review of my own series...

Damn, I'm feeling so schizophrenic, now... ;-]

On 2014-07-06 23:27 +0200, Yann E. MORIN spake thusly:
> Currently, we have temporary files to store 'downloaded' files or
> repositories, and they all are created using 'mktemp .XXXXXX'.
> Also, temporary repositories are named in a inconsistent manner.
> 
> This poses a problem in case something goes wrong: it is not possible
> to easily see what temp file corresponds to what attempted download.
> 
> Make all this a bit more homogeneous:
>   - name the temporary files and directories after the final file,
>     with this mktemp pattern:   ${BUILD_DIR}/.${output##*/}.XXXXXX
> 
> This ensures it is easy to correlate a temp file or dir to the
> associated download attempt.
[--SNIP--]
> --- a/support/download/cvs
> +++ b/support/download/cvs
> @@ -20,28 +20,31 @@ rawname="${3}"
>  basename="${4}"
>  output="${5}"
>  
> -repodir="${basename}.tmp-cvs-checkout"
> -
> -cd "${BUILD_DIR}"
> -# Remove leftovers from a previous failed run
> -rm -rf "${repodir}"
> -
>  # Play tic-tac-toe with temp files
>  # - first, we download to a trashable location (the build-dir)
>  # - then we create a temporary tarball in the final location, so it is
>  #   on the same filesystem as the final file
>  # - finally, we atomically rename to the final file
>  
> +# Since cvs by itself is not capable of generating archives, we use
> +# a little trick of tar, to transform the filenames as they are being
> +# added to the archive, by replacing the leadin '.' with the basename
> +# of the package. Note: basename is just that, a basename, so it does
> +# not contain any '/', so we need not escape them for the transform
> +# expression.
> +
>  ret=1
> +repodir="$( mktemp -d "${BUILD_DIR}/.${output##*/}.XXXXXX" )"
>  if ${CVS} -z3 -d":pserver:anonymous@${repo}" \
>             co -d "${repodir}" -r ":${rev}" -P "${rawname}"; then
>      tmp_output="$( mktemp "${output}.XXXXXX" )"
> -    if tar czf - "${repodir}" >"${tmp_output}"; then
> +    if tar czf - -C "${repodir}" --transform "s/^\./${basename}/;" . \
> +           >"${tmp_output}"; then
>          mv "${tmp_output}" "${output}"
>          ret=0
>      fi
>  fi
>  
>  # Cleanup
> -rm -rf "${repodir}" "${tmp_output}"
> +rm -rf "${tmpdir}" "${tmp_output}"

This hunk is a left-over from a previous tentative. I forgot to remove
that.

/me reaches for his flame-thrower...

>  exit ${ret}
> diff --git a/support/download/git b/support/download/git
> index d3fcdaf..011c055 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -18,8 +18,6 @@ cset="${2}"
>  basename="${3}"
>  output="${4}"
>  
> -repodir="${basename}.tmp-git-checkout"
> -
>  # Play tic-tac-toe with temp files
>  # - first, we download to a trashable location (the build-dir)
>  # - then we create the uncomporessed tarball in tht same trashable location
> @@ -27,12 +25,11 @@ repodir="${basename}.tmp-git-checkout"
>  #   it is on the same filesystem as the final file
>  # - finally, we atomically rename to the final file
>  
> +# Upon failure, git cleans behind itself, so no need to catch failures
> +# here. The only case when git would not clean up, is if it gets killed
> +# with SIGKILL, which is user-initiated, so we let the user handle that.
>  cd "${BUILD_DIR}"
> -# Remove leftovers from a previous failed run
> -rm -rf "${repodir}"
> -
> -# Upon failure, git cleans behind itself, so no need to catch failures here.
> -# The only case when git would not clean up, is if it gets killed with SIGKILL.

And the rewrite of this comment should have been folded in the
corresponding changeset... :-(

> diff --git a/support/download/scp b/support/download/scp
> index 1cc18de..192508b 100755
> --- a/support/download/scp
> +++ b/support/download/scp
> @@ -12,9 +12,11 @@ set -e
>  
>  url="${1}"
>  output="${2}"
> -tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
> +tmp_dl="$( mktemp "${BUILD_DIR}/.${output##*/}..XXXXXX" )"

And there is a double-dot here... :-(

> diff --git a/support/download/svn b/support/download/svn
> index 232d887..db98143 100755
> --- a/support/download/svn
> +++ b/support/download/svn
> @@ -31,7 +25,9 @@ rm -rf "${repodir}"
>  # - finally, we atomically rename to the final file
>  
>  ret=1
> -if ${SVN} export "${repo}@${rev}" "${repodir}"; then
> +cd "${BUILD_DIR}"
> +repodir="$( mktemp -d ".${output##*/}.XXXXXX" )"
> +if ${SVN} export --force "${repo}@${rev}" "${repodir}"; then
>      tmp_output="$( mktemp "${output}.XXXXXX" )"
>      if tar czf - "${repodir}" >"${tmp_output}"; then

And here, we should use the same trick as is used for cvs.

Sigh...

I'll wait for more comments before re-spinning the series...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
