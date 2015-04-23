From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 24 Apr 2015 00:00:15 +0200
Subject: [Buildroot] [PATCH 09/30] package/matchbox: make
 match-startup-monitor a real package
In-Reply-To: <b5a7a6e89a61acaa154c10b6e9cef08404f913a8.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <b5a7a6e89a61acaa154c10b6e9cef08404f913a8.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <55396B6F.2040004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/15 20:09, Yann E. MORIN wrote:
>  Currently, matchbox-startup-monitor is missing a Kconfig entry, but is
  ^

> so far solely a build-time dependency of matchbox-panel.
> 
> So, make it a real package, and only build-depend on it when enabled.
> Fix the condition to build-depend on it.

 Update commit message according to my comment below.

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/matchbox/Config.in                          | 1 +
>  package/matchbox/matchbox-panel/matchbox-panel.mk   | 4 ++--
>  package/matchbox/matchbox-startup-monitor/Config.in | 2 ++
>  3 files changed, 5 insertions(+), 2 deletions(-)
>  create mode 100644 package/matchbox/matchbox-startup-monitor/Config.in
> 
> diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
> index 9b27d4d..2f9b73d 100644
> --- a/package/matchbox/Config.in
> +++ b/package/matchbox/Config.in
> @@ -26,5 +26,6 @@ source "package/matchbox/matchbox-desktop/Config.in"
>  source "package/matchbox/matchbox-common/Config.in"
>  source "package/matchbox/matchbox-fakekey/Config.in"
>  source "package/matchbox/matchbox-keyboard/Config.in"
> +source "package/matchbox/matchbox-startup-monitor/Config.in"
>  
>  endif
> diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
> index d3efed9..f7d699b 100644
> --- a/package/matchbox/matchbox-panel/matchbox-panel.mk
> +++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
> @@ -13,9 +13,9 @@ MATCHBOX_PANEL_LICENSE_FILES = COPYING
>  MATCHBOX_PANEL_DEPENDENCIES = matchbox-lib
>  MATCHBOX_PANEL_CONF_OPTS = --enable-expat
>  
> -ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
> +ifeq ($(BR2_PACKAGE_MATCHBOX_STARTUP_MONITOR),y)
>  MATCHBOX_PANEL_CONF_OPTS += --enable-startup-notification
> -MATCHBOX_PANEL_DEPENDENCIES += startup-notification matchbox-startup-monitor
> +MATCHBOX_PANEL_DEPENDENCIES += matchbox-startup-monitor
>  else
>  MATCHBOX_PANEL_CONF_OPTS += --disable-startup-notification
>  endif
> diff --git a/package/matchbox/matchbox-startup-monitor/Config.in b/package/matchbox/matchbox-startup-monitor/Config.in
> new file mode 100644
> index 0000000..4dd088f
> --- /dev/null
> +++ b/package/matchbox/matchbox-startup-monitor/Config.in
> @@ -0,0 +1,2 @@
> +config BR2_PACKAGE_MATCHBOX_STARTUP_MONITOR
> +	bool

 This changes behaviour: it used to be selected automatically when
startup-notification was selected. So you should add

	default y if BR2_PACKAGE_STARTUP_NOTIFICATION

 Of course, that's going to be reverted anyway when you later add a prompt to
this package, so perhaps it's not that important.


 Regards,
 Arnout
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
