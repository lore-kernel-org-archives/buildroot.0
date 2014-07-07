From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 07 Jul 2014 18:08:26 +0200
Subject: [Buildroot] [PATCH 4/5] support/download: only create final
 temp file when needed
In-Reply-To: <399c6d6d31d5b3dbe337ce97bb18c3e19f224422.1404681878.git.yann.morin.1998@free.fr>
References: <cover.1404681878.git.yann.morin.1998@free.fr>
 <399c6d6d31d5b3dbe337ce97bb18c3e19f224422.1404681878.git.yann.morin.1998@free.fr>
Message-ID: <53BAC5FA.50004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/07/14 23:27, Yann E. MORIN wrote:
> Create the temp file in the final location only when it is needed.
> 
> This avoids the nasty experience of seeing lots of temp files in
> BR2_DL_DIR, that would linger around in case the downloads fails.

 It would also help to add a

trap "rm -f ${tmp_dl}" EXIT HUP INT QUIT TERM

which also removes the need of doing the rm at the end. Of course, that trap is
still racy (interrupt between mktemp and trap).

 But with the two temporary variables, adding a trap becomes even more
difficult. Unless that part is refactored into a separate helper script of
course :-)

> 
> Add a comment on why we don;t clean-up after git.

 Typo in don;t

> 
> Reported-by: Peter Korsgaard <jacmet@uclibc.org>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  support/download/bzr  | 2 +-
>  support/download/cvs  | 2 +-
>  support/download/git  | 6 ++++--
>  support/download/hg   | 2 +-
>  support/download/scp  | 2 +-
>  support/download/svn  | 2 +-
>  support/download/wget | 2 +-
>  7 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/support/download/bzr b/support/download/bzr
> index f86fa82..a2cb440 100755
> --- a/support/download/bzr
> +++ b/support/download/bzr
> @@ -17,7 +17,6 @@ rev="${2}"
>  output="${3}"
>  
>  tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
> -tmp_output="$( mktemp "${output}.XXXXXX" )"
>  
>  # Play tic-tac-toe with temp files
>  # - first, we download to a trashable location (the build-dir)
> @@ -27,6 +26,7 @@ tmp_output="$( mktemp "${output}.XXXXXX" )"
>  
>  ret=1
>  if ${BZR} export --format=tgz "${tmp_dl}" "${repo}" -r "${rev}"; then
> +    tmp_output="$( mktemp "${output}.XXXXXX" )"
>      if cat "${tmp_dl}" >"${tmp_output}"; then
>          mv "${tmp_output}" "${output}"
>          ret=0
> diff --git a/support/download/cvs b/support/download/cvs
> index a8ab080..22863d8 100755
> --- a/support/download/cvs
> +++ b/support/download/cvs
> @@ -21,7 +21,6 @@ basename="${4}"
>  output="${5}"
>  
>  repodir="${basename}.tmp-cvs-checkout"
> -tmp_output="$( mktemp "${output}.XXXXXX" )"
>  
>  cd "${BUILD_DIR}"
>  # Remove leftovers from a previous failed run
> @@ -36,6 +35,7 @@ rm -rf "${repodir}"
>  ret=1
>  if ${CVS} -z3 -d":pserver:anonymous@${repo}" \
>             co -d "${repodir}" -r ":${rev}" -P "${rawname}"; then
> +    tmp_output="$( mktemp "${output}.XXXXXX" )"
>      if tar czf - "${repodir}" >"${tmp_output}"; then
>          mv "${tmp_output}" "${output}"
>          ret=0
> diff --git a/support/download/git b/support/download/git
> index b0031e5..d3fcdaf 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -19,8 +19,6 @@ basename="${3}"
>  output="${4}"
>  
>  repodir="${basename}.tmp-git-checkout"

 (not related to this patch) It's actually not a checkout, it's a bare clone.

> -tmp_tar="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
> -tmp_output="$( mktemp "${output}.XXXXXX" )"
>  
>  # Play tic-tac-toe with temp files
>  # - first, we download to a trashable location (the build-dir)
> @@ -33,6 +31,8 @@ cd "${BUILD_DIR}"
>  # Remove leftovers from a previous failed run
>  rm -rf "${repodir}"
>  
> +# Upon failure, git cleans behind itself, so no need to catch failures here.
> +# The only case when git would not clean up, is if it gets killed with SIGKILL.

 I think the SIGKILL is reason enough to do the rm explicitly in the script. Of
course, this is only valid if you use the trap, otherwise you never reach the rm
(due to 'set -e').


 Regards,
 Arnout

>  if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
>      printf "Doing shallow clone\n"
>      ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" "${repodir}"
> @@ -43,8 +43,10 @@ fi
>  
>  ret=1
>  pushd "${repodir}" >/dev/null
> +tmp_tar="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
>  if ${GIT} archive --prefix="${basename}/" --format=tar "${cset}" \
>                    >"${tmp_tar}"; then
> +    tmp_output="$( mktemp "${output}.XXXXXX" )"
>      if gzip -c "${tmp_tar}" >"${tmp_output}"; then
>          mv "${tmp_output}" "${output}"
>          ret=0
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
