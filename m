From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 May 2016 00:39:28 +0200
Subject: [Buildroot] [PATCH 1/1] linux: arm: config endiness based on
 BR2 config
In-Reply-To: <1463474820-18073-1-git-send-email-oferh@marvell.com>
References: <1463474820-18073-1-git-send-email-oferh@marvell.com>
Message-ID: <e02c9bd7-58c2-8ed3-70d9-dee7785ca5bc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/17/16 10:47, oferh at marvell.com wrote:
> From: Ofer Heifetz <oferh@marvell.com>
>
> By default linux ARM arch is implicit configured LE,
> when BR2 is configured BE, modify the linux config to BE
> for ARM arch.
>
> Signed-off-by: Ofer Heifetz <oferh@marvell.com>
> ---
>  linux/linux.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index d88060e..71545e4 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -218,6 +218,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
>  	)
>  	$(if $(BR2_arm)$(BR2_armeb),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
> +	$(if $(BR2_armeb)$(BR2_aarch64_be),
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_CPU_BIG_ENDIAN,$(@D)/.config))

  Instead of doing this specifically for ARM, perhaps it's better to do this in 
general for all platforms? Something like (untested)

ifeq ($(BR2_ENDIAN),"BIG")
	$(call KCONFIG_ENABLE_OPT,CONFIG_CPU_BIG_ENDIAN,$(@D)/.config))
else
	$(call KCONFIG_ENABLE_OPT,CONFIG_CPU_LITTLE_ENDIAN,$(@D)/.config))
endif

  Even though not all arches support these options, it's harmless to add it for 
the ones which don't have them. The subsequent olddefconfig should just remove 
it again.

  Regards,
  Arnout

>  	$(if $(BR2_TARGET_ROOTFS_CPIO),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config))
>  	# As the kernel gets compiled before root filesystems are
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
