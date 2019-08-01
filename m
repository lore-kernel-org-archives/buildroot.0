From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 1 Aug 2019 09:15:40 -0500
Subject: [Buildroot] [PATCH v2] ima-evm-utils: Add as new package,
 version 1.2.1
In-Reply-To: <20190731193119.10522-1-petr.vorel@gmail.com>
References: <20190731193119.10522-1-petr.vorel@gmail.com>
Message-ID: <CANQCQpbTPuhm_a-SFei+RNdkRvPjXP5LZddPYqvAjoXTgTqD7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr,


On Wed, Jul 31, 2019 at 2:32 PM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> + add myself as a maintainer.
>
> Adding build and install hooks to run make in src subdirectory
> (root directory asciidoc and xsltproc for manpage).
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v1->v2:
> * Update to 1.2.1 (thus drop patch
> 0001-evmctl-use-correct-include-for-xattr.h.patch)
> * Fix build by adding required selects (BR2_PACKAGE_OPENSSL and BR2_PACKAGE_KEYUTILS)
> * Add depends on BR2_USE_MMU and !BR2_STATIC_LIBS (based on keyutils dependency)
> * cleanup comments
>
>
> Petr
>
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/ima-evm-utils/Config.in          | 11 ++++++++
>  package/ima-evm-utils/ima-evm-utils.hash |  3 +++
>  package/ima-evm-utils/ima-evm-utils.mk   | 32 ++++++++++++++++++++++++
>  5 files changed, 48 insertions(+)
>  create mode 100644 package/ima-evm-utils/Config.in
>  create mode 100644 package/ima-evm-utils/ima-evm-utils.hash
>  create mode 100644 package/ima-evm-utils/ima-evm-utils.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 05711ba678..5435a892c7 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1825,6 +1825,7 @@ N:        Petr Kulhavy <brain@jikos.cz>
>  F:     package/linuxptp/
>
>  N:     Petr Vorel <petr.vorel@gmail.com>
> +F:     package/ima-evm-utils/
>  F:     package/iproute2/
>  F:     package/iputils/
>  F:     package/linux-backports/
> diff --git a/package/Config.in b/package/Config.in
> index 9b2cc7522d..76f1ee1798 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2122,6 +2122,7 @@ endmenu
>
>  menu "Security"
>         source "package/checkpolicy/Config.in"
> +       source "package/ima-evm-utils/Config.in"
>         source "package/optee-benchmark/Config.in"
>         source "package/optee-client/Config.in"
>         source "package/optee-examples/Config.in"
> diff --git a/package/ima-evm-utils/Config.in b/package/ima-evm-utils/Config.in
> new file mode 100644
> index 0000000000..7e3dcc4002
> --- /dev/null
> +++ b/package/ima-evm-utils/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_IMA_EVM_UTILS
> +       bool "ima-evm-utils"
> +       depends on BR2_USE_MMU # keyutils dependency: fork()
> +       depends on !BR2_STATIC_LIBS # keyutils dependency: dlopen
> +       select BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_KEYUTILS
> +       help
> +         Linux Integrity Measurement Architecture (IMA)
> +         Extended Verification Module (EVM) tools.

Do you have a proposal for how to use these tools in an embedded
environment where a filesystem needs to be "labeled/staged" offline
with the signatures/hashes?

The filesystem staging might be a good run time test case as well to
show the end to end use where you execute a qemu which uses the IMA
tools to authenticate apps executing from a filesystem you just built.

> +
> +         https://sourceforge.net/p/linux-ima/wiki/Home/
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
> +       cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +IMA_EVM_UTILS_PRE_CONFIGURE_HOOKS += IMA_EVM_UTILS_RUN_AUTOGEN
> +
> +# build just sources in src subdirectory as root directory requires asciidoc
> +# and xsltproc for manpage
> +define IMA_EVM_UTILS_BUILD_CMDS
> +       $(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) -C $(@D)/src all
> +endef
> +define IMA_EVM_UTILS_INSTALL_STAGING_CMDS
> +       $(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D)/src install
> +endef
> +define IMA_EVM_UTILS_INSTALL_TARGET_CMDS
> +       $(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D)/src install
> +endef
> +
> +$(eval $(autotools-package))
> --
> 2.22.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
