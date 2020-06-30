From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Tue, 30 Jun 2020 19:23:30 +0200
Subject: [Buildroot] NFS-root boot problem
Message-ID: <CAOiXNkBxAvePRB5zCCcPdyyBarM_4w_8hvc15nWhuK=15W6ptg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Folks,

I am rather new to Buildroot and facing problems while trying to create a
development environment with nfs-rootfs. Would highly appreciate if someone
more experienced could provide help or tips.

My environment is very similar to what is described in [1]. The main difference
is that I am using a XUbuntu 19.04 virtual machine (VMWare) on Windows host as
a development system. Basically, there are two network cards - one facing to
the Internet and another one is directly connected to the target board. There
is a DHCP and NFS server running on the VM serving requests from the card
connected to the target board.

As a target, I got an STM32MP157C-DK2 board and am following Bootlin's tutorial
[2] for minimal image. My Buildroot version is 2020.05 which is newer than the
one used in the tutorial. That is why I skip some git/merge steps because
changes seem to be already integrated in the main branch. As a result, I am
able to build a minimalistic image and it works as expected.

As the next step, I want to be able to boot the target with nfs-rootfs. For
this purpose, I have set up DHCP and NFS server on VM and unpack generated
rootfs.tar to sharted directory. In addition, I modified kernel configuration
for target to support rootfs over NFS.

I confirmed that DHCP works by specifying the following in
/etc/network/interfaces on the target board:

auto eth0
iface eth0 inet dhcp

After boot, I have eth0 with an assigned IP address and can ping in both
directions between VM and target.  I have also confirmed that NFS works by
successfully mounting NFS share with unpacked rootfs from target.

To use nfs rootfs instead of mmc, I modified /boot/extlinux/extlinux.conf
directly on target as following:

label stm32mp157c-dk2-buildroot
  kernel /boot/zImage
  devicetree /boot/stm32mp157c-dk2.dtb
  # append root=/dev/mmcblk0p4 rootwait
  append root=/dev/nfs rootwait rw nfsroot=192.168.10.1:/srv/nfs/rootfs ip=dhcp

My expectation was that now instead of rootfs from mmc (which works fine), NFS
share with rootfs will be used. This is where I have got a problem. Here are the
last lines of the boot log:

[    8.349831] stm32-dwmac 5800a000.ethernet eth0: Link is Up -
1Gbps/Full - flow control rx/tx
[    8.369852] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[    8.399809] Sending DHCP requests ., OK
[    8.445835] IP-Config: Got DHCP answer from 192.168.10.1, my
address is 192.168.10.2
[    8.459285] IP-Config: Complete:
[    8.464607]      device=eth0, hwaddr=00:80:e1:42:63:27,
ipaddr=192.168.10.2, mask=255.255.255.0, gw=192.168.10.1
[    8.480546]      host=devboard, domain=dev.local, nis-domain=(none)
[    8.492540]      bootserver=192.168.10.1, rootserver=192.168.10.1,
rootpath=/srv/nfs/rootfs,wsize=1024,rsize=1024,v3
[    8.492546]      nameserver0=8.8.8.8
[    8.515305] ALSA device list:
[    8.520550]   No soundcards found.
[    8.569520] VFS: Mounted root (nfs filesystem) on device 0:16.
[    8.583574] devtmpfs: mounted
[    8.590867] Freeing unused kernel memory: 1024K
[    8.630042] Run /sbin/init as init process
Starting syslogd: OK
Starting klogd: OK
Running sysctl: OK
Initializing random number generator: OK
Saving random seed: OK
Starting rpcbind: OK
Starting network: ip: RTNETLINK answers: File exists
udhcpc: started, v1.31.1
[   19.379804] nfs: server 192.168.10.1 not responding, still trying
[   28.199820] nfs: server 192.168.10.1 not responding, still trying

Nothing happens after that and the system basically hangs. What puzzles me is
that it seems like rootfs is actually mounted by the kernel. Trying to run
/sbin/init is where it stops working and I have absolutely no idea what might
be the reason.

I was trying to remove all entries mentioning eth0 from /etc/network/interfaces
and not specifying eth0 as an interface to configure over DHCP in the buildroot
menuconfig. It prevents the "Starting network: ip: RTNETLINK answers: File
exists" message, but "server 192.168.10.1 not responding" still remains and the
boot process is stuck there.

Any suggestions and hints what I might be doing wrong are highly appreciated!

[1] https://developer.toradex.com/knowledge-base/how-to-setup-networking-for-embedded-linux-application-development
[2] https://bootlin.com/blog/building-a-linux-system-for-the-stm32mp1-basic-system/

Thanks,
Andrey.
