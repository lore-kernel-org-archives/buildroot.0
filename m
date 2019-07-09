From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 9 Jul 2019 20:30:03 +0200
Subject: [Buildroot] [PATCH 1/3] package/pkg-generic: allow to use
 <pkg>_DL_VERSION in packages .mk files
In-Reply-To: <20190709074551.22747-2-victor.huesca@bootlin.com>
References: <20190709074551.22747-1-victor.huesca@bootlin.com>
 <20190709074551.22747-2-victor.huesca@bootlin.com>
Message-ID: <6c1d55b1-df16-6452-7da5-78b4dd1160a6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Victor,

On 09/07/2019 09:45, Victor Huesca wrote:
> This patch continue the work done here http://buildroot-busybox.2317881.n4.nabble.com/PATCH-0-4-Sanetize-packages-version-tp225554.html

 It's generally nices to summarize the discussion and put the reference as a
footnote, e.g.:

The _VERSION values should correspond to the ones on release-monitoring.org, so
we can easily check if there is an update for a package. For downloaded
packages, we can just add any prefix/suffix as part of the _SOURCE and/or _SITE
variables. However, for VCS-downloaded packages, the _VERSION is used directly
by the download infra.

This patch makes the DL_VERSION public, i.e. packages can set it (to a different
value than _VERSION). This way, we can handle the missing corner cases without
changes all over the places. See [1] for the full discussion.

[1]
http://buildroot-busybox.2317881.n4.nabble.com/PATCH-0-4-Sanetize-packages-version-tp225554.html



 However, I don't think the discussion said anything more than what I wrote
above, so I don't think adding the reference is very valuable. It's up to you.

> By making this DL_VERSION public we should be able to handle the missing corner-cases
> with package version sanitizeing.
> 
> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
> ---
>  package/pkg-generic.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 9620dec524..c48f54a2b7 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -447,7 +447,9 @@ $(2)_PKGDIR			=  $(pkgdir)
>  # version control system branch or tag, for example remotes/origin/1_10_stable.
>  # Similar for spaces and colons (:) that may appear in date-based revisions for
>  # CVS.

 Maybe it would be good to add a comment like this:

# Since _DL_VERSION and _VERSION are defined based on themselves, we need to use
# := assignment. Also, since they may be calculated through functions, it's best
# to strip them - this makes it easier for the packages themselves.


> -ifndef $(2)_VERSION
> +ifdef $(2)_DL_VERSION
> + $(2)_DL_VERSION := $$(strip $$($(2)_DL_VERSION))

 This will not work as intended... A few lines below, we have:

$(2)_VERSION := $$(call sanitize,$$($(2)_DL_VERSION))

so the _VERSION defined by the package will not be used at all...

 I'm surprised that you didn't notice this. Maybe I'm mistaken? Or is there some
situation where the correct _VERSION does end up getting used?

 I think the only solution is something like:

ifdef $(2)_DL_VERSION
 $(2)_DL_VERSION := $$(strip $$($(2)_DL_VERSION))
 $(2)_VERSION := $$(call sanitize,$$($(2)_DL_VERSION))
else
 ifndef $(2)_VERSION
  ifdef $(3)_DL_VERSION
   $(2)_DL_VERSION := $$($(3)_DL_VERSION)
  else ifdef $(3)_VERSION
   $(2)_DL_VERSION := $$($(3)_VERSION)
  endif
 else
  $(2)_DL_VERSION := $$(strip $$($(2)_VERSION))
 endif
endif


 Regards,
 Arnout

> +else ifndef $(2)_VERSION
>   ifdef $(3)_DL_VERSION
>    $(2)_DL_VERSION := $$($(3)_DL_VERSION)
>   else ifdef $(3)_VERSION
> 
