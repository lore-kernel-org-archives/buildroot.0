From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 11:40:16 +0100
Subject: [Buildroot] [PATCH 1/4] configs: add defconfig for Nationalchip
 gx6605s dev board.
In-Reply-To: <1488450842-29100-1-git-send-email-ren_guo@c-sky.com>
References: <1488450842-29100-1-git-send-email-ren_guo@c-sky.com>
Message-ID: <20170302114016.48ca10f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Mar 2017 18:33:59 +0800, Guo Ren wrote:
> gx6605s is a nice SOC for dvbs2 DVB product, and C-SKY inside.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>

Thanks. This patch shouldn't come first in the series: it depends on
the csky architecture being added. So the series should have the patch
adding the architecture first, and then a patch adding the board.

>  board/csky/gx6605s/gdbinit          |  25 ++
>  board/csky/gx6605s/gx6605s.dts      |  56 ++++
>  board/csky/gx6605s/gx6622.dts       |  56 ++++
>  board/csky/gx6605s/gx66xx_defconfig | 525 ++++++++++++++++++++++++++++++++++++

I think I suggested in the previous review that those .dts and
defconfig should not be in Buildroot, but instead inside your kernel
tree.

> diff --git a/configs/csky_gx6605s_defconfig b/configs/csky_gx6605s_defconfig
> new file mode 100644
> index 0000000..f5862dd
> --- /dev/null
> +++ b/configs/csky_gx6605s_defconfig
> @@ -0,0 +1,19 @@
> +BR2_csky=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/c-sky/tools/raw/master/csky-linux-tools-x86_64-glibc-linux-4.9.2-20170227.tar.gz"
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="csky-linux"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_4_5=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> +BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/csky/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="gx6605s"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/c-sky/linux-4.9.y/archive/HEAD.tar.gz"

Don't use "HEAD" as HEAD is a moving thing. Use a fixed commit hash.

> +BR2_LINUX_KERNEL_DEFCONFIG="gx66xx"

So you're using the defconfig from the kernel tree itself... so why do
you have still include it in your patch?

> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="gx6605s"

Same here: why do you still have .dts files in your patch, since you're
using the .dts from your kernel tree?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
