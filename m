From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 7 Feb 2012 20:49:22 +0100
Subject: [Buildroot] kernel boot problem related to GCC  ?
In-Reply-To: <CAAXf6LXL+1pkZTm56CUUkwmqkd0j9ozm6Yut8xhtGGC3qAVuHQ@mail.gmail.com>
References: <7E2C5DAB2B124E0C900A527EE0EF019C@JohanW7>
 <CAAXf6LXL+1pkZTm56CUUkwmqkd0j9ozm6Yut8xhtGGC3qAVuHQ@mail.gmail.com>
Message-ID: <B96A653CD45F4861979DAABFC4FE7386@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas 

This is wat i tried :
Rootfs build in 2010.2 with kernel build with 2011.11 : fails
Rootfs build in 2011.11 with kernel build with 2010.02 : boots

So this showed that the boot problem is not in the generated rootfs.
(in fact i also tried other busybox version with the same result )

What i found in the build directory of the kernel was a file called .missing-syscalls.d, don't know if this has something to do with
it or not.

After finding no solution i ported all my patches i used on the 2.6.31.9 kernel to the 2.6.36.1 kernel and this works fine.

I have been building and building ...and i found out that building in 2011.11 with gcc 4.5.3 fails, using gcc 4.3.6 is OK !
Strange ...i think it might something to do with the ABI..
Gone try to do a build with gcc 4.4.x just out of curiosity.

Johan


-----Oorspronkelijk bericht-----
Van: patrickdepinguin at gmail.com [mailto:patrickdepinguin at gmail.com] Namens Thomas De Schampheleire
Verzonden: dinsdag 7 februari 2012 15:30
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] kernel boot problem

Hi,

On Mon, Feb 6, 2012 at 4:04 PM, Sagaert Johan <sagaert.johan@skynet.be> wrote:
> Hi
>
> I receive this on the console when my system boots:
>
> When i build the same kernel (same version ,same patches and same 
> kernel config ) With 2011.11 : panic !
> With 2010.02 : ok
>
> Kernel 2.6.31.9 ,build with gcc 4.5.3
>
> Any idea (both are build in OABI but EABI yields same problem)?
>
> snip
> ....
> sd 0:0:0:0: [sda] Assuming drive cache: write through
> ?sda: sda1 < sda5 > sda2
> sd 0:0:0:0: [sda] Assuming drive cache: write through sd 0:0:0:0: 
> [sda] Attached SCSI removable disk EXT2-fs warning: mounting unchecked 
> fs, running e2fsck is recommended
> VFS: Mounted root (ext2 filesystem) on device 8:5.
> Freeing init memory: 112K
> BUG: Bad page state in process init ?pfn:204b6 page:c04086c0 
> flags:00000400 count:1 mapcount:0 mapping:(null) index:0 [<c002a748>] 
> (unwind_backtrace+0x0/0xd0) from [<c006b5fc>] (bad_page+0x104/0x138) 
> [<c006b5fc>] (bad_page+0x104/0x138) from [<c006d1c4>] 
> (get_page_from_freelist+0x344/0x470)
> [<c006d1c4>] (get_page_from_freelist+0x344/0x470) from [<c006d3d8>] 
> (__alloc_pages_nodemask+0xe8/0x518)
> [<c006d3d8>] (__alloc_pages_nodemask+0xe8/0x518) from [<c006fa08>] 
> (__do_page_cache_readahead+0x114/0x260)[<c006fa08>]
> (__do_page_cache_readahead+0x114/0x260) from [<c006fdbc>] 
> (ra_submit+0x20/0x24) [<c006fdbc>] (ra_submit+0x20/0x24) from 
> [<c0067e8c>] (filemap_fault+0x1f0/0x434)
>
> [<c0067e8c>] (filemap_fault+0x1f0/0x434) from [<c007a128>] 
> (__do_fault+0x50/0x404)
>
> This is from the one build in 2010.02 and is OK
>
> Snip
> ...
> sd 0:0:0:0: [sda] Assuming drive cache: write through
> ?sda: sda1 < sda5 > sda2
> sd 0:0:0:0: [sda] Assuming drive cache: write through sd 0:0:0:0: 
> [sda] Attached SCSI removable disk EXT2-fs warning: mounting unchecked 
> fs, running e2fsck is recommended
> VFS: Mounted root (ext2 filesystem) on device 8:5.
> Freeing init memory: 120K
> init started: BusyBox v1.15.3 (2010-04-30 12:24:59 CEST) UBIFS error 
> (pid 348): ubifs_get_sb: cannot open "ubi0:data", error -19 starting 
> pid 352, tty '': '/etc/init.d/rcS'
> Populating /dev using udev: done
> Starting portmap: done
> Initializing random number generator... done.
> Starting network...
> ifconfig: SIOCGIFFLAGS: No such device Starting dropbear sshd: OK 
> Starting inetd : OK sucses 0 adding beeper0 doing timer start Major 
> =251 sucses 0 adding oled0
> OLED: Loaded
> ....
>
>

Can you compare the versions of other packages used between both
buildroot versions?
For example, busybox probably changed version. Can you try stepping back that ?
