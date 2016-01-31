From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 31 Jan 2016 20:42:23 +0100
Subject: [Buildroot] [PATCH 12/16 v3] core/legal-info: renumber saved
 patches
In-Reply-To: <89835259941b9067e4482d51ab2f45fa5e373262.1454004518.git.yann.morin.1998@free.fr>
References: <cover.1454004518.git.yann.morin.1998@free.fr>
 <89835259941b9067e4482d51ab2f45fa5e373262.1454004518.git.yann.morin.1998@free.fr>
Message-ID: <56AE639F.3080304@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Yann E. MORIN wrote:
> Patches we save can come from various locations;
>    - bundled with Buildroot
>    - downloaded
>    - from one or more global-patch-dir
>
> It is possible that two patches lying into different locations have the
> same basename, like so (first is bundled, second is from an hypothetical
> global-patch-dir):
>      package/foo/0001-fix-Makefile.patch
>      /path/to/my/patches/foo/0001-fix-Makefile.patch
>
> In that case, we'd save onlt the second patch, overwriting the first.

onlt -> only

Indeed for legal-info it would be a serious issue if we silently
overwrite a patch, resulting in _silently_ missing a patch. Thus this
must be fixed somehow, and I would not merge the previous patch without
this one (or any variation we come up with).

As an alternative solution, Arnout proposed to error out if two patches
have the same basename. Even though if would avoid the ugly prefixing,
it would unnecessarily break builds without a need (as far as the
development is concerned).

Thus, I moderately prefer Yann's solution. It could be improved by
renaming only files that have identical names, but that might be
overkill, and can definitely be done later.

>
> We fix that by forcibly prefixing saved patches with a new numbering, to
> guarantee the unicity of saved files.
>
> The unfortunate side-effects are that:
>    - most saved patches will be twice-numbered,
>    - the series file is now redundant.
>
> While the former is mostly not nice-looking, we shouldn't try to strip
> any leading numbering, as that might not be a numbering (e.g.
> 42-retries.patch which is a patch add 42 retries).
>
> The latter is not really problematic. A lot of tools (and people) can
> work with, and prefer to have a series file.

I agree, leaving the series file may be useful to somebody, and it
doesn't hurt anyway.

>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
>
> ---
> Note that I've made this a separate change, not because the patch would
> be too complex if squahed with the previous, but rather to have a more
> detailed commit log about the reason for the renumbering; squashing the
> two changes together would make for a really long commit log, at the
> risk of being more difficult to follow.
> ---
>   package/pkg-generic.mk | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index c5b66db..f6132b3 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -825,9 +825,16 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
>   		     $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
>   		     $$($(2)_REDIST_SOURCES_DIR))
>   # Copy patches and generate the series file
> -	$$(Q)while read f; do \
> -		$$(call hardlink-copy,$$$${f},$$($(2)_REDIST_SOURCES_DIR)) || exit 1; \
> -		printf "%s\n" "$$$${f##*/}" >>$$($(2)_REDIST_SOURCES_DIR)/series || exit 1; \
> +# Because patches may come from various places (bundled in Buildroot,
> +# from one or more global-patch-dir), there might be collisions on the
> +# basenames of those files.
> +# We add a new numbering to each patch to ensure unicity of the filenames.
> +	$$(Q)cpt=1; while read f; do \
> +		_c=$$$$(printf "%04d" $$$${cpt}); \
> +		$$(call hardlink-copy,$$$${f},$$($(2)_REDIST_SOURCES_DIR),\
> +			$$$${_c}-$$$${f##*/}) || exit 1; \
> +		printf "%s\n" "$$$${_c}-$$$${f##*/}" >>$$($(2)_REDIST_SOURCES_DIR)/series || exit 1; \
> +		: $$$$((cpt++)); \

I must admit this is not the most readable piece of code I have seen so
far... ;) I cannot do anything about the '$$$$'s, but at least I can
suggest to rename the variables:

  - cpt -> patch_num
  - _c -> prefix_num

But it works fine, thus:
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
