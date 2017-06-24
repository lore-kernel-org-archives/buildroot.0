From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 15:38:18 +0200
Subject: [Buildroot] [PATCH v2] board: Add nanopi-m1 Support
In-Reply-To: <1497807154-15295-1-git-send-email-chakra@openedev.com>
References: <1497807154-15295-1-git-send-email-chakra@openedev.com>
Message-ID: <20170624153818.4af640ec@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Jun 2017 23:02:34 +0530, Chakra Divi wrote:
> Add initial support for nanopi-m1 board
> with below features
> - U-Boot 2017.07-rc1
> - Linux 4.11.5
> - Default packages from buildroot
> 
> Created a vendor folder friendly arm under
> buildroot board; Added nanopi-m1 board
> other friendlyarm boards can be added here
> 
> Signed-off-by: Chakra Divi <chakra@openedev.com>

I was about to apply this... but it doesn't build. It fails to build
during the U-Boot build process:

  CC      net/arp.o
  LD      test/dm/built-in.o
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ImportError: No module named libfdt

  CC      lib/efi_loader/efi_disk.o
*** binman needs the Python libfdt library.
*** Either install it on your system, or try:
***
*** sudo apt-get install swig libpython-dev
***
*** to have U-Boot build its own version.
Makefile:1359: recipe for target 'checkbinman' failed
make[2]: *** [checkbinman] Error 1
make[2]: *** Waiting for unfinished jobs....

This is a build issue not really specific to this defconfig: any
defconfig using the binman too will fail this way. I guess we need to
package the Python libfdt library for the host, and provide a U-Boot
sub-option that allows the user to say "my defconfig needs the Python
libfdt library".

A few other comments below.

>  N:	Chakra <chakra@openedev.com>

Please refresh on the latest master, where I've changed to use your full nemae.

> diff --git a/board/friendlyarm/nanopi-m1/post-build.sh b/board/friendlyarm/nanopi-m1/post-build.sh
> new file mode 120000
> index 0000000..cd7f116
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-m1/post-build.sh
> @@ -0,0 +1 @@
> +../post-build.sh
> \ No newline at end of file

Please drop the post-build.sh script, it is not needed: use
BR2_TARGET_UBOOT_BOOT_SCRIPT instead.

> +# Bootloaders
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_m1"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"

As said above: use BR2_TARGET_UBOOT_BOOT_SCRIPT.

> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-m1"
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-m1/post-build.sh"

You can drop.

> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-m1/genimage.cfg board/friendlyarm/nanopi-m1/boot.cmd"

Drop the last argument here.

> +# BR2_TARGET_ROOTFS_TAR is not set
> +
> +# Additional tools
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

And drop this last line.

Could you fix these issues, especially the build issue, and send an
updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
