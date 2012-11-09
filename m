From: =?windows-1252?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 09 Nov 2012 15:11:20 +0200
Subject: [Buildroot] Udev on a live CD system does not appear to
 populate /dev
In-Reply-To: <509CF4F8.6080608@macrium.com>
References: <5099186E.1030409@macrium.com> <509958D9.7050108@petroprogram.com>
 <5099A14C.5000204@mind.be> <509AA0C4.4060506@petroprogram.com>
 <CACpMmu9g8xXNsyQp6DheEqP9z_Q=7DwkorWc120-gW5wQj9+YA@mail.gmail.com>
 <509BA71B.6020009@petroprogram.com> <509BD78A.8050908@macrium.com>
 <509C2166.8050705@mind.be> <509CF4F8.6080608@macrium.com>
Message-ID: <509D00F8.1030303@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

9.11.2012 14:20, Antony Vennard kirjoitti:
> On 08/11/2012 21:17, Arnout Vandecappelle wrote:
>>  If you build a cpio rootfs, you shouldn't need any additional command line
>> parameters because the kernel never gets to mounting the root
>> filesystem.  It
>> just runs the /init in the initramfs.
>>
>>  Using a cpio rootfs should also solve your problems with the device nodes,
>> because we provide a /init that mounts devtmpfs explicitly.
>>
>>  Regards,
>>  Arnout
>>
> Yep, I'd come to the conclusion I needed an /init to exist, constructing
> the root file system. Manually creating the CD as a test, the kernel
> panics (root file system not found) if init doesn't exist. I used the
> one from fs/cpio/init as you suggested.
>
> The ram_disk_size parameter does appear to be entirely optional.
>
> I'm now on to the next problem - that script exec's /sbin/init which is
> really /bin/busybox... which is exiting straight away or crashing, as
> the kernel is now panicking about an exiting init :(
>
> I'm going to have an experiment with this, see if I can understand what
> the issue is.
Well, at least now it find's your root device (aka dynamic ramdisk aka
/dev/ram0).
That's good.

Yes, it will throw kernel panic because init is never supposed to exit.
So stuff inside your /etc/ or /etc/init.d needs some fine tuning.

Do you now also have symlink of init --> /bin/busybox in your initramfs
root also ?

If you wan't you can feed the grub kernel loading line a  init=/bin/sh  
(or /bin/ash or whatever your shell is)
That should just start your shell (skip everything else) in live cd so
that you can look inside the running system what
works and what really happened
(aka if your /dev has all the nodes, are all the necessary stuff there,
etc...)

Also, if that init=/bin/sh does not work (it should always work) then
it's clear that somethings is wrong with your busybox.

After kernel has loaded it seeks for either /init or /sbin/init then it
looks for /etc/inittab file.
In /etc/inittab it calls /etc/init.d/rcS which is responsible of
starting all your other services (mdev,network,urandom etc..)
inside /etc/init.d directory


I have included here my own live CD init stuff (only the bare
essentials, most of the default buildroot stuff remaining intact).
It's a combination of buildroot, gentoo and some of my own stuff (with
all my CD-limit breaking hacks removed).
It's not perfect but it works.

Just remember that if you are not using /bin/login then just replace that

tty1::respawn:-/bin/login

line with your own shell (/bin/sh, /bin/ash etc...)

Regards
Stefan
> I have also grabbed a copy of buildroot git. Once I've got this working,
> I'll have a go at modifying buildroot to build iso9660 targets via this
> mechanism. I'm no expert in this kind of thing, but it'll be a good
> learning experience.
>
> I may also potentially be looking to integrate EFI boot into our live CD
> at some stage - if this is of interest I can have a go at adding this to
> buildroot also.
>
> Thanks for your help,
>
> Antony
>
>

-------------- next part --------------
A non-text attachment was scrubbed...
Name: copy_of_my_etc_init_stuff.tar.bz2
Type: application/octet-stream
Size: 11689 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121109/c3b3b3a0/attachment-0001.obj>
