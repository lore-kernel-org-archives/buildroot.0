From: Joel Stanley <joel@jms.id.au>
Date: Thu, 18 Jul 2019 06:41:41 +0000
Subject: [Buildroot] [PATCH v3] board: Add PowerPC mac99
In-Reply-To: <20190625012652.21853-1-joel@jms.id.au>
References: <20190625012652.21853-1-joel@jms.id.au>
Message-ID: <CACPK8Xej-ayWSaUkbHSHSM5fKKej5-XWEb+ZcTAORdow48+CHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 25 Jun 2019 at 01:26, Joel Stanley <joel@jms.id.au> wrote:
>
> PowerPC kernel developers were after a userspace for testing 32-bit
> powerpc kernels. This machine both suits that requirement and has
> support in qemu. It's also a fairly common piece of 32-bit ppc hardware.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Tested-by: Daniel Axtens <dja@axtens.net>

Ping

> ---
> v3: Add ROOTFS_CPIO output as well as ext
> v2: Use default output directory for qemu command line in readme
>
>  DEVELOPERS                          |  2 ++
>  board/qemu/ppc-mac99/linux.fragment |  3 +++
>  board/qemu/ppc-mac99/readme.txt     |  5 +++++
>  configs/qemu_ppc_mac99_defconfig    | 11 +++++++++++
>  4 files changed, 21 insertions(+)
>  create mode 100644 board/qemu/ppc-mac99/linux.fragment
>  create mode 100644 board/qemu/ppc-mac99/readme.txt
>  create mode 100644 configs/qemu_ppc_mac99_defconfig
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ce3fcb2de8c1..29a560f4a398 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1147,6 +1147,8 @@ N:        Joel Stanley <joel@jms.id.au>
>  F:     package/pdbg/
>  F:     board/qemu/ppc64le-pseries/
>  F:     configs/qemu_ppc64le_pseries_defconfig
> +F:     board/qemu/ppc-mac99/
> +F:     configs/qemu_ppc_mac99_defconfig
>
>  N:     Johan Derycke <johanderycke@gmail.com>
>  F:     package/python-libconfig/
> diff --git a/board/qemu/ppc-mac99/linux.fragment b/board/qemu/ppc-mac99/linux.fragment
> new file mode 100644
> index 000000000000..b1975f8253f7
> --- /dev/null
> +++ b/board/qemu/ppc-mac99/linux.fragment
> @@ -0,0 +1,3 @@
> +CONFIG_SERIAL_PMACZILOG=y
> +CONFIG_SERIAL_PMACZILOG_TTYS=y
> +CONFIG_SERIAL_PMACZILOG_CONSOLE=y
> diff --git a/board/qemu/ppc-mac99/readme.txt b/board/qemu/ppc-mac99/readme.txt
> new file mode 100644
> index 000000000000..a8a18db5b9ab
> --- /dev/null
> +++ b/board/qemu/ppc-mac99/readme.txt
> @@ -0,0 +1,5 @@
> +Run the emulation with:
> +
> +  qemu-system-ppc -nographic -vga none -M mac99 -cpu g4 -m 1G -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -net nic,model=sungem -net user -append "root=/dev/sda"
> +
> +Tested with QEMU 3.1.0
> diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99_defconfig
> new file mode 100644
> index 000000000000..7a6a279c5399
> --- /dev/null
> +++ b/configs/qemu_ppc_mac99_defconfig
> @@ -0,0 +1,11 @@
> +BR2_powerpc=y
> +BR2_powerpc_7400=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_DEFCONFIG="pmac32"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-mac99/linux.fragment"
> +BR2_LINUX_KERNEL_VMLINUX=y
> +BR2_TARGET_ROOTFS_CPIO=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> --
> 2.20.1
>
