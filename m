From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jan 2014 21:39:12 +0100
Subject: [Buildroot] [PATCH 2/6] pkg-infra: move git download helper to
 a script
In-Reply-To: <add407fe211f2032f76fda6442b06b7d8a3af2cc.1389569992.git.yann.morin.1998@free.fr>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <add407fe211f2032f76fda6442b06b7d8a3af2cc.1389569992.git.yann.morin.1998@free.fr>
Message-ID: <52D5A070.5040800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/01/14 00:44, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> The git download helper is getting a bit more complex, and does not
> raise an error when a PKG_VERSION is a sha1 that does not exist in
> the repository. Instead, it generates an empty archive.
>
> Fixing it in the Makefile proves to be challenging, to say the least.
>
> Move it into a shell script in support/download/git, which will make
> it much easier to read, maintain, fix an enhance in the future.

  This patch contains a few more changes than just moving it to a script. 
These should ideally be done in separate patches.

[snip]
> diff --git a/support/download/git b/support/download/git
> new file mode 100755
> index 0000000..99ea1b2
> --- /dev/null
> +++ b/support/download/git
> @@ -0,0 +1,36 @@
> +#!/bin/sh
> +set -e
> +
> +# Download helper for git
> +# Call it with:
> +#   $1: git repo
> +#   $2: git cset
> +#   $3: prefix/
> +#   $4: output file
> +# And this environment:
> +#   GIT      :  the git command to call
> +#   BUILD_DIR:  path to Buildroot's build dir
> +
> +repo="${1}"
> +cset="${2}"
> +prefix="${3}"
> +output="${4}"
> +
> +pushd "${BUILD_DIR}" >/dev/null

  This used to be DL_DIR.

  Note that I agree that BUILD_DIR is more appropriate.

  Although the original indeed does a pushd, this is quite redundant when 
it's done in a script. So I'd directly make it a simple cd (without 
redirection).

> +rm -rf .git-tmp-repo    # In case a previous attempt was interrupted
> +
> +if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
> +    printf "Doing shallow clone\n"
> +    ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" .git-tmp-repo

  It used to be extracted into $($(PKG)_BASE_NAME). That has the 
advantage that it is unique, which makes it possible to do multiple 
downloads in parallel (which I sometimes do BTW, by manually starting 
downloads in separate shells).

  But even better would be $($(PKG)_BASE_NAME).git-tmp-repo :-)

> +else
> +    printf "Doing full clone\n"
> +    ${GIT} clone --bare "${repo}" .git-tmp-repo
> +fi
> +
> +pushd .git-tmp-repo >/dev/null
> +${GIT} archive --prefix="${prefix}" --format=tar "${cset}"  \
> +|gzip -c >"${output}"

  We have about 20 instances of the | at the end of the line (as was the 
original), and only 4 at the beginning of the line (and two of these were 
done by you...).

  In the original, the / at the end of the prefix is added explicitly 
here in the call to git archive. I think that makes more sense than 
adding the / in the call itself.

  Regards,
  Arnout

> +popd >/dev/null
> +
> +rm -rf .git-tmp-repo
> +popd >/dev/null
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
