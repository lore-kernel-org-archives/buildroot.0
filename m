From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Oct 2018 00:50:25 +0100
Subject: [Buildroot] [V2 3/4] pkg-perl: add a target which upgrades all
 packages from metacpan
In-Reply-To: <20181011161248.13457-4-francois.perrad@gadz.org>
References: <20181011161248.13457-1-francois.perrad@gadz.org>
 <20181011161248.13457-4-francois.perrad@gadz.org>
Message-ID: <3d3d2615-6ce3-cb1e-69b8-bc2a2d3b7f0c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Francois,

On 10/11/18 5:12 PM, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/pkg-perl.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
> index 07348bd5d..74a116075 100644
> --- a/package/pkg-perl.mk
> +++ b/package/pkg-perl.mk
> @@ -57,6 +57,10 @@ endif
>  #       used no matter the setting
>  $(2)_PREFER_INSTALLER ?= MB
>  
> +ifeq ($(4),target)
> +SCANCPAN_ALL_DISTRIB += $$($(2)_DISTNAME)
> +endif
> +
>  #
>  # Configure step. Only define it if not already defined by the package
>  # .mk file. And take care of the differences between host and target
> @@ -199,6 +203,11 @@ $(call inner-generic-package,$(1),$(2),$(3),$(4))
>  
>  endef
>  
> +# global target which upgrades all packages
> +.PHONY: scancpan
> +scancpan:
> +	utils/scancpan -force -target $(SCANCPAN_ALL_DISTRIB)

 I don't agree with this patch. When people post package bumps, our assumption
is that they actually use the package and have tested it after the bump. A
target that just blindly bumps everything is not what we want.

 Therefore, I've marked this patch as rejected in patchwork.

 Regards,
 Arnout
