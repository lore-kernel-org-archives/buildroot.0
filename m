From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Mar 2018 15:32:50 +0100
Subject: [Buildroot] [PATCH 00/23] Fix numerous defconfig build failures
In-Reply-To: <20180304213137.24681-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 4 Mar 2018 22:31:14 +0100")
References: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
Message-ID: <87tvttp94d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > This commit fixes a significant number of defconfig build failures:

 >  - Some defconfigs have a Linux kernel that needs openssl on the
 >    host. This requires adding a mechanism to add host-openssl as a
 >    dependency of the linux package. This is done by introducing
 >    BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL in patch 1.

 >    Then, numerous defconfigs are fixed to use
 >    BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL: patches 6 to 13.

 >    The qemu_x86_defconfig and qemu_x86_64_defconfig are however
 >    changed in a different way: by removing wireless support, which is
 >    the reason why host-openssl becomes necessary in recent kernel
 >    versions. Since Qemu doesn't emulate a wireless interface, it
 >    didn't make much sense to have this additional dependency. See
 >    patch 4 and 5.

 >    For all other defconfigs, we erred on the safe side, and kept the
 >    configuration as-is, and simply added
 >    BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL.

 >  - Some defconfigs have a Linux kernel that needs libelf on the
 >    host. Like host-openssl, we added a new option
 >    BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF. See patch 2.

 >    In practice, only qemu_x86_64_defconfig needed libelf and the host,
 >    and instead of bringing this dependency, we have disabled the ORC
 >    Unwinder from the kernel defconfig. See patch 4.

 >    Therefore, there are no in-tree defconfig that uses
 >    BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF.

 >  - In order to make the host openssl and host libelf usable by the
 >    Linux kernel build system, we had to ensure that HOST_CFLAGS and
 >    HOST_LDFLAGS were properly taken into account. This is done in
 >    patch 3.

 >  - Some defconfigs have a U-Boot that needs dtc on the host. For
 >    these, the fix is simple: add BR2_TARGET_UBOOT_NEEDS_DTC=y in the
 >    defconfig. Patches 14 to 22.

 >  - Finally, one defconfig, ts4900_defconfig, had a separate issue: it
 >    wasn't explicitly specifying a kernel version, causing a mismatch
 >    with the selected kernel headers version.

 > Best regards,

 > Thomas

 > Thomas Petazzoni (23):
 >   linux: add BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL
 >   linux: add BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF
 >   linux: fix passing of host CFLAGS and LDFLAGS

I've put this patch in front of the rest and committed the entire
series, thanks!

I'll also backport to 2018.02.x once we've verified that it doesn't
break anything.

-- 
Bye, Peter Korsgaard
