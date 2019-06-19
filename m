From: John Keeping <john@metanate.com>
Date: Wed, 19 Jun 2019 16:34:20 +0100
Subject: [Buildroot] [RFC PATCH] download/git: ban branch references
In-Reply-To: <20190619151817.6331-1-john@metanate.com>
References: <20190619151817.6331-1-john@metanate.com>
Message-ID: <20190619163420.1a46c7eb@donbot>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 Jun 2019 16:18:17 +0100
John Keeping <john@metanate.com> wrote:

> As described in the manual, using a branch name as a version is not
> supported.  However, nothing enforces this so it is easy to specify a
> branch name either accidentally or because new developers have not read
> through the manual.
> 
> For Git it is reasonably easy to catch most violations of this rule and
> fail the fetch phase.  This isn't intended to be a comprehensive filter
> (it can be bypassed with, for example, FOO_VERSION=origin/master), but
> should catch accidental use of a branch version and prompt switching to
> an immutable reference.
> 
> Signed-off-by: John Keeping <john@metanate.com>
> ---

Just after sending this, I realised that the patch below doesn't work
for versions specified as a SHA1.

When we have a SHA1 version, then the earlier call to:

	_git fetch origin "'${cset}:${cset}'"

creates a *branch* refs/heads/${cset} for the SHA1.  Git then prints a
warning when passing the SHA1 to rev-parse:

	Git normally never creates a ref that ends with 40 hex characters
	because it will be ignored when you just specify 40-hex. These refs
	may be created by mistake. For example,

	  git checkout -b $br $(git rev-parse ...)

	where "$br" is somehow empty and a 40-hex ref is created. Please
	examine these refs and maybe delete them. Turn this message off by
	running "git config advice.objectNameWarning false"

Maybe we need to skip that fetch if ${cset} matches [0-9a-fA-F]+ or skip
it if ${cset} doesn't contain '/' since I think all of the special refs
we're interested in there will contain at least one branch separator.

>  support/download/git | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/support/download/git b/support/download/git
> index 075f665bbf..3f26613e61 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -134,6 +134,25 @@ if ! _git rev-parse --quiet --verify "'${cset}^{commit}'" >/dev/null 2>&1; then
>      exit 1
>  fi
>  
> +# Check that the specified version is not a branch. We expect a tag or
> +# raw commit hash, and accept some special refs as above. Using a branch
> +# is forbidden because these are mutable references.
> +case "${cset}" in
> +    refs/heads/*)
> +        printf >&2 "Refusing to use Git branch '%s'.\n" "${cset#refs/heads/}"
> +        exit 1
> +        ;;
> +    refs/*)
> +        : pass
> +        ;;
> +    *)
> +        if _git rev-parse --quiet --verify "refs/heads/${cset}" >/dev/null 2>&1; then
> +            printf >&2 "Refusing to use Git branch '%s'.\n" "${cset}"
> +            exit 1
> +        fi
> +        ;;
> +esac
> +
>  # The new cset we want to checkout might have different submodules, or
>  # have sub-dirs converted to/from a submodule. So we would need to
>  # deregister _current_ submodules before we checkout.
