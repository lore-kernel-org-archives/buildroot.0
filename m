From: Trent Piepho <tpiepho@impinj.com>
Date: Thu, 22 Feb 2018 23:06:15 +0000
Subject: [Buildroot] Issue getting /var/lib created correctly with RO rootfs
 and systemd
Message-ID: <1519340775.25567.164.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've found that /var/lib is not getting created correctly with a RO
rootfs and systemd.

What buildroot does is have ${TARGET_DIR}/var be a symlink to
${TARGET_DIR}/usr/share/factory/var.  Then, as a rootfs build step, it
turns each entry in ${TARGET_DIR}/usr/share/factory/var/* into a
tmpfiles line to copy that tree into the real /var (a tmpfs) on the
target.

So one gets /etc/tmpfiles.d/var-factory.conf with lines like:
C! /var/empty
C! /var/lib
C! /var/www

The problem is that systemd-tmpfiles behavior for "C!" if the target
directory already exists is to silently do nothing (which is
documented, if not helpful in this case).

It turns out during boot, before tmpfiles is run, something in systemd
will create /var/lib/systemd/catalog.

So when tmpfiles gets to "C! /var/lib", rather than recursively
populate /var/lib from /usr/share/factory/var/lib, it does nothing,
because /var/lib already exists.

My hacky solution is to modify SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR to
processes not just $(TARGET_DIR)/usr/share/factory/var/*, but also
...var/lib/*, and ...var/lib/systemd/*.  Then one gets:

C! /var/empty - - - -
C! /var/lib - - - -
C! /var/www - - - -
C! /var/lib/dbus - - - -
C! /var/lib/nginx - - - -
C! /var/lib/systemd - - - -
C! /var/lib/systemd/coredump - - - -

The /var/lib line may do nothing, but then the /var/lib/dbus, etc.
lines will take care of the rest of the tree /var/lib.

It occurs to me if that if tmpfiles had a "merge tree" operation that
would pull in new files/directories even if the destination tree
exists, rather than do nothing, one could use:
M! /var
and be done with it.

buildroot making $TARGET_DIR/var a symlink to
$TARGET_DIR/usr/share/factory/var has problems if anything wants to
create a symlink in /var.  For instance, if one creates:
ln -s ../run $TARGET_DIR/var/run

You do not get a link that has $TARGET_DIR/var/run point to
$TARGET_DIR/run as desired, but rather
$TARGET_DIR/usr/share/factory/var/../run.

It can still work if the link is made correctly, ../../../../run, but
one has to know if target/var is really target/var or a link.  It seems
nicer if anything creating a symlink in /var didn't need to know if the
rootfs was RO or not.

So maybe it would be better to leave target/var as a real directory,
then create target/usr/share/factory/var from it at rootfs creation
time?
