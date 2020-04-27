From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Apr 2020 22:55:37 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain/toolchain-external: install
 ldd on the target
In-Reply-To: <20200422153442.31989-1-sebastien.szymanski@armadeus.com>
References: <20200422153442.31989-1-sebastien.szymanski@armadeus.com>
Message-ID: <20200427205537.GD11346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

S?bastien, All,

On 2020-04-22 17:34 +0200, S?bastien Szymanski spake thusly:
> From: Julien Boibessot <julien.boibessot@armadeus.com>
> 
> From: Julien Boibessot <julien.boibessot@armadeus.com>
> 
> It could be usefull to have ldd on the target so install it.
> 
> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
> [S?bastien: add commit message]
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

I was not too fond of it, but it looks like we do install it for an
internal glibc-based toolchain, so meh...

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 8667d7ddf6..6d91cb5d1e 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -499,6 +499,12 @@ define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
>  	fi
>  endef
>  
> +define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LDD
> +	$(Q)if test -f $(STAGING_DIR)/usr/bin/ldd ; then \
> +		$(INSTALL) -D $(STAGING_DIR)/usr/bin/ldd $(TARGET_DIR)/usr/bin/ldd ; \
> +		$(SED) 's:.*/bin/bash:#!/bin/sh:' $(TARGET_DIR)/usr/bin/ldd ; \
> +	fi
> +endef
>  
>  ################################################################################
>  # inner-toolchain-external-package -- defines the generic installation rules
> @@ -593,6 +599,7 @@ define $(2)_INSTALL_TARGET_CMDS
>  	$$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
>  	$$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER)
>  	$$(TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
> +	$$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LDD)
>  endef
>  
>  # Call the generic package infrastructure to generate the necessary
> -- 
> 2.25.3
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
