From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 22:23:52 +0100
Subject: [Buildroot] [PATCH 2/2] package/cwiid: add optional dependency
 to bluez5_utils
In-Reply-To: <20170219131834.27844-2-bernd.kuhls@t-online.de>
References: <20170219131834.27844-1-bernd.kuhls@t-online.de>
 <20170219131834.27844-2-bernd.kuhls@t-online.de>
Message-ID: <20170301222352.1f97ef44@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Feb 2017 14:18:34 +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/cwiid/Config.in | 2 +-
>  package/cwiid/cwiid.mk  | 8 +++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
> index 03b7dbbcd..69e54f5b7 100644
> --- a/package/cwiid/Config.in
> +++ b/package/cwiid/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_CWIID
>  	depends on BR2_USE_WCHAR # bluez_utils -> libglib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> dbus, alsa-lib, libglib2
>  	depends on BR2_USE_MMU # bluez_utils -> dbus, libglib2
> -	select BR2_PACKAGE_BLUEZ_UTILS
> +	select BR2_PACKAGE_BLUEZ_UTILS if !BR2_PACKAGE_BLUEZ5_UTILS

This causes a circular dependency:

package/bluez_utils/Config.in:1:error: recursive dependency detected!
package/bluez_utils/Config.in:1:	symbol BR2_PACKAGE_BLUEZ_UTILS is selected by BR2_PACKAGE_BLUEZ5_UTILS
package/bluez5_utils/Config.in:1:	symbol BR2_PACKAGE_BLUEZ5_UTILS depends on BR2_PACKAGE_BLUEZ_UTILS

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
