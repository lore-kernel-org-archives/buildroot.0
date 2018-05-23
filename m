From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 May 2018 10:22:31 +0200
Subject: [Buildroot] [PATCH v2] pkg-generic: error out with 'local' site
 method and no _SITE
In-Reply-To: <20180523063138.11717-1-arnout@mind.be>
References: <20180523063138.11717-1-arnout@mind.be>
Message-ID: <20180523102231.59ec69df@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 May 2018 08:31:38 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The 'local' site method is easily confused with the 'file' site method,
> making people create packages like this:
> 
>     FOO_SITE_METHOD = local
>     FOO_SOURCE = foo.tar.gz
> 
>     $(eval $(generic-package))
> 
> Due to the intricacies of the generic package infra, this does not
> cause an error; instead, the foo.tar.gz tarball that happens to be
> present in the download directory will be used. This behaviour differs
> greatly from what is specified in the manual.
> 
> Instead, error out immediately if a package specifies the 'local' site
> method but does not specify a _SITE.
> 
> We check for _OVERRIDE_SRCDIR rather than checking for _SITE, just
> after _OVERRIDE_SRCDIR has been set to _SITE. Indeed, a package that
> sets _OVERRIDE_SRCDIR but not _SITE currently works correctly. There is
> no reason to make it fail.
> 
> See also
> https://stackoverflow.com/questions/50364655/including-patches-to-build-root
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v2: explain in commit message why we check for _OVERRIDE_SRCDIR
> ---
>  package/pkg-generic.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 8a3b5f90a9..988f2d34e3 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -520,6 +520,9 @@ ifeq ($$($(2)_SITE_METHOD),local)
>  ifeq ($$($(2)_OVERRIDE_SRCDIR),)
>  $(2)_OVERRIDE_SRCDIR = $$($(2)_SITE)
>  endif
> +ifeq ($$($(2)_OVERRIDE_SRCDIR),)
> +$$(error $(1) has local site method, but `$(2)_SITE_METHOD` is not defined)

I still don't understand the error message, and it doesn't match your
commit log. The commit log says:

""
Instead, error out immediately if a package specifies the 'local' site
method but does not specify a _SITE.
""

but your error message says "$(2)_SITE_METHOD" is not defined.

I believe the message should be:

$$(error $(1) has local site method, but `$(2)_SITE` is not defined)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
