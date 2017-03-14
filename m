From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Mar 2017 10:04:02 +0100
Subject: [Buildroot] [PATCH v3 1/3] uccp420wlan: new package
In-Reply-To: <1488202681-9744-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
References: <1488202681-9744-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
Message-ID: <47099025-ebf9-b9d5-f26e-5206b0ec93eb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-02-17 14:37, Abhimanyu V wrote:
> From: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
> 
> Wifi kernel module and firmware for Imagination explorer RPU
> 
> Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
> Reviewed-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
> ---
>  Changes v1->v2
>   - add hash file
>  Changes v2->v3 (Suggested by Arnout)
>   - remove patch and bump version
>   - add proprietary license file to LICENSE_FILES
>   - Fix help text indentation to below 72 columns
[snip]
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
> index 0000000..4676ef3
> --- /dev/null
> +++ b/package/uccp420wlan/uccp420wlan.mk
> @@ -0,0 +1,20 @@
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
> +define UCCP420WLAN_INSTALL_FIRMWARE
> +	mkdir -p $(TARGET_DIR)/lib/firmware/img/uccp420wlan
> +	cp $(@D)/firmware/*.ldr $(TARGET_DIR)/lib/firmware/img/uccp420wlan
> +endef
> +
> +UCCP420WLAN_POST_INSTALL_TARGET_HOOKS += UCCP420WLAN_INSTALL_FIRMWARE

 Sorry I didn't notice this before: there is no need for a POST_INSTALL_HOOK
here, you can just

define UCCP420WLAN_INSTALL_TARGET_CMDS


 Regards,
 Arnout

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
