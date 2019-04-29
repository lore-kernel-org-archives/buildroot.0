From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 29 Apr 2019 22:28:48 +0200
Subject: [Buildroot] [PATCH] core/pkg-infra: host variant inherits
 DL_SUBDIR
In-Reply-To: <20190428174458.10458-1-yann.morin.1998@free.fr>
References: <20190428174458.10458-1-yann.morin.1998@free.fr>
Message-ID: <05ec02af-7527-6960-3ef0-ce70e13bc4b6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Yann,

On 28/04/2019 19:44, Yann E. MORIN wrote:
> We have no clear separation between variables that should be
> automatically inherited by the host variant, from the target
> variant, and those variables that should not be inherited.
> 
> However, it clearly makes sense that the host variant does inherit
> all the download variables, of which the sub-directory.

 I'm not sure it's worth doing this if nothing uses it. But it does make things
consistent. However...

> 
> Notes: currently, only three packages define HOST_FOO_DL_SUBDIR,
> but they all are host-only packages anyway, so needs not be fixed:
>   - gcc-initial
>   - gcc-final
>   - python3-setuptools
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/pkg-generic.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 67782138b4..5c7c039390 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -466,6 +466,12 @@ ifdef $(3)_OVERRIDE_SRCDIR
>    $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
>  endif
>  
> +ifndef $(2)_DL_SUBDIR
> + ifdef $(3)_DL_SUBDIR
> +  $(2)_DL_SUBDIR = $$($(3)_DL_SUBDIR)

 For most (all?) others, we define the default value in the same place. So move
it from 4 lines below to the else branch here.

 Regards,
 Arnout

> + endif
> +endif
> +
>  $(2)_BASENAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
>  $(2)_BASENAME_RAW = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
>  $(2)_DL_SUBDIR ?= $$($(2)_RAWNAME)
> 
