From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Fri, 16 Nov 2012 21:36:28 +0100
Subject: [Buildroot] Load Address and EntryPoint for Kernel
In-Reply-To: <20121028212150.0ff4c78b@skate>
References: <508D5B55.1070401@googlemail.com> <20121028174310.34c4f029@skate>
 <508D6874.609@googlemail.com> <20121028212150.0ff4c78b@skate>
Message-ID: <50A6A3CC.40400@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Am 28.10.2012 21:21, schrieb Thomas Petazzoni:
> The kernel sources clearly indicate that the entry point should be
> 0x48000. So it seems like your patches haven't been applied, or your
> kernel has been badly configured, or something like that.

after some time I have found the issue. You are right, at a deeper look
I was able to see that I have made a misspelled naming of my patches.
The patches all missing the 'linux-' prefix. :)
After I have corrected this the correct address was shown while the
kernel build.

>   OBJCOPY arch/arm/boot/zImage
>   Kernel: arch/arm/boot/zImage is ready
>   UIMAGE  arch/arm/boot/uImage
> Image Name:   Linux-2.6.34.13-nevis
> Created:      Fri Nov 16 21:26:38 2012
> Image Type:   ARM Linux Kernel Image (uncompressed)
> Data Size:    2131444 Bytes = 2081.49 kB = 2.03 MB
> Load Address: 00048000
> Entry Point:  00048000
>   Image arch/arm/boot/uImage is ready

And after all the kernel is excellent booting on the STB.

> Hit any key to stop autoboot:  0                                                                                                                                                                                                 
> HDx> tftpboot ubi/uImage                                                                                                                                                                                                         
> TFTP from server 192.168.136.4; our IP address is 192.168.136.10                                                                                                                                                                 
> Filename 'ubi/uImage'.                                                                                                                                                                                                           
> Load address: 0xe000000                                                                                                                                                                                                          
> Loading: #################################################################                                                                                                                                                       
>          #################################################################                                                                                                                                                       
>          ################                                                                                                                                                                                                        
> done                                                                                                                                                                                                                             
> T Bytes transferred = 2131508 (208634 hex)                                                                                                                                                                                       
> HDx> bootm 0xe000000                                                                                                                                                                                                             
> ## Booting kernel from Legacy Image at 0e000000 ...                                                                                                                                                                              
>    Image Name:   Linux-2.6.34.13-nevis                                                                                                                                                                                           
>    Image Type:   ARM Linux Kernel Image (uncompressed)                                                                                                                                                                           
>    Data Size:    2131444 Bytes =  2 MB                                                                                                                                                                                           
>    Load Address: 00048000                                                                                                                                                                                                        
>    Entry Point:  00048000                                                                                                                                                                                                        
>    Verifying Checksum ... OK                                                                                                                                                                                                     
>    Loading Kernel Image ... OK                                                                                                                                                                                                   
> OK                                                                                                                                                                                                                               
>                                                                                                                                                                                                                                  
> Starting kernel ...                                                                                                                                                                                                              
>                                                                                                                                                                                                                                  
> Uncompressing Linux... done, booting the kernel.                                                                                                                                                                                 
> [    0.000000] Linux version 2.6.34.13-nevis (carsten at wheezy) (gcc version 4.7.1 (crosstool-NG 1.16.0 - buildroot 2012.08-00015-g0256ea5) ) #1 Fri Nov 16 21:26:33 CET 2012                                                      
> [    0.000000] CPU: ARMv6-compatible processor [410fb764] revision 4 (ARMv7), cr=00c5387f                                                                                                                                        
> [    0.000000] CPU: VIPT aliasing data cache, VIPT aliasing instruction cache                                                                                                                                                    
> [    0.000000] Machine: CoolStream HDx IRD                                                                                                                                                                                       
> [    0.000000] Memory policy: ECC disabled, Data cache writeback                                                                                                                                                                 
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 97536                                                                                                                                        
> [    0.000000] Kernel command line: console=ttyRI0 mtdparts=cx2450xflash:384k(U-Boot),128k(Splash),4096k(kernel),28160k(systemFS) root=mtd3 rootfstype=jffs2 rw mem=384M                                                         
> [    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)                                                                                                                                                               
> [    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)                                                                                                                                                   
> [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)                                                                                                                                                    
> [    0.000000] Memory: 384MB = 384MB total                                                                                                                                                                                       
> [    0.000000] Memory: 385404k/385404k available, 7812k reserved, 0K highmem                                                                                                                                                     
> [    0.000000] Virtual kernel memory layout:                                                                                                                                                                                     
> [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)                                                                                                                                                                 
> [    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)                                                                                                                                                                 
> [    0.000000]     DMA     : 0xffc00000 - 0xffe00000   (   2 MB)                                                                                                                                                                 
> [    0.000000]     vmalloc : 0x98800000 - 0xe0000000   (1144 MB)                                                                                                                                                                 
> [    0.000000]     lowmem  : 0x80000000 - 0x98000000   ( 384 MB)                                                                                                                                                                 
> [    0.000000]     modules : 0x7e800000 - 0x80000000   (  24 MB)                                                                                                                                                                 
> [    0.000000]       .init : 0x80048000 - 0x80062000   ( 104 kB)                                                                                                                                                                 
> [    0.000000]       .text : 0x80062000 - 0x80424000   (3848 kB)                                                                                                                                                                 
> [    0.000000]       .data : 0x80424000 - 0x80441900   ( 119 kB)                                                                                                                                                                 
> [    0.000000] NR_IRQS:352

Thanks for your help!

Regards
Carsten
