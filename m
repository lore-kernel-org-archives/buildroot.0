From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 20 Jul 2020 13:32:12 +0200
Subject: [Buildroot] Handling read-only mounts in buildroot
Message-ID: <CADYdroPb7G4hP+PnTfCMNvA8M0gmWEmuDQgZ8Oxc6Cnp=6zB=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I ran my head against the hidden logic in buildroot, which will be inadvertently
triggered if one dares to pick the REMOUNT_ROOTFS_RW option.

I brought up some deficiencies in [1], it boils down to this,
that there is a copy operation in the image creation phase,
and a replacement started on the running system.
Both operations care little about the previous state, or issues
related to the order in the phase they are executed.

It might be possible to improve the logic (handling symlinks, picking
file names that are lexicographically late/early) but I consider this
a very narrow and fragile concept.

-   REMOUNT_ROOTFS_RW should only add/change an entry to /etc/fstab
-   There are multiple ways to create a ro base installation (and many
more outside of the scope of buildroot, like handling this in the
initrd), so make any logic an explicit option or a own package.
-   Find one solution that works the same or similar with all init systems.

I attached one possible solution, currently only for systemd. Did not
package as BR package,
but it's basically "production-ready". Just unpack it into
/usr/lib/systemd/system.

The benefits would be that it's design:

-   unties all packages from side-effects.
-   filesystem is otherwise untouched
-   no dependency and sideffects on/with tmpfilesd, create image hooks
-   same solution could be used for openrc/sysv/busybox
-   could be distributed/maintained as separate package
    (and thus easily replaced by another read-only package)

Norbert

[1] - http://lists.busybox.net/pipermail/buildroot/2020-July/287016.html
[2] - http://lists.busybox.net/pipermail/buildroot/2020-July/287200.html
[3] - http://lists.busybox.net/pipermail/buildroot/2020-July/287359.html
-------------- next part --------------
A non-text attachment was scrubbed...
Name: bmountvar.tar
Type: application/x-tar
Size: 10240 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200720/d167ecb3/attachment.tar>
