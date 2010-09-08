From: JNY <jny0@hotmail.com>
Date: Wed, 8 Sep 2010 01:31:02 -0700 (PDT)
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <29591683.post@talk.nabble.com>
References: <29591683.post@talk.nabble.com>
Message-ID: <29641651.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>bzImage is the kernel file, and I didn't ask you about it.  I'm asking
>about your filesystem.
 
>The rootfs files contain your root filesystem.  Can you tell us clearly
what you're doing to set up the root filesystem on
>your device?

Apologies.  I use the following script (see below) to install the filesystem
'rootfs.i486.tar.bz2' and the kernel image 'bzImage'.
This script is called from /boot/grub/menu.lst on the USB stick.


echo Setting up main drive...
echo "d
n
p
1


a
1
w
" | /sbin/fdisk /dev/hda
/usr/sbin/mkfs.ext2 /dev/hda1

echo Mounting drive and populating...
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
#umount /dev/hda1

echo "root (hd0,0)
setup (hd0)
quit
" | /sbin/grub


echo 
echo Installation Finished. Please Reboot.
echo =====================================
/bin/sleep 8000
-- 
View this message in context: http://old.nabble.com/EXT2-fs-error-tp29591683p29641651.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
