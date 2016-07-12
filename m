From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jul 2016 16:51:45 +0200
Subject: [Buildroot] [PATCH 4/7] new package: ti-sgx/ti-sgx-libgbm
 libgbm for SGX graphics accelerator
In-Reply-To: <1468311988-22059-5-git-send-email-lothar.felten@gmail.com>
References: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
 <1468311988-22059-5-git-send-email-lothar.felten@gmail.com>
Message-ID: <20160712165145.1e3ac32b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jul 2016 10:26:25 +0200, Lothar Felten wrote:
> This package adds a custom ti version of libgbm required by the binary
> libraries of the ti-sgx/ti-sgx-um package.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>

Is this libgbm a TI-specific implementation of the libgm available in
Mesa ? If that's the case, then it's going to be complicated to
package, as we would have two implementations of the same API.

> ---
>  package/ti-sgx/ti-sgx-libgbm/Config.in          |  5 +++
>  package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.hash |  2 ++
>  package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.mk   | 41 +++++++++++++++++++++++++
>  3 files changed, 48 insertions(+)
>  create mode 100644 package/ti-sgx/ti-sgx-libgbm/Config.in
>  create mode 100644 package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.hash
>  create mode 100644 package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.mk
> 
> diff --git a/package/ti-sgx/ti-sgx-libgbm/Config.in b/package/ti-sgx/ti-sgx-libgbm/Config.in
> new file mode 100644
> index 0000000..24427c8
> --- /dev/null
> +++ b/package/ti-sgx/ti-sgx-libgbm/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_TI_SGX_LIBGBM
> +        bool "libgbm, ti variant"

Indentation should be done with one tab. Also, this should be:

	bool "ti-sgx-libgm"

> +        help
> +	  TI SGX libgbm variant

More details + upstream link.

> diff --git a/package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.mk b/package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.mk
> new file mode 100644
> index 0000000..c92c8dc
> --- /dev/null
> +++ b/package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.mk
> @@ -0,0 +1,41 @@
> +################################################################################
> +#
> +# ti-sgx-libgbm
> +#
> +################################################################################
> +
> +# This correpsonds to SDK 02.00.00.00
> +TI_SGX_LIBGBM_VERSION = cb86a2f2cecd41023bf1bf12fbcf11be11220f31
> +TI_SGX_LIBGBM_SITE = git://git.ti.com/glsdk/libgbm.git
> +TI_SGX_LIBGBM_LICENSE = MIT License
> +TI_SGX_LIBGBM_LICENSE_FILES = gbm.h
> +TI_SGX_LIBGBM_INSTALL_STAGING = YES
> +
> +TI_SGX_LIBGBM_DEPENDENCIES = linux

Are you sure? Looking at the code, it surely doesn't depend on linux.
However, it depends on udev and libdrm, so those should be added as
dependencies (both in the Config.in file and here).

> +# This package uses autoconf, but not automake, so we need to call

This is wrong: the package is using automake, there is a Makefile.am in
the source tree.

> +# their special autogen.sh script, and have custom target and staging
> +# installation commands.
> +
> +define TI_SGX_LIBGBM_RUN_AUTOGEN
> +        cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +TI_SGX_LIBGBM_PRE_CONFIGURE_HOOKS += TI_SGX_LIBGBM_RUN_AUTOGEN

Did you try <pkg>_AUTORECONF = YES ?

> +define TI_SGX_LIBGBM_INSTALL_TARGET_CMDS
> +        $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +                PREFIX=/usr \
> +                STRIP=/bin/true \
> +                DESTDIR=$(TARGET_DIR) \
> +                install
> +endef
> +
> +define TI_SGX_LIBGBM_INSTALL_STAGING_CMDS
> +        $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +                PREFIX=/usr \
> +                STRIP=/bin/true \
> +                DESTDIR=$(STAGING_DIR) \
> +                install
> +endef

Provided it's using autoamke, I believe those two variables should not
be needed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
