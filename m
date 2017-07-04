From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 17:33:40 +0200
Subject: [Buildroot] [PATCH 013/100] avahi: use new gettext logic
In-Reply-To: <20170704144920.12318-14-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
 <20170704144920.12318-14-thomas.petazzoni@free-electrons.com>
Message-ID: <3e85e92f-e90d-e088-b879-d92d88d8927b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 16:47, Thomas Petazzoni wrote:
> This commit switches to use the new gettext logic, which involves:
> 
>  - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
>    on gettext/host-gettext
> 
>  - using TARGET_NLS_LIBS to force linking against libintl
> 
>  - dropping BR2_PACKAGE_GETTEXT selection
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout


> ---
>  package/avahi/Config.in | 1 -
>  package/avahi/avahi.mk  | 6 +++---
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/avahi/Config.in b/package/avahi/Config.in
> index a6b4ac8..5e303d0 100644
> --- a/package/avahi/Config.in
> +++ b/package/avahi/Config.in
> @@ -4,7 +4,6 @@ config BR2_PACKAGE_AVAHI
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
>  	help
>  	  Avahi is a system which facilitates service
>  	  discovery on a local network.
> diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
> index a356a08..94b6292 100644
> --- a/package/avahi/avahi.mk
> +++ b/package/avahi/avahi.mk
> @@ -97,8 +97,8 @@ AVAHI_CONF_OPTS = \
>  	--with-autoipd-group=avahi
>  
>  AVAHI_DEPENDENCIES = \
> -	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-intltool \
> -	host-pkgconf host-gettext
> +	host-intltool host-pkgconf \
> +	$(TARGET_NLS_DEPENDENCIES)
>  
>  AVAHI_CFLAGS = $(TARGET_CFLAGS)
>  
> @@ -168,7 +168,7 @@ endif
>  
>  AVAHI_CONF_ENV += CFLAGS="$(AVAHI_CFLAGS)"
>  
> -AVAHI_MAKE_OPTS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
> +AVAHI_MAKE_OPTS += LIBS=$(TARGET_NLS_LIBS)
>  
>  define AVAHI_USERS
>  	avahi -1 avahi -1 * - - -
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
