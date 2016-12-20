From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Dec 2016 23:11:27 +0100
Subject: [Buildroot] [PATCH] busybox: adjust nommu swaponoff handling
 for busybox 1.26.0+
In-Reply-To: <20161220215347.10629-1-peter@korsgaard.com>
References: <20161220215347.10629-1-peter@korsgaard.com>
Message-ID: <8bd87291-94ba-a085-c463-efac2a3fe1c3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-12-16 22:53, Peter Korsgaard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/dfe/dfec2c0626ab087325fd869bcbe0b9dc354d788c/
> 
> Busybox 1.26.0 gained separate config options for swapon / swapoff:
> 
> commit f417ffd88f194bbfd18605882ee242190c1bab34
> Author: Denys Vlasenko <vda.linux@googlemail.com>
> Date:   Mon Nov 14 17:30:50 2016 +0100
> 
>     Make swapon and swapoff individually selectable.
> 
>     For example, without swapoff, code shrinks by 277 bytes.
> 
>     Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> 
> So adjust busybox.config and the logic to disable these applets for nommu
> builds for the new names.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 However, for the busybox.config part, perhaps it would be better to regenerate
it with 'make busybox-update-config'? It currently says that it's for 1.25.1,
which looks suspicious :-)


 Regards,
 Arnout

> ---
>  package/busybox/busybox.config | 3 ++-
>  package/busybox/busybox.mk     | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
> index 02b1ee1..3e3b5d4 100644
> --- a/package/busybox/busybox.config
> +++ b/package/busybox/busybox.config
> @@ -633,9 +633,10 @@ CONFIG_READPROFILE=y
>  # CONFIG_RTCWAKE is not set
>  # CONFIG_SCRIPT is not set
>  # CONFIG_SCRIPTREPLAY is not set
> -CONFIG_SWAPONOFF=y
> +CONFIG_SWAPON=y
>  # CONFIG_FEATURE_SWAPON_DISCARD is not set
>  # CONFIG_FEATURE_SWAPON_PRI is not set
> +CONFIG_SWAPOFF=y
>  CONFIG_SWITCH_ROOT=y
>  CONFIG_UMOUNT=y
>  CONFIG_FEATURE_UMOUNT_ALL=y
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index d7751b5..40fb4d9 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -96,7 +96,8 @@ endef
>  else
>  define BUSYBOX_SET_MMU
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_NOMMU,$(BUSYBOX_BUILD_CONFIG))
> -	$(call KCONFIG_DISABLE_OPT,CONFIG_SWAPONOFF,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_DISABLE_OPT,CONFIG_SWAPON,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_DISABLE_OPT,CONFIG_SWAPOFF,$(BUSYBOX_BUILD_CONFIG))
>  	$(call KCONFIG_DISABLE_OPT,CONFIG_ASH,$(BUSYBOX_BUILD_CONFIG))
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH,$(BUSYBOX_BUILD_CONFIG))
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_BASH_COMPAT,$(BUSYBOX_BUILD_CONFIG))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
