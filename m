From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 22:02:14 +0100
Subject: [Buildroot] [PATCH 1/2] package/xen: Force disable SDL for
 xen-qemu build
In-Reply-To: <20180118185548.8994-1-alistair.francis@xilinx.com>
References: <20180118185548.8994-1-alistair.francis@xilinx.com>
Message-ID: <20180118220214.39ff4f5b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Jan 2018 10:55:47 -0800, Alistair Francis wrote:

> diff --git a/package/xen/003-tools-Makefile-Force-disable-SDL-QEMU-build.patch b/package/xen/003-tools-Makefile-Force-disable-SDL-QEMU-build.patch
> new file mode 100644
> index 0000000000..fdb9d9c39d
> --- /dev/null
> +++ b/package/xen/003-tools-Makefile-Force-disable-SDL-QEMU-build.patch
> @@ -0,0 +1,30 @@
> +From d3b633ee4d7d7a9ae0f99da4720d637d5fbeb007 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@xilinx.com>
> +Date: Thu, 18 Jan 2018 09:51:35 -0800
> +Subject: [PATCH] tools/Makefile: Force disable SDL QEMU build
> +
> +This patch fixes this compile issue when building xen-qemu with SDL
> +
> +/output/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/include/SDL2/SDL_syswm.h:83:22: fatal error: directfb.h: No such file or directory
> + #include <directfb.h>
> +
> +Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> +---
> + tools/Makefile | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/tools/Makefile b/tools/Makefile
> +index ab7a01ee1b..4df6228fc5 100644
> +--- a/tools/Makefile
> ++++ b/tools/Makefile
> +@@ -274,6 +274,7 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
> + 		--datadir=$(SHAREDIR)/qemu-xen \
> + 		--localstatedir=$(localstatedir) \
> + 		--disable-kvm \
> ++		--disable-sdl \

Instead of patching, could you try:

	----with-extra-qemuu-configure-args="--disable-sdl"

passed to the top-level configure script, from xen.mk ?

This should have the same effect, without requiring a patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
