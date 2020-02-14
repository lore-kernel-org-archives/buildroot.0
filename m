From: Michael Walle <michael@walle.cc>
Date: Fri, 14 Feb 2020 13:32:46 +0100
Subject: [Buildroot] [PATCH v2 2/4] package/arm-gnu-a-toolchain: new
 package
In-Reply-To: <1581590685-31680-3-git-send-email-sunil@amarulasolutions.com>
References: <1581590685-31680-1-git-send-email-sunil@amarulasolutions.com>
 <1581590685-31680-3-git-send-email-sunil@amarulasolutions.com>
Message-ID: <c869c9ee905f59cbe6cc1b51143293c9@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2020-02-13 11:44, schrieb sunil at amarulasolutions.com:
> From: Suniel Mahesh <sunil@amarulasolutions.com>
> 
> arm trusted firmware requires a bare metal toolchain to build Rockchip 
> rk3399
> platform and rk3399 has a cortex-m0 core. Add pre-built 
> cross-compilation
> ARM-A bare metal toolchain for Arm Cortex-A family processors to avoid 
> the
> following build error.
> 
> make[3]: arm-none-eabi-gcc: Command not found
> 
> pre-built bate metal ARM GNU-A toolchain installs into the host file
> system folder
> /opt/gcc-arm-none-eabi.
> 
> https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-arm-none-eabi.tar.xz

Can this be some kind of virtual package? What if I don't like a 
prebuild
binary, if I don't have a x86_64 buildhost or want to have another gcc 
version.

-michael

> Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
> ---
> Changes for v2:
> - Added lines in description regarding why bare metal toolchain is 
> required,
>   as suggested by Jagan and pointed out by Sergey
> ---
>  .../arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash   |  3 +++
>  package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk | 27 
> ++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 
> package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
>  create mode 100644 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
> 
> diff --git a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
> b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
> new file mode 100644
> index 0000000..aa0a23a
> --- /dev/null
> +++ b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +#sha256
> bb17109f0ee697254a5d4ae6e5e01440e3ea8f0277f2e8169bf95d07c7d5fe69
> gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2
> +sha256
> ac952d89ae0fc3543e81099e7d34917efc621f5def112eee843fd1ce755eca8c
> gcc-arm-9.2-2019.12-x86_64-arm-none-eabi.tar.xz
> diff --git a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
> b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
> new file mode 100644
> index 0000000..55dce4d
> --- /dev/null
> +++ b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# arm-gnu-a-toolchain
> +#
> +################################################################################
> +
> +ARM_GNU_A_TOOLCHAIN_SITE =
> https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel
> +ARM_GNU_A_TOOLCHAIN_VERSION = 9.2-2019.12
> +ARM_GNU_A_TOOLCHAIN_SOURCE =
> gcc-arm-$(ARM_GNU_A_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
> +ARM_GNU_A_TOOLCHAIN_LICENSE = GPL-3.0+
> +ARM_GNU_A_TOOLCHAIN_LICENSE_FILES =
> +
> +HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR = 
> $(HOST_DIR)/opt/gcc-arm-none-eabi
> +
> +define HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_CMDS
> +    rm -rf $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
> +    mkdir -p $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
> +    cp -rf $(@D)/* $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
> +
> +    cd $(HOST_DIR)/bin && \
> +	for i in $(HOST_DIR)/opt/gcc-arm-none-eabi/bin/*; do \
> +	ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
> +    done
> +
> +endef
> +
> +$(eval $(host-generic-package))
