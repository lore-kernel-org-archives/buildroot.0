From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jul 2014 18:45:56 +0200
Subject: [Buildroot] [PATCH 2/6 v2] support/download: fix the git helper
In-Reply-To: <b0bdeb224c0dab926128a93fe7ddf31d4a3b67ac.1404769268.git.yann.morin.1998@free.fr>
References: <cover.1404769268.git.yann.morin.1998@free.fr>
 <b0bdeb224c0dab926128a93fe7ddf31d4a3b67ac.1404769268.git.yann.morin.1998@free.fr>
Message-ID: <53BC2044.1040409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/07/14 23:44, Yann E. MORIN wrote:
> When switching the git helper over to a shell script, a special case was
> not carried over: in case the remote has the required reference, we
> attempt a shallow clone, using --depth 1. However, this is not supported
> when the remote is accessed with the http protocol.
> 
> Therefore, the download fails.
> 
> What happened before the conversion to a shell script was that the helper
> in the Makefile would fallback to doing a full-clone.
> 
> This is the case and behaviour that were lost in the conversion.
> 
> To avoid making the script too complex, we only attempt a full clone if
> needed. And we decide that a full clone is needed by default; we decide
> it is unnecessary if the remote has the needed reference *and* the
> shallow clone was successful.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Actually, the ls-remote step is a bit useless: a failing shallow clone will not
be slower, and if it succeeds it wasn't necessary to begin with.

 Regards,
 Arnout

> ---
>  support/download/git | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/support/download/git b/support/download/git
> index badb491..116e5a9 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -33,10 +33,14 @@ cd "${BUILD_DIR}"
>  # Remove leftovers from a previous failed run
>  rm -rf "${repodir}"
>  
> +git_done=0
>  if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
>      printf "Doing shallow clone\n"
> -    ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" "${repodir}"
> -else
> +    if ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" "${repodir}"; then
> +        git_done=1
> +    fi
> +fi
> +if [ ${git_done} -eq 0 ]; then
>      printf "Doing full clone\n"
>      ${GIT} clone --bare "${repo}" "${repodir}"
>  fi
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
