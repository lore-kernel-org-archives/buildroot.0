From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu, 12 May 2016 17:25:37 +0200
Subject: [Buildroot] [PATCH] package/systemd: optionally disable network
 service
In-Reply-To: <1462896852-19625-1-git-send-email-m.niestroj@grinn-global.com>
References: <1462896852-19625-1-git-send-email-m.niestroj@grinn-global.com>
Message-ID: <ac0fc5ff-f267-c08f-b83e-d9b6bddbc001@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Please ignore this patch, as the problem was in configuration.

I had the issue described below, because I had BR2_SYSTEM_DHCP
configured. With this enabled, there is an additional entry in
/etc/network/interfaces. Without it, network.service just configures
loopback device. This of course doesn't affect connman and
network.target in any way.

Regards,
Marcin

On 10.05.2016 18:14, Marcin Niestroj wrote:
> If systemd-networkd is disabled we install network.service file, in
> order to bring network interfaces up/down. While this works ok in simple
> setup, it confuses other network managers if they are enabled in
> Buildroot. For example when using with connman, network.service
> is 'activating' all the time, preventing activation of network.target
> and all services depending on it (e.g. sshd).
>
> Add new config option to disable installation of network.service.
>
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/systemd/Config.in  | 12 ++++++++++++
>  package/systemd/systemd.mk |  2 ++
>  2 files changed, 14 insertions(+)
>
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 97d48c4..3b0b2c0 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -132,6 +132,18 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
>
>  	  http://www.freedesktop.org/software/systemd/man/systemd-networkd.html
>
> +config BR2_PACKAGE_SYSTEMD_NETWORK_SERVICE
> +	bool "install default network service"
> +	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD
> +	default y
> +	help
> +	  Install default network service, which is configuring network
> +	  interfaces during boot.
> +
> +	  If you are using some network manager, than you propably want
> +	  to disable this option, as the default network service and
> +	  the network manager software may confuse each other.
> +
>  config BR2_PACKAGE_SYSTEMD_TIMESYNCD
>  	bool "enable SNTP client"
>  	help
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 8a6aa44..465ca8c 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -160,6 +160,7 @@ define SYSTEMD_INSTALL_RESOLVCONF_HOOK
>  endef
>  else
>  SYSTEMD_CONF_OPTS += --disable-networkd
> +ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORK_SERVICE),y)
>  define SYSTEMD_INSTALL_SERVICE_NETWORK
>  	$(INSTALL) -D -m 644 package/systemd/network.service \
>  		$(TARGET_DIR)/etc/systemd/system/network.service
> @@ -168,6 +169,7 @@ define SYSTEMD_INSTALL_SERVICE_NETWORK
>  		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/network.service
>  endef
>  endif
> +endif
>
>  ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
>  SYSTEMD_CONF_OPTS += --enable-timesyncd
>

-- 
Marcin Niestroj
