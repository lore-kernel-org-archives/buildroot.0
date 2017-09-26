From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 00:41:36 +0200
Subject: [Buildroot] [PATCH v3] package/dfu-util: allow to build it for
 the target as well
In-Reply-To: <0cc3073e-a173-8803-3385-9b7b9c0061d4@grandegger.com>
References: <0cc3073e-a173-8803-3385-9b7b9c0061d4@grandegger.com>
Message-ID: <3efc3fc0-d085-f1da-2a95-4ef78b7835b5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-09-17 08:12, Wolfgang Grandegger wrote:
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
> 
> Changes since v2:
> - propagate the threads dependency from libusb and add a comment
> 
> Changes since v1:
> - add missing "select BR2_PACKAGE_LIBUSB" in Config.in
> 
>  package/Config.in            |  1 +
>  package/dfu-util/Config.in   | 13 +++++++++++++
>  package/dfu-util/dfu-util.mk |  2 ++
>  3 files changed, 16 insertions(+)
>  create mode 100644 package/dfu-util/Config.in
> 
> diff --git a/package/Config.in b/package/Config.in
> index 48d1381..b493201 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -389,6 +389,7 @@ endmenu
>  	source "package/dbus-python/Config.in"
>  	source "package/dbus-triggerd/Config.in"
>  	source "package/devmem2/Config.in"
> +	source "package/dfu-util/Config.in"
>  	source "package/dmidecode/Config.in"
>  	source "package/dmraid/Config.in"
>  	source "package/dt-utils/Config.in"
> diff --git a/package/dfu-util/Config.in b/package/dfu-util/Config.in
> new file mode 100644
> index 0000000..2f45fcd
> --- /dev/null
> +++ b/package/dfu-util/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_DFU_UTIL
> +	bool "dfu-util"
> +	select BR2_PACKAGE_LIBUSB
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  Dfu-util is the host side implementation of the DFU 1.0
> +	  specification of the USB forum. DFU is intended to download
> +	  and upload firmware to devices connected over USB.
> +
> +	  http://dfu-util.sourceforge.net/
> +
> +comment "dfu-util needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
> index c494485..5e8ba5a 100644
> --- a/package/dfu-util/dfu-util.mk
> +++ b/package/dfu-util/dfu-util.mk
> @@ -9,6 +9,8 @@ DFU_UTIL_SITE = http://dfu-util.sourceforge.net/releases
>  DFU_UTIL_LICENSE = GPL-2.0+
>  DFU_UTIL_LICENSE_FILES = COPYING
>  
> +DFU_UTIL_DEPENDENCIES = libusb
>  HOST_DFU_UTIL_DEPENDENCIES = host-libusb
>  
> +$(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
