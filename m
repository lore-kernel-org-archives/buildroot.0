From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Apr 2015 23:29:42 +0200
Subject: [Buildroot] [PATCH 01/30] package/matchbox: make matchbox-lib a
 real package
In-Reply-To: <8beb050842a9ca88e919dae89b382bfe7a1701ff.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <8beb050842a9ca88e919dae89b382bfe7a1701ff.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <55396446.7060207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/15 20:09, Yann E. MORIN wrote:
> Currently, the matchbox package is using weird, legacy constrcuts to
> build its different parts.
> 
> Notably, it adds matchbox-lib to the list of packages to build, even
> though it is not a real package since it does not have a Kconfig entry.
> 
> Fix that:
>   - add a Kconfig entry for matchbox-lib
>   - select it from the top-level matchbox package
> 
> Note that matchbox-common already depends on matchbox-lib.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Some suggestions below for handling the one-level-less approach.

> ---
>  package/matchbox/Config.in              | 3 +++
>  package/matchbox/matchbox-lib/Config.in | 2 ++
>  package/matchbox/matchbox.mk            | 2 +-
>  3 files changed, 6 insertions(+), 1 deletion(-)
>  create mode 100644 package/matchbox/matchbox-lib/Config.in
> 
> diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
> index 7867ae3..70cc168 100644
> --- a/package/matchbox/Config.in
> +++ b/package/matchbox/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_MATCHBOX
>  	select BR2_PACKAGE_XLIB_LIBXEXT
>  	select BR2_PACKAGE_XLIB_LIBXDAMAGE
>  	select BR2_PACKAGE_XLIB_LIBXCURSOR
> +	select BR2_PACKAGE_MATCHBOX_LIB
>  	help
>  	  Matchbox is an Open Source base environment for the X Window
>  	  System running on non-desktop embedded platforms such as
> @@ -17,6 +18,8 @@ config BR2_PACKAGE_MATCHBOX
>  
>  if BR2_PACKAGE_MATCHBOX
>  
> +source "package/matchbox/matchbox-lib/Config.in"

 This should obviously move to package/Config.in, and the condition should be
copied.


 Regards,
 Arnout

> +
>  config BR2_PACKAGE_MATCHBOX_PANEL
>  	bool "Matchbox Panel"
>  	help
> diff --git a/package/matchbox/matchbox-lib/Config.in b/package/matchbox/matchbox-lib/Config.in
> new file mode 100644
> index 0000000..480e6fe
> --- /dev/null
> +++ b/package/matchbox/matchbox-lib/Config.in
> @@ -0,0 +1,2 @@
> +config BR2_PACKAGE_MATCHBOX_LIB
> +	bool
> diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
> index fe1a7db..e367df2 100644
> --- a/package/matchbox/matchbox.mk
> +++ b/package/matchbox/matchbox.mk
> @@ -1,4 +1,4 @@
>  ifeq ($(BR2_PACKAGE_MATCHBOX),y)
>  include $(sort $(wildcard package/matchbox/*/*.mk))
> -PACKAGES += matchbox-lib matchbox-wm
> +PACKAGES += matchbox-wm
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
