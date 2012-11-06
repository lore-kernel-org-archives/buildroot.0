From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 07 Nov 2012 00:26:58 +0100
Subject: [Buildroot] Udev on a live CD system does not appear to
 populate /dev
In-Reply-To: <5099186E.1030409@macrium.com>
References: <5099186E.1030409@macrium.com>
Message-ID: <50999CC2.1090504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/11/12 15:02, Antony Vennard wrote:
> Hi All,
>
> I'm currently looking at using udev for a live cd environment built with
> buildroot, and I'm having trouble getting udev to pick up the machine's
> devices.
>
> I have some questions and some details that will (hopefully) help
> identify my problem

  It would help if you can do 'make savedefconfig' and post the
resulting defconfig file.

>
> Firstly, my kernel is configured to use devtmpfs:
>
> 681:CONFIG_DEVTMPFS=y
> 682:CONFIG_DEVTMPFS_MOUNT=y
>
> so as I understand it, /dev should be mounted as a tmpfs by the kernel
> and populated with /dev/null, /dev/console etc.

  Since you're making a live CD, you'll probably boot with an
initrd/initramfs.  The kernel then doesn't mount /dev automatically,
it has to be done by init script in /init (which is called instead of
/sbin/init for an initramfs).  Buildroot creates this script for you
when you build a cpio or initramfs filesystem (i.e. the things that are
typically used as initrd image).  If you're trying to use an ext2 as
an initrd (which is a bad idea), you have to copy fs/cpio/init to the
target yourself.

> Yet, my
> buildroot/output/target contains a dev folder with subdirectories
> created by buildroot.

  Yes, that's a bit silly.  It doesn't really matter, because the devtmpfs
gets mounted over it and those files are no longer visible.

  If you have an initrd/initramfs, /dev/console should ideally be there,
otherwise you get the message 'Failed to open an initial console'.  That
message is harmless though because the /init script mounts /dev, which
implicitly creates /dev/console, and when /sbin/init is execed it can use
this /dev/console.

> So, I tried both creating the entries with target/generic_device_table
> for tty0, tty1, console, null. This works,

  Yep, this sounds like you're missing a /init.

> and udev reports it is scanning for devices and done,
> yet /dev never picks up e.g. /dev/sda, or
> /dev/disk/..., or so on. I have, in this configuration, copied
> /usr/lib/udev/rules.d/* to buildroot/output/target/etc/udev/rules.d to
> no avail; as far as I can see whatever rules I supply, even from my
> Fedora or Ubuntu distributions, do not seem to affect udev.

  Note that udev doesn't create anything in /dev - it relies on the kernel
to create the device nodes. udev only does renaming, chmodding, chowning
and making symlinks.

>
> Wondering if this creation method was wrong, I have then removed all of
> the entries in /dev so that the kernel can mount its own devtmpfs. When
> booting, /dev/null and /dev/tty1 are reported as missing. I imagine
> there is nothing in /dev at this stage

  This is weird.  If there's no /dev/console, how can init report that
/dev/tty1 is missing?

[snip]

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
