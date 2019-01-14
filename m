From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 14 Jan 2019 09:34:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/dash: Create $(TARGET_DIR)/bin
 before install
In-Reply-To: <20190114035532.23010-1-vadim4j@gmail.com>
References: <20190114035532.23010-1-vadim4j@gmail.com>
Message-ID: <20190114073444.e7pk47mzxy7fwtlj@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vadim,

On Mon, Jan 14, 2019 at 05:55:32AM +0200, Vadim Kochan wrote:
> The build fails because $(TARGET_DIR)/bin folder may not exist if for
> example to use the following defconfig:
> 
> 	BR2_x86_64=y
> 	BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
> 	BR2_SYSTEM_BIN_SH_DASH=y
> 	BR2_TARGET_GENERIC_GETTY_PORT="tty1"
> 	BR2_LINUX_KERNEL=y
> 	BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> 	BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
> 	BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> 	BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
> 	BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> 	BR2_PACKAGE_S6_LINUX_INIT=y
> 	BR2_TARGET_ROOTFS_EXT2=y
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  package/dash/dash.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/dash/dash.mk b/package/dash/dash.mk
> index f699f40686..606b5db34a 100644
> --- a/package/dash/dash.mk
> +++ b/package/dash/dash.mk
> @@ -28,6 +28,7 @@ DASH_CONF_OPTS += --without-libedit
>  endif
>  
>  define DASH_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/bin
>  	$(INSTALL) -m 0755 $(@D)/src/dash $(TARGET_DIR)/bin/dash
>  endef

I can't reproduce this issue here. I tested this config:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2018.05.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_DASH=y
BR2_PACKAGE_S6_LINUX_INIT=y

The build log shows this:

>>> skeleton-init-common  Installing to target
rsync -a --ignore-times --exclude .svn --exclude .git --exclude .hg --exclude .bzr --exclude CVS --chmod=u=rwX,go=rX --exclude .empty --exclude '*~' system/skeleton/ /.../buildroot/output/target/
/usr/bin/install -d -m 0755 /home/baruch/git/buildroot/output/target/bin
/usr/bin/install -d -m 0755 /home/baruch/git/buildroot/output/target/sbin
/usr/bin/install -d -m 0755 /home/baruch/git/buildroot/output/target/lib

The SYSTEM_USR_SYMLINKS_OR_DIRS macro defined in system/system.mk created the 
/bin directory. Do you have any idea why it doesn't work in your case?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
