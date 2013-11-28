From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Nov 2013 21:55:15 +0100
Subject: [Buildroot] [PATCH 2/5] package/rpi-firmware: add option to
 install firmware files in target/boot/
In-Reply-To: <20131128211140.6003b460@skate>
References: <cover.1385157864.git.yann.morin.1998@free.fr>
 <74d82d94462f019fa59a880bfdff422110956f5c.1385157864.git.yann.morin.1998@free.fr>
 <20131128211140.6003b460@skate>
Message-ID: <20131128205515.GB3337@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-11-28 21:11 +0100, Thomas Petazzoni spake thusly:
> On Fri, 22 Nov 2013 23:50:55 +0100, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > The firmware files must reside in a FAT filesystem, in the first partition
> > of the SDcard, so it makes sense to install them in target/ (eg. for a
> > post-image script to generate the different partitions from the rootfs.tar).
> 
> I don't understand the reasoning here. These files must be at the root
> of a specific FAT filesystem, so I fail to see why installing them
> inside the root filesystem is of any help to achieve that.
> 
> Yes, I've seen that it's probably related to the proposed logic to
> generate a bundled image in PATCH 5/5, but for the moment, my feeling
> is that if that logic requires *all* files to be present in the root
> filesystem to be later installed in a separate FAT/boot filesystem,
> then the logic isn't really appropriate, and should be improved, no?

The basic idea is to not depend on board-specific layout of the boot
files in the genimages infra.

Notice how the boot files for the Raspberry Pi are located in
images/rpi-firmware? This is not a 'generic' location, and we would need
a way for a 'board' to pass a 'description' to genimages of what should
be copied to the partition.

Since we do not have board description in Buildroot (and have gone quite
our way to remove it in the past), I tried not too add more. Of course,
the 'partition layout description' is board-specific, but its syntax is
not board-specific; the one we bundle is just an example, to serve as a
basis for the real file for a real project.

I designed genimages so that it does *not* deal with adding/removing
stuff to/from the filesystem, but just dispatch the directory layout
into different partitions. I find it odd to tinker with the content of
the filesystems at that point (but maybe I am biased, since genimages
used to be a post-image hook, but now is a real fs target).

> I believe that the existing choice of installing things in
> $(BINARIES_DIR)/rpi-firmware/ was a much better choice. That's a choice
> I've kept in the series on Grub/Grub2/Gummiboot, by creating a
> $(BINARIES_DIR)/efi/ directory.

Yes, but 'efi' is generic, it is not named after the target system,
while 'rpi-firmware' is very specific. Maybe we could harmonise the name
for that directory (eg. 'boot-files') and use that name to install all
bootloader files, in which case that'd be probably OK.

( BTW, the current grub package does copy its files into
$(TARGET_DIR)/boot/grub and I like it ;-) )

Except that bootloaders may install different sets of files, and we can't
find a common name for those files. Eg. rpi-firmware installs 5 different
files (bootcode.bin, start.elf, fixup.dat, config.txt, and cmdline.txt),
while grub installs at least three files (stage1, stage2, and any
fs-specific stage1_5, not counting the splashcreens).

Yet, we might be able to use that, if the bootloaders also install a
list of files to copy to the FS.

But then it means 'rootfs.tar' (or any other fs images) does not contain
the same as the 'genimages' images. I think this is bad, and I think all
images should have the same FS content.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
