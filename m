From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 15 Nov 2019 14:29:16 +0100
Subject: [Buildroot] [PATCH/next v3 1/5] package/ti-sgx-libgbm: new
 package
In-Reply-To: <20191115125001.28255-2-unixmania@gmail.com>
References: <20191115125001.28255-1-unixmania@gmail.com>
 <20191115125001.28255-2-unixmania@gmail.com>
Message-ID: <CAGm1_ku-He5YHSOd_--O+9YLfE89qjFzSNqJRq_=Mxt5o5aPxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

On Fri, Nov 15, 2019 at 1:51 PM <unixmania@gmail.com> wrote:
>
> From: Lothar Felten <lothar.felten@gmail.com>
>
> A custom ti version of libgbm for SGX graphics accelerator, required by
> the binary libraries of the ti-sgx-um package.
>
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> Changes v1->v2
> - Fix SDK version (comment in ti-sgx-libgbm.mk)
> - Remove duplicate package in package/ti-sgx/ti-sgx-libgbm
> Changes v2->v3
> - Add DEVELOPERS entry
> - Re-generate patch to include sys/sysmacros.h using git format-patch
> - Fix indentation and remove stray empty lines
> - Extract license from gbm.h header instead of distributing the whole
>   file. This is safe because if the terms change in the header the
>   sha256 hash will stop matching.
> - Use HTTP to clone the Git repository (works with an HTTP proxy, which
>   is better when building behind a firewall that blocks the git port).
> - Use AUTORECONF=YES instead of the running autogen.sh script.
> - Use INSTALL_{STAGING,TARGET}_OPTS instead of custom install commands.
> - Add home page to Config.in
> ---
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  ...-Add-missing-sys-sysmacros.h-include.patch | 25 ++++++++++++
>  package/ti-sgx-libgbm/Config.in               |  6 +++
>  package/ti-sgx-libgbm/ti-sgx-libgbm.hash      |  3 ++
>  package/ti-sgx-libgbm/ti-sgx-libgbm.mk        | 40 +++++++++++++++++++
>  6 files changed, 76 insertions(+)
>  create mode 100644 package/ti-sgx-libgbm/0001-Add-missing-sys-sysmacros.h-include.patch
>  create mode 100644 package/ti-sgx-libgbm/Config.in
>  create mode 100644 package/ti-sgx-libgbm/ti-sgx-libgbm.hash
>  create mode 100644 package/ti-sgx-libgbm/ti-sgx-libgbm.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c0863aabc6..f1f55e7bc5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1387,6 +1387,7 @@ N:        Lothar Felten <lothar.felten@gmail.com>
>  F:     board/bananapi/bananapi-m2-ultra/
>  F:     configs/bananapi_m2_ultra_defconfig
>  F:     package/ti-sgx-demos/
> +F:     package/ti-sgx-libgbm/
>  F:     package/ti-sgx-km/
>  F:     package/ti-sgx-um/
>
> diff --git a/package/Config.in b/package/Config.in
> index f72c77b416..0a0499421c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -541,6 +541,7 @@ endmenu
>         source "package/ti-sgx-demos/Config.in"
>         source "package/ti-sgx-km/Config.in"
>         source "package/ti-sgx-um/Config.in"
> +       source "package/ti-sgx-libgbm/Config.in"
>         source "package/ti-uim/Config.in"
>         source "package/ti-utils/Config.in"
>         source "package/triggerhappy/Config.in"
> diff --git a/package/ti-sgx-libgbm/0001-Add-missing-sys-sysmacros.h-include.patch b/package/ti-sgx-libgbm/0001-Add-missing-sys-sysmacros.h-include.patch
> new file mode 100644
> index 0000000000..2863c93bed
> --- /dev/null
> +++ b/package/ti-sgx-libgbm/0001-Add-missing-sys-sysmacros.h-include.patch
> @@ -0,0 +1,25 @@
> +From e3a3f3655956265eb4f3b866d445a9d19e613594 Mon Sep 17 00:00:00 2001
> +From: Lothar Felten <lothar.felten@gmail.com>
> +Date: Thu, 14 Nov 2019 23:37:07 -0300
> +Subject: [PATCH] Add missing sys/sysmacros.h include
> +
> +Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> +---
> + gbm.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/gbm.c b/gbm.c
> +index 7bc5880..e360da7 100644
> +--- a/gbm.c
> ++++ b/gbm.c
> +@@ -36,6 +36,7 @@
> +
> + #include <sys/types.h>
> + #include <sys/stat.h>
> ++#include <sys/sysmacros.h>
> + #include <unistd.h>
> + #include <errno.h>
> +
> +--
> +2.18.1
> +
> diff --git a/package/ti-sgx-libgbm/Config.in b/package/ti-sgx-libgbm/Config.in
> new file mode 100644
> index 0000000000..33014b2ed3
> --- /dev/null
> +++ b/package/ti-sgx-libgbm/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_TI_SGX_LIBGBM
> +       bool "ti-sgx-libgbm"
> +       help
> +         TI SGX libgbm variant

'.' is missing at the end of the package description.

> +
> +         https://git.ti.com/cgit/glsdk/libgbm
> diff --git a/package/ti-sgx-libgbm/ti-sgx-libgbm.hash b/package/ti-sgx-libgbm/ti-sgx-libgbm.hash
> new file mode 100644
> index 0000000000..352e7583ab
> --- /dev/null
> +++ b/package/ti-sgx-libgbm/ti-sgx-libgbm.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256 85e3eafcd06caccd8c4cea3081b1406ae51c07e19541ac19b9c33a5b41fec82d  ti-sgx-libgbm-c5ddc6a37bb78ac753b317b17d890d1f7338dea6.tar.gz
> +sha256 3bda4bde25397a5329f9b9d9b138fc5aad165015d6cd62665ed372518903c7c7  license.txt
> diff --git a/package/ti-sgx-libgbm/ti-sgx-libgbm.mk b/package/ti-sgx-libgbm/ti-sgx-libgbm.mk
> new file mode 100644
> index 0000000000..622aaa595f
> --- /dev/null
> +++ b/package/ti-sgx-libgbm/ti-sgx-libgbm.mk
> @@ -0,0 +1,40 @@
> +################################################################################
> +#
> +# ti-sgx-libgbm
> +#
> +################################################################################
> +
> +# This correpsonds to SDK 06.00.00.07
> +TI_SGX_LIBGBM_VERSION = c5ddc6a37bb78ac753b317b17d890d1f7338dea6
> +TI_SGX_LIBGBM_SITE = http://git.ti.com/git/glsdk/libgbm.git
> +TI_SGX_LIBGBM_SITE_METHOD = git
> +TI_SGX_LIBGBM_LICENSE = MIT License

s/MIT License/MIT

Yegor

> +TI_SGX_LIBGBM_LICENSE_FILES = license.txt
> +TI_SGX_LIBGBM_INSTALL_STAGING = YES
> +TI_SGX_LIBGBM_AUTORECONF = YES
> +
> +TI_SGX_LIBGBM_DEPENDENCIES = libdrm udev
> +
> +# Extract the license from the gbm.h header instead of distributing the whole
> +# file. This is safe because if the terms change in the header the sha256 hash
> +# will stop matching.
> +define TI_SGX_LIBGBM_EXTRACT_LICENSE
> +       head -n 26 $(@D)/gbm.h > $(@D)/license.txt
> +endef
> +TI_SGX_LIBGBM_POST_EXTRACT_HOOKS += TI_SGX_LIBGBM_EXTRACT_LICENSE
> +
> +define TI_SGX_LIBGBM_INSTALL_TARGET_OPTS
> +       PREFIX=/usr \
> +       STRIP=/bin/true \
> +       DESTDIR=$(TARGET_DIR) \
> +       install
> +endef
> +
> +define TI_SGX_LIBGBM_INSTALL_STAGING_OPTS
> +       PREFIX=/usr \
> +       STRIP=/bin/true \
> +       DESTDIR=$(STAGING_DIR) \
> +       install
> +endef
> +
> +$(eval $(autotools-package))
> --
> 2.18.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
