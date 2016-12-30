From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Dec 2016 22:26:28 +0000
Subject: [Buildroot] [Bug 9541] Platform drivers autoloading from info in
 device tree does not work
In-Reply-To: <bug-9541-163@https.bugs.busybox.net/>
References: <bug-9541-163@https.bugs.busybox.net/>
Message-ID: <bug-9541-163-PNCnkTjzh7@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9541

--- Comment #2 from Artem Synytsyn <a.synytsyn@gmail.com> ---
Hello, Peter,

First of all I'll describe steps, which I've made.
1. Clone buildroot from official repo
2. make raspberrypi_defconfig
3. Add enc28j60.dtbo into overlays directory on boot partition
4. Add dtoverlay=enc28j60 into config.txt

After boot lsmod command output is empty(except ipv6 module, which is marked as
"permanent"). 

- I've used device tree overlay from the firmware, which was built by buildroot
itself. As for the snippet it is standard also, here is its code:
https://github.com/raspberrypi/linux/blob/rpi-4.4.y/arch/arm/boot/dts/overlays/enc28j60-overlay.dts.
Also, as I said, device tree node with this device is exposed in
/proc/device-tree, so I think it is ok.
- driver enc28j60.ko is enabled in kernel configuration as loadable, it is
present in /lib/modules filesystem. I can load it manually and it is ok too.
- mdev is present in system. And I think it is root of the problem, because
Raspbian distro has udev instead mdev and it successfully loads kernel module
based on info from device tree.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
