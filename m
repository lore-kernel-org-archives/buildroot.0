From: =?UTF-8?Q?Andr=C3=A9_Erdmann?= <dywi@mailerd.de>
Date: Fri, 17 Oct 2014 08:32:27 +0200
Subject: [Buildroot] systemd: write-up and packaging questions
In-Reply-To: <543EBBDB.5010500@mind.be>
References: <543AC16C.7000100@mailerd.de>
	<543EBBDB.5010500@mind.be>
Message-ID: <CAGrucu08YvuSJ72kMrJFM9MCY-MviULtjKafC+AxUxvu2faZiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2014-10-15 20:24 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
> On 12/10/14 19:59, Andr? Erdmann wrote:
>> Hi,
>>
>> Some of the issues pointed out below may be already known, but I couldn't
>> find any report on this, so I'd like to share my experience with setting up a
>> systemd-based system that does a little bit more than bringing up a console ;)
>> Use case was tvheadend with avahi and nfs (+ dropbear etc.), running on a
>> DreamPlug. Overall it works great, but requires some post-build actions:
>>
>> * installation of additional service files
>>   (I'll propose patches for them sooner or later)
>
>  Sooner would be good, because we've had several other reports of systemd not
> working.
>

I'm on it ;) But it won't be that many files (nfs/rpcbind, tvheadend
and mongoose); In most cases I just adapted (copy&edit) files from
Gentoo, Arch or the upstream repo

>> * changes to the default rootfs skeleton
>
>  Actually this is the one that should be done soon.
>
>> * optional: removal of /etc/init.d etc.
>
>  Someone is working on that.
>
>>
>>
>> Filesystem Layout
>> =================
>>
>> There are some issues with the default rootfs skeleton.
>> For example, systemd-hostnamed fails to start with the error message
>> "file exists", likely related to symlinks pointing to /tmp (/run, /var/...).
>> After some trial-and-error I've figured out that both /run and /var/tmp
>> symlinks must be replaced with real directories, and that it needs to be done
>> before booting systemd (at build/image creation time or in initramfs/initrd).
>>
>> So, the minimum amount of necessary changes seems to be:
>> * create /run as directory
>>   and make /var/run->../run, /var/lock->run/lock link to it;
>>   /run gets automatically mounted on boot
>
>  This is something that we can easily do. Except, we should then also mount a
> tmpfs on /run in the non-systemd case.
>

Is replacing /run,/var/run,/var/lock and editing /etc/fstab in
system/skeleton sufficient? I'm aware that the fstab entry is not
required for systemd, but it doesn't hurt either.

>> * create /var/tmp as directory;
>>   needs manual mount setup (fstab or .mount unit)
>
>  This also needs to be a tmpfs by the way. Very annoying to have all these tmpfses.
>

Could also be bind-mounted from /tmp. Still another mountpoint that
needs to be taken care of, but maybe more backwards-compatible and
would share its mount options (e.g. size limit) with /tmp.

>> * /var/lib/dbus is then a dead link pointing to /tmp/dbus,
>>   not sure if /run/dbus would be the correct link dest
>
>  Can't we just make /var/lib/dbus/machine-id a symlink to /tmp/machine-id? Or
> does that not work?
>
I don't know. /tmp/((dbus/)?)machine-id exists on
sysvinit/busybox-init systems only where /etc/init.d/S30dbus creates
it.

On a systemd-booted machine, /var/lib/dbus is empty (when created as
dir) and there's only /etc/machine-id, which gets created as an empty
file by the systemd package; systemd then generates an ID during
bootup and writes it to /etc/machine-id if possible, else it gets
written to /run/machine-id and bind-mounted.

Symlinking /etc/machine-id to /tmp/machine-id is not an option (I
tried it). systemd then believes to boot a stateless system ("empty
/etc"), services fail to start, e.g. systemd-tmpfiles, and the journal
is empty. It can be worked around by mounting /tmp and creating an
empty /tmp/machine-id before exec-ing systemd's init, but that's far
from being practical.

What about symlinking /var/lib/dbus/machine-id to /etc/machine-id for
systemd-based systems and keeping /var/lib/dbus as-is (symlink)
otherwise (non-systemd)? If that violates the readonly rootfs
scenario, we'd need another solution.

> [snip] Maxime already commented on the rest.
>
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
