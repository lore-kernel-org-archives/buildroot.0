From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Oct 2019 08:35:44 +0100
Subject: [Buildroot] [PATCH v2 1/1] ima-evm-utils: Add as new package,
 version 1.2.1
In-Reply-To: <20191028054057.8049-1-petr.vorel@gmail.com>
References: <20191028054057.8049-1-petr.vorel@gmail.com>
Message-ID: <20191028073544.GA2485@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2019-10-28 06:40 +0100, Petr Vorel spake thusly:
> + add myself as a maintainer.
> 
> Adding build and install hooks to run make in src subdirectory
> (root directory asciidoc and xsltproc for manpage).
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
> new file mode 100644
> index 0000000000..97de449d0d
> --- /dev/null
> +++ b/package/ima-evm-utils/ima-evm-utils.mk
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# ima-evm-utils
> +#
> +################################################################################
> +
> +IMA_EVM_UTILS_VERSION = 1.2.1
> +IMA_EVM_UTILS_SITE = http://downloads.sourceforge.net/project/linux-ima/ima-evm-utils
> +IMA_EVM_UTILS_LICENSE = GPL-2.0
> +IMA_EVM_UTILS_LICENSE_FILES = COPYING
> +IMA_EVM_UTILS_DEPENDENCIES = host-pkgconf keyutils openssl
> +
> +# configure is missing but gpm seems not compatible with our autoreconf
> +# mechanism so we have to do it manually instead of using IMA_EVM_UTILS_AUTORECONF = YES
> +define IMA_EVM_UTILS_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +IMA_EVM_UTILS_PRE_CONFIGURE_HOOKS += IMA_EVM_UTILS_RUN_AUTOGEN

Looking at the code, it looks like their autoregen.sh is just creating
the missing m4/ sub-directory.

Have you tried:

    define IMA_EVM_UTILS_M4
        mkdir -p $(@D)/m4
    endef
    IMA_EVM_UTILS_POST_EXTRACT_HOOKS += IMA_EVM_UTILS_M4
    IMA_EVM_UTILS_AUTORECONF = YES

> +# build just sources in src subdirectory as root directory requires asciidoc
> +# and xsltproc for manpage
> +define IMA_EVM_UTILS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) -C $(@D)/src all
> +endef

Have you tried:

    IMA_EVM_UTILS_SUBDIR = src

Regards,
Yann E. MORIN.

> +define IMA_EVM_UTILS_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) \
> +		DESTDIR="$(STAGING_DIR)" -C $(@D)/src install
> +endef
> +define IMA_EVM_UTILS_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) \
> +		DESTDIR="$(TARGET_DIR)" -C $(@D)/src install
> +endef
> +
> +$(eval $(autotools-package))
> -- 
> 2.23.0
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
