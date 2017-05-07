From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 16:33:08 +0200
Subject: [Buildroot] [PATCH v2] package/sunxi-mali: remove sunxi-mali
 libMali for r2p4 Mali kernel modules
In-Reply-To: <20170221214316.23012-1-romain.naour@gmail.com>
References: <20170221214316.23012-1-romain.naour@gmail.com>
Message-ID: <20170507163308.02ee8514@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Feb 2017 22:43:16 +0100, Romain Naour wrote:
> sunxi-mali userspace drivers (libMali.so) for r2p4 Mali kernel modules
> are linked against libUMP.so.2 but libump package in Buildroot only
> provide libUMP.so.3.
> 
> From [1] (only framebuffer variant was used in Buildroot):
> 
>  ./r2p4/armel/framebuffer/libGLESv2.so
>  ./r2p4/armel/framebuffer/libMali.so
> - 0x00000001 (NEEDED)                     Shared library: [libUMP.so]
> + 0x00000001 (NEEDED)                     Shared library: [libUMP.so.2]
>  ./r2p4/armel/framebuffer/libGLESv1_CM.so
>  ./r2p4/armel/framebuffer/libEGL.so
> 
> So any program or library trying to link with -lGLESv2 or -lEGL will
> fail with the following error:
> 
> arm-none-linux-gnueabi/bin/ld: warning: libUMP.so.2, needed by
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libMali.so,
> not found (try using -rpath or -rpath-link)
> 
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so:
> undefined reference to `ump_close'
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so:
> undefined reference to `ump_mapped_pointer_get'
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so:
> undefined reference to `ump_secure_id_get'
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so:
> undefined reference to `ump_mapped_pointer_release'
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libMali.so:
> undefined reference to `ump_reference_add'
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libMali.so:
> undefined reference to `ump_size_get'
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so:
> undefined reference to `ump_reference_release'
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so:
> undefined reference to `ump_open'
> collect2: error: ld returned 1 exit status
> 
> Since nothing provide libUMP.so.2, remove BR2_PACKAGE_SUNXI_MALI_R2P4
> option and add BR2_ARM_EABIHF dependency directly to sunxi-mali
> package.
> 
> Also the defconfig olimex_a20_olinuxino_lime_mali_defconfig maintained
> by Francois Perrad, is an ARM EABIHF system.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8d0/8d0b78798abf0c4ca124952d0d0455da6f8fa14f/
> 
> [1] https://github.com/linux-sunxi/sunxi-mali-proprietary/commit/1c5063f43cdc9de341c0d63b2e3921cab86c7742
> [2] http://lists.busybox.net/pipermail/buildroot/2017-February/183500.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Francois Perrad <francois.perrad@gadz.org>
> ---
> v2: improve the commit log and comments (ThomasP)
>     Remove armel ABI case in sunxi-mali.mk
> ---
>  Config.in.legacy                 |  8 ++++++++
>  package/sunxi-mali/Config.in     | 25 ++++++++-----------------
>  package/sunxi-mali/sunxi-mali.mk | 12 ++----------
>  3 files changed, 18 insertions(+), 27 deletions(-)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
