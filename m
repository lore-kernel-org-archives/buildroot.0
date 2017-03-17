From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Mar 2017 23:36:22 +0100
Subject: [Buildroot] [PATCH v4 1/3] uccp420wlan: new package
In-Reply-To: <1489664602-32596-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
References: <1489664602-32596-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
Message-ID: <c8cbe6d4-dcf4-8c39-a2da-9a1e1132c823@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-03-17 12:43, Abhimanyu V wrote:
> From: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
> 
> Wifi kernel module and firmware for Imagination explorer RPU
> 
> Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
> Reviewed-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 There is one worry: it needs a kernel >= 4.2. However, I expect most of our
modules packages have some kind of kernel dependency, and none of them encode
it. It's also hard to do since we don't have a way to know the kernel version.
It could be worthwhile, however, to mention this minimum kernel version in the
help text.

[snip]
> diff --git a/package/uccp420wlan/Config.in b/package/uccp420wlan/Config.in
> new file mode 100644
> index 0000000..40abc8e
> --- /dev/null
> +++ b/package/uccp420wlan/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_UCCP420WLAN
> +	bool "uccp420wlan"
> +	depends on BR2_LINUX_KERNEL
> +	help
> +	  SoftMAC (mac80211) based WiFi driver for Imagination's
> +	  Explorer RPU uccp420. This supports Dual Band WiFi with
> +	  2.4GHz - 2x2 b/g/n 40MHz, 5GHz - 2x2 a/n/11ac 80MHz modes
> +
> +	  Used in creator ci40 board.

 So

	  This module needs a Linux kernel >= v4.2.

> +
> +	  https://github.com/CreatorDev/uccp420wlan
> +
> +comment "uccp420wlan needs a Linux kernel to be built"

 and

comment "uccp420wlan needs a Linux kernel >= v4.2 to be built"


 Regards,
 Arnout

> +	depends on !BR2_LINUX_KERNEL
> diff --git a/package/uccp420wlan/uccp420wlan.hash b/package/uccp420wlan/uccp420wlan.hash
> new file mode 100644
> index 0000000..41f60a4
> --- /dev/null
> +++ b/package/uccp420wlan/uccp420wlan.hash
> @@ -0,0 +1,2 @@
> +# locally computed hash
> +sha256 1d4de62fc842dbab739708cf0d9ebce270fcdf63c1c13ac676cbc253acdaa3bb uccp420wlan-v6.9.1.tar.gz
> diff --git a/package/uccp420wlan/uccp420wlan.mk b/package/uccp420wlan/uccp420wlan.mk
> new file mode 100644
> index 0000000..1496a92
> --- /dev/null
> +++ b/package/uccp420wlan/uccp420wlan.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# uccp420wlan
> +#
> +################################################################################
> +
> +UCCP420WLAN_VERSION = v6.9.1
> +UCCP420WLAN_SITE = $(call github,CreatorDev,uccp420wlan,$(UCCP420WLAN_VERSION))
> +UCCP420WLAN_LICENSE = GPLv2 (kernel module), proprietary (firmware blob)
> +UCCP420WLAN_LICENSE_FILES = COPYING firmware/LICENSE.imagination
> +
> +define UCCP420WLAN_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/lib/firmware/img/uccp420wlan
> +	cp $(@D)/firmware/*.ldr $(TARGET_DIR)/lib/firmware/img/uccp420wlan
> +endef
> +
> +$(eval $(kernel-module))
> +$(eval $(generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
