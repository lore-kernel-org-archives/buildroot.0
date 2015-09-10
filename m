From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 10 Sep 2015 15:06:59 +0100
Subject: [Buildroot] [PATCH] modem-manager: now needs libgudev under
 systemd
In-Reply-To: <1441889437-13931-1-git-send-email-yegorslists@googlemail.com>
References: <1441889437-13931-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <55F18E83.1020007@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

when you say that "modem-manager: now needs libgudev for systemd", what
do you mean exactly by "now"? I would expect something like "since
version X" or a better explanation.

On 09/10/2015 01:50 PM, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Fixes: http://autobuild.buildroot.net/results/d59/d597a81271a082c8252e2333906815c437b6576d/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/modem-manager/Config.in        | 3 ++-
>  package/modem-manager/modem-manager.mk | 4 ++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
> index 59b8d88..1cd502b 100644
> --- a/package/modem-manager/Config.in
> +++ b/package/modem-manager/Config.in
> @@ -1,11 +1,12 @@
>  config BR2_PACKAGE_MODEM_MANAGER
>  	bool "modemmanager"
>  	depends on BR2_PACKAGE_HAS_UDEV
> -	select BR2_PACKAGE_DBUS
>  	depends on BR2_USE_WCHAR # libglib2 and gnutls
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
>  	depends on BR2_USE_MMU # dbus
> +	select BR2_PACKAGE_DBUS

I know you are trying to keep all the depends together and all the
selects together, but since this is not related with the goal that your
patch is trying to achieve, I would do it in a separate patch.

>  	select BR2_PACKAGE_DBUS_GLIB
> +	select BR2_PACKAGE_LIBGUDEV if BR2_INIT_SYSTEMD
>  	help
>  	  ModemManager is a DBus-activated daemon which controls mobile
>  	  broadband (2G/3G/4G) devices and connections.
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index 0e6b36a..36c8c0d 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -12,6 +12,10 @@ MODEM_MANAGER_LICENSE_FILES = COPYING
>  MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib host-intltool
>  MODEM_MANAGER_INSTALL_STAGING = YES
>  
> +ifeq ($(BR2_INIT_SYSTEMD),y)
> +MODEM_MANAGER_DEPENDENCIES += libgudev
> +endif
> +

Perhaps an explanation like the one included in this patch would useful
to understand why libgudev is needed:

http://git.buildroot.net/buildroot/commit/?id=46a615bb6439a4fe69f1bfc6a347852b993d46a2

Regards,

Vincent.

>  ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
>  MODEM_MANAGER_DEPENDENCIES += libqmi
>  MODEM_MANAGER_CONF_OPTS += --with-qmi
> 
