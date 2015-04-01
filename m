From: Fabrice Mousset | GEOCEPT GmbH <fabrice.mousset@geocept.com>
Date: Wed, 1 Apr 2015 16:18:47 +0000
Subject: [Buildroot] Build embedded system for x86 device
In-Reply-To: <AMXPR04MB103B46C4493795E70A219D7EAF30@AMXPR04MB103.eurprd04.prod.outlook.com>
References: <AMXPR04MB10385410B37EA5F396EE688EAF30@AMXPR04MB103.eurprd04.prod.outlook.com>,
 <AMXPR04MB103B46C4493795E70A219D7EAF30@AMXPR04MB103.eurprd04.prod.outlook.com>
Message-ID: <1427905127091.2736@geocept.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I reply to myself and I apologies for the noise...

In fact, the solution was easy find, I simple had to follow the help message from GRUB2:
a) generate a tar rootfs
b) leave 1Mb at begin of the Compact Flash and create a primary partition (ext3 in my use case)
c) format the root partition (sudo mkfs.ext3 /dev/sdb1) and mount it (sudo mount /dev/sdb1 /mnt)
d) install grub sudo ./output/host/usr/sbin/grub-bios-setup \
			-b ./output/host/usr/lib/grub/i386-pc/boot.img \
			-c ./output/images/grub.img -d . /dev/sdb
e) install the rootfs ==> sudo tar -C /mnt -xf output/images/rootfs.tar
f) install kernel ==> sudo cp output/image/bzImage  /mnt/boot/
g) finish: sync && sudo umount /mnt

That's it!

All works fine now, and my device boots with success :)

Thanks to all Buildroot contributors/maintainers for this great software :)

Best regards

Fabrice
