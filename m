From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 15:56:47 +0100
Subject: [Buildroot] [PATCH v4 2/2]
 package/x11r7/xdriver_xf86-video-nouveau: new package
In-Reply-To: <1450534925-9099-2-git-send-email-bernd.kuhls@t-online.de>
References: <1450534925-9099-1-git-send-email-bernd.kuhls@t-online.de>
 <1450534925-9099-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151219155647.0a4ca4b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 19 Dec 2015 15:22:05 +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: no changes

I've applied, but it triggers a kconfig warning (which already existed
for some other packages):

warning: (BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU && BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU && BR2_PACKAGE_XDRIVER_XF86_VIDEO_NOUVEAU) selects BR2_PACKAGE_LIBDRM_NOUVEAU which has unmet direct dependencies (BR2_PACKAGE_LIBDRM && (BR2_i386 || BR2_x86_64))

So it already existed for BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU and
BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU, and your package
(BR2_PACKAGE_XDRIVER_XF86_VIDEO_NOUVEAU) just adds a new bogus select.
I've still applied your package because this issue needs to be fixed
separately, and address for all three Config.in options.

Essentially, this happens because I'm building on ARM, and the
BR2_PACKAGE_LIBDRM_NOUVEAU option is only available on i386 and x86_64.
However, I wonder why BR2_PACKAGE_LIBDRM_NOUVEAU is not available on
ARM, since I'm pretty sure that the Nouveau driver is used on ARM on
some Tegra platforms.

Right now, this causes a build failure:

checking for LIBDRM_NOUVEAU... no
configure: error: Package requirements (libdrm_nouveau >= 2.4.25) were not met:

With the following (not very minimal) configuration:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.11-rc1-71-g90d1299.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_NOUVEAU=y
BR2_PACKAGE_LIBGLFW=y
BR2_PACKAGE_LIBSOIL=y
# BR2_TARGET_ROOTFS_TAR is not set

Can you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
