From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Aug 2019 01:33:27 +0000
Subject: [Buildroot] [Bug 10586] musl gcc has ifunc enabled when musl
 doesn't support it
In-Reply-To: <bug-10586-163@https.bugs.busybox.net/>
References: <bug-10586-163@https.bugs.busybox.net/>
Message-ID: <bug-10586-163-6lL8FOhmsi@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10586

Carlos Santos <unixmania@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |unixmania at gmail.com
                   |.org                        |
             Status|NEW                         |ASSIGNED

--- Comment #1 from Carlos Santos <unixmania@gmail.com> ---
Sorry for the late answer. I'm taking this bug.

I can't reproduce this on a system buit with the following defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--bleeding-edge-2018.11-1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
BR2_SYSTEM_DHCP="eth0"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set

$ echo 'int main(){ return 0; }' > /tmp/a.c
$ host/bin/x86_64-linux-gcc -o target/root/a /tmp/a.c -latomic
$ host/bin/x86_64-linux-readelf -d target/root/a

Dynamic section at offset 0x2eb0 contains 16 entries:
  Tag        Type                         Name/Value
 0x0000000000000001 (NEEDED)             Shared library: [libatomic.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]
 0x000000000000000c (INIT)               0x401000
 0x000000000000000d (FINI)               0x401175
 0x0000000000000004 (HASH)               0x400290
 0x000000006ffffef5 (GNU_HASH)           0x4002b8
 0x0000000000000005 (STRTAB)             0x400340
 0x0000000000000006 (SYMTAB)             0x4002e0
 0x000000000000000a (STRSZ)              54 (bytes)
 0x000000000000000b (SYMENT)             24 (bytes)
 0x0000000000000015 (DEBUG)              0x0
 0x0000000000000003 (PLTGOT)             0x404000
 0x0000000000000002 (PLTRELSZ)           24 (bytes)
 0x0000000000000014 (PLTREL)             RELA
 0x0000000000000017 (JMPREL)             0x400378
 0x0000000000000000 (NULL)               0x0

$ make
$ qemu-kvm -M pc -m 1024 -kernel "images/bzImage" \
  -drive file=images/rootfs.ext2,if=virtio,format=raw \
  -append "root=/dev/vda console=ttyS0,115200n8 net.ifnames=0" \
  -net nic,model=virtio -net "user${hostfwd}" -nographic -enable-kvm \
  -rtc base=utc -device virtio-rng-pci -watchdog i6300esb
[...]
Welcome to Buildroot
buildroot login: root
# ./a
# 

Can you still see the error?

Could you please post a defconfig on which the problem happens?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
