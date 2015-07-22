From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 23:20:13 +0200
Subject: [Buildroot] [PATCH v3 1/1] rtl8821au: new package
In-Reply-To: <1437583153-31359-1-git-send-email-christian@paral.in>
References: <1437583153-31359-1-git-send-email-christian@paral.in>
Message-ID: <20150722232013.52492a99@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christian Stewart,

On Wed, 22 Jul 2015 09:39:13 -0700, Christian Stewart wrote:
> Adding a kernel module based USB wifi driver. There is no official
> version of this driver that works properly on ARM and with newer USB
> WiFi cards. This driver version builds module 8821au and is based on a
> kernel module release from ASUS with various fixes integrated in.
> 
> [Thomas, Yann, Luca:
>   - Using the new kernel-module setup
>   - Compacted endian flag define to one line]

This last paragraph has nothing to do in the commit log itself. The
changelog between the different versions of the patch should go...

> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---

here, i.e after the "---" line.


> diff --git a/package/rtl8821au/Config.in b/package/rtl8821au/Config.in
> new file mode 100644
> index 0000000..0a8cd74
> --- /dev/null
> +++ b/package/rtl8821au/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_RTL8821AU
> +	bool "rtl8821au"
> +	depends on BR2_LINUX_KERNEL
> +	help
> +		rtl8821au wifi driver
> +
> +		https://github.com/paralin/rtl8821au

Indentation for the help text is one tab + two spaces. Also, it is
customary to add a comment like:

comment "rtl8821au needs a Linux kernel to be built"
	depends on !BR2_LINUX_KERNEL

> diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
> new file mode 100644
> index 0000000..9c3d286
> --- /dev/null
> +++ b/package/rtl8821au/rtl8821au.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# rtl8821au
> +#
> +################################################################################
> +
> +RTL8821AU_VERSION = 4.3.14
> +RTL8821AU_SITE = $(call github,paralin,rtl8821au,v$(RTL8821AU_VERSION))
> +RTL8821AU_CFLAGS_ENDIAN = -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
> +
> +define RTL8821AU_CONFIGURE_CMDS
> +	$(SED) "s/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC = n/g" $(@D)/Makefile
> +endef

I think this $(SED) is probably unnecessary, you can probably just pass
CONFIG_PLATFORM_I386_PC=n on the command line, i.e

> +
> +RTL8821AU_MODULE_MAKE_OPTS = \
> +	CONFIG_RTL8821AU=m \
> +	KVER=$(LINUX_VERSION_PROBED) \
> +	USER_EXTRA_CFLAGS=$(RTL8821AU_CFLAGS_ENDIAN)

	CONFIG_PLATFORM_I386_PC=n

However, this driver doesn't build for me.

First because the usage of __DATE__ and __TIME__ is triggering the
following build error:

/home/thomas/projets/buildroot/output/build/rtl8821au-4.3.14/./core/rtw_debug.c:70:64: error: macro "__DATE__" might prevent reproducible builds [-Werror=date-time]
  DBG_871X_SEL_NL(sel, "build time: %s %s\n", __DATE__, __TIME__);
                                                                ^
Then, after patching the code to remove this useless debugging line,
the build fails with:

/home/thomas/projets/buildroot/output/build/rtl8821au-4.3.14/./os_dep/linux/rtw_android.c: In function ?rtw_android_cmdstr_to_num?:
/home/thomas/projets/buildroot/output/build/rtl8821au-4.3.14/./os_dep/linux/rtw_android.c:346:3: error: implicit declaration of function ?strnicmp? [-Werror=implicit-function-declaration]
   if(0 == strnicmp(cmdstr , android_wifi_cmd_str[cmd_num], strlen(android_wifi_cmd_str[cmd_num])) )
   ^

Here is the defconfig to reproduce the problem:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.05-496-g85945aa.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
BR2_LINUX_KERNEL_DEFCONFIG="sama5"
BR2_LINUX_KERNEL_ZIMAGE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_RTL8821AU=y
# BR2_TARGET_ROOTFS_TAR is not set

Can you rework your patch to fix those issues?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
