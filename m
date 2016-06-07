From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 23:12:36 +0200
Subject: [Buildroot] [PATCH v4] uboot-tools: fix FIT support and make it
 optional
In-Reply-To: <1464982539-26551-1-git-send-email-casantos@datacom.ind.br>
References: <1464791982-10166-5-git-send-email-casantos@datacom.ind.br>
 <1464982539-26551-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20160607231236.26895b0c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Jun 2016 16:35:39 -0300, Carlos Santos wrote:
> Fix several issues regarding the support for Flat Image Trees (FIT).
> 
> - Add a patch to really allow turning FIT support on/off, which was not
>   possible due to bugs in the code and in the tools Makefile. This patch
>   has been sent upstream but not applied there, yet.
> 
> - Use independent options to control FIT support on host and target
>   packages.
> 
> - Subordinate FIT signature support to the activation of FIT support, in
>   the target package, not to mkimage installation.
> 
> - Add a dependence on the dtc utilities because mkimage needs it when
>   FIT is enabled; otherwise mkimage fails like this:
> 
>     $ mkimage -f firmware.its firmware.im
>     sh: dtc: command not found
> 
> - Add BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT to the
>   Config.in.legacy file.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Thanks, I've applied your patch, with some minor tweaks, see below.


> +ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),y)
> +UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y
> +UBOOT_TOOLS_DEPENDENCIES += dtc
> +ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
> +UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y
> +UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
> +endif # BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
> +endif # BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT

Nesting the two conditions is not needed, since the Config.in options
already depend on each other. So I've "un-nested" the conditions.

> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_TOOLS_MAKE_OPTS) CROSS_BUILD_TOOLS=y tools-only
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_TOOLS_MAKE_OPTS) env no-dot-config-targets=env

These lines were a bit too long, so I've split them.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
