From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Sep 2020 09:37:58 +0200
Subject: [Buildroot] [PATCH 1/2] linux: show compression options only on
 some architectures
In-Reply-To: <20200924122222.3449188-1-thomas.petazzoni@bootlin.com>
References: <20200924122222.3449188-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200925073758.GD11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-09-24 14:22 +0200, Thomas Petazzoni spake thusly:
> Our Linux kernel compression options have the effect of enabling
> CONFIG_KERNEL_{GZIP,LZMA,LZ4,...}. However, those configuration
> options only exist on a subset of the CPU architectures, and it is
> confusing to have such a choice visible when it in fact has no
> effect. For example on ARM64, it has absolutely no effect, and the way
> to create a compressed image is different, and the image is not
> self-extractible.
> 
> So, we introduce a BR2_LINUX_KERNEL_ARCH_HAS_COMPRESSION to know which
> architectures have compression support. Of course, it's never going to
> be perfect as the set of architectures supporting compression might
> change over time. But at least, it will allow us to hide this option
> on architectures that do not at this point support compression.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  linux/Config.in | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 49da2b81b2..9f2af6da5b 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -299,6 +299,22 @@ endchoice
>  # Kernel compression format
>  #
>  
> +# Indicates whether this architecture has support for built-in kernel
> +# compression, i.e architectures that select one of
> +# HAVE_KERNEL_{GZIP,LZMA,LZ4,LZO,XZ,UNCOMPRESSED}
> +config BR2_LINUX_KERNEL_ARCH_HAS_COMPRESSION
> +	bool
> +	default y if BR2_arcle || BR2_arceb
> +	default y if BR2_arm || BR2_armeb
> +	default y if BR2_csky
> +	default y if BR2_i386
> +	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> +	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
> +	default y if BR2_sh
> +	default y if BR2_x86_64
> +
> +if BR2_LINUX_KERNEL_ARCH_HAS_COMPRESSION

So, if the arch does not support kernel image compression, we will have
none of the compression symbols defined, which means that, in linux.mk,
we would have:

    104 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_GZIP) += CONFIG_KERNEL_GZIP
    105 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZ4) += CONFIG_KERNEL_LZ4
    106 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZMA) += CONFIG_KERNEL_LZMA
    107 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZO) += CONFIG_KERNEL_LZO
    108 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_XZ) += CONFIG_KERNEL_XZ
    109 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_ZSTD) += CONFIG_KERNEL_ZSTD
    [--SNIP--]
    319 define LINUX_KCONFIG_FIXUP_CMDS
    322     $(call KCONFIG_ENABLE_OPT,$(strip $(LINUX_COMPRESSION_OPT_y)))

But then, LINUX_COMPRESSION_OPT_y would be empty, so we'd call KCONFIG_ENABLE_OPT
with an empty string, which would expand to:

    $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=y, $(2))

... and replacing the parameters would give (I'm pretty sure you'll see
where we're going now):

    $(call KCONFIG_MUNGE_DOT_CONFIG, , =y, $(2))

When KCONFIG_MUNGE_DOT_CONFIG is expanded, we'd get:

    $(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3))
    echo '$(strip $(2))' >> $(call KCONFIG_DOT_CONFIG,$(3))

... which would eventualy lead us to:

    $(SED) "/\\<)\\>/d" /some/.config-file
    echo '=y' >> /some/.config-file

And to be honest, I am not sure that last line would generate a fully
legit kconfig setting... ;-)

Of course, running 'make oldconfig' on that modified .config would drop
invalid lines, so you would not notivce the issue, but still this is not
correct...

Regards,
Yann E. MORIN.

>  choice
>  	prompt "Kernel compression format"
>  	help
> @@ -326,6 +342,8 @@ config BR2_LINUX_KERNEL_ZSTD
>  
>  endchoice
>  
> +endif
> +
>  config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
>  	string "Kernel image target name"
>  	depends on BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
