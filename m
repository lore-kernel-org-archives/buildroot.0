From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Feb 2013 18:31:58 +0100
Subject: [Buildroot] need smaller filesystem for NOR
In-Reply-To: <1360628370.13529.110.camel@genx>
References: <1360344317.17385.31.camel@genx.eng.msli.com>
 <20130208183807.2b2fe572@skate> <1360359245.28641.79.camel@genx.eng.msli.com>
 <1360628370.13529.110.camel@genx>
Message-ID: <511A7C8E.9010407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/02/13 01:19, John Stile wrote:
> On Fri, 2013-02-08 at 13:34 -0800, John Stile wrote:
[snip]
> Next I changed from:
>   root=/dev/mtdblock2
> to:
>   root=/dev/mtdblock 13


  A jffs2 filesystem should be mounted through /dev/mtdN, not through 
/dev/mtdblockN. So root=/dev/mtd13 is a better idea.

>
> The kernel messages now show my desire layout at boot time, however, the
> the file system still does not mount, but the root file system is not
> found.
>
> Kernel boot messages for NAND and NOR:
>   ...
>   rtc-at91sam9 at91_rtt.0: hctosys: unable to read the hardware clock
>   JFFS2 write-buffering enabled buffer (1056) erasesize (8448)
>   Node at 0x00001cd8 with length 0x00000489 would run over the end of the erase block
>   Perhaps the file system was created with the wrong erase size?
>   jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001cdc: 0x0489 instead
>   jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001ce0: 0x651a instead
>   jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001ce4: 0x0006 instead
>   ...
>   Further such events for this erase block will not be printed
>   VFS: Mounted root (jffs2 filesystem) on device 31:13.
>   Freeing init memory: 104K
>   Kernel panic - not syncing: Attempted to kill init!
>   [<c0028678>] (unwind_backtrace+0x0/0xdc) from [<c0243990>] (panic+0x34/0x110)
>
> I think this means I am close.
>
> Next I tried to edit my jffs options in the .config for my recovery
> 'failsafe' buildroot:
> Filesystem images  --->
>   [*] jffs2 root filesystem
>   Flash Type (Select custom page and erase size)  --->
>   (0x1065) Page Size
>   (0xC60) Erase block size

  Those numbers are unlikely. 0x1065 is a very odd number (literally). 
Also, the erase block size is always larger than the page size, and for 
NOR I think it's normally equal to it.

  These questions are however more appropriate for
linux-mtd at lists.infradead.org because they are not buildroot related.


  However, if you want a quick fix: you can also choose the 
BR2_TARGET_ROOTFS_INITRAMFS ("initial RAM filesystem linked into linux 
kernel") option. With your huge 5.5MB rootfs that will kill build and 
boot time, but it means you don't have to bother with writing the JFFS2 
to NOR or even partitioning your NOR. It's all in a single uImage.

  You could even create a FIT image that includes both kernel and rootfs 
(as a cpio archive, "cpio the root filesystem (for use as an initial RAM 
filesystem)") but buildroot doesn't have support for that.


  Regards,
  Arnout


>
> I gleaned these numbers from the output o the sam-ba utility used to
> load the NOR flash, but they still don't work.
>
> This had no effect.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
