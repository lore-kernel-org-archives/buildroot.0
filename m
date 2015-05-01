From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 23:39:54 +0200
Subject: [Buildroot] [PATCH 28/30] package/matchbox-panel: add option to
 use ACPI for the battery applet
In-Reply-To: <cbb90f6326af77c2c466fa72ee970fee6a9040f1.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <cbb90f6326af77c2c466fa72ee970fee6a9040f1.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <5543F2AA.6070706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/15 20:09, Yann E. MORIN wrote:
> It is possible to use ACPI to monitor the battery with the battery
> min-applet. If ACPI is not explicitly enabled, then APM is used if
> available; if ACPI is not explcitly enabled and APM is not available,
> then the battery applet id not built.
> 
> What is a pity is that there is no way to explicitly enable or disable
> the applet; it only relies on auto-detection... :-(
> 
> So, add an option to enable use of ACPI, visible only on architectures
> that have at least some hope of having ACPI support.

 Since APM exists only on x86, there is basically no way to disable the applet
on x86. The only thing that the configure option does is to force the applet to
use the deprecated and most likely unavailable APM interface.

 Therefore, I'd remove the Config.in option and just pass --enable-acpi-linux
unconditionally on x86 and aarch64. The worst that can happen is that you build
a tiny applet that turns out not to work.

 That said, the applet doesn't build for me (with Sourcery x86_64 toolchain)
because the 'line_parse' inner function is declared static...


 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/matchbox/matchbox-panel/Config.in         | 15 +++++++++++++++
>  package/matchbox/matchbox-panel/matchbox-panel.mk |  6 ++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/package/matchbox/matchbox-panel/Config.in b/package/matchbox/matchbox-panel/Config.in
> index 47bd10a..93241f0 100644
> --- a/package/matchbox/matchbox-panel/Config.in
> +++ b/package/matchbox/matchbox-panel/Config.in
> @@ -4,3 +4,18 @@ config BR2_PACKAGE_MATCHBOX_PANEL
>  	help
>  	  A flexible always present 'window bar' for holding
>  	  application launchers.
> +
> +if BR2_PACKAGE_MATCHBOX_PANEL
> +
> +config BR2_PACKAGE_MATCHBOX_PANEL_ACPI
> +	bool "use ACPI for battery mini-applet"
> +	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64
> +	help
> +	  Use ACPI to monitor the battery.
> +
> +	  Say 'y' here to use ACPI to monitor the battery.
> +	  If you say 'n', then APM will be used if available;
> +	  otherwise the battery monitor mini-applet is not
> +	  built.
> +
> +endif # BR2_PACKAGE_MATCHBOX_PANEL
> diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
> index f7d699b..aa9018c 100644
> --- a/package/matchbox/matchbox-panel/matchbox-panel.mk
> +++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
> @@ -20,6 +20,12 @@ else
>  MATCHBOX_PANEL_CONF_OPTS += --disable-startup-notification
>  endif
>  
> +ifeq ($(BR2_PACKAGE_MATCHBOX_PANEL_ACPI),y)
> +MATCHBOX_PANEL_CONF_OPTS += --enable-acpi-linux
> +else
> +MATCHBOX_PANEL_CONF_OPTS += --disable-acpi-linux
> +endif
> +
>  ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS),y)
>  MATCHBOX_PANEL_DEPENDENCIES += wireless_tools
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
