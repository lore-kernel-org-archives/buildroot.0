From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 16 Nov 2018 18:41:02 +0100
Subject: [Buildroot] [PATCH next] package/pkg-luarocks: use
 <pkg>_EXTRACT_DEPENDENCIES
In-Reply-To: <20181116135300.27234-1-thomas.petazzoni@bootlin.com>
References: <20181116135300.27234-1-thomas.petazzoni@bootlin.com>
Message-ID: <CAB0FRssx7Lr7MU4wUpeVkRYGxAz6YiEs56QbTm+D6XS0DKH-aQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le ven. 16 nov. 2018 ? 14:53, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> The host luarocks tool is needed when *extracting* luarocks
> packages. Since regular dependencies are only available at the
> configure step, it caused the "luarocks" program to be available too
> late to be used to extract luarocks packages.
>
> To work around this, host-luarocks was manually added as a dependency
> of the extract step of luarocks packages. While this worked fine until
> now, it breaks badly with per-package folders, because host-luarocks
> is not recorded as an extract dependency of luarocks packages, and
> therefore is not copied to the per-package host folder, causing a
> failure.
>
> In the mean time, the <pkg>_EXTRACT_DEPENDENCIES mechanism was added,
> which aims at fixing exactly this problem, so let's use it and
> simplify pkg-luarocks.mk.
>
> Cc: Francois Perrad <francois.perrad@gadz.org>
>

Acked-by: Francois Perrad <francois.perrad@gadz.org>


> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-luarocks.mk | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
> index e2b48cfb4c..29c5e66cd1 100644
> --- a/package/pkg-luarocks.mk
> +++ b/package/pkg-luarocks.mk
> @@ -42,7 +42,8 @@ $(2)_SITE             ?= $$(call
> qstrip,$$(BR2_LUAROCKS_MIRROR))
>
>  # Since we do not support host-luarocks-package, we know this is
>  # a target package, and can just add the required dependencies
> -$(2)_DEPENDENCIES      += host-luarocks luainterpreter
> +$(2)_DEPENDENCIES      += luainterpreter
> +$(2)_EXTRACT_DEPENDENCIES += host-luarocks
>
>  #
>  # Extract step. Extract into a temporary dir and move the relevant part
> to the
> @@ -71,10 +72,6 @@ endif
>  # make targets
>  $(call inner-generic-package,$(1),$(2),$(3),$(4))
>
> -# $(2)_DEPENDENCIES are handled for configure step (too late)
> -# but host-luarocks is required to do the extract
> -$$($(2)_TARGET_EXTRACT): | host-luarocks
> -
>  endef
>
>
>  ################################################################################
> --
> 2.19.1
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181116/7e8d7a6b/attachment.html>
