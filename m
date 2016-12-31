From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 31 Dec 2016 08:55:49 +0000
Subject: [Buildroot] [Bug 9541] Platform drivers autoloading from info in
 device tree does not work
In-Reply-To: <bug-9541-163@https.bugs.busybox.net/>
References: <bug-9541-163@https.bugs.busybox.net/>
Message-ID: <bug-9541-163-niL8OtJ8Hz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9541

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> ---
I take it that you somewhere in that sequence enabled mdev? (E.G. System
configuration->/dev management (Dynamic using devtmpfs+mdev)

The module specifies the following aliases:

modinfo
target/lib/modules/4.4.36-v7/kernel/drivers/net/ethernet/microchip/enc28j60.ko
| grep alias
alias:          spi:enc28j60
alias:          of:N*T*Cmicrochip,enc28j60*

Can you first of all verify that you can load the module with these wildcards?

E.G.

modprobe 'spi:enc28j60'
lsmod | grep enc28j60
rmmod enc28j60.ko

modprobe 'of:N*T*Cmicrochip,enc28j60*'
lsmod | grep enc28j60
rmmod enc28j60.ko

And check what the modalias is for the /sys/bus/spi/* device?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
