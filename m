From: Ossy <ossy1980@gmx.net>
Date: Wed, 07 Jul 2010 22:14:39 +0200
Subject: [Buildroot] init: I won't write compressed data to a terminal.
In-Reply-To: <87eiff5daa.fsf@macbook.be.48ers.dk>
References: <4C33AB4E.9050604@gmx.net>
	<87pqyz6dpa.fsf@macbook.be.48ers.dk>	<4C34C0C3.4000500@gmx.net>
	<87eiff5daa.fsf@macbook.be.48ers.dk>
Message-ID: <4C34E02F.4090102@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 07.07.2010 20:59, schrieb Peter Korsgaard:
>>>>>> "Ossy" == Ossy<ossy1980@gmx.net>  writes:
>
>   Ossy>  Am 07.07.2010 07:52, schrieb Peter Korsgaard:
>   >>>>>>>  "Ossy" == Ossy<ossy1980@gmx.net>   writes:
>   >>
>   Ossy>  Hi buildroot mailinglist,
>   Ossy>  After successfully compiling a whole rootfs and mounting it via loop
>   Ossy>  on some nfs export I started my arm ebedded device and ran into tho
>   Ossy>  following error after booting the image via tftp.
>   >>
>   Ossy>  "init: I won't write compressed data to a terminal."
>   >>
>   >>  What .config are you using? That string doesn't exist in the busybox
>   >>  init (or anywhere in busybox).
>
>   Ossy>  I'm using the configuration attached (you may need to ignore my custom
>   Ossy>  settings for the sheevaplugbased DockStar).
>
>   Ossy>  I mount the generated rootfs with
>   Ossy>  mount -o loop,ro br_dist/dev/rootfs.ext2 /exports/rootfs/rfs1
>   Ossy>  and export it via nfs. The Kernel supports rootfs over nfs and was
>   Ossy>  able to mount the filesystem via nfs. After that I get the above
>   Ossy>  mentioned error.
>
> You can also simply extract the generated tarball as root instead of the
> ext2 stuff.
I extracted the the tar archive into the directory, but I get the same 
error:
[   26.191501] Looking up port of RPC 100003/2 on 192.168.1.106
[   26.203553] Looking up port of RPC 100005/1 on 192.168.1.106
[   26.280377] VFS: Mounted root (nfs filesystem) on device 0:12.
[   26.286293] Freeing init memory: 112K
init: I won't write compressed data to a terminal.
init: For help, type: `init --help'.
[   26.361526] Kernel panic - not syncing: Attempted to kill init!
[   26.367484] Backtrace:
[   26.369970] [<c0028544>] (dump_backtrace+0x0/0x110) from [<c0314e70>] 
(dump_stack+0x18/0x1c)
[   26.378465]  r7:c7820000 r6:c7820000 r5:4005eef0 r4:c03f89dc
[   26.384207] [<c0314e58>] (dump_stack+0x0/0x1c) from [<c0314ec4>] 
(panic+0x50/0x13c)
[   26.391923] [<c0314e74>] (panic+0x0/0x13c) from [<c003e064>] 
(do_exit+0x6c/0x690)

>   Ossy>  As Mitch already mentioned, this error comes from bzip2 (or maybe
>   Ossy>  gzip). So I guess there is some ext2 inline compression, which is not
>   Ossy>  compatibel with the serial console?
>
> No, as you mount the ext2 on the nfs server and not on your embedded
> box. Have you added any custom init scripts in your tree?
>
> What does a grep -rlis zip * in your /etc give?
ossy at debian-virtual:/exports/rootfs/rfs1/etc$ grep -rlis zip *
profile
services
sysconfig/sysstat
ossy at debian-virtual:/exports/rootfs/rfs1/etc$ less sysconfig/sysstat
# sysstat-9.0.5 configuration file.

# How long to keep log files (in days).
# If value is greater than 28, then log files are kept in
# multiple directories, one for each month.
HISTORY=7

# Compress (using gzip or bzip2) sa and sar files older than (in days):
COMPRESSAFTER=10

sysconfig/sysstat (END)

> I don't see anything wrong with your .config's right away.
