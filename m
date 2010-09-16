From: Johnny Beardsmore <jny0@hotmail.com>
Date: Thu, 16 Sep 2010 09:21:21 +0000
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <1284627065.4173.2221.camel@station1.ormlab.com>
References: <29591683.post@talk.nabble.com> <29641651.post@talk.nabble.com>,,
	<SNT119-W3039C61443ADF5E85164F582730@phx.gbl>,,
	<SNT119-W26A1FD2D4331730D164D2C82770@phx.gbl>,,
	<20100913102031.03481d63@surf>,,
	<SNT119-W9D3C2902126B58DEE9A1282770@phx.gbl>,,
	<87mxrm6lrc.fsf@macbook.be.48ers.dk>,,
	<SNT119-W4750F1F26C2613C40FB5C82790@phx.gbl>,,
	<20100915133124.604f8b74@surf>,,
	<SNT119-W19D1DBCD197B0F139037EA82790@phx.gbl>,,
	<20100915190725.459aaca8@surf>,
	<SNT119-W315E2AFFA66E576AA7F27A827A0@phx.gbl>,
	<1284627065.4173.2221.camel@station1.ormlab.com>
Message-ID: <SNT119-W38B5142DB23D37AEB445A827A0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> > Un-taring the rootfs.i486.tar.bz onto the flashdrive of the device
> > using grub has worked for me (with the exception of the problem I'm
> > experiencing),
> The confusion starts here.  Where is the "rootfs.i486.tar.bz" and why
> are you un-taring it unto a flash drive?

Sorry, I meant rootfs.i486.tar.bz2.  The flash drive is the nv memory for the pc-104.  I do so with the following script (see below).  This is called from /boot/grub/menu.lst, and is located in /home/reflash.sh.  The whole loading process is contained in a USB memory stick over two partitions (one with the MBR).  It's done like this to make it easy for anyone to be able to load up the pc-104.  They just plug in the stick, and turn it on.

echo "" | /sbin/fdisk /dev/hda
/usr/sbin/mkfs.ext2 /dev/hda1

/bin/mount /dev/sda2 /mnt
/bin/mount /dev/hda1 /mnt/disk
rm -rf /mnt/disk/*
/bin/tar -C /mnt/disk/ -xvf /mnt/rootfs.i486.tar.bz2

mkdir /mnt/disk/var/log/lighttpd
cp /mnt/grub/menu.lst /mnt/disk/boot/grub/
cp -av /mnt/home/* /mnt/disk/home/
cp -av /mnt/etc/inittab /mnt/disk/etc/
cp -av /mnt/etc/lighttpd /mnt/disk/etc/
cp -av /mnt/etc/network/* /mnt/disk/etc/network/
cp -av /mnt/etc/init.d/* /mnt/disk/etc/init.d/
cp -av /mnt/var/www /mnt/disk/var/

echo "root (hd0,0)
setup (hd0)
quit
" | /sbin/grub

echo "Done"
 
> Where does the rootfs.i486.tar.bz file come from? Do you create it
> manually? or is it the output of buildroot?  The file-system image I get
> from buildroot is called rootfs.i486.ext2.gz, no tar.  

rootfs.i486.tar.bz2 comes from Buildroot.  It's in /output/staging along with the bzImage.

> Do you have the flash drive mounted as you root file system?  You maybe
> wearing out the flash thus loosing the those frequently accessed files.
> My flash drive (CF card) is mounted read-only and when certain events
> occur or a timeout in my application, the flash drive is remounted
> read-write, the data is written and then the flash drive is remounted
> read-only, in over three years and 23 system I haven?t lost any data.
 
 There is a physical switch on the flash drive which is set to read/write (options are r/w and WP (write protect)).  There's another switch (master / slave) which is set to master.

> I don't think doing in fsck on boot is going to help you, your files are
> getting corrupted on the unclean shut-downs fsck isn't going to be able
> to repair them.

Perhaps I should force a clean shutdown?  I might be barking up the wrong tree.  I get the e2fsck warning on boot, and loose data.  I assumed the two were connected.  I've never experienced systematic hardware failure (unless it's a problem with a batch), so I assumed my code/engineering was at fault.

> If you can clarify the confusion noted above maybe I can help.

 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100916/30d149e3/attachment.html>
