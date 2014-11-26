From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 26 Nov 2014 08:45:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/network-manager: NM needs
 ISC-DHCPC or DHCPCD
In-Reply-To: <1416983821-2729-1-git-send-email-nroach44@gmail.com>
References: <1416983821-2729-1-git-send-email-nroach44@gmail.com>
Message-ID: <20141126064539.GM2374@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nathaniel,

On Wed, Nov 26, 2014 at 02:37:01PM +0800, Nathaniel Roach wrote:
> As NM communicates with the dhcp client through DBus, it
> doesn't support any old client.
> 
> Add the dependencies to Config.in, and ensure that they
> are built beforehand.
> ---
> Two things I'm a little wary of:
>  - The new "you need to enable x,y,z..." line is /huge/,
> 	is there a nice way around this?
>  - This adds unecessary things to static-ip configured
> 	systems, but then again they are using NM for that
> 	(instead of ifup/down) so maybe this is a non issue?
> 
> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
> ---
>  package/network-manager/Config.in          | 6 ++++--
>  package/network-manager/network-manager.mk | 2 ++
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
> index 0ed6ca5..72a2732 100644
> --- a/package/network-manager/Config.in
> +++ b/package/network-manager/Config.in
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
>  	depends on BR2_USE_MMU # dbus
>  	depends on BR2_PACKAGE_HAS_UDEV
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> +	depends on BR2_PACKAGE_DHCP_CLIENT || BR2_PACKAGE_DHCPCD

We usually use 'select' for this kind of dependencies. Something like 
(untested):

	select BR2_PACKAGE_DHCPCD if !BR2_PACKAGE_DHCP_CLIENT

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
