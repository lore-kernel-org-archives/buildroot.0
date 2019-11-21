From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 21 Nov 2019 22:42:14 +0100
Subject: [Buildroot] [PATCH v3 for-next 08/11] board/qemu/*/launch.sh:
 add qemu launch script
In-Reply-To: <20191117201909.12900-9-romain.naour@smile.fr>
References: <20191117201909.12900-1-romain.naour@smile.fr>
 <20191117201909.12900-9-romain.naour@smile.fr>
Message-ID: <9aabec73-3c04-70c5-af9f-3b35f9a1039f@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 17/11/2019 ? 21:19, Romain Naour a ?crit?:
> From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> 
> It is not very convenient for Buildroot users to store
> the Qemu command line in a readme.txt instead of a script
> to be used as soon as the Qemu image has been created.
> 
> This patch replace the readme.txt file located in
> board/qemu/<Qemu target>/ by a script (launch.sh).
> 
> This allow Buildroot user to start easily Qemu using
> only one simple command:
> 
> $ ./board/qemu/aarch64-virt/launch.sh test/qemu_aarch64_virt/
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---


> diff --git a/board/qemu/mips32r2-malta/launch.sh b/board/qemu/mips32r2-malta/launch.sh
> new file mode 100755
> index 0000000000..8069b59171
> --- /dev/null
> +++ b/board/qemu/mips32r2-malta/launch.sh
> @@ -0,0 +1,2 @@
> +#!/bin/env bash
> +

The content of this script is missing, it should be:

 qemu-system-mips -M malta -kernel ${1:-output}/images/vmlinux -serial stdio
-drive file=${1:-output}/images/rootfs.ext2,format=raw -append "rootwait
root=/dev/hda" -net nic,model=pcnet -net user

# The login prompt will appear in the terminal that started Qemu. The
# graphical window is the framebuffer. No keyboard support has been
# enabled.

# Tested with QEMU 2.12.0

It's fixed for v4.

Best regards,
Romain


> diff --git a/board/qemu/mips32r2-malta/readme.txt b/board/qemu/mips32r2-malta/readme.txt
> deleted file mode 100644
> index 9ff3c4b810..0000000000
> --- a/board/qemu/mips32r2-malta/readme.txt
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -Run the emulation with:
> -
> - qemu-system-mips -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user
> -
> -The login prompt will appear in the terminal that started Qemu. The
> -graphical window is the framebuffer. No keyboard support has been
> -enabled.
> -
> -Tested with QEMU 2.12.0
