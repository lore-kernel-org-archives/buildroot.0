From: Torsten Mohr <tmohr@s.netic.de>
Date: Mon, 14 Mar 2011 22:05:36 +0100
Subject: [Buildroot] u-boot, setup SD card, BeagleBoard-xM
In-Reply-To: <979699.78119.qm@web161802.mail.bf1.yahoo.com>
References: <201103132130.24022.tmohr@s.netic.de>
	<979699.78119.qm@web161802.mail.bf1.yahoo.com>
Message-ID: <201103142205.36239.tmohr@s.netic.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Steve,

thanks for your answer and your help.

I got a bit further in reproducing the problem.  First, i was not using "sync" 
before, but i don't think this was the problem as i always mounted and 
unmounted the card.

Now what i did in steps:
First test:
- create a FS on partition 1, sommand: mkfs.msdos -F 32 -n "beagle" /dev/sdc1
- mount it and copy MLO on it as the first file
- copy all other files from the angstrom distro on it, starting with u-
boot.bin.  What i wrote below was a mistake, "u-boot.bin" was the file name i 
always used.
- Booting from that card works fine.
- Hooray !

Second test:
- I shut down the kernel i booted properly
- mount the card in the PC again
- delete u-boot.bin
- copy the u-boot.bin from buildroot onto the card
- unmount card, sync
- i did not touch "MLO" at all
- the output says that X-Loader can't find u-boot.bin "or blank nand contents"

Third test
- i mount the card again on the PC
- i delete all files except MLO
- i copy all files from angstrom distro on the card, same order as the first 
time, when everything worked.  MLO was not touched at all on the card.
- when booting, X-Loader tells me that it can't find "u-boot.bin" "or blank 
nand contents".
- I don't understand why this happens, the same files are on the card as 
before and i did not touch MLO.


Fourth test:
- format the card as above
- copy MLO on it first
- copy u-boot.bin and uImage from buildroot to the card
- unmount, sync
- When booting, X-Loader finds u-boot.bin, starts it, but there is only weird 
output:
Texas Instruments X-Loader 1.4.4ss (Aug 19 2010 - 02:49:27)                                                                                                                                                    
Beagle xM Rev A                                                                                                                                                                                                
Reading boot sector                                                                                                                                                                                            
Load???&??oot.b?????????????g????Ca????????&?*??      ??(?5??I?*???j??????
&???k?+????                                                                                                                      
?a??                                                                                      
?????????i??????C!???????.??                                                                                        
                                                                                                                          i????                                                                                
                                                                                                                                 ?
W+???+????!??Zh                                                             


It looks that the card should be created "at once" and not by deleting / 
adding files?

It looks that buildroot-2010.11 / u-boot does not work properly?


Best regards,
Torsten.


Am Montag, 14. M?rz 2011, 17:42:38 schrieb Steve Calfee:
> Hi, I'm working on the XM too. see below
> 
> 
> 
> ----- Original Message ----
> 
> > From: Torsten Mohr <tmohr@s.netic.de>
> > Hello,
> > 
> > i wonder if anybody can give me some hints on how to set up an SD  card
> > for u-boot for my BeagleBoard-xM.
> > 
> > The board came with a card with  an Angstrom distro that works fine and
> > fist starts u-boot and then  uImage.
> > 
> > I've set up a second card using some descriptions i found  googling, but
> > don't
> > 
> > really get any success.
> > 
> > I've set up the second  card to:
> > heads: 255
> > sectors: 63
> > cylinders:  trunc(size/255/63/512)
> > 
> > ---  1st try:
> > 
> > The fist partition is  type 0x0c (W95), bootable and formatted using:
> > mkfs.msdos -F 32 -n "beagle"  /dev/sdc1
> > 
> > I created u-boot and a kernel using buildroot-2010.11.
> > 
> > I  copied a MLO to the SD card, then u-boo.bint and then uImage.
> > 
> > I created a  user.scr from input.scr:
> > mmc init
> > setenv console tty0  console=ttyS2,115200n8
> > 
> > I created user.scr from it  with:
> > 
> > ../host/usr/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0  -n
> > lassie
> > 
> > -d input.scr user.scr
> > 
> > I only get weird  output.
> 
> Try changing only one thing at a time. First get your kernel to boot, then
> try to modify u-boot. I assume you did a typeo above and actually spelled
> u-boot.bin as that and not as you said u-boo.bint?
> 
> I have had problems creating a sd card from scratch on ubuntu lucid. gpartd
> doesn't seem to work correctly. disk utility did, and I have heard that
> fdisk will work correctly. Since bootstrapping was too simple, TI added
> MLO as a first stage bootstrap. TI's rom only reads a particular fat
> format, and must find MLO as the first file in the fat. So you must copy
> MLO first onto the sd. MLO then reads the fat and must find the perfectly
> named u-boot.bin.
> 
> > ---  2nd try:
> > i created an exact copy of the SD card  with the Angstrom distro (that
> > works) using "dd", that i put on the second  SD card.
> > 
> > I then mounted the first partition as /mnt and deleted the  u-boot.bin
> > that was
> > 
> > on the card and copied the same file (exactly the same  file) onto the
> > card.
> > 
> > Booting from this card does not work, the OMAP does  not find a working
> > u- boot.bin:
> > 
> > Texas Instruments X-Loader 1.4.4ss  (Aug 19 2010 - 02:49:27)
> > Beagle xM Rev A
> > Reading boot sector
> > u-boot.bin  not found or blank nand contents - attempting serial boot . .
> > . ## Ready for  binary (kermit) download to 0x80008000 at 115200 bps...
> > 
> > I don't  understand this, i thought that i only need to copy the files
> > onto the
> > 
> > SD  card.  Is it important where the sectors of each file are on the 
> > card? Do i need to run some other tool (like what was necessary for 
> > LILO)?
> 
> It is true, all you need is a perfectly formatted sd card. You must have
> forgotten to sync or had a bad copy of u-boot.bin. I have copied from
> nautilus, u-boot.bin onto the micro-sd card.
> 
> > Can anybody give me a hint on how to set up an SD card?
> > - Where  do i get a MLO?
> 
> From your working sd card.
> 
> > - Do i need to configure MLO?
> 
> Not unless you want to build it (I haven't tried that yet).
> 
> > - What do i need to do with  the files?
> 
> MLO must be first in the fat directory.
> 
> > - Did i miss an important step during setup of the  card?
> 
> Please do things one step at a time. Please ask simpler questions. I'll try
> to help.
> 
> Regards, Steve
