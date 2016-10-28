From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Oct 2016 18:28:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server:
 depends on BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20160925113232.1303-1-bernd.kuhls@t-online.de>
References: <20160925113232.1303-1-bernd.kuhls@t-online.de>
Message-ID: <20161028182846.5a6bba87@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Sep 2016 13:32:32 +0200, Bernd Kuhls wrote:
> It uses __sync_val_compare_and_swap_4 & __sync_bool_compare_and_swap_4.
> 
> Fixes
> http://autobuild.buildroot.net/results/ecc/ecc083ffc00e05e15390b630c57d398fbe2356e0/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xserver_xorg-server/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
> index 5715a56..665be21 100644
> --- a/package/x11r7/xserver_xorg-server/Config.in
> +++ b/package/x11r7/xserver_xorg-server/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_XSERVER_XORG_SERVER
>  	bool "xorg-server"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_USE_MMU # fork()
>  	# We need a SHA1 implementation. If either openssl or
>  	# libgcrypt are already part of the build, we'll use one of


This is not correct: the X.org server builds just fine on Sparc, which
doesn't provide this atomic operation. The following defconfig builds
fine:

BR2_sparc=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-uclibc-2016.08-613-ge98b4dd.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
# BR2_TARGET_ROOTFS_TAR is not set

The build failure comes from libxshmfence, so it's this package who
should depend on BR2_TOOLCHAIN_HAS_SYNC_4, and of course this
dependency be propagated wherever BR2_PACKAGE_XLIB_LIBXSHMFENCE is
selected, i.e:

package/mesa3d/Config.in:       select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XPROTO_DRI3PROTO
package/x11r7/xserver_xorg-server/Config.in:    select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XPROTO_DRI3PROTO

Could you have a look into this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
