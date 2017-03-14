From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 22:54:27 +0100
Subject: [Buildroot] [PATCH 1/2] odroid-mali: fix broken headers.
In-Reply-To: <trinity-929fc1a7-02df-4b8f-b623-1a623d2a9f58-1489414620167@3capp-mailcom-bs04>
References: <20170313090834.13715-1-daggs@gmx.com>
 <20170313133345.36d712f4@free-electrons.com>
 <trinity-929fc1a7-02df-4b8f-b623-1a623d2a9f58-1489414620167@3capp-mailcom-bs04>
Message-ID: <20170314225427.390c43ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Mar 2017 15:17:00 +0100, daggs wrote:

> yes, I did verified.
> what I did encountered (not sure it is a bug), is the following:
> 1. checkout a clean buildroot.
> 2. run make odroidc2_defconfig.
> 3. run make menuconfig
>     1. set libc to glibc.
>     2. select odroid-mali.
>     3. select libepoxy.
> 4. run build.

Thanks!

> the above will fail libepoxy on Xlib.h no such file or directory found.
> for that xorg + libX11 needs to be enabled.

Then there is still a problem with odroid-mali, because with the
rpi-userland OpenGL ES/EGL provider, libepoxy builds just fine. Try the
following defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_RPI_USERLAND=y
BR2_PACKAGE_LIBEPOXY=y
# BR2_TARGET_ROOTFS_TAR is not set

I've tested your patches, and indeed I've been able to reproduce this
issue. It's because they have re-used the mesa3d headers as-is it
seems, and therefore MESA_EGL_NO_X11_HEADERS needs to be defined when
X11 is not used.

So I guess this would need to be adjust in the pkg-config files
installed by odroid-mali... even though that will only work with the
packages that then use pkg-config to detect OpenGL ES/EGL.

Adding in Cc Peter Seiderer, who also mentioned MESA_EGL_NO_X11_HEADERS
in another thread recently.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
