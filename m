From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 07 Jul 2014 08:11:38 +0200
Subject: [Buildroot] [PATCH 2/5] support/download: properly use temp
	files
In-Reply-To: <3c2e529b6f9c542dba662b08b54f844f275e23ee.1404681878.git.yann.morin.1998@free.fr>
References: <cover.1404681878.git.yann.morin.1998@free.fr>
 <3c2e529b6f9c542dba662b08b54f844f275e23ee.1404681878.git.yann.morin.1998@free.fr>
Message-ID: <53BA3A1A.1000307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/07/14 23:27, Yann E. MORIN wrote:
> When using 'mv' to move files to temp files, the existing temp file is
> forcibly removed by 'mv', and a new file is created.
> 
> Although this should have little impact to us, there is still a race
> conditions in case two parallel downloads would step on each other's
> toes, and it goes like that:
> 
>     Process 1                       Process 2
>     mktemp tmp_output
>     mv tmp_dl tmp_output
>         removes tmp_output
>                                     mktemp tmp_ouput
>         writes to tmp_output
>                                     mv tmp_dl tmp_output
>                                         removes tmp_output
>                                         writes to tmp_output
>     mv tmp_output output
>                                     mv tmp_output output
> 
> In this case, mktemp has the opportunity to create the same tmp_output
> temporary file, and we trash the content from one with the content
> from the other, and the last to do the final 'mv' breaks horibly.
> 
> Instead, use 'cat', which guarantees that tmp_output is not removed
> before writing to it.

 Not that it makes a real difference, but I think that 'cp' is a more natural
way to do this.

> 
> This complexifies a bit the local-files (cp) helper, but better safe
> than sorry.
> 
> (Note: this is a purely theoretical issue, I did not observe it yet, but
> it is slated to happen one day or the other, and will be very hard to
> debug then.)

 Actually, since the mktemp string is based on time and PID, the chance of this
happening is really vanishingly small. That said, better safe than sorry.


> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  support/download/bzr  | 2 +-
>  support/download/cp   | 9 ++++++---
>  support/download/cvs  | 2 +-
>  support/download/git  | 4 ++--
>  support/download/hg   | 2 +-
>  support/download/scp  | 2 +-
>  support/download/svn  | 2 +-
>  support/download/wget | 2 +-
>  8 files changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/support/download/bzr b/support/download/bzr
> index 19d837d..f86fa82 100755
> --- a/support/download/bzr
> +++ b/support/download/bzr
> @@ -27,7 +27,7 @@ tmp_output="$( mktemp "${output}.XXXXXX" )"
>  
>  ret=1
>  if ${BZR} export --format=tgz "${tmp_dl}" "${repo}" -r "${rev}"; then
> -    if mv "${tmp_dl}" "${tmp_output}"; then
> +    if cat "${tmp_dl}" >"${tmp_output}"; then
>          mv "${tmp_output}" "${output}"
>          ret=0
>      fi

 Not really related to this patch, but why do we need this ${tmp_dl} to begin
with? Especially since we're already "occupying" a tempfile in DL_DIR anyway.

 Also, with this added complexity, the download helper scripts are becoming
quite similar. So wouldn't it be a good idea to refactor them? I'm thinking of
something like this:

support/download/helper:

#!/bin/bash

# We want to catch any command failure, and exit immediately
set -e

# Generic download helper
# Call it with:
#   $1: specific download helper
#   $2: output file
#   ...: arguments for the specific download helper

download="${1}"
output="${2}"
shift 2

tmp_output="$( mktemp ... )"
if "${download}" "${tmp_output}" "$@"; then
	# Blah blah need things to be atomic blah blah
	mv "${tmp_output}" "${output}"
fi



 I expect there will be even more common stuff between the download helpers in
the future, so it makes sense to have this.


> diff --git a/support/download/cp b/support/download/cp
> index 8f6bc06..e73159b 100755
> --- a/support/download/cp
> +++ b/support/download/cp
> @@ -13,12 +13,15 @@ set -e
>  source="${1}"
>  output="${2}"
>  
> +tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
>  tmp_output="$( mktemp "${output}.XXXXXX" )"
>  
>  ret=1
> -if ${LOCALFILES} "${source}" "${tmp_output}"; then
> -    mv "${tmp_output}" "${output}"
> -    ret=0
> +if ${LOCALFILES} "${source}" "${tmp_dl}"; then
> +    if cat "${tmp_dl}" >"${tmp_output}"; then

 Same here, what's the point of ${tmp_dl}?

> +        mv "${tmp_output}" "${output}"
> +        ret=0
> +    fi
>  fi
>  
>  # Cleanup
> diff --git a/support/download/cvs b/support/download/cvs
> index 9aeed79..a8ab080 100755
> --- a/support/download/cvs
> +++ b/support/download/cvs
> @@ -36,7 +36,7 @@ rm -rf "${repodir}"
>  ret=1
>  if ${CVS} -z3 -d":pserver:anonymous@${repo}" \
>             co -d "${repodir}" -r ":${rev}" -P "${rawname}"; then
> -    if tar czf "${tmp_output}" "${repodir}"; then
> +    if tar czf - "${repodir}" >"${tmp_output}"; then
>          mv "${tmp_output}" "${output}"
>          ret=0
>      fi
> diff --git a/support/download/git b/support/download/git
> index badb491..b0031e5 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -43,8 +43,8 @@ fi
>  
>  ret=1
>  pushd "${repodir}" >/dev/null
> -if ${GIT} archive --prefix="${basename}/" -o "${tmp_tar}" \
> -                  --format=tar "${cset}"; then
> +if ${GIT} archive --prefix="${basename}/" --format=tar "${cset}" \
> +                  >"${tmp_tar}"; then

 What's the reason for this change? I've checked with strace, and git archive
doesn't seem to unlink, it just does open(O_TRUNC) like cp.


>      if gzip -c "${tmp_tar}" >"${tmp_output}"; then
>          mv "${tmp_output}" "${output}"
>          ret=0
> diff --git a/support/download/hg b/support/download/hg
> index 6e9e26b..8b36db9 100755
> --- a/support/download/hg
> +++ b/support/download/hg
> @@ -35,7 +35,7 @@ ret=1
>  if ${HG} clone --noupdate --rev "${cset}" "${repo}" "${repodir}"; then
>      if ${HG} archive --repository "${repodir}" --type tgz \
>                       --prefix "${basename}" --rev "${cset}" \
> -                     "${tmp_output}"; then
> +                     - >"${tmp_output}"; then

 I didn't check for hg, but I also don't expect it to unlink() first. In fact,
it's mv's behaviour of unlinking first that is surprising.

>          mv "${tmp_output}" "${output}"
>          ret=0
>      fi
> diff --git a/support/download/scp b/support/download/scp
> index d3aad43..e16ece5 100755
> --- a/support/download/scp
> +++ b/support/download/scp
> @@ -17,7 +17,7 @@ tmp_output="$( mktemp "${output}.XXXXXX" )"
>  
>  ret=1
>  if ${SCP} "${url}" "${tmp_dl}"; then
> -    if mv "${tmp_dl}" "${tmp_output}"; then
> +    if cat "${tmp_dl}" >"${tmp_output}"; then
>          mv "${tmp_output}" "${output}"
>          ret=0
>      fi
> diff --git a/support/download/svn b/support/download/svn
> index 39cbbcb..259d3ed 100755
> --- a/support/download/svn
> +++ b/support/download/svn
> @@ -33,7 +33,7 @@ rm -rf "${repodir}"
>  
>  ret=1
>  if ${SVN} export "${repo}@${rev}" "${repodir}"; then
> -    if tar czf "${tmp_output}" "${repodir}"; then
> +    if tar czf - "${repodir}" >"${tmp_output}"; then

 Again, tar doesn't unlink so this isn't needed.



 Regards,
 Arnout

>          mv "${tmp_output}" "${output}"
>          ret=0
>      fi
> diff --git a/support/download/wget b/support/download/wget
> index cbeca3b..0f71108 100755
> --- a/support/download/wget
> +++ b/support/download/wget
> @@ -25,7 +25,7 @@ tmp_output="$( mktemp "${output}.XXXXXX" )"
>  
>  ret=1
>  if ${WGET} -O "${tmp_dl}" "${url}"; then
> -    if mv "${tmp_dl}" "${tmp_output}"; then
> +    if cat "${tmp_dl}" >"${tmp_output}"; then
>          mv "${tmp_output}" "${output}"
>          ret=0
>      fi
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
