From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Feb 2019 21:52:19 +0100
Subject: [Buildroot] [PATCH v4 2/7] optee-client: new package
In-Reply-To: <1548845249-28201-2-git-send-email-etienne.carriere@linaro.org>
References: <1548845249-28201-1-git-send-email-etienne.carriere@linaro.org>
 <1548845249-28201-2-git-send-email-etienne.carriere@linaro.org>
Message-ID: <20190217215219.5df6d7a0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello ?tienne,

I have applied to the next branch after a few changes (see below), but
there are some build failures with some configurations, which will have
to be fixed. I'm giving more details below as well.

On Wed, 30 Jan 2019 11:47:24 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> diff --git a/package/optee-client/3.4.0/optee-client.hash b/package/optee-client/3.4.0/optee-client.hash
> new file mode 100644
> index 0000000..0da25ce
> --- /dev/null
> +++ b/package/optee-client/3.4.0/optee-client.hash
> @@ -0,0 +1,4 @@
> +# From https://github.com/OP-TEE/optee_client/archive/3.4.0.tar.gz
> +sha256 7c131a44f4d73acb8816fba88bcd7e6a18537f0a522ae426a20e2ca7dc46a6ec  optee-client-3.4.0.tar.gz
> +# Locally computed
> +sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
> diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
> new file mode 100644
> index 0000000..99cac63
> --- /dev/null
> +++ b/package/optee-client/Config.in
> @@ -0,0 +1,55 @@
> +config BR2_PACKAGE_OPTEE_CLIENT
> +	bool "optee-client"

The following dependency:

	depends on !BR2_STATIC_LIBS

is needed, because optee-client tries to unconditionally build a shared
library, instead of obeying to the standard
BUILD_SHARED_LIBS/BUILD_STATIC_LIBS CMake variables.

> +if BR2_PACKAGE_OPTEE_CLIENT
> +
> +choice
> +	prompt "version"
> +	default BR2_PACKAGE_OPTEE_CLIENT_LATEST
> +	help
> +	  Select the version of OP-TEE client you want to use
> +
> +config BR2_PACKAGE_OPTEE_CLIENT_LATEST
> +	bool "3.4.0"
> +	help
> +	  This fetches the registered release tag from the
> +	  OP-TEE official Git repository.
> +
> +config BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_GIT
> +	bool "Custom Git repository"
> +	help
> +	  Sync with a specific OP-TEE Git repository.
> +
> +endchoice

I don't really see why a version selection was needed, so I've dropped
it entirely. Is there anything really HW/SoC specific in optee-client ?

There are two build failures that I noticed.

With the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv5-ctng-linux-gnueabi.tar.xz"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="armv5-ctng-linux-gnueabi"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_OPTEE_CLIENT=y
# BR2_TARGET_ROOTFS_TAR is not set

You will get:

/home/thomas/projets/outputs/armv5-ctng-linux-gnueabi/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function 'TEEC_InitializeContext':
/home/thomas/projets/outputs/armv5-ctng-linux-gnueabi/build/optee-client-3.4.0/libteec/src/tee_client_api.c:149:28: error: 'gen_caps' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    ctx->reg_mem = gen_caps & TEE_GEN_CAP_REG_MEM;
                            ^
cc1: all warnings being treated as errors

With this other defconfig:

BR2_or1k=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-openrisc-full-2018.02-925-gd4158df.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_OPTEE_CLIENT=y
# BR2_TARGET_ROOTFS_TAR is not set

You will get this failure:

/home/thomas/projets/buildroot/output/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function ?TEEC_OpenSession?:
/home/thomas/projets/buildroot/output/build/optee-client-3.4.0/libteec/src/tee_client_api.c:507:8: error: cast increases required alignment of target type [-Werror=cast-align]
  arg = (struct tee_ioctl_open_session_arg *)buf;
        ^
/home/thomas/projets/buildroot/output/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function ?TEEC_InvokeCommand?:
/home/thomas/projets/buildroot/output/build/optee-client-3.4.0/libteec/src/tee_client_api.c:581:8: error: cast increases required alignment of target type [-Werror=cast-align]
  arg = (struct tee_ioctl_invoke_arg *)buf;
        ^
cc1: all warnings being treated as errors

Since I wanted to move forward with merging the OP-TEE support, I
applied this patch despite these build failures (a number of other
configurations are building fine), but we will need those build issues
to be resolved.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
