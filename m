From: Steve Calfee <stevecalfee@gmail.com>
Date: Wed, 23 Mar 2011 16:31:31 -0700
Subject: [Buildroot] BeagleBoard-xM, booting 2.6.37, root=/dev/mmcblk0p2,
 kernel hangs
In-Reply-To: <AANLkTikPixoYQfWYnnKKBb6TuXOMXt165gkfVAzL-OPR@mail.gmail.com>
References: <201103232200.55266.tmohr@s.netic.de>	<AANLkTikXt+=tDUAtbP39EZQ8ExEZzEU0kMYFP0NQ_Pm5@mail.gmail.com>	<201103232310.39054.tmohr@s.netic.de>
	<AANLkTikPixoYQfWYnnKKBb6TuXOMXt165gkfVAzL-OPR@mail.gmail.com>
Message-ID: <4D8A82D3.9020704@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/23/11 15:53, bruce bushby wrote:
> I've only just started using buildroot but I found the NFS setup simplifies
> things and it also makes testing new builds very easy.
>
> I can help with the NFS setup if you need.....it's about the only part of
> things I'm any good at :)
>
> my uboot settings:
>
> U-Boot>  printenv
> bootdelay=3
> baudrate=115200
> AutoRamSizeCfg=ON
> AutoLinuxEnvCfg=ON
> ethact=macb0
> autostart=
> autoload=no
> ipaddr=192.100.1.102
> ethaddr=192.100.1.102
> bootcmd=ethinit $ipaddr ; tftp 0x20200000 uImage ; bootm 0x20200000
> serverip=192.100.1.108
> bootargs=console=ttyS0,115200 mem=64M ver=4384k icofat=257k root=/dev/nfs
> nfsroot=192.100.1.108:/nfsroot ip=192.100.1.102
> mtdparts=atmel_nand:7936k(ARMboot)ro,- at 7936k(root)
> stdin=serial
> stdout=serial
> stderr=serial
>
> Environment size: 431/32764 bytes
> U-Boot>
>
>
> 1. setup tftpboot (I use /tftpboot)
> 2. Create an nfs share (I use /nfsroot)
> 2. Copy uImage to /tftpboot/uImage (give /tftpboot 777 file perms)
> 4. Copy rootfs.tar to /nfsroot ; tar -xf rootfs.tar
>
> uboot:
> setenv ipaddr 192.100.1.102
> setenv bootcmd "...your bootcmd"
> setenv bootargs "..your bootargs"
> saveenv
>
> I set my bootcmd to include "ethinit $ipaddr;" .... otherwise you have to
> manually "ethinit $ipaddr"
>
>
>
Hi Bruce,

What u-boot are you using and what is it's config. I see here you got 
both usb ethernet to work and also saveenv to mmc. I would like to see 
your u-boot config.

I gave up on u-boot, but do mount nfs from the bb-xm. then if needed I 
copy over a new uImage and reboot. Obviously either tftp or nfs booting 
would be even nicer.

I tried to get kexec to work on the bb, but it doesn't. Lots of people 
are saying kexec is not working in 2.6.38, but I haven't seen fixes yet. 
The nice thing about kexec is it uses a less bloated u-boot, gives 
better scripting capability (and for me without the ability to saveenv), 
easier customizing. But alas....

Regards, Steve
