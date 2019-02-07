From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Feb 2019 22:33:20 +0100
Subject: [Buildroot] [TO-BE-TESTED] support/download/hg: implement
 repository cache
In-Reply-To: <20190205202433.25292-1-patrickdepinguin@gmail.com>
References: <20190205202433.25292-1-patrickdepinguin@gmail.com>
Message-ID: <5f0e55d2-99e2-bc68-4017-334dbafa35a9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/02/2019 21:24, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Similar to the git download helper, implement a repository cache for
> Mercurial repositories.
> 
> The code is mostly guided by the implementation for git, with certain parts
> copied almost verbatim.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  support/download/hg | 81 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 78 insertions(+), 3 deletions(-)
> 
> Note: this patch only got limited testing so far and needs to be tested further.
> But I already wanted to send it out for feedback and for those of you that want
> to help test it.

 It would be a good idea to do the same kind of copy and pasting on
support/testing/tests/download/test_git and its helpers and include that as the
first patches in the series.

 BTW, do you already have an idea of performance improvement?


> diff --git a/support/download/hg b/support/download/hg
> index efb515fca5..bb5cc87969 100755
> --- a/support/download/hg
> +++ b/support/download/hg
> @@ -1,7 +1,7 @@
>  #!/usr/bin/env bash
>  
>  # We want to catch any unexpected failure, and exit immediately
> -set -e
> +set -E

 If you do this, the comment above is no longer valid...
      -e  Exit immediately if a command exits with a non-zero status.
      -E  If set, the ERR trap is inherited by shell functions.
are not the same thing!

 However, since AFAICS the only function in this file is the trap handler
itself, this seems to be a mistake, no?

 Ow, this really is inherited from git, introduced by commit b7efb43e86da96.
Yann, care to explain?

>  
>  # Download helper for hg, to be called from the download wrapper script
>  #
> @@ -10,11 +10,39 @@ set -e
>  #   -o FILE     Generate archive in FILE.
>  #   -u URI      Clone from repository at URI.
>  #   -c CSET     Use changeset (or revision) CSET.
> +#   -d DLDIR    Download directory path.

 Hm, looks like this is missing in the git helper :-) Yann?

>  #   -n NAME     Use basename NAME.
>  #
[snip]
> +	Do *not* work in that directory; your changes will eventually get
> +	lost. Do *not* even use it as a remote, or as the source for new

 This bit is actually rubbish: it's perfectly fine to clone it, as long as you
don't push to it. Oh well.

> +	worktrees; your commits will eventually get lost.
> +_EOF_
> +
> +if ! [ -d "${hg_cache}/.hg" ]; then

 Is the presence of a .hg directory a 100% reliable of identifying it as a
mercurial repo?

> +    # While it would be possible to create an empty repo and use pull
> +    # subsequently, we intentionally use clone the first time as it could be
> +    # faster than pull thanks to clonebundles, if enabled on the server.
> +    printf "Cloning repository from '${uri}' into '${hg_cache}'\n"
> +    _hg clone ${verbose} "${@}" --noupdate "'${uri}'" "'${hg_cache}'"
> +else
> +    printf "Pulling repository from '${uri}' into '${hg_cache}'\n"
> +    _hg pull ${verbose} "${@}" --repository "'${hg_cache}'" "'${uri}'"
> +fi

 Does hg always do a full mirror on clone/pull? Or doesn't it have the concept
of special refs that git has?

> +
> +# Check that the changeset does exist. If it does not, re-cloning from
> +# scratch won't help, so we don't want to trash the repository for a
> +# missing commit. We just exit without going through the ERR trap.
> +if ! _hg identify --repository "'${hg_cache}'" --rev "'${cset}'" >/dev/null 2>&1; then
> +    printf "Commit '%s' does not exist in this repository\n." "${cset}"
> +    exit 1
> +fi
> +
> +# Make sure that there is no working directory. This will clear any user
> +# temptation to work in this directory.

 Good plan :-)

 Regards,
 Arnout

> +_hg update --repository "'${hg_cache}'" null >/dev/null 2>&1
>  
> -_hg archive ${verbose} --repository "'${basename}'" --type tgz \
> +_hg archive ${verbose} --repository "'${hg_cache}'" --type tgz \
>              --prefix "'${basename}'" --rev "'${cset}'" \
>              - >"${output}"
> 
