From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Dec 2018 13:25:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/brcm-patchram-plus: Add new
 package
In-Reply-To: <20181224115357.5520-1-vadim4j@gmail.com>
References: <20181224115357.5520-1-vadim4j@gmail.com>
Message-ID: <20181224122509.GC2703@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vadim, All,

On 2018-12-24 13:53 +0200, Vadim Kochan spake thusly:
> Add tool which allows to setup broadcom bluetooth
> device via UART.

You should explain in the commit log why you use autogen.sh and not
BRCM_PATCHRAM_PLUS_AUTORECONF=YES.

And since I just tried, I can tell it works...

> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/brcm-patchram-plus/Config.in b/package/brcm-patchram-plus/Config.in
> new file mode 100644
> index 0000000000..0f3ad4c951
> --- /dev/null
> +++ b/package/brcm-patchram-plus/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_BRCM_PATCHRAM_PLUS
> +	bool "brcm-patchram-plus"
> +	help
> +	  Broadcom utility to flash Bluetooth firmwares, extended with
> +	  per-device Low Power Mode configuration.

We usually like to add a pointer to the homepage for a project, but
since there is none here, we can just add the pointer to the github
repository.

> diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.hash b/package/brcm-patchram-plus/brcm-patchram-plus.hash
> new file mode 100644
> index 0000000000..59263f23d4
> --- /dev/null
> +++ b/package/brcm-patchram-plus/brcm-patchram-plus.hash
> @@ -0,0 +1,2 @@
> +# locally computed
> +sha256  7d63f3a0c79cb5d187a0f2647734601f9c97d4eb8e545ce9ace7653c1f3f9a58  brcm-patchram-plus-94fb127e614b19a9a95561b8c1a0716e2e1e6293.tar.gz
> diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.mk b/package/brcm-patchram-plus/brcm-patchram-plus.mk
> new file mode 100644
> index 0000000000..e9528efc5f
> --- /dev/null
> +++ b/package/brcm-patchram-plus/brcm-patchram-plus.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# brcm-patchram-plus
> +#
> +################################################################################
> +
> +BRCM_PATCHRAM_PLUS_VERSION = 94fb127e614b19a9a95561b8c1a0716e2e1e6293
> +BRCM_PATCHRAM_PLUS_SITE = $(call github,AsteroidOS,brcm-patchram-plus,$(BRCM_PATCHRAM_PLUS_VERSION))
> +BRCM_PATCHRAM_PLUS_LICENSE = APACHE-2.0
> +
> +define BRCM_PATCHRAM_PLUS_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh

This is in fact incorrect, because autogen.sh will end up running
configure, unless the environment variable NOCONFIGURE is set an non
empty. So, you end up running configure for the host, not the target.

Besides, using autoreconf does work, in fact.

Regards,
Yann E. MORIN.

> +endef
> +
> +BRCM_PATCHRAM_PLUS_PRE_CONFIGURE_HOOKS += BRCM_PATCHRAM_PLUS_AUTOGEN
> +
> +$(eval $(autotools-package))
> -- 
> 2.14.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
