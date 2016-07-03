From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 3 Jul 2016 14:59:38 +0200
Subject: [Buildroot] [PATCH 24/24 v2] system: allow DHCP interface with
 systemd-networkd
In-Reply-To: <f1c505051eef3830d3cea769967f7218bd70e7c9.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <f1c505051eef3830d3cea769967f7218bd70e7c9.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <f43a27bc-4e71-87a6-8fde-fbeef5a391db@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 22/06/2016 ? 21:07, Yann E. MORIN a ?crit :
> It is pretty trivial to enable a DHCP interface with systemd-networkd, we
> just need to provide a .network config file with just the name of the
> interface to bring up and activate DHCP on it.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>


Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> ---
>  package/skeleton-systemd/skeleton-systemd.mk | 12 +++++++++++-
>  system/Config.in                             |  9 +++------
>  2 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/package/skeleton-systemd/skeleton-systemd.mk b/package/skeleton-systemd/skeleton-systemd.mk
> index c7c2e26..cbaded2 100644
> --- a/package/skeleton-systemd/skeleton-systemd.mk
> +++ b/package/skeleton-systemd/skeleton-systemd.mk
> @@ -15,7 +15,17 @@ SKELETON_SYSTEMD_ADD_SKELETON_DEPENDENCY = NO
>  
>  # In case we're not using systemd-networkd, use the sysv-like network infra;
>  # otherwise, the necessary bits are installed by the systemd package.
> -ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),)
> +ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
> +
> +define SKELETON_SYSTEMD_SET_NETWORK
> +	mkdir -p $(TARGET_DIR)/etc/systemd/network
> +	printf '[Match]\nName=%s\n[Network]\nDHCP=yes\n' \
> +		$(SKELETON_NETWORK_DHCP_IFACE) \
> +		>$(TARGET_DIR)/etc/systemd/network/$(SKELETON_NETWORK_DHCP_IFACE).network
> +endef
> +SKELETON_SYSTEMD_TARGET_FINALIZE_HOOKS += SKELETON_SYSTEMD_SET_NETWORK
> +
> +else # BR2_PACKAGE_SYSTEMD_NETWORKD is not set
>  
>  define SKELETON_SYSTEMD_RSYNC_NETWORK
>  	 $(call SKELETON_RSYNC,system/skeleton-net,$(TARGET_DIR))
> diff --git a/system/Config.in b/system/Config.in
> index 32d6542..c90866c 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -362,7 +362,7 @@ config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
>  config BR2_SYSTEM_DHCP
>  	string "Network interface to configure through DHCP"
>  	default ""
> -	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD && (BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN)
> +	depends on BR2_PACKAGE_SYSTEMD_NETWORKD || BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN
>  	help
>  	  Enter here the name of the network interface (E.G. eth0) to
>  	  automatically configure through DHCP at bootup.
> @@ -372,11 +372,8 @@ config BR2_SYSTEM_DHCP
>  	  For more complicated network setups use an overlay to overwrite
>  	  /etc/network/interfaces or add a networkd configuration file.
>  
> -comment "automatic network configuration via DHCP is not compatible with networkd"
> -	depends on BR2_PACKAGE_SYSTEMD_NETWORKD
> -
> -comment "automatic network configuration via DHCP needs ifupdown or busybox"
> -	depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN)
> +comment "automatic network configuration via DHCP needs systemd, busybox or ifupdown"
> +	depends on !(BR2_PACKAGE_SYSTEMD_NETWORKD || BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN)
>  
>  endif # BR2_ROOTFS_SKELETON_DEFAULT
>  
> 
