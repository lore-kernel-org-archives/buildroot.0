From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 1 Oct 2019 20:56:01 +0200
Subject: [Buildroot] [PATCH v2] ima-evm-utils: Add as new package,
 version 1.2.1
In-Reply-To: <20190731193119.10522-1-petr.vorel@gmail.com>
References: <20190731193119.10522-1-petr.vorel@gmail.com>
Message-ID: <20191001185559.GA22340@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

any change this to be merged?
Or any comments, please?

Kind regards,
Petr

> + add myself as a maintainer.

> Adding build and install hooks to run make in src subdirectory
> (root directory asciidoc and xsltproc for manpage).

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v1->v2:
> * Update to 1.2.1 (thus drop patch
> 0001-evmctl-use-correct-include-for-xattr.h.patch)
> * Fix build by adding required selects (BR2_PACKAGE_OPENSSL and BR2_PACKAGE_KEYUTILS)
> * Add depends on BR2_USE_MMU and !BR2_STATIC_LIBS (based on keyutils dependency)
> * cleanup comments


> Petr

>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/ima-evm-utils/Config.in          | 11 ++++++++
>  package/ima-evm-utils/ima-evm-utils.hash |  3 +++
>  package/ima-evm-utils/ima-evm-utils.mk   | 32 ++++++++++++++++++++++++
>  5 files changed, 48 insertions(+)
>  create mode 100644 package/ima-evm-utils/Config.in
>  create mode 100644 package/ima-evm-utils/ima-evm-utils.hash
>  create mode 100644 package/ima-evm-utils/ima-evm-utils.mk

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 05711ba678..5435a892c7 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1825,6 +1825,7 @@ N:	Petr Kulhavy <brain@jikos.cz>
>  F:	package/linuxptp/

>  N:	Petr Vorel <petr.vorel@gmail.com>
> +F:	package/ima-evm-utils/
>  F:	package/iproute2/
>  F:	package/iputils/
>  F:	package/linux-backports/
> diff --git a/package/Config.in b/package/Config.in
> index 9b2cc7522d..76f1ee1798 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2122,6 +2122,7 @@ endmenu

>  menu "Security"
>  	source "package/checkpolicy/Config.in"
> +	source "package/ima-evm-utils/Config.in"
>  	source "package/optee-benchmark/Config.in"
>  	source "package/optee-client/Config.in"
>  	source "package/optee-examples/Config.in"
> diff --git a/package/ima-evm-utils/Config.in b/package/ima-evm-utils/Config.in
> new file mode 100644
> index 0000000000..7e3dcc4002
> --- /dev/null
> +++ b/package/ima-evm-utils/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_IMA_EVM_UTILS
> +	bool "ima-evm-utils"
> +	depends on BR2_USE_MMU # keyutils dependency: fork()
> +	depends on !BR2_STATIC_LIBS # keyutils dependency: dlopen
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_KEYUTILS
> +	help
> +	  Linux Integrity Measurement Architecture (IMA)
> +	  Extended Verification Module (EVM) tools.
> +
> +	  https://sourceforge.net/p/linux-ima/wiki/Home/
> diff --git a/package/ima-evm-utils/ima-evm-utils.hash b/package/ima-evm-utils/ima-evm-utils.hash
> new file mode 100644
> index 0000000000..24be627d20
> --- /dev/null
> +++ b/package/ima-evm-utils/ima-evm-utils.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256 ad8471b58c4df29abd51c80d74b1501cfe3289b60d32d1b318618a8fd26c0c0a  ima-evm-utils-1.2.1.tar.gz
> +sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
> new file mode 100644
> index 0000000000..cd15f526f6
> --- /dev/null
> +++ b/package/ima-evm-utils/ima-evm-utils.mk
> @@ -0,0 +1,32 @@
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
> +
> +# build just sources in src subdirectory as root directory requires asciidoc
> +# and xsltproc for manpage
> +define IMA_EVM_UTILS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) -C $(@D)/src all
> +endef
> +define IMA_EVM_UTILS_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D)/src install
> +endef
> +define IMA_EVM_UTILS_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D)/src install
> +endef
> +
> +$(eval $(autotools-package))
