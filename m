From: Pierre Ficheux <pierre.ficheux@openwide.fr>
Date: Sun, 18 Sep 2011 15:01:51 +0200
Subject: [Buildroot] mdev problem in 2011.08 ?
Message-ID: <4E75EBBF.9080203@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

May be I'm wrong but it seems there is a problem when using mdev for
/dev management:

/dev management (Dynamic using mdev)

The /dev/null device is needed by /etc/inittab when mounting /proc and
/sys. As it does not exist because S10mdev is started later, /sys is not
mounted and mdev -s does not work.

# Startup the system
null::sysinit:/bin/mount -t proc proc /proc
null::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
null::sysinit:/bin/mkdir -p /dev/pts
null::sysinit:/bin/mkdir -p /dev/shm
null::sysinit:/bin/mount -a
null::sysinit:/bin/hostname -F /etc/hostname
# now run any rc scripts
::sysinit:/etc/init.d/rcS

I fixed it for my test by adding the following line to /etc/inittab

::sysinit:/bin/mknod /dev/null c 1 3


regards

-- 
Pierre FICHEUX -/- CTO OW/OWI, France -\- pierre.ficheux at openwide.fr
                                         http://ingenierie.openwide.fr
                                         http://www.ficheux.org
I would love to change the world, but they won't give me the source code
