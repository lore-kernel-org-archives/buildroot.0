From: Matthew Weber <matt@thewebers.ws>
Date: Sat, 2 Apr 2016 00:01:29 -0500
Subject: [Buildroot] [PATCH 2/4 v2] support/download/git: do not use git
 archive, handle it manually
In-Reply-To: <5a6f95aea1aac633ba580a190c833d45005ea918.1459541702.git.yann.morin.1998@free.fr>
References: <cover.1459541702.git.yann.morin.1998@free.fr>
 <5a6f95aea1aac633ba580a190c833d45005ea918.1459541702.git.yann.morin.1998@free.fr>
Message-ID: <CAFt09wMUvXdk65MOOF_RQvS06iCGDbLyrC7SDKJjcdhZ0PaJwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Fri, Apr 1, 2016 at 3:25 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> We currently use git-archive to generate the tarball. This is all handy
> and dandy, but git-archive does not support submodules. In the follow-up
> patch, we're going to handle submodules, so we would not be able to use
> git-archive.
>
> Instead, we manually generate the archive:
>   - extract the tree to the requested cset,
>   - get the date of the commit to store in the archive,
>   - store only numeric owners,
>   - store owner and group as 0 (zero, although any arbitrary value would
>     have been fine, as long as it's a constant),
>   - sort the files to store in the archive.
>
> We also get rid of the .git directory, because there is no reason to
> keep it in the context of Buildroot. Some people would love to keep it
> so as to speed up later downloads when updating a package, but that is
> not really doable. For example:
>   - use current Buildroot
>   - it would need foo-12345, so do a clone and keep the .git in the
>     generated tarball
>   - update Buildroot
>   - it would need foo-98765
> For that second clone, how could we know we would have to first extract
> foo-12345 ? So, the .git in the archive is pretty much useless for
> Buildroot.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Tested-by: Matt Weber <matt@thewebers.ws>
Reviewed-by: Matt Weber <matt@thewebers.ws>

> ---
>  support/download/git | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/support/download/git b/support/download/git
> index 20b436e..5672217 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -65,9 +65,17 @@ if ! _git fetch "'${cset}:${cset}'" >/dev/null 2>&1; then
>      printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
>  fi
>
> -_git archive --prefix="'${basename}/'" -o "'${output}.tmp'" --format=tar "'${cset}'"
> +# Checkout the required changeset.
> +_git checkout -q "'${cset}'"
> +
> +# Get date of commit to generate a reproducible archive.
> +date="$( _git show --no-patch --pretty=format:%cD )"
> +
> +# We do not need the .git dir to generate the tarball
> +rm -rf .git
>
> -# Not really required, but here for consistency
>  popd >/dev/null
>
> +tar cf - --numeric-owner --owner=0 --group=0 --mtime="${date}" \
> +         -T <(find "${basename}" -not -type d |sort) >"${output}.tmp"
>  gzip -n <"${output}.tmp" >"${output}"
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Thanks,
Matt
