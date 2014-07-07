From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 07 Jul 2014 18:31:38 +0200
Subject: [Buildroot] [PATCH 1/6] dbus: enable systemd support
In-Reply-To: <1404406659-31109-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1404406659-31109-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1404406659-31109-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <53BACB6A.602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/07/14 18:57, Eric Le Bihan wrote:
> Enable systemd support if systemd is selected as init system (require
> systemd compatibility libraries).
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/dbus/Config.in |    1 +
>  package/dbus/dbus.mk   |    9 +++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dbus/Config.in b/package/dbus/Config.in
> index 653f748..7d49ce5 100644
> --- a/package/dbus/Config.in
> +++ b/package/dbus/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_DBUS
>  	# uses fork()
>  	depends on BR2_USE_MMU
>  	select BR2_PACKAGE_EXPAT
> +	select BR2_PACKAGE_SYSTEMD_COMPAT if BR2_INIT_SYSTEMD
>  	help
>  	  The D-Bus message bus system.
>  
> diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
> index 0c8fcf3..de699fc 100644
> --- a/package/dbus/dbus.mk
> +++ b/package/dbus/dbus.mk
> @@ -50,8 +50,13 @@ else
>  DBUS_CONF_OPT += --without-x
>  endif
>  
> -ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> -DBUS_CONF_OPT += --with-systemdsystemunitdir=/lib/systemd/system
> +ifeq ($(BR2_INIT_SYSTEMD),y)
> +DBUS_CONF_OPT += \
> +	--enable-systemd \
> +	--with-systemdsystemunitdir=/lib/systemd/system

 Doesn't systemd.pc specify this correctly?


 Otherwise, looks good to me.

 Regards,
 Arnout

> +DBUS_DEPENDENCIES += systemd
> +else
> +DBUS_CONF_OPT += --disable-systemd
>  endif
>  
>  # fix rebuild (dbus makefile errors out if /var/lib/dbus is a symlink)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
