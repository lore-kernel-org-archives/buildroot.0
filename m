From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Sep 2020 09:45:46 +0200
Subject: [Buildroot] [PATCH 1/2] linux: show compression options only on
 some architectures
In-Reply-To: <20200925073758.GD11621@scaer>
References: <20200924122222.3449188-1-thomas.petazzoni@bootlin.com>
 <20200925073758.GD11621@scaer>
Message-ID: <20200925094546.064d9c09@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Sep 2020 09:37:58 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> So, if the arch does not support kernel image compression, we will have
> none of the compression symbols defined, which means that, in linux.mk,
> we would have:
> 
>     104 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_GZIP) += CONFIG_KERNEL_GZIP
>     105 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZ4) += CONFIG_KERNEL_LZ4
>     106 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZMA) += CONFIG_KERNEL_LZMA
>     107 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZO) += CONFIG_KERNEL_LZO
>     108 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_XZ) += CONFIG_KERNEL_XZ
>     109 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_ZSTD) += CONFIG_KERNEL_ZSTD
>     [--SNIP--]
>     319 define LINUX_KCONFIG_FIXUP_CMDS
>     322     $(call KCONFIG_ENABLE_OPT,$(strip $(LINUX_COMPRESSION_OPT_y)))
> 
> But then, LINUX_COMPRESSION_OPT_y would be empty, so we'd call KCONFIG_ENABLE_OPT
> with an empty string, which would expand to:
> 
>     $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=y, $(2))
> 
> ... and replacing the parameters would give (I'm pretty sure you'll see
> where we're going now):
> 
>     $(call KCONFIG_MUNGE_DOT_CONFIG, , =y, $(2))
> 
> When KCONFIG_MUNGE_DOT_CONFIG is expanded, we'd get:
> 
>     $(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3))
>     echo '$(strip $(2))' >> $(call KCONFIG_DOT_CONFIG,$(3))
> 
> ... which would eventualy lead us to:
> 
>     $(SED) "/\\<)\\>/d" /some/.config-file
>     echo '=y' >> /some/.config-file
> 
> And to be honest, I am not sure that last line would generate a fully
> legit kconfig setting... ;-)
> 
> Of course, running 'make oldconfig' on that modified .config would drop
> invalid lines, so you would not notivce the issue, but still this is not
> correct...

Thanks for spotting this, I'll fix in v2. That being said, one can
notice that you're pointing out that this bogus =y line will be
dropped... just as equally as the bogus CONFIG_KERNEL_GZIP=y that we
have today gets dropped on arm64 and other architectures for which
those CONFIG_KERNEL_{GZIP,LZMA,LZ4,...} options don't exist :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
