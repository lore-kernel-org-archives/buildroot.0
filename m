From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 07 Oct 2012 13:31:53 +0200
Subject: [Buildroot] [PATCH] linux: Fix initramfs compression
In-Reply-To: <1349551332-25169-1-git-send-email-gvaxon@gmail.com>
References: <1349551332-25169-1-git-send-email-gvaxon@gmail.com>
Message-ID: <50716829.7010004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/10/12 21:22, Valentine Barshak wrote:
> -		$(call KCONFIG_DISABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE,$(@D)/.config)
> -		$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(@D)/.config))
> +		for c in GZIP BZIP2 LZMA XZ LZO; do \
> +			if grep -qm1 "CONFIG_RD_$$c=y" $(@D)/.config; then \
> +				$(call KCONFIG_DISABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE,$(@D)/.config); \
> +				$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_$$c,$(@D)/.config); \
> +				break; \
> +			fi; \
> +		done)

  I think this is a bit too complex for something that won't really be used by
most people.  Why not just remove the COMPRESSION lines from linux.mk?  Then
we fall back on the default if the user hasn't configured it explicitly.  Gives
the user the possibility to choose something else than the default, without adding
complexity to buildroot.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
