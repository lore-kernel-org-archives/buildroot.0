From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 14:40:31 +0100
Subject: [Buildroot] [PATCH] tvheadend: add dependency on udev based
 rootfs creation
In-Reply-To: <20171229130604.9897-1-daggs@gmx.com>
References: <20171229130604.9897-1-daggs@gmx.com>
Message-ID: <20171229144031.798b5f81@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Dec 2017 15:06:04 +0200, Dagg Stompler wrote:
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV is needed for tvheadend inorder
> for the program to see usb based DVB cards.
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  package/tvheadend/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
> index 44a69a27ba..2a497b481d 100644
> --- a/package/tvheadend/Config.in
> +++ b/package/tvheadend/Config.in
> @@ -9,6 +9,7 @@ config BR2_PACKAGE_TVHEADEND
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV

You should use BR2_PACKAGE_HAS_UDEV instead. Indeed udev can be
provided by either eudev or systemd.

This change will also require a change in the Config.in comment. See
package/dt-utils/Config.in for an example.

Also, does tvheadend needs to link with libudev ? If so, it should have
udev in its <pkg>_DEPENDENCIES. If it doesn't link with libudev, then
I'm not sure to see how udev helps for tvheadend to detect USB DVB
cards.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
