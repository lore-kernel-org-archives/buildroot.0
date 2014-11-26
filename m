From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 26 Nov 2014 10:49:18 +0200
Subject: [Buildroot] [PATCH v2] package/network-manager: NM needs
 ISC-DHCPC or DHCPCD
In-Reply-To: <1416986374-24951-1-git-send-email-nroach44@gmail.com>
References: <1416986374-24951-1-git-send-email-nroach44@gmail.com>
Message-ID: <20141126084918.GO2374@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nathaniel,

On Wed, Nov 26, 2014 at 03:19:34PM +0800, Nathaniel Roach wrote:
> As NM communicates with the dhcp client through DBus, it
> doesn't support any old client.
> 
> Add the dependencies to Config.in, and ensure that they
> are built beforehand.

So only these two DHCP clients are supported? If so, please mention that here.

> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
> ---
> This adds unecessary things to static-ip configured
> 	systems, but then again they are using NM for that
> 	(instead of ifup/down) so maybe this is a non issue?
> 
> Changes v1 -> v2:
>   - Switched to "select" from "depends on" (As recommended by
> 	Baruch). Uses DHCPCD as default as it's the lighter
> 	option.
>   - Because of the above, the edit to "NM needs ..." is no
> 	longer needed.
> 
> ---
>  package/network-manager/Config.in          | 1 +
>  package/network-manager/network-manager.mk | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
> index 0ed6ca5..a3e6e33 100644
> --- a/package/network-manager/Config.in
> +++ b/package/network-manager/Config.in
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
>  	depends on BR2_USE_MMU # dbus
>  	depends on BR2_PACKAGE_HAS_UDEV
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> +	select BR2_PACKAGE_DHCPCD if !BR2_PACKAGE_DHCP_CLIENT
>  	select BR2_PACKAGE_DBUS
>  	select BR2_PACKAGE_DBUS_GLIB
>  	select BR2_PACKAGE_GNUTLS
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 7944254..96bc858 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -57,10 +57,12 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
>  NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/usr/sbin/dhclient
> +NETWORK_MANAGER_DEPENDENCIES += dhcp

Are you sure this is a build time dependency?

>  endif
>  
>  ifeq ($(BR2_PACKAGE_DHCPCD),y)
>  NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/usr/sbin/dhcpcd
> +NETWORK_MANAGER_DEPENDENCIES += dhcpcd

Ditto.

>  endif
>  
>  # uClibc by default doesn't have backtrace support, so don't use it

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
