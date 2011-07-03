From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun,  3 Jul 2011 12:47:57 +0200
Subject: [Buildroot] [PATCH 0/1] Bug in the boot process using mdev
Message-ID: <1309690078-9197-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I ran into trouble when trying to activate mdev in buildroot.
The symptoms were amazing, but I won't delight you with them.
I'll report my analysis of the cause and a solution instead.

The init process I use is busybox's init, with the inittab that comes with
buildroot. This starts with:

  # Startup the system
  null::sysinit:/bin/mount -t proc proc /proc
  null::sysinit:/bin/mount -o remount,rw /
  null::sysinit:/bin/mkdir -p /dev/pts
  null::sysinit:/bin/mount -a
  null::sysinit:/bin/hostname -F /etc/hostname
  # now run any rc scripts
  ::sysinit:/etc/init.d/rcS

Busybox init takes the first field, adds "/dev/" in front if it and uses the
result as the input and output device the the process to be launched.
This is normally used for ttys, but in this case the processes will read from
and write to /dev/null.

Alas, /dev/null does not exist when the first few "sysinit" lines are executed,
since it will be created by mdev, which in turn will be launched only by rcS,
in the last of the cited inittab lines.

The result is that some of these processes may spit out weird error messages on
the console, and some will fail.
I didn't go further down on this, but on some tests I got a system without mdev
working and with a /dev/null created as a regular file -- not as a char device.

The story is long, but the solution is actually simple, as you can see in the
patch: just create the /dev/null character device in the target root filsystem,
so it is there also before mdev starts.

I sould not test udev, but it should have the same problem, and the same
solution should work.

Luca

Luca Ceresoli (1):
  Fix boot with mdev

 target/generic/Config.in                    |    2 +-
 target/generic/device_table_dynamic_dev.txt |   10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletions(-)
 create mode 100644 target/generic/device_table_dynamic_dev.txt

-- 
1.7.4.1
