From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 20:03:20 +0200
Subject: [Buildroot] [PATCH v3 3/3] package/mesa3d: add support for
 Intel Vulkan driver
In-Reply-To: <1468772875-5090-3-git-send-email-bernd.kuhls@t-online.de>
References: <1468772875-5090-1-git-send-email-bernd.kuhls@t-online.de>
 <1468772875-5090-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160920200320.0063036c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 18:27:55 +0200, Bernd Kuhls wrote:
> The Vulkan intel driver depends on the i965 dri driver:
> https://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=12.0#n1653
> 
> and a sha1 implementation:
> https://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=12.0#n1656
> 
> The Vulkan driver needs linux/memfd.h
> https://cgit.freedesktop.org/mesa/mesa/tree/src/intel/vulkan/anv_allocator.c?h=12.0#n30
> which is not available in kernel headers older than 3.18:
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/log/include/uapi/linux/memfd.h?id=refs/tags/v3.18.36
> 
> The Vulkan driver makes use of ifunc
> https://cgit.freedesktop.org/mesa/mesa/tree/src/intel/vulkan/anv_entrypoints_gen.py?h=12.0#n287
> which is not available on uClibc:
> https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config.gcc;h=82cc9a9959b5ab57c0b8779e054b80cdb95f169b;hb=gcc-6-branch#l1485
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=e6cdd6b1755033e8f416efaa4334d1294c0a43c6
> 
> The Vulkan driver makes use of static_assert
> https://cgit.freedesktop.org/mesa/mesa/tree/src/intel/vulkan/anv_private.h?h=12.0#n153
> 
> Compiling the Vulkan driver with uClibc and musl fails, therefore this
> driver is glibc-only.
> 
> Although the configure script does not check for dri3 support if the
> Intel Vulkan driver is enabled it needs it nonetheless:
> https://cgit.freedesktop.org/mesa/mesa/tree/src/intel/vulkan/anv_wsi_x11.c?h=12.0#n682
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: no changes
> v2: added dependency on BR2_PACKAGE_XORG7 (Thomas)
>     optionally select libsha1

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
