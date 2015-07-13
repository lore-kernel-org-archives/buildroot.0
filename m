From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 13 Jul 2015 17:32:52 +0200
Subject: [Buildroot] [PATCH v3 1/2] librtas: new package
In-Reply-To: <671713efe39467f10b56db5074d472dc45ceeec9.1432015191.git.sam.bobroff@au1.ibm.com>
References: <cover.1432015191.git.sam.bobroff@au1.ibm.com>
 <671713efe39467f10b56db5074d472dc45ceeec9.1432015191.git.sam.bobroff@au1.ibm.com>
Message-ID: <55A3DA24.10604@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,

Le 19/05/2015 07:59, Sam Bobroff a ?crit :
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---
> v2:
> 
> Remove redundant INSTALL_TARGET=yes.
> Add patch description and patch signed-off-by.
> Rename patch with correct prefix (0001-).
> 
>  package/Config.in                                  |    1 +
>  ...0001-librtas-install-librtas.so.1-symlink.patch |   31 ++++++++++++++++++++
>  package/librtas/Config.in                          |    9 ++++++
>  package/librtas/librtas.mk                         |   26 ++++++++++++++++
>  4 files changed, 67 insertions(+)
>  create mode 100644 package/librtas/0001-librtas-install-librtas.so.1-symlink.patch
>  create mode 100644 package/librtas/Config.in
>  create mode 100644 package/librtas/librtas.mk
> 

[snip]

> diff --git a/package/librtas/Config.in b/package/librtas/Config.in
> new file mode 100644
> index 0000000..bf0a705
> --- /dev/null
> +++ b/package/librtas/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBRTAS
> +	bool "librtas"
> +	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le

Have you tested this package with uClibc-ng or musl ?

I tried to build with an experimental musl 1.1.6 based toolchain but it won't
build (lot of build errors).

Then I tried to build with a uClibc-ng powerpc toolchain used in autobuilder [1]
and powerpc-utils fail to build when librtas support is enabled.

src/drmgr/common.c:17:22: fatal error: execinfo.h No such file or directory.

But it build fine with a glibc based toolchain (build tested with the CS powerpc
2011.03 toolchain). For now, it's ok if librtas can be available on glibc
toolchains.

Also, the package should depends on !BR2_STATIC_LIBS since librtas build
unconditionally a shared library.

Otherwise, you patch looks ok.

Best regards,
Romain Naour

[1] http://autobuild.buildroot.net/toolchains/configs/br-powerpc-e500mc-full.config

> +	help
> +	  The librtas package provides an interface for Run-Time Abstraction
> +	  Services (RTAS) calls on PAPR platforms. The libraries allow users to
> +	  examine and manipulate hardware, and parse RTAS events.
> +
> +	  http://librtas.sourceforge.net/
> diff --git a/package/librtas/librtas.mk b/package/librtas/librtas.mk
> new file mode 100644
> index 0000000..b081a91
> --- /dev/null
> +++ b/package/librtas/librtas.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# librtas
> +#
> +################################################################################
> +
> +LIBRTAS_VERSION = 1.3.13
> +LIBRTAS_SITE = http://downloads.sourceforge.net/project/librtas
> +LIBRTAS_LICENSE = Common Public License Version 1.0
> +LIBRTAS_LICENSE_FILES = COPYRIGHT
> +LIBRTAS_INSTALL_STAGING = YES
> +
> +define LIBRTAS_BUILD_CMDS
> +	$(MAKE) -C $(@D) CC="$(TARGET_CC)" LD="$(TARGET_LD)"
> +endef
> +
> +define LIBRTAS_INSTALL_STAGING_CMDS
> +	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
> +endef
> +
> +define LIBRTAS_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +endef
> +
> +
> +$(eval $(generic-package))
> 
