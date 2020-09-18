From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 18 Sep 2020 23:37:08 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/qt5webengine: needs
 libxkbcommon
In-Reply-To: <20200918195852.6999-3-ps.report@gmx.net>
References: <20200918195852.6999-1-ps.report@gmx.net>
 <20200918195852.6999-3-ps.report@gmx.net>
Message-ID: <20200918233708.335f87fd@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 18 Sep 2020 21:58:52 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
>   subprocess.CalledProcessError: Command '['/home/seiderer/Work/Buildroot/build_rpi4_qt5_update_001/build/qt5webengine-5.15.1/src/core/pkg-config_wrapper.sh', '--variable=prefix', 'xkbcommon']' returned non-zero exit status 1
>
>   See //ui/events/keycodes/BUILD.gn:12:3: whence it was called.
>     pkg_config("xkbcommon") {
>     ^------------------------
>   See //ui/events/ozone/layout/BUILD.gn:42:15: which caused the file to be included.
>       deps += [ "//ui/events/keycodes:xkb" ]
>                 ^-------------------------
>   Project ERROR: GN run error!
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>  - send as extra patch as I am not sure if the failure is caused by
>    the version bump and/or by a combination from my buildroot config
>    (update: qt5webengine-5.15.0 with the same buildroot config
>    compiles fine without libxkbcommon, will try qt5webengine-5.15.1
>    with a striped down buildroot config)

Same failure wihtout libxkbcommon with reduced defconfig and qt5webengine-5.15.1:

BR2_aarch64=y
BR2_cortex_a72=y
BR2_ARM_FPU_VFPV4=y
BR2_ENABLE_DEBUG=y
BR2_OPTIMIZE_3=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_DHCP="eth0"
BR2_GENERATE_LOCALE="en_US"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --aarch64"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,1c64f4bc22811d2d371b271daa3fb27895a8abdd)/linux-1c64f4bc22811d2d371b271daa3fb27895a8abdd.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_DEJAVU=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
BR2_PACKAGE_QT5WEBENGINE=y
BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS=y
BR2_PACKAGE_QT5WEBENGINE_ALSA=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="1024M"
BR2_TARGET_ROOTFS_TAR_GZIP=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

Regards,
Peter

>
> Changes v1 -> v2:
>   - no changes (only for the notes part)
> ---
>  package/qt5/qt5webengine/Config.in       | 1 +
>  package/qt5/qt5webengine/qt5webengine.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
> index 9879345e1e..4e923c7f31 100644
> --- a/package/qt5/qt5webengine/Config.in
> +++ b/package/qt5/qt5webengine/Config.in
> @@ -41,6 +41,7 @@ config BR2_PACKAGE_QT5WEBENGINE
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_LIBNSS
>  	select BR2_PACKAGE_LIBVPX
> +	select BR2_PACKAGE_LIBXKBCOMMON
>  	select BR2_PACKAGE_OPUS
>  	select BR2_PACKAGE_WEBP
>  	select BR2_PACKAGE_WEBP_DEMUX
> diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
> index 9101f35937..64c9c96cc2 100644
> --- a/package/qt5/qt5webengine/qt5webengine.mk
> +++ b/package/qt5/qt5webengine/qt5webengine.mk
> @@ -7,7 +7,7 @@
>  QT5WEBENGINE_VERSION = $(QT5_VERSION)
>  QT5WEBENGINE_SITE = $(QT5_SITE)
>  QT5WEBENGINE_SOURCE = qtwebengine-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WEBENGINE_VERSION).tar.xz
> -QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libvpx opus webp \
> +QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libvpx libxkbcommon opus webp \
>  	qt5declarative qt5webchannel host-bison host-flex host-gperf \
>  	host-pkgconf host-python
>  QT5WEBENGINE_INSTALL_STAGING = YES
