From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 7 Feb 2017 22:46:43 +0100
Subject: [Buildroot] [PATCH 1/1] Add notes explaining that SITE_METHOD
 == local prevents any patches from being applied to the package sources.
In-Reply-To: <20170207204053.18749-1-grant.b.edwards@gmail.com>
References: <20170207204053.18749-1-grant.b.edwards@gmail.com>
Message-ID: <CAAXf6LU_5HZ1aDfCi+T1SZcx3bk7276uReqP4HHvmSMiC-5+xg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Grant,

On Tue, Feb 7, 2017 at 9:40 PM, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> Signed-off-by: Grant Edwards <grant.b.edwards@gmail.com>
> ---
>  docs/manual/adding-packages-generic.txt | 17 +++++++++--------
>  docs/manual/customize-patches.txt       |  3 ++-
>  docs/manual/patch-policy.txt            |  4 ++++
>  3 files changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index a08283c..cdacb8b 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -217,13 +217,13 @@ information is (assuming the package name is +libfoo+) :
>    full URL and download the patch from this location. Otherwise,
>    Buildroot will assume that the patch should be downloaded from
>    +LIBFOO_SITE+. If +HOST_LIBFOO_PATCH+ is not specified, it defaults
> -  to +LIBFOO_PATCH+. Note that patches that are included in Buildroot
> -  itself use a different mechanism: all files of the form
> -  +*.patch+ present in the package directory inside
> -  Buildroot will be applied to the package after extraction (see
> -  xref:patch-policy[patching a package]). Finally, patches listed in
> -  the +LIBFOO_PATCH+ variable are applied _before_ the patches stored
> -  in the Buildroot package directory.
> +  to +LIBFOO_PATCH+.  Patches that are included in Buildroot itself
> +  use a different mechanism: all files of the form +*.patch+ present
> +  in the package directory inside Buildroot will be applied to the
> +  package after applying patches specified by +LIBFOO_PATCH+.  (See
> +  xref:patch-policy[patching a package].) If +LIBFOO_SITE_METHOD+ is
> +  set to +local+ no patches are applied: the source directory is used
> +  as-is.
>
>  * +LIBFOO_SITE+ provides the location of the package, which can be a
>    URL or a local filesystem path. HTTP, FTP and SCP are supported URL
> @@ -315,7 +315,8 @@ information is (assuming the package name is +libfoo+) :
>    ** +local+ for a local source code directory. One should use this
>       when +LIBFOO_SITE+ specifies a local directory path containing
>       the package source code. Buildroot copies the contents of the
> -     source directory into the package's build directory.
> +     source directory into the package's build directory.  No patches
> +     are applied: the source directory contents are used as-is.
>
>  * +LIBFOO_GIT_SUBMODULES+ can be set to +YES+ to create an archive
>    with the git submodules in the repository.  This is only available
> diff --git a/docs/manual/customize-patches.txt b/docs/manual/customize-patches.txt
> index fa63541..05c935b 100644
> --- a/docs/manual/customize-patches.txt
> +++ b/docs/manual/customize-patches.txt
> @@ -11,7 +11,8 @@ architecture.
>
>  The +BR2_GLOBAL_PATCH_DIR+ configuration option can be used to specify
>  a space separated list of one or more directories containing package
> -patches.
> +patches.  [If a package's +_SITE_METHOD+ is set to +local+, no patches
> +are applied.]
>
>  For a specific version +<packageversion>+ of a specific package
>  +<packagename>+, patches are applied from +BR2_GLOBAL_PATCH_DIR+ as
> diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
> index e1df8b0..9976d03 100644
> --- a/docs/manual/patch-policy.txt
> +++ b/docs/manual/patch-policy.txt
> @@ -59,6 +59,10 @@ details.
>  [[patch-apply-order]]
>  === How patches are applied
>
> +If a packate's +_SITE_METHOD+ is set to +local+, no patches are

package's

> +applied: the source directory is used as-is.  Otherwise, patches are
> +applied as specified below.
> +
>  . Run the +<packagename>_PRE_PATCH_HOOKS+ commands if defined;
>
>  . Cleanup the build directory, removing any existing +*.rej+ files;


When a package source is overridden using the FOO_OVERRIDE_SRCDIR
mechanism, the same is true: no patches are applied automatically, the
overridden srcdir is supposed to be complete and used as-is. Perhaps
the documentation updates could also cover that?

Thanks,
Thomas
