From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 26 Oct 2019 05:22:20 -0500
Subject: [Buildroot] [PATCH v2] ima-evm-utils: Add as new package,
 version 1.2.1
In-Reply-To: <20190731193119.10522-1-petr.vorel@gmail.com>
References: <20190731193119.10522-1-petr.vorel@gmail.com>
Message-ID: <CANQCQpZu-CZnMAAHn-7EkTM652NFh5TCT9_Yz=rh3wpNysG6wA@mail.gmail.com>
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

[snip]

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
> +
> +         https://sourceforge.net/p/linux-ima/wiki/Home/

Please add a comment like below to provide guidance when the
dependencies aren't met.

comment "ima-evm-utils needs dynamic library support"
        depends on BR2_USE_MMU
        depends on BR2_STATIC_LIBS

> diff --git a/package/ima-evm-utils/ima-evm-utils.hash b/package/ima-evm-utils/ima-evm-utils.hash
> new file mode 100644
> index 0000000000..24be627d20
> --- /dev/null
> +++ b/package/ima-evm-utils/ima-evm-utils.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256 ad8471b58c4df29abd51c80d74b1501cfe3289b60d32d1b318618a8fd26c0c0a  ima-evm-utils-1.2.1.tar.gz
> +sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING

Suggest adding a hash for the license file.
sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING

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

[snip]

> +define IMA_EVM_UTILS_INSTALL_STAGING_CMDS
> +       $(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D)/src install

Suggest breaking this line after $(MAKE)

> +endef
> +define IMA_EVM_UTILS_INSTALL_TARGET_CMDS
> +       $(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D)/src install
> +endef

Suggest breaking this line after $(MAKE)


Regards,
Matt
