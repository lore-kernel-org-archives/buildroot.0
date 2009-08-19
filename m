From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 19 Aug 2009 18:28:42 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <20090819233037.1d8e5a5d@surf>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com><20090819214237.534c433f@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com>
	<20090819233037.1d8e5a5d@surf>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901BEA4AD@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, August 19, 2009 2:31 PM, Thomas Petazzoni wrote:
>> The kernel and rootfs are both created with Buildroot.
>> 
>> For the kernel config I have:
>> 
>> CONFIG_AEABI=y
>> CONFIG_OABI_COMPAT=y
>> 
>> For buildroot's config I have:
>> 
>> # BR2_ARM_OABI is not set
>> BR2_ARM_EABI=y
>
> That's correct. When I fall into similar issue, I usually end up
> writing a very simple init program that does:
>
> int main(void)
> {
>	write(1, "Hello\n", 6);
>	while(1);
> }
>
> Compile it statically and put it in /sbin/init. Getting this first
> basic program to work is a first step.

I just tried that and get the same results.  Maybe I didn't compile
it statically?  I just did:

$ arm-none-linux-gnueabi-gcc init.c -o init

Then replaced the /sbin/init link to busybox with the file.  I also
loop mounted the rootfs.arm.ext2 filesystem to verify that the file
was indeed replaced.

>> Is there a similar configuration that needs to be set in Busybox?
>
> Not that I'm aware of.

I added a printk in the run_init_process() function in init/main.c
to verify what process was trying to start.  Here's a bit more of
the boot messages, I can post the whole thing it needed:

Uncompressing Linux................................................................................................................... done, booting the kernel.
Linux version 2.6.30.5 (bigguiness at etch) (gcc version 4.3.3 (Sourcery G++ Lite 2009q1-203) ) #12 PREEMPT Wed Aug 19 11:10:39 MST 2009
CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=c0007177
CPU: VIVT data cache, VIVT instruction cache
Machine: Vision Engraving Systems EP9307 SoM
Memory policy: ECC disabled, Data cache writeback
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16192
Kernel command line: root=/dev/ram console=ttyAM2 video=ep93xx-fb:640x480-16 at 60

... Everything after that looks normal

rtc-isl1208 0-006f: setting system clock to 2009-08-19 14:57:28 UTC (1250693848)
RAMDISK: gzip image found at block 0
VFS: Mounted root (ext2 filesystem) on device 1:0.
Freeing init memory: 120K
run_init_process: /sbin/init
Kernel panic - not syncing: Attempted to kill init!
[<c002ca8c>] (unwind_backtrace+0x0/0xdc) from [<c02943dc>] (panic+0x48/0x120)
[<c02943dc>] (panic+0x48/0x120) from [<c0048430>] (do_exit+0x64/0x608)
[<c0048430>] (do_exit+0x64/0x608) from [<c0048a84>] (do_group_exit+0xb0/0xe4)
[<c0048a84>] (do_group_exit+0xb0/0xe4) from [<c0052cc4>] (get_signal_to_deliver+0x384/0x3dc)
[<c0052cc4>] (get_signal_to_deliver+0x384/0x3dc) from [<c00295f8>] (do_signal+0x50/0x528)
[<c00295f8>] (do_signal+0x50/0x528) from [<c0026eac>] (work_pending+0x1c/0x20)

Any other ideas?

Thanks for the help,
Hartley
