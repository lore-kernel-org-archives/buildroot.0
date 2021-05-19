From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 17:49:37 +0200
Subject: [Buildroot] [PATCH] package/fscrypt: new package
In-Reply-To: <20210507191957.29678-1-dusan.ivanco@gmail.com>
References: <20210507191957.29678-1-dusan.ivanco@gmail.com>
Message-ID: <20210519154937.GF2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Du?an, All,

On 2021-05-07 21:19 +0200, dusan.ivanco at gmail.com spake thusly:
> From: Du?an Ivan?o <dusan.ivanco@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/fscrypt/Config.in b/package/fscrypt/Config.in
> new file mode 100644
> index 0000000000..17abe021af
> --- /dev/null
> +++ b/package/fscrypt/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_FSCRYPT
> +	bool "fscrypt"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LINUX_PAM

linux-pam has dependencies; you must propagate them here (as I just
explained in your raspi2fb patch).

[--SNIP--]
> diff --git a/package/fscrypt/fscrypt.mk b/package/fscrypt/fscrypt.mk
> new file mode 100644
> index 0000000000..2f67f2ed75
> --- /dev/null
> +++ b/package/fscrypt/fscrypt.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# fscrypt
> +#
> +################################################################################
> +
> +FSCRYPT_VERSION = 0.3.0
> +FSCRYPT_SITE = $(call github,google,fscrypt,v$(FSCRYPT_VERSION))
> +FSCRYPT_LICENSE = Apache-2.0
> +FSCRYPT_LICENSE_FILES = LICENSE
> +FSCRYPT_DEPENDENCIES = host-go linux-pam
> +FSCRYPT_MAKE_ENV = GOOS=linux GOARCH=arm CGO_ENABLED=1
> +
> +define FSCRYPT_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_FS_ENCRYPTION)
> +endef
> +
> +define FSCRYPT_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(FSCRYPT_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define FSCRYPT_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/fscrypt $(TARGET_DIR)/usr/bin
> +	$(INSTALL) -D -m 0755 $(@D)/bin/pam_fscrypt.so $(TARGET_DIR)/usr/lib/security
> +endef
> +
> +$(eval $(generic-package))

I haven't reviewed the package in details, but here I wonder why you are
using the generic-package infrastructure, when the package is written in
Go and we have an infrastructure dedicated to Go packages:

    https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_go_packages

Can you revisit your package and see if you can make use of the
go-pacakge infra instead? If this is not possible, please expand the
commit log to explain why.

Thanks!

Regards,
Yann E. MORIN.

> -- 
> 2.21.1 (Apple Git-122.3)
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
