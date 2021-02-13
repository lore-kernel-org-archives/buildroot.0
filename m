From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Feb 2021 11:13:26 +0100
Subject: [Buildroot] [PATCH-NEXT 4/4] linux: build after linux-firmware
 if enabled for early loading support
In-Reply-To: <20210212184049.13202-5-peter@korsgaard.com>
References: <20210212184049.13202-1-peter@korsgaard.com>
 <20210212184049.13202-5-peter@korsgaard.com>
Message-ID: <20210213101326.GR1679218@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-02-12 19:40 +0100, Peter Korsgaard spake thusly:
> To support building in (a subset of) the linux-firmware files into the
> kernel using the CONFIG_EXTRA_FIRMWARE option, we need to ensure that the
> firmware files are installed before the Linux kernel is built, similar to
> how it is done for intel-microcode.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  linux/linux.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index a212f42c28..5e4b319cf1 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -78,7 +78,8 @@ LINUX_MAKE_ENV = \
>  
>  LINUX_INSTALL_IMAGES = YES
>  LINUX_DEPENDENCIES = host-kmod \
> -	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode)
> +	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
> +	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware)

You also need to tell the kernel where to find those firmware files,
with CONFIG_EXTRA_FIRMWARE_DIR, otherwise it will look in /lib/firmware.

So we'd need something like:

    $(if $(BR2_PACKAGE_LINUX_FIRMWARE),
        $(call KCONFIG_SET_OPT,CONFIG_EXTRA_FIRMWARE_DIR,"$${BR_BINARIES_DIR}/linux-firmware"))

(note the $$ escaping and the use of a shell-level variable, like is
done for CONFIG_INITRAMFS_SOURCE).

Regards,
Yann E. MORIN.

>  # Starting with 4.16, the generated kconfig paser code is no longer
>  # shipped with the kernel sources, so we need flex and bison, but
> -- 
> 2.20.1
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
