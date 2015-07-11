From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Jul 2015 14:20:43 +0200
Subject: [Buildroot] [PATCH] linux: adjust fixup logic for ktap
In-Reply-To: <1424612340-2332-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1424612340-2332-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <55A10A1B.3060800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/22/15 14:39, Thomas Petazzoni wrote:
> The ktap package requires some parts of the kernel tracing
> infrastructure to be enabled, especially
> CONFIG_EVENT_TRACING. However, this option is a blind option in the
> kernel, so enabling it in linux.mk has no effect: we need to enable a
> non-blind option that selects CONFIG_EVENT_TRACING. We've chosen to
> select CONFIG_FTRACE.

 I think it makes more sense to select the smaller ENABLE_DEFAULT_TRACERS, no?

 Otherwise:
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> This fixes the build of ktap.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  linux/linux.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 29f59e8..75f4936 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -198,7 +198,7 @@ define LINUX_CONFIGURE_CMDS
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
>  	$(if $(BR2_PACKAGE_KTAP),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS,$(@D)/.config)
> -		$(call KCONFIG_ENABLE_OPT,CONFIG_EVENT_TRACING,$(@D)/.config)
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_FTRACE,$(@D)/.config)
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS,$(@D)/.config)
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_FUNCTION_TRACER,$(@D)/.config))
>  	$(if $(BR2_PACKAGE_SYSTEMD),
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
