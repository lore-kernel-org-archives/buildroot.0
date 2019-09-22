From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Sep 2019 17:24:20 +0200
Subject: [Buildroot] [PATCH] core/show-info: extend with kconfig
 variables
In-Reply-To: <20190922125500.13865-1-yann.morin.1998@free.fr>
References: <20190922125500.13865-1-yann.morin.1998@free.fr>
Message-ID: <dc4b1e27-8cdb-82c4-c8fc-01de4fa88d5f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Yann,

 I have two comments on this one, one bikeshedding and one fundamental.

On 22/09/2019 14:55, Yann E. MORIN wrote:
> Extend the output of show-info with the kconfig variables applicable to
> each item in the list:
>   - the main variable, if it exists
>   - the list of sub-options, if any
> 
> The main variable may not exist for host packages or for some low-level
> target packages (e.g. virtual packages), and does not exist for the
> pseudo, common rootfs.
> 
> Even though a host package may not have a main option, it may still have
> sub-options (e.g. a blind option to enable an optional feature, like an
> hypotetical BR2_PACKAGE_HOST_PYTHON_NEEDS_SSL).
> 
> For a package, the new ouput may now contain structures like:
>     "busybox": {
>       "kconfig_var": {
>         "BR2_PACKAGE_BUSYBOX": "y",
>         "options": {

 I'm not sure I like this mixing of levels. I mean, the key of this kconfig_var
dict (or whatever a dict is called in JS-speak) can be either the symbol name,
or the special name "options" in which case we get another level of dict. (This
is the bikeshedding comment.)


>           "BR2_PACKAGE_BUSYBOX_CONFIG": "package/busybox/busybox.config",
>           "BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES": "",
>           "BR2_PACKAGE_BUSYBOX_SHOW_OTHERS": "y"

 I'm a bit worried about these suboptions. The problem is that it's kind of a
mixed bag of things:

 - as noted below, some options may be missing;
 - booleans that are relevant but happen to be unset are not listed;
 - blind options that are not relevant (_ARCH_SUPPORTS) *are* listed;
 - completely unrelated options are included (e.g. AT_SPI2_CORE for "at").

 Given that this information is never really reliable, I doubt there is a
practical (generic) use case for it.

>         }
>       },
>       [...]
>     }
> 
> or for a filesystem:
>     "rootfs-tar": {
>       "kconfig_var": {
>         "BR2_TARGET_ROOTFS_TAR": "y",
>         "options": {
>           "BR2_TARGET_ROOTFS_TAR_NONE": "y",
>           "BR2_TARGET_ROOTFS_TAR_OPTIONS": ""
>         }
>       },
>       [...]
>     },
> 
> or for an item with no kconfig presence (most probably a host package):
>     "host-foo": {
>       "kconfig_var": {
>         "options": {}
>       },
>       [...]
>     }
> 
> Note: for some special packages, the sub-options do not follow the
> traditional naming convention. For example, the option pointing to the
> uClibc config file is named BR2_UCLIBC_CONFIG, instead of the expected
> BR2_PACKAGE_UCLIBC_CONFIG. Therefore, those variables do not appear in
> the output of show-info.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  package/pkg-utils.mk | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 74ade437d9..a05bf54527 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -97,6 +97,16 @@ define _json-info-pkg
>  endef
>  
>  define _json-info-pkg-details
> +	"kconfig_var": {
> +		$(if $(filter $($(1)_KCONFIG_VAR),$(.VARIABLES)),
> +			"$($(1)_KCONFIG_VAR)": "$($($(1)_KCONFIG_VAR))"$(comma)

 It might make sense to convert this to bool, similar like is done with _IS_VIRTUAL.

 And it might make sense to refactor *that* into

y-empty-to-bool = $(if $($(1)),true,false)


 But I'm not 100% sure of this. We could also say we want to stay close to the
original (i.e. the actual variable value in make).


 Regards,
 Arnout

> +		)
> +		"options": {
> +			$(foreach v,$(sort $(filter $($(1)_KCONFIG_VAR)_%,$(.VARIABLES))),
> +				"${v}": "$(call qstrip,$($(v)))"$(comma)
> +			)
> +		}
> +	},
>  	"version": "$($(1)_DL_VERSION)",
>  	"licenses": "$($(1)_LICENSE)",
>  	"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET)),
> @@ -119,6 +129,16 @@ define _json-info-pkg-details
>  endef
>  
>  define _json-info-fs
> +	"kconfig_var": {
> +		$(if $(filter BR2_TARGET_$(1),$(.VARIABLES)),
> +			"BR2_TARGET_$(1)": "$(BR2_TARGET_$(1))"$(comma)
> +		)
> +		"options": {
> +			$(foreach v,$(sort $(filter BR2_TARGET_$(1)_%,$(.VARIABLES))),
> +				"${v}": "$(call qstrip,$($(v)))"$(comma)
> +			)
> +		}
> +	},
>  	"dependencies": [
>  		$(call make-comma-list,$(sort $($(1)_DEPENDENCIES)))
>  	]
> 
