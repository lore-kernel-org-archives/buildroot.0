From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 14 Jul 2015 16:05:53 +0200
Subject: [Buildroot] [PATCHv2] transmission: improve systemd support
In-Reply-To: <1436881866-2168-1-git-send-email-aurelien@chabot.fr>
References: <1421684056-5266-11-git-send-email-maxtram95@gmail.com>
 <1436881866-2168-1-git-send-email-aurelien@chabot.fr>
Message-ID: <CAGduivy48ijCY6MxObh2KNJjEii8R9s89T5f7mVWOMB_-shE6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Aur?lien, all

On Tue, Jul 14, 2015 at 3:51 PM, Aur?lien Chabot <aurelien@chabot.fr> wrote:
> From: Maxim Mikityanskiy <maxtram95@gmail.com>
>
> Support running transmission-daemon in system-wide mode using systemd:
>
> 1. Pass --with-systemd-daemon to configure script if systemd is enabled.
>
> 2. Install sysctl.d config file to increase send and receive buffer
> sizes.
>
> 3. Install sysusers.d config file to create transmission user when using
> systemd. Create transmission user when not using systemd.
>
> 4. Install transmission-daemon.service for systemd.
>
> [Aur?lien : Fix symlink relative path, use upstream service file,
> no need for config path, and use transmission user in sysv script]
>
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
> ---
>  package/transmission/S92transmission            |  4 +--
>  package/transmission/transmission.mk            | 37 +++++++++++++++++++++++++
>  package/transmission/transmission_sysctl.conf   |  2 ++
>  package/transmission/transmission_sysusers.conf |  1 +
>  4 files changed, 41 insertions(+), 3 deletions(-)
>  create mode 100644 package/transmission/transmission_sysctl.conf
>  create mode 100644 package/transmission/transmission_sysusers.conf
>
> diff --git a/package/transmission/S92transmission b/package/transmission/S92transmission
> index 1870522..e5976b0 100644
> --- a/package/transmission/S92transmission
> +++ b/package/transmission/S92transmission
> @@ -24,9 +24,7 @@
>  # by default, this is set to 'transmission'.
>  # For the sake of security you shouldn't set a password
>  # on this user
> -#USERNAME=transmission
> -USERNAME=default
> -
> +USERNAME=transmission
>
>
>  # ----- *ADVANCED* CONFIGURATION -----
> diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
> index bbc32bf..81dd110 100644
> --- a/package/transmission/transmission.mk
> +++ b/package/transmission/transmission.mk
> @@ -36,11 +36,48 @@ endif
>  ifeq ($(BR2_PACKAGE_TRANSMISSION_DAEMON),y)
>  TRANSMISSION_CONF_OPTS += --enable-daemon
>
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +TRANSMISSION_DEPENDENCIES += systemd
> +TRANSMISSION_CONF_OPTS += --with-systemd-daemon
> +else
> +TRANSMISSION_CONF_OPTS += --without-systemd-daemon
> +endif
> +
> +ifeq ($(BR2_INIT_SYSTEMD),)
> +define TRANSMISSION_USERS
> +       transmission -1 transmission -1 * /var/lib/transmission - transmission Transmission Daemon
> +endef
> +endif
> +
>  define TRANSMISSION_INSTALL_INIT_SYSV
>         $(INSTALL) -m 0755 -D package/transmission/S92transmission \
>                 $(TARGET_DIR)/etc/init.d/S92transmission
>  endef
>
> +define TRANSMISSION_INSTALL_INIT_SYSTEMD
> +       $(INSTALL) -D -m 0755 $(@D)/daemon/transmission-daemon.service \
> +               $(TARGET_DIR)/usr/lib/systemd/system/transmission-daemon.service
Do we still need to install the service ? Doesn't the transmission
Makefile do it for us ?
> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +       ln -fs ../../../../usr/lib/systemd/system/transmission-daemon.service \
> +               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/transmission-daemon.service
> +endef
> +
> +define TRANSMISSION_INSTALL_SYSCTL_HOOK
> +       $(INSTALL) -D -m 644 package/transmission/transmission_sysctl.conf \
> +               $(TARGET_DIR)/usr/lib/sysctl.d/20-transmission.conf
> +endef
> +
> +TRANSMISSION_POST_INSTALL_TARGET_HOOKS += \
> +       TRANSMISSION_INSTALL_SYSCTL_HOOK
> +
I don't know what the other think about it but I really don't like the
fact that there's some sysctl conf installed by a package.
> +define TRANSMISSION_INSTALL_SYSUSERS_HOOK
> +       $(INSTALL) -D -m 644 package/transmission/transmission_sysusers.conf \
> +               $(TARGET_DIR)/usr/lib/sysusers.d/transmission.conf
> +endef
> +
> +TRANSMISSION_POST_INSTALL_TARGET_HOOKS += \
> +       TRANSMISSION_INSTALL_SYSUSERS_HOOK
> +
>  else
>  TRANSMISSION_CONF_OPTS += --disable-daemon
>  endif
> diff --git a/package/transmission/transmission_sysctl.conf b/package/transmission/transmission_sysctl.conf
> new file mode 100644
> index 0000000..7862332
> --- /dev/null
> +++ b/package/transmission/transmission_sysctl.conf
> @@ -0,0 +1,2 @@
> +net.core.wmem_max = 1048576
> +net.core.rmem_max = 4194304
So I would scratch that too.
> diff --git a/package/transmission/transmission_sysusers.conf b/package/transmission/transmission_sysusers.conf
> new file mode 100644
> index 0000000..09396d4
> --- /dev/null
> +++ b/package/transmission/transmission_sysusers.conf
> @@ -0,0 +1 @@
> +u transmission - "Transmission daemon" /var/lib/transmission
> --
Have you tested with a read-only file system ? Since
/var/lib/transmission is not a tmpfs, I don't know if transmission
will be very happy about that.
> 2.4.5
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
