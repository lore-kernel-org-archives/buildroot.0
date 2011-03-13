From: Torsten Mohr <tmohr@s.netic.de>
Date: Sun, 13 Mar 2011 21:30:23 +0100
Subject: [Buildroot] u-boot, setup SD card, BeagleBoard-xM
Message-ID: <201103132130.24022.tmohr@s.netic.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

i wonder if anybody can give me some hints on how to set up an SD card for
u-boot for my BeagleBoard-xM.

The board came with a card with an Angstrom distro that works fine and fist 
starts u-boot and then uImage.

I've set up a second card using some descriptions i found googling, but don't 
really get any success.

I've set up the second card to:
heads: 255
sectors: 63
cylinders: trunc(size/255/63/512)

---  1st try:

The fist partition is type 0x0c (W95), bootable and formatted using:
mkfs.msdos -F 32 -n "beagle" /dev/sdc1

I created u-boot and a kernel using buildroot-2010.11.

I copied a MLO to the SD card, then u-boo.bint and then uImage.

I created a user.scr from input.scr:
mmc init
setenv console tty0 console=ttyS2,115200n8

I created user.scr from it with:

../host/usr/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n lassie 
-d input.scr user.scr

I only get weird output.


---  2nd try:
i created an exact copy of the SD card with the Angstrom distro (that works) 
using "dd", that i put on the second SD card.

I then mounted the first partition as /mnt and deleted the u-boot.bin that was 
on the card and copied the same file (exactly the same file) onto the card.

Booting from this card does not work, the OMAP does not find a working u-
boot.bin:

Texas Instruments X-Loader 1.4.4ss (Aug 19 2010 - 02:49:27)
Beagle xM Rev A
Reading boot sector
u-boot.bin not found or blank nand contents - attempting serial boot . . .
## Ready for binary (kermit) download to 0x80008000 at 115200 bps...

I don't understand this, i thought that i only need to copy the files onto the 
SD card.  Is it important where the sectors of each file are on the card?
Do i need to run some other tool (like what was necessary for LILO)?

Can anybody give me a hint on how to set up an SD card?
- Where do i get a MLO?
- Do i need to configure MLO?
- What do i need to do with the files?
- Did i miss an important step during setup of the card?


Thanks for any hints,
Torsten.
