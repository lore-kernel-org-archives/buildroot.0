From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 14 Oct 2010 14:23:57 +0200
Subject: [Buildroot] VFS: Cannot open root device "mtd ...
In-Reply-To: <0C11C5BF0B29FD43A8D0250F711D497F7F66397800@ex01-ubitronix.ubitronix.local>
References: <0C11C5BF0B29FD43A8D0250F711D497F7F663977FF@ex01-ubitronix.ubitronix.local>
	<4CB6D740.8030105@visionsystems.de>
	<0C11C5BF0B29FD43A8D0250F711D497F7F66397800@ex01-ubitronix.ubitronix.local>
Message-ID: <4CB6F65D.1090401@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hello abhiash,

> Boardfile that I am using is at91sam9260ek_defconfig.
>
> In the file -->
> output/build/linux2.6.34.1/arch/arm/mach-at91/board-sam9260ek.c
>
> The name is mentioned as "Partition 1" and "Partition 2" for the MTD partition.
>
> I have not altered this file
>
> Specifying it as /dev/Partition 1 in the uboot env.... it takes it as Partition

These partition name will be used for other operations, device names are still the same /dev/mtdblockX

> Partition1 gives the same errors.
>
> What should be the next try ?

You'll have to modify

output/build/linux2.6.34.1/arch/arm/mach-at91/board-sam9260ek.c

/*
 * NAND flash
 */
static struct mtd_partition __initdata ek_nand_partition[] = {
        {
                .name   = "Boot", 		/* /dev/mtdblock0 */
                .offset = 0,
                .size   = SZ_2M,
        },
        {
                .name   = "Kernel",		/* /dev/mtdblock1 */
                .offset = MTDPART_OFS_NXTBLK,
                .size   = SZ_2M,
        },

        {
                .name   = "File System",	/* /dev/mtdblock2 */
                .offset = MTDPART_OFS_NXTBLK,
                .size   = MTDPART_SIZ_FULL,
        },
};

Then your kernel params should look like this:

'mem=64M console=ttyS0,115200 root=/dev/mtdblock2 rw rootfstype=jffs2'

Best regards,
Yegor
