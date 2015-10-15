From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Oct 2015 18:36:22 +0200
Subject: [Buildroot] [PATCH] busybox: enable fully featured hush shell
 for nommu
In-Reply-To: <1444862205-23935-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444862205-23935-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <561FD606.2080905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-10-15 00:36, Gustavo Zacarias wrote:
> As pointed by Rich Fekler on IRC the basic hush shell is pretty much
> useless since it doesn't support if conditionals, loops, functions, case
> or even interactive mode.
> So enable the full feature-set.
> Size delta: +10184 bytes uncompressed for blackfin fdpic.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/busybox/busybox.mk | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 3494456..d3a6fd8 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -89,6 +89,21 @@ define BUSYBOX_SET_MMU
>  	$(call KCONFIG_DISABLE_OPT,CONFIG_SWAPONOFF,$(BUSYBOX_BUILD_CONFIG))
>  	$(call KCONFIG_DISABLE_OPT,CONFIG_ASH,$(BUSYBOX_BUILD_CONFIG))
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_BASH_COMPAT,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_BRACE_EXPANSION,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_HELP,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_INTERACTIVE,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_SAVEHISTORY,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_JOB,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_TICK,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_IF,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_LOOPS,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_CASE,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_FUNCTIONS,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_LOCAL,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_RANDOM_SUPPORT,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_EXPORT_N,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_MODE_X,$(BUSYBOX_BUILD_CONFIG))

 I don't like this, since it makes it completely impossible to disable these
hush features. I admit that it indeed doesn't make a significant difference, but
on principle I'm against forcing this on the user.

 So ideally, we should just let them default to y (all these options have a
default y). We can simply remove them from busybox.config.

 But unfortunately, that doesn't work. The problem is that the kconfig infra
will run the oldconfig  immediately after merge_config, before applying the
fixups. Since in busybox.config, ash is enabled and hush is disabled, all these
options will be turned off by the oldconfig run. To solve this, we should run
the fixups immediately after merge_config. I've tried this and it seems to work.

 But then we're running the fixups three times in the configure step, which
feels a bit like overkill to me. So perhaps a more elegant solution would be the
following: instead of calling sed-based fixups, use a kconfig fragment and
merge_config to apply the fixups.

 Cc-ing our Kconfig infra expert to consider this.

 Regards,
 Arnout


>  endef
>  endif
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
