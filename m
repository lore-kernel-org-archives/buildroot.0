From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 23 Feb 2010 22:22:51 +0100
Subject: [Buildroot] Newbie: AT91SAM9260 NAND Boot
Message-ID: <D3796D57A9CF4CBE9A4A46D52BE466DE@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
I use buildroot to build a tarred rootfs
 
Then i confure U-boot to boot from NFS :
 
setenv bootfile uImage

setenv serverip 192.168.1.110

setenv bootargs mem=64M console=ttyS0,115200 root=/dev/nfs rw
nfsroot=192.168.1.110:/home/johan/srcmain ip=dhcp

tftpboot 0x21000000

bootm 0x21000000
i use UBIFS on the nandflash : it seems to be the best choice
once booted ftom nfs (for my board )
#partition info

#mtd
#0  0x00000000-0x00040000 : "bootstrap"

#1  0x00040000-0x00080000 : "u-boot"

#2  0x00080000-0x00200000 : "u-boot environment"

#3  0x00200000-0x00800000 : "kernel"

#4  0x00800000-0x40000000 : "filesystems"
then 

#erasing mtd3 partition for the kernel 
flash_eraseall /dev/mtd3
#write the kernel image to mtd3
nandwrite -p /dev/mtd3 /uImage
 

#erase mtd4 partition
flash_eraseall /dev/mtd4
 

# attach mtd4 to the ubi driver
# -m 4-->mtd block 4
ubiattach /dev/ubi_ctrl -m 4

#create a 128 Mbyte volume in ubi0 (partition 0)
#-N rootfs ---> partition name
# -s   	   --->size
ubimkvol /dev/ubi0 -N rootfs -s 128MiB
#rest of the nand 

ubimkvol /dev/ubi0 -N data -m
 

#create mountpoint
mkdir /mnt/vol0
#mount the ubi volume named rootfs to /mnt/vol0
mount -t ubifs ubi0:rootfs /mnt/vol0
#cd into it
cd /mnt/vol0
#untar the tar containing the rootfilesystem generated with buildroot
tar xf /at91sam9260dfc-rootfs.arm.tar
sync
 
then reboot and setup u-boot to boot from nand
 

setenv bootargs mem=64M console=ttyS0,115200n8 ubi.mtd=4 root=ubi0:rootfs rw
rootfstype=ubifs

nand read 0x21000000 0x00200000 0x200000
bootm 0x21000000
 
this should help you
 
Johan
 
 
 
 
 
 
 
 
 
 
 
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100223/55742d82/attachment.htm>
