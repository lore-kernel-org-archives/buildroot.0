From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jan 2020 15:32:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/ussp-push: add bluez5_utils
 support
In-Reply-To: <20200111092101.419186-1-fontaine.fabrice@gmail.com>
References: <20200111092101.419186-1-fontaine.fabrice@gmail.com>
Message-ID: <20200111153209.2a6b57d6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Jan 2020 10:21:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ussp-push/Config.in    | 2 +-
>  package/ussp-push/ussp-push.mk | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ussp-push/Config.in b/package/ussp-push/Config.in
> index aefec85a20..d0ab577609 100644
> --- a/package/ussp-push/Config.in
> +++ b/package/ussp-push/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_USSP_PUSH
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
>  	depends on BR2_USE_MMU # dbus
>  	select BR2_PACKAGE_OPENOBEX
> -	select BR2_PACKAGE_BLUEZ_UTILS
> +	select BR2_PACKAGE_BLUEZ_UTILS if !BR2_PACKAGE_BLUEZ5_UTILS

Doing this causes a Kconfig circular dependency:

package/bluez_utils/Config.in:1:error: recursive dependency detected!
package/bluez_utils/Config.in:1:	symbol BR2_PACKAGE_BLUEZ_UTILS is selected by BR2_PACKAGE_BLUEZ5_UTILS
package/bluez5_utils/Config.in:1:	symbol BR2_PACKAGE_BLUEZ5_UTILS is selected by BR2_PACKAGE_BLUEZ_ALSA
package/bluez-alsa/Config.in:1:	symbol BR2_PACKAGE_BLUEZ_ALSA depends on BR2_PACKAGE_BLUEZ_UTILS

This problem also affects your cwiid and sconeserver patches.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
