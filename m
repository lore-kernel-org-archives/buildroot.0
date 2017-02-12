From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 15:22:25 +0100
Subject: [Buildroot] [PATCH 1/1] Add text explaining that patches are
 not applied for SITE_METHOD==local or OVERRRIDE_SRCDIR cases.
In-Reply-To: <20170209170719.32146-1-grant.b.edwards@gmail.com>
References: <20170209170719.32146-1-grant.b.edwards@gmail.com>
Message-ID: <20170212152225.481ffb52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Feb 2017 11:07:19 -0600, Grant Edwards wrote:
> Signed-off-by: Grant Edwards <grant.b.edwards@gmail.com>

Thanks for this patch. This is definitely something we should mention
more explicitly in the manual, but I'm not entirely happy with your
proposal.

First, a nit about the commit title, it should be shorter, and prefixed
by what you're patching. Like:

	docs/manual: explain situations where patches are not applied

or something like that.

> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index a08283c..bbd3cf5 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -217,13 +217,14 @@ information is (assuming the package name is +libfoo+) :
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
> +  xref:patch-policy[patching a package].) [If +LIBFOO_SITE_METHOD+ is
> +  set to +local+, or if the +OVERRIDE_SRCDIR+ is used to specify a
> +  source directory, no patches are applied: the source directory is
> +  used as-is.]

I believe mentioning this here is not needed. Instead we probably want
to entirely remove the part "Patches that are included in Buildroot
itself...", and instead refer to a common paragraph that explains the
entire logic with which patches are applied.

>  * +LIBFOO_SITE+ provides the location of the package, which can be a
>    URL or a local filesystem path. HTTP, FTP and SCP are supported URL
> @@ -315,7 +316,8 @@ information is (assuming the package name is +libfoo+) :
>    ** +local+ for a local source code directory. One should use this
>       when +LIBFOO_SITE+ specifies a local directory path containing
>       the package source code. Buildroot copies the contents of the
> -     source directory into the package's build directory.
> +     source directory into the package's build directory.  No patches
> +     are applied: the source directory contents are used as-is.

I'd prefer if we had a section that centralized what OVERRIDE_SRCDIR
and SITE_METHOD=local do, what are there use cases, etc.

> diff --git a/docs/manual/customize-patches.txt b/docs/manual/customize-patches.txt
> index fa63541..18e6af8 100644
> --- a/docs/manual/customize-patches.txt
> +++ b/docs/manual/customize-patches.txt
> @@ -11,7 +11,9 @@ architecture.
>  
>  The +BR2_GLOBAL_PATCH_DIR+ configuration option can be used to specify
>  a space separated list of one or more directories containing package
> -patches.
> +patches.  [If a package's +_SITE_METHOD+ is set to +local+, or if the
> ++OVERRIDE_SRCDIR+ feature is used to specify a source directory, no
> +patches are applied.]
>  
>  For a specific version +<packageversion>+ of a specific package
>  +<packagename>+, patches are applied from +BR2_GLOBAL_PATCH_DIR+ as
> diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
> index e1df8b0..33e1640 100644
> --- a/docs/manual/patch-policy.txt
> +++ b/docs/manual/patch-policy.txt
> @@ -59,6 +59,11 @@ details.
>  [[patch-apply-order]]
>  === How patches are applied
>  
> +If a packate's +_SITE_METHOD+ is set to +local+, or if the
> ++OVERRIDE_SRCDIR+ feature is used to specify a source directory, no
> +patches are applied: the source is used as-is.  Otherwise, patches are
> +applied as specified below.
> +
>  . Run the +<packagename>_PRE_PATCH_HOOKS+ commands if defined;
>  
>  . Cleanup the build directory, removing any existing +*.rej+ files;

I believe there's a lot of overlap between customize-patches.txt and
patch-policy.txt. We want to refactor that into a single section that
explains how patches are applied.

So, all in all:

 1. Add a section about OVERRIDE_SRCDIR and SITE_METHOD=local,
    regrouping all information about these features, including how
    patches are (not) applied.

 2. Merge patch-policy.txt and customize-patches.txt.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
