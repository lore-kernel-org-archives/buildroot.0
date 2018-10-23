From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Oct 2018 00:19:13 +0100
Subject: [Buildroot] [scanrock 5/5] [RFC] pkg-luarocks: add per package
 upgrade target
In-Reply-To: <20181021163259.28335-6-francois.perrad@gadz.org>
References: <20181021163259.28335-1-francois.perrad@gadz.org>
 <20181021163259.28335-6-francois.perrad@gadz.org>
Message-ID: <2bc4f28a-f0eb-5a08-d08b-208351c4adeb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/21/18 5:32 PM, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/pkg-generic.mk  | 6 +++++-
>  package/pkg-luarocks.mk | 8 ++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 91b61c6de..f349c6c1f 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -779,6 +779,9 @@ $(1)-external-deps:
>  	@echo "file://$$($(2)_OVERRIDE_SRCDIR)"
>  endif
>  
> +$(1)-upgrade:
> +			+$$($(2)_UPGRADE_CMDS)

 I prefer how you did it in the perl infrastructure: a private target in the
perl infra, nothing in the generic infra. Indeed, I don't think it makes sense
to have such an upgrade possibility in the generic case.

 If it ever does, we can still move it into the generic infra.

> +
>  $(1)-show-version:
>  			@echo $$($(2)_VERSION)
>  
> @@ -1030,7 +1033,8 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
>  	$(1)-rsync \
>  	$(1)-show-depends \
>  	$(1)-show-version \
> -	$(1)-source
> +	$(1)-source \
> +	$(1)-upgrade
>  
>  ifneq ($$($(2)_SOURCE),)
>  ifeq ($$($(2)_SITE),)
> diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
> index e2b48cfb4..55f7300d3 100644
> --- a/package/pkg-luarocks.mk
> +++ b/package/pkg-luarocks.mk
> @@ -44,6 +44,14 @@ $(2)_SITE		?= $$(call qstrip,$$(BR2_LUAROCKS_MIRROR))
>  # a target package, and can just add the required dependencies
>  $(2)_DEPENDENCIES	+= host-luarocks luainterpreter
>  
> +# Upgrade helper
> +ifndef $(2)_UPGRADE_CMDS
> +define $(2)_UPGRADE_CMDS
> +	PATH=$(BR_PATH) \
> +	utils/scanrock $$($(2)_NAME_UPSTREAM) $(1)

 This shows a good reason to use the lua-specific upgrade target: we want to use
the Buildroot-built host-luarocks here, I guess, so we should depend on it. In
fact, on my Fedora laptop, with the system-installed luarocks, scanrocks fails
with "Error: Failed copying unpacked rockspec into unpacked source directory."
(in the unpack step; I can reproduce when running manually), but it succeeds
with the Buildroot-built luarocks. So we would want:

$(1)-upgrade: host-luarocks
	PATH=$(BR_PATH) utils/scranrock $$($(2)_NAME_UPSTREAM) $(1)

 Regards,
 Arnout

> +endef
> +endif
> +
>  #
>  # Extract step. Extract into a temporary dir and move the relevant part to the
>  # source dir.
> 
