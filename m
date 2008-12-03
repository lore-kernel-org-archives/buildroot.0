From: Cyril HAENEL <chaenel@free.fr>
Date: Wed, 03 Dec 2008 09:55:47 +0100
Subject: [Buildroot] [Re:  Problem with jffs2 image creation.]
In-Reply-To: <493541B5.1000706@free.fr>
References: <493541B5.1000706@free.fr>
Message-ID: <49364993.5090408@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I found something !

I looked in detail the build procedure, and I see that before 
mkdev.jffs2 is called with the -D device_table.txt option, makedevs is 
called !
Thus /dev/ directory is already populated, and mkdev.jffs2 doesn't work 
correctly !
I edited the script target/jffs2/jffs2root.mk and commented this line :

#JFFS2_OPTS += -D $(TARGET_DEVICE_TABLE)

Thus now mkfs.jffs2 is called without the device_table.txt, and the 
image is built correctly because /dev is already populated by makedevs.


Cyril HAENEL a ?crit :

>I use the default configuration : make at91sam9260dfc_defconfig
>
>By default buildroot build 2 images, ext2 and jffs2, I have not changed 
>any option in menuconfig :
>
>[nlc at nlcLaptop buildroot]$ ls -l binaries/at91sam9260dfc/
>total 15444
>-rwxr-xr-x 1 nlc nlc    3708 2008-12-02 14:49 
>at91sam9260dfc-dataflashcardboot-2.3.4.bin*
>-rw-r--r-- 1 nlc nlc 1622380 2008-12-02 14:49 
>at91sam9260dfc-linux-2.6.24.4-20081202.gz
>-rwxr-xr-x 1 nlc nlc  167300 2008-12-02 14:49 
>at91sam9260dfc-u-boot-1.2.0-atmel-20081202.bin*
>-rw-r--r-- 1 nlc nlc     483 2008-12-02 14:49 autoscript
>-rw-r--r-- 1 nlc nlc     555 2008-12-02 14:49 autoscript.at91sam9260dfc
>-rw-r--r-- 1 nlc nlc 9576448 2008-12-02 14:49 rootfs.arm-20081202.ext2
>-rw-r--r-- 1 nlc nlc 4392688 2008-12-02 14:50 rootfs.arm-20081202.jffs2
>
>If I mount the ext2 image on my laptop everything is OK (devices are 
>presents in /dev), and the image works fine when I put it in the board.
>But when I mount the jffs2 image on my laptop, /dev, and even /etc are 
>empty ! And of course the image doesn't work on the board.
>ext2 and jffs2 images seems to not be generated with the same tool. I 
>think there is a problem with the mkfs.jffs2 tool ?
>
>  
>

-- 

Cyril Haenel
Registered Linux User #332632
