From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 21 May 2014 14:22:08 +0200
Subject: [Buildroot] Sundry newcomer questions
In-Reply-To: <0ee801cf7388$2b26e6f0$8174b4d0$@novadsp.com>
References: <0ee801cf7388$2b26e6f0$8174b4d0$@novadsp.com>
Message-ID: <20140521122208.GU27329@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, May 19, 2014 at 06:31:27PM +0100, g4 at novadsp.com wrote:
> Fantastic. I've now got a rootfs.tar, zImage and 2 flavours of u-boot.bin ,
> the second being u-boot-sunxi-with-spl.bin. Not sure if these will actually
> work :) but thanks to all who helped.
> 
> Target in question is an Olimex A13 board. I'm specifically using Buildroot
> to try and automate as much of the build/deployment as possible so I can
> concentrate on the harder bits. 
> 
> Questions arising (apologies if these are not specifically buildroot related
> and/or ): 
> 
> 1. Why the 2 .bin files. Is this a mis-configuration on my part? 

No, it's unusual, but it's u-boot-sunxi that generates this.

The SPL is where the RAM initialization and basic hardware setup are
done. the u-boot.bin is the second stage bootloader that will
eventually load the kernel and boot it.

You want to use u-boot-sunxi-with-spl.bin.

> 2. The 'Instant Buildroot' ebook describes the use of dd, parted and friends
> to create an SD ready image. Is there any reason, philosophical or
> practical, why this cannot be added as a final, optional, step to the
> buildroot process?

This has been discussed a few times in the past, and I guess there's
some patches for this, but the major step to overcome would be that in
order to do this, you'd need root permissions, and hence, run
buildroot as root, which is a no-go.

> 3. Am I correct in assuming that the .bin files, along with zImage, end up
> on the first FAT partition of the target media, with the untar'd contents of
> rootfs on the ext3 formatted second partition?

This depends on the SoC, but in your case, no.

The u-boot-sunxi-with-spl.bin should be located at the sector 8 of the
SD card.

The zImage will mostly likely be in the first FAT partition, and the
rootfs in the second partition. You can also use directly the ext
image instead of untar'ing the archive.

Note that you can do it pretty much all you want here. The only real
requirement is that u-boot starts at the sector 8, the rest is up to
you.

You have more details here: http://linux-sunxi.org/Bootable_SD_card#Bootloader

> 4. The QEMU arm-versatile example specify a -drive file that has a .ext2
> extension. Does this mean that the options for creating .ext2/.ext3
> filesystems are QEMU specific?

No, any user can set it.

> 5. Can the .extX images be copied directly to a formatted SD card for
> example? I'm unclear on this as my trial rootfs.ext3 appears to be a symlink
> to a .ext2 file?

I don't know the rationale between having the symlink, but you can
just dd the ext3 image to your partition and you'll be done.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140521/2011409a/attachment.asc>
