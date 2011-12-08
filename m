From: Emmanuel BOUAZIZ <ebouaziz@neotion.com>
Date: Thu, 08 Dec 2011 11:31:10 +0100
Subject: [Buildroot] buildroot with SquashFS root file system
In-Reply-To: <201112061216.46659.minimod@morethan.org>
References: <4EDE32C3.7020400@neotion.com>
 <201112060956.07523.minimod@morethan.org> <4EDE57E6.4040007@neotion.com>
 <201112061216.46659.minimod@morethan.org>
Message-ID: <4EE091EE.2010504@neotion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/06/2011 07:16 PM, Michael S. Zick wrote:

> My next guess -
> 
> Was the kernel built by Buildroot or did you build it otherwise?
> If the kernel wasn't built by Buildroot, it may not have the
> required options set for tmpfs, devtmpfs, automount devtmpfs.
> 
> If built outside of Buildroot, what version kernel?
> 

I build the kernel using buildroot. It's version 3.1.4


On 12/06/2011 09:29 PM, Peter Korsgaard wrote:

>
> An initramfs would be a better option than initrd, but OK. Did you build
> the kernel with buildroot or manually?
>

I'll probably use the initramfs since it already works and you say it's a better option. But I'd like to make the
SquashFS work now that I've started, it's frustrating not to succeed :p

I build the kernel with buildroot, it'version 3.1.4

>
>  Emmanuel> Here is what I get during the boot sequence:
>
>  Emmanuel> (...)
>  Emmanuel> RAMDISK: squashfs filesystem found at block 0
>  Emmanuel> RAMDISK: Loading 14133KiB [1 disk] into ram disk.../
>  Emmanuel> usb 1-7: new high speed USB device number 3 using ehci_hcd
>  Emmanuel> VFS: Mounted root (squashfs filesystem) readonly on device 1:0
>  Emmanuel> usb 2-2: new full speed USB device number 2 using uhci_hcd
>  Emmanuel> can't open /dev/null: No such file or directory
>  Emmanuel> can't open /dev/null: No such file or directory
>  Emmanuel> can't open /dev/null: No such file or directory
>  Emmanuel> can't open /dev/null: No such file or directory
>  Emmanuel> can't open /dev/null: No such file or directory
>  Emmanuel> can't open /dev/null: No such file or directory
>
> Do you have CONFIG_DEVTMPFS enabled in your kernel? From a quick look at
> the kernel sources (init/do_mounts_initrd.c) I see that the kernel
> doesn't mount devtmpfs automatically when an initrd is used, so you'll
> need to add a wrapper script as /linuxrc which mounts it and execs
> /sbin/init, similar to how we do it for initramfs (fs/cpio/init):
>
> # devtmpfs does not get automounted for initramfs
> /bin/mount -t devtmpfs devtmpfs /dev
> exec 0</dev/console
> exec 1>/dev/console
> exec 2>/dev/console
> exec /sbin/init $*
>

Yes it's enabled. I've put that same mechanism in squashfs (modified fs/squashfs/squashfs.mk and added fs/squashfs/init)
and added init=/init in kernel parameters but the /init script is not run.

I took a look at the possible kernel parameters and added root=/dev/ram0 rw to the kernel parameters.
Now I get a "devtmpfs: mounted" before the /init script is run, and another saying "mount: mounting devtmpfs on /dev
failed: Device or resource busy" when the /init script is run :D

So I removed the /init script, the "can't open /dev/null" problem is gone.

The only remaining problem is that the whole filesystem is read-only despite the 'rw' including /var and /tmp.

regards,

-- 
Emmanuel
