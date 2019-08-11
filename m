From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 11 Aug 2019 19:13:28 +0000
Subject: [Buildroot] [Bug 9881] systemd-resolved not setting resolv.conf link
In-Reply-To: <bug-9881-163@https.bugs.busybox.net/>
References: <bug-9881-163@https.bugs.busybox.net/>
Message-ID: <bug-9881-163-AXzESncFjZ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9881

--- Comment #1 from Carlos Santos <unixmania@gmail.com> ---
In fact the symlink should be created only if BR2_PACKAGE_SYSTEMD_RESOLVED is
selected otherwise NetworkManager fails to update resolv.conf. You can test
this on QEMU with the following defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2018.11-1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
BR2_INIT_SYSTEMD=y
# BR2_TARGET_GENERIC_GETTY is not set
BR2_SYSTEM_ENABLE_NLS=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
BR2_PACKAGE_NETWORK_MANAGER=y
# BR2_PACKAGE_SYSTEMD_RESOLVED is not set
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set

The start it with

qemu-system-x86_64 -M pc -m 1024 -kernel "output/images/bzImage" \
  -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
  -append "root=/dev/vda console=ttyS0,115200n8 net.ifnames=0" \
  -net nic,model=virtio -net "user" -nographic -enable-kvm \
  -rtc base=utc -device virtio-rng-pci -watchdog i6300esb

Welcome to Buildroot
buildroot login: root
# ls -l /etc/resolv.conf 
lrwxrwxrwx    1 root     root            34 Aug 11 16:35 /etc/resolv.conf ->
../run/systemd/resolve/resolv.conf
# nslookup mail.google.com
nslookup: write to '127.0.0.1': Connection refused
;; connection timed out; no servers could be reached

# rm /etc/resolv.conf
# systemctl restart NetworkManager.service
# ls -l /etc/resolv.conf 
-rw-r--r--    1 root     root            50 Aug 11 19:12 /etc/resolv.conf
# nslookup mail.google.com
Server:         10.0.2.3
Address:        10.0.2.3:53

Non-authoritative answer:
mail.google.com canonical name = googlemail.l.google.com
Name:   googlemail.l.google.com
Address: 216.58.202.197

Non-authoritative answer:
mail.google.com canonical name = googlemail.l.google.com
Name:   googlemail.l.google.com
Address: 2800:3f0:4001:817::2005

-- 
You are receiving this mail because:
You are on the CC list for the bug.
