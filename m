From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jan 2014 21:43:39 +0100
Subject: [Buildroot] [PATCH 3/6] pkg-infra: git helper creates an empty
 archive if PKG_VERSION is a missing hash
In-Reply-To: <b528cb41d4ac90bbccf471a88485b249eabfdc82.1389569992.git.yann.morin.1998@free.fr>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <b528cb41d4ac90bbccf471a88485b249eabfdc82.1389569992.git.yann.morin.1998@free.fr>
Message-ID: <52D5A17B.8010703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/01/14 00:44, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> If the PKG_VERSION is a sha1 that does not exist in the repository, the git
> helper just creates an empty archive instead of failing and erroring out.
>
> This is because of the way we create the archive:
>      git archive ${cset} |gzip -c >"${archive}"
>
> In this construct, git does exit with a non-zero exit-code, but gzip does not,
> as it was successful in creating the archive (from an empty output, but gzip
> does not mind that).
>
> Since a pipe exits with the exit-code of the right-most simple command (see
> POSIX.1-2008), the pipe above exits with gzip's exit-code. And we miss the
> error altogether.
>
> This is most harmful, in that the error may not occur until much later, when
> we try to configure the package, with the error message buried deep down
> ipotentially thousands of lines above... :-(
>
> Fix that by checking that the hash (or whatever treeish we've been passed, for
> that matters) does indeed exist in the repository, before we even attempt to
> create the archive.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>   support/download/git | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/support/download/git b/support/download/git
> index 99ea1b2..508f8a1 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -28,9 +28,15 @@ else
>   fi
>
>   pushd .git-tmp-repo >/dev/null
> -${GIT} archive --prefix="${prefix}" --format=tar "${cset}"  \
> -|gzip -c >"${output}"
> +res=1
> +if ${GIT} rev-list -n 1 "${cset}" >/dev/null 2>&1; then

  When we've done a shallow clone, this check is redundant because we 
have cloned exactly this ref.

  So instead, I'd do the check in the full clone condition, with an 
explicit exit.

  Regards,
  Arnout

> +    ${GIT} archive --prefix="${prefix}" --format=tar "${cset}"  \
> +    |gzip -c >"${output}"
> +    res=0
> +fi
>   popd >/dev/null
>
>   rm -rf .git-tmp-repo
>   popd >/dev/null
> +
> +exit ${res}
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
