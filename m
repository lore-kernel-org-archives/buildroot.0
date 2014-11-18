From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Nov 2014 21:54:59 +0100
Subject: [Buildroot] [PATCH 3/4] pkg-infra: differentiate remote tarball
 name from local filename
In-Reply-To: <9c560fb0f335f99d5350617f0368ae591e46e837.1416068005.git.yann.morin.1998@free.fr>
References: <cover.1416068004.git.yann.morin.1998@free.fr>
 <9c560fb0f335f99d5350617f0368ae591e46e837.1416068005.git.yann.morin.1998@free.fr>
Message-ID: <546BB223.9020600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/11/14 17:19, Yann E. MORIN wrote:
> Some upstreams may use a naming scheme that does not fit well in how
> Buildroot wants to handle filenames.
>
> For example, GitHub used to have a scheme like:
>     https://github.com/USER/REPO/archive/VERSION.tar.gz
>
> which means we would have a local file named VERSION.tar.gz, when we
> want to have PKG-VERSION.tar.gz
>
> Other forges are also known to have similar schemes. Google Code, for
> example, may also use similarly named files.
>
> Introduce a new variable, FOO_UPSTREAM_SOURCE, which the package may set
> in that case. If not set, it defaults to FOO_SOURCE.

 Instead of this, I was thinking of the reverse approach: define FOO_LOCAL_SOURCE.
It could possibly even be calculated automatically in pkg-generic.mk. E.g.

$(2)_LOCAL_SOURCE = \
    $$(if $$(findstring $(3),$$($(2)_SOURCE)),
        $$($(2)_SOURCE),
        $(3)-$$($(2)_SOURCE))

(and something similar for adding the version, so it should probably be factored
into a function).


 Regards,
 Arnout

>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  package/pkg-generic.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 543cb60..30bce59 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -84,7 +84,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
>          done ; \
>      fi
>  endif
> -    $(if $($(PKG)_SOURCE),$(call
> DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE),$($(PKG)_SOURCE)))
> +    $(if $($(PKG)_SOURCE),$(call
> DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_UPSTREAM_SOURCE),$($(PKG)_SOURCE)))
>      $(foreach p,$($(PKG)_EXTRA_DOWNLOADS),$(call
> DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
>      $(foreach p,$($(PKG)_PATCH),\
>          $(if $(findstring ://,$(p)),\
> @@ -361,6 +361,10 @@ ifndef $(2)_SOURCE
>   endif
>  endif
>  
> +ifndef $(2)_UPSTREAM_SOURCE
> +  $(2)_UPSTREAM_SOURCE = $$($(2)_SOURCE)
> +endif
> +
>  ifndef $(2)_PATCH
>   ifdef $(3)_PATCH
>    $(2)_PATCH = $$($(3)_PATCH)

-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
