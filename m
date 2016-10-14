From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Oct 2016 23:44:06 +0200
Subject: [Buildroot] GDB is not built for target,
	even with BR2_PACKAGE_GDB_DEBUGGER=y set
In-Reply-To: <CAChFQ9RYSsBMyHoqmw5m7zhQ8kHN_JDhnsbthuLOG+er9joHrA@mail.gmail.com>
 (Adam Baxter's message of "Fri, 14 Oct 2016 14:24:58 +1100")
References: <CAChFQ9RYSsBMyHoqmw5m7zhQ8kHN_JDhnsbthuLOG+er9joHrA@mail.gmail.com>
Message-ID: <87k2day5ax.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Baxter <voltagex@voltagex.org> writes:

 > Hi all,
 > gdb is not being built for my target. The following defconfig was created
 > by doing the following:

 > make qemu_x86_64_defconfig
 > make menuconfig
 > *enabled all required options for gdb*
 > make savedefconfig BR2_DEFCONFIG=test_defconfig

 > BR2_x86_64=y
 > BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 > BR2_PTHREAD_DEBUG=y
 > BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 > BR2_SYSTEM_DHCP="eth0"
 > BR2_LINUX_KERNEL=y
 > BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 > BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 > BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 > BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.8.config"
 > BR2_PACKAGE_GDB=y
 > BR2_PACKAGE_GDB_DEBUGGER=y
 > BR2_PACKAGE_GDB_TUI=y
 > BR2_TARGET_ROOTFS_CPIO_GZIP=y
 > BR2_TARGET_ROOTFS_INITRAMFS=y
 > # BR2_TARGET_ROOTFS_TAR is not set
 > BR2_PACKAGE_HOST_MKE2IMG=y

 > The image builds correctly and runs in qemu, but there's no sign of gdb
 > anywhere.

That's because of a bug introduced last weekend. It should be fixed by:

commit 8ae8d1162d92f14a0445fc497f473fde0aee6c3c
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Fri Oct 14 19:32:43 2016 +0200

    gdb: unbreak host/target install step

    Commit 12306a81f8edc (gdb: get rid of host-texinfo dependency) tried to
    append MAKEINFO=true to the host/target make install arguments, but as the
    default values for these are only added when (host-)autotools-package is
    evaluated (and only if empty), this effectively drops the default values and
    we ended up without the 'install' target and nothing got installed.

    To fix this, specify the full install arguments.

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
