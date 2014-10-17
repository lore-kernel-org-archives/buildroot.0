From: =?UTF-8?B?QW5kcsOpIEVyZG1hbm4=?= <dywi@mailerd.de>
Date: Fri, 17 Oct 2014 11:15:10 +0200
Subject: [Buildroot] systemd: write-up and packaging questions
In-Reply-To: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A4987DD@AMEHLEX02.ehl.pri>
References: <543AC16C.7000100@mailerd.de>
 <CAGduivzUiy3C6rykCd33GE5iAQh+YVJ5LueGp5c5MKTfDeM1-w@mail.gmail.com>
 <A2A6A18A7161D44FBCA90D5B3AF90A2E5A4987DD@AMEHLEX02.ehl.pri>
Message-ID: <5440DE1E.6020205@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Resend / log-copy&paste tricked my mail program into sending it out too early]

2014/10/17 Hiram Van Paassen <Hiram.van.Paassen@mastervolt.com>:
> On zo, 2014-10-12 at 21:12 +0200, Maxime Hadjinlian wrote:
>>   Hi Andr?, All
>>
>> On Sun, Oct 12, 2014 at 7:59 PM, Andr? Erdmann <dywi@mailerd.de> wrote:
>>> Hi,
>>>
>>> Some of the issues pointed out below may be already known, but I couldn't
>>> find any report on this, so I'd like to share my experience with setting up a
>>> systemd-based system that does a little bit more than bringing up a console ;)
>>> Use case was tvheadend with avahi and nfs (+ dropbear etc.), running on a
>>> DreamPlug. Overall it works great, but requires some post-build actions:
>>>
>>> * installation of additional service files
>>>   (I'll propose patches for them sooner or later)
>>> * changes to the default rootfs skeleton
>>> * optional: removal of /etc/init.d etc.
>> I have a patch that I need to send that does just that.
>>>
>>>
>>> Filesystem Layout
>>> =================
>>>
>>> There are some issues with the default rootfs skeleton.
>>> For example, systemd-hostnamed fails to start with the error message
>>> "file exists", likely related to symlinks pointing to /tmp (/run, /var/...).
>>> After some trial-and-error I've figured out that both /run and /var/tmp
>>> symlinks must be replaced with real directories, and that it needs to be done
>>> before booting systemd (at build/image creation time or in initramfs/initrd).
>>>
>>> So, the minimum amount of necessary changes seems to be:
>>> * create /run as directory
>>>   and make /var/run->../run, /var/lock->run/lock link to it;
>>>   /run gets automatically mounted on boot
>>> * create /var/tmp as directory;
>>>   needs manual mount setup (fstab or .mount unit)
>>> * /var/lib/dbus is then a dead link pointing to /tmp/dbus,
>>>   not sure if /run/dbus would be the correct link dest
> We use buildroot with read-only root and we get the following messages
> from systemd-tmpfiles just after boot:
> 
> Jan 01 00:00:18 iris systemd-tmpfiles[70]: chmod(/var) failed: Read-only
> file system
> Jan 01 00:00:18 iris systemd-tmpfiles[70]:
> symlink(../usr/share/zoneinfo/UTC, /etc/localtime) failed: Read-only
> file system
> Jan 01 00:00:18 iris systemd-tmpfiles[70]:
> symlink(../proc/self/mounts, /etc/mtab) failed: Read-only file system
> Jan 01 00:00:18 iris systemd-tmpfiles[70]: chmod(/var/lib) failed:
> Read-only file system
> Jan 01 00:00:18 iris systemd-tmpfiles[70]: chmod(/var/lib/systemd)
> failed: Read-only file system
> Jan 01 00:00:18 iris systemd-tmpfiles[70]:
> chmod(/var/lib/systemd/coredump) failed: Read-only file system
> 
> I suspect some of them stem from an unexpected filesystem layout in
> combination with not being able to change things
> 

Just commenting on this particular issue:

If you don't change the default filesystem layout, then things fail dramatically,
especially when /etc is readonly. That's my experience with systemd+buildroot so far.

I use an aufs squashfs+memory as rootfs, which allows me to track fs changes quite
easily. I've attached some logs below so you can make up your mind on what needs to
be writable. I haven't rebooted the machine since a while and did some
changes in between (e.g. /etc/systemd/system), which can be ignored.


$ grep -v /home /proc/self/mounts

rootfs / rootfs rw,size=254908k,nr_inodes=63727 0 0
proc /proc proc rw,nosuid,nodev,noexec,relatime 0 0
sysfs /sys sysfs rw,nosuid,nodev,noexec,relatime 0 0
mdev /dev devtmpfs rw,nosuid,relatime,size=10240k,nr_inodes=64012,mode=755 0 0
/dev/zram1 /.rootfs_union_root/mem ext4 rw,noatime,discard,nobarrier,commit=240 0 0
sfs_container /.rootfs_union_root/container tmpfs ro,relatime,size=22528k,mode=711 0 0
/dev/loop0 /.rootfs_union_root/loop/rootfs squashfs ro,relatime 0 0
/dev/loop1 /.rootfs_union_root/loop/overlay squashfs ro,relatime 0 0
aufs_rootfs / aufs rw,relatime,si=39d8f4dc,dio,dirperm1 0 0
/dev/zram2 /rw ext4 rw,nodev,noatime,discard,nobarrier,commit=240 0 0
/dev/zram3 /run ext4 rw,nosuid,nodev,noatime,discard,nobarrier,commit=240 0 0
/dev/zram2 /etc/udev ext4 rw,nodev,noatime,discard,nobarrier,commit=240 0 0
/dev/zram2 /status ext4 rw,nodev,noatime,discard,nobarrier,commit=240 0 0
/dev/zram2 /tmp ext4 rw,nodev,noatime,discard,nobarrier,commit=240 0 0
/dev/zram2 /var/log ext4 rw,nodev,noatime,discard,nobarrier,commit=240 0 0
/dev/zram2 /var/www ext4 rw,nodev,noatime,discard,nobarrier,commit=240 0 0
/dev/zram2 /var/tmp ext4 rw,nodev,noatime,discard,nobarrier,commit=240 0 0
/dev/zram2 /var/lib/systemd ext4 rw,nodev,noatime,discard,nobarrier,commit=240 0 0
/dev/zram2 /lib/modules ext4 ro,nodev,noatime,discard,nobarrier,commit=240 0 0
mntfs /.mntfs tmpfs rw,nosuid,nodev,noexec,relatime,size=1024k,mode=775,gid=6 0 0
mntfs /mnt tmpfs rw,nosuid,nodev,noexec,relatime,size=1024k,mode=775,gid=6 0 0
mntfs /media tmpfs rw,nosuid,nodev,noexec,relatime,size=1024k,mode=775,gid=6 0 0
mntfs /data tmpfs rw,nosuid,nodev,noexec,relatime,size=1024k,mode=775,gid=6 0 0
tmpfs /dev/shm tmpfs rw,nodev,noexec,size=4096k 0 0
devpts /dev/pts devpts rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000 0 0
tmpfs /sys/fs/cgroup tmpfs ro,nosuid,nodev,noexec,mode=755 0 0
cgroup /sys/fs/cgroup/systemd cgroup rw,nosuid,nodev,noexec,relatime,xattr,release_agent=/lib/systemd/systemd-cgroups-agent,name=syst$
cgroup /sys/fs/cgroup/cpuset cgroup rw,nosuid,nodev,noexec,relatime,cpuset 0 0
cgroup /sys/fs/cgroup/cpu,cpuacct cgroup rw,nosuid,nodev,noexec,relatime,cpu,cpuacct 0 0
cgroup /sys/fs/cgroup/memory cgroup rw,nosuid,nodev,noexec,relatime,memory 0 0
cgroup /sys/fs/cgroup/devices cgroup rw,nosuid,nodev,noexec,relatime,devices 0 0
cgroup /sys/fs/cgroup/freezer cgroup rw,nosuid,nodev,noexec,relatime,freezer 0 0
cgroup /sys/fs/cgroup/net_cls,net_prio cgroup rw,nosuid,nodev,noexec,relatime,net_cls,net_prio 0 0
cgroup /sys/fs/cgroup/blkio cgroup rw,nosuid,nodev,noexec,relatime,blkio 0 0
systemd-1 /proc/sys/fs/binfmt_misc autofs rw,relatime,fd=22,pgrp=1,timeout=300,minproto=5,maxproto=5,direct 0 0
debugfs /sys/kernel/debug debugfs rw,relatime 0 0
mqueue /dev/mqueue mqueue rw,relatime 0 0
fusectl /sys/fs/fuse/connections fusectl rw,relatime 0 0
nfsd /proc/fs/nfsd nfsd rw,relatime 0 0
binfmt_misc /proc/sys/fs/binfmt_misc binfmt_misc rw,relatime 0 0
(EOF)


$ find /.rootfs_union_root/mem/

/.rootfs_union_root/mem/
/.rootfs_union_root/mem/.wh..wh.aufs
/.rootfs_union_root/mem/lost+found
/.rootfs_union_root/mem/dev
/.rootfs_union_root/mem/dev/.keep
/.rootfs_union_root/mem/dev/shm
/.rootfs_union_root/mem/dev/shm/.keep
/.rootfs_union_root/mem/.keep
/.rootfs_union_root/mem/mnt
/.rootfs_union_root/mem/mnt/.wh..wh..opq
/.rootfs_union_root/mem/etc
/.rootfs_union_root/mem/etc/resolv.conf
/.rootfs_union_root/mem/etc/systemd
/.rootfs_union_root/mem/etc/systemd/system
/.rootfs_union_root/mem/etc/systemd/system/.wh.home-tvheadend.automount
/.rootfs_union_root/mem/etc/systemd/system/tvheadend-backup.timer
/.rootfs_union_root/mem/etc/systemd/system/mongoose at .service
/.rootfs_union_root/mem/etc/systemd/system/multi-user.target.wants
/.rootfs_union_root/mem/etc/systemd/system/multi-user.target.wants/home-tvheadend-nfs.mount
/.rootfs_union_root/mem/etc/systemd/system/tvheadend-backup.service
/.rootfs_union_root/mem/etc/systemd/system/home-tvheadend-nfs.mount
/.rootfs_union_root/mem/etc/systemd/system/home-tvheadend.mount
/.rootfs_union_root/mem/etc/systemd/system/tvheadend.service.d
/.rootfs_union_root/mem/etc/systemd/system/tvheadend.service.d/10-remotefs.conf
/.rootfs_union_root/mem/etc/systemd/system/tvheadend.service.d/09-disk.conf
/.rootfs_union_root/mem/etc/systemd/system/home-tvheadend-nfs.automount
/.rootfs_union_root/mem/etc/group
/.rootfs_union_root/mem/etc/mactab
/.rootfs_union_root/mem/etc/group-
/.rootfs_union_root/mem/etc/machine-id
/.rootfs_union_root/mem/etc/mtab
/.rootfs_union_root/mem/etc/udev
/.rootfs_union_root/mem/etc/udev/.wh..wh..opq
/.rootfs_union_root/mem/etc/.updated
/.rootfs_union_root/mem/etc/gshadow
/.rootfs_union_root/mem/etc/.pwd.lock
/.rootfs_union_root/mem/var
/.rootfs_union_root/mem/var/log
/.rootfs_union_root/mem/var/log/.wh..wh..opq
/.rootfs_union_root/mem/var/www
/.rootfs_union_root/mem/var/www/.wh..wh..opq
/.rootfs_union_root/mem/var/lib
/.rootfs_union_root/mem/var/lib/systemd
/.rootfs_union_root/mem/var/lib/systemd/.wh..wh..opq
/.rootfs_union_root/mem/var/lib/nfs
/.rootfs_union_root/mem/var/lib/nfs/state
/.rootfs_union_root/mem/var/lib/nfs/export-lock
/.rootfs_union_root/mem/var/lib/nfs/.etab.lock
/.rootfs_union_root/mem/var/lib/nfs/.xtab.lock
/.rootfs_union_root/mem/var/.updated
/.rootfs_union_root/mem/var/tmp
/.rootfs_union_root/mem/var/tmp/.wh..wh..opq
/.rootfs_union_root/mem/.wh..wh.plnk
/.rootfs_union_root/mem/.mntfs
/.rootfs_union_root/mem/lib
/.rootfs_union_root/mem/lib/modules
/.rootfs_union_root/mem/data
/.rootfs_union_root/mem/proc
/.rootfs_union_root/mem/proc/.keep
/.rootfs_union_root/mem/status
/.rootfs_union_root/mem/LIRAM_ENV
/.rootfs_union_root/mem/media
/.rootfs_union_root/mem/media/.wh..wh..opq
/.rootfs_union_root/mem/root
/.rootfs_union_root/mem/root/.config
/.rootfs_union_root/mem/root/.config/htop
/.rootfs_union_root/mem/root/.config/htop/htoprc
/.rootfs_union_root/mem/root/.ash_history
/.rootfs_union_root/mem/.keep_zram
/.rootfs_union_root/mem/.wh..wh.orph
/.rootfs_union_root/mem/.rootfs_union_root
/.rootfs_union_root/mem/.rootfs_union_root/container
/.rootfs_union_root/mem/.rootfs_union_root/mem
/.rootfs_union_root/mem/.rootfs_union_root/loop
/.rootfs_union_root/mem/.rootfs_union_root/loop/overlay
/.rootfs_union_root/mem/.rootfs_union_root/loop/rootfs
/.rootfs_union_root/mem/tmp
/.rootfs_union_root/mem/tmp/.wh..wh..opq
/.rootfs_union_root/mem/rw
(EOF)


$ find /rw/

/rw/
/rw/tmp
/rw/tmp/.font-unix
/rw/tmp/mongoose at .service
/rw/tmp/OX
/rw/tmp/.X11-unix
/rw/tmp/.XIM-unix
/rw/tmp/systemd-private-9e485374aa2047b2b83f0565a6f63976-systemd-timesyncd.service-C7UvPb
/rw/tmp/systemd-private-9e485374aa2047b2b83f0565a6f63976-systemd-timesyncd.service-C7UvPb/tmp
/rw/tmp/systemd-private-9e485374aa2047b2b83f0565a6f63976-tvheadend.service-AKkFFI
/rw/tmp/systemd-private-9e485374aa2047b2b83f0565a6f63976-tvheadend.service-AKkFFI/tmp
/rw/tmp/avahi-autopid
/rw/tmp/.Test-unix
/rw/tmp/systemd-private-9e485374aa2047b2b83f0565a6f63976-mongoose at default.service-uNa44A
/rw/tmp/systemd-private-9e485374aa2047b2b83f0565a6f63976-mongoose at default.service-uNa44A/tmp
/rw/tmp/.ICE-unix
/rw/.keep_zram
/rw/etc
/rw/etc/udev
/rw/etc/udev/hwdb.d
/rw/etc/udev/rules.d
/rw/etc/udev/udev.conf
/rw/etc/udev/hwdb.bin
/rw/lost+found
/rw/var
/rw/var/tmp
/rw/var/tmp/.keep
/rw/var/tmp/systemd-private-9e485374aa2047b2b83f0565a6f63976-systemd-timesyncd.service-cLHa5c
/rw/var/tmp/systemd-private-9e485374aa2047b2b83f0565a6f63976-systemd-timesyncd.service-cLHa5c/tmp
/rw/var/tmp/systemd-private-9e485374aa2047b2b83f0565a6f63976-tvheadend.service-5Mbirx
/rw/var/tmp/systemd-private-9e485374aa2047b2b83f0565a6f63976-tvheadend.service-5Mbirx/tmp
/rw/var/tmp/systemd-private-9e485374aa2047b2b83f0565a6f63976-mongoose at default.service-nzzCYB
/rw/var/tmp/systemd-private-9e485374aa2047b2b83f0565a6f63976-mongoose at default.service-nzzCYB/tmp
/rw/var/log
/rw/var/log/btmp
/rw/var/log/wtmp
/rw/var/log/lastlog
/rw/var/log/journal
/rw/var/log/journal/remote
/rw/var/log/journal/.keep
/rw/var/lib
/rw/var/lib/systemd
/rw/var/lib/systemd/clock
/rw/var/lib/systemd/random-seed
/rw/var/lib/systemd/coredump
/rw/var/lib/systemd/timers
/rw/var/lib/systemd/timers/stamp-tvheadend-backup.timer
/rw/var/lib/systemd/catalog
/rw/var/lib/systemd/catalog/database
/rw/var/www
/rw/var/www/htdocs
/rw/var/www/htdocs/sys
/rw/var/www/htdocs/index.html
/rw/zdisk
/rw/zdisk/rw
/rw/zdisk/run
/rw/.keep
/rw/status
/rw/status/system
/rw/status/system/.keep
/rw/status/system/boot-blame.txt
/rw/status/system/boot-time.txt
/rw/status/system/boot-plot.svg
/rw/status/initramfs.log
/rw/lib
/rw/lib/modules
/rw/lib/modules/....
(EOF)


$ systemctl list-units --no-pager

UNIT                                                                            LOAD   ACTIVE SUB       DESCRIPTION
proc-sys-fs-binfmt_misc.automount                                               loaded active running   Arbitrary Executable File Formats File System Automount Point
sys-devices-ocp\x40f1000000-f1012000.serial-tty-ttyS0.device                    loaded active plugged   /sys/devices/ocp at f1000000/f1012000.serial/tty/ttyS0
sys-devices-ocp\x40f1000000-f1050000.ehci-usb1-1\x2d1-1\x2d1.1-1\x2d1.1:1.0-host1-target1:0:0-1:0:0:0-block-sda.device loaded active plugged   STORAGE_DEVICE
sys-devices-ocp\x40f1000000-f1050000.ehci-usb1-1\x2d1-1\x2d1.1-1\x2d1.1:1.0-host1-target1:0:0-1:0:0:1-block-sdb-sdb1.device loaded active plugged   STORAGE_DEVICE dp_tv
sys-devices-ocp\x40f1000000-f1050000.ehci-usb1-1\x2d1-1\x2d1.1-1\x2d1.1:1.0-host1-target1:0:0-1:0:0:1-block-sdb.device loaded active plugged   STORAGE_DEVICE
sys-devices-ocp\x40f1000000-f1050000.ehci-usb1-1\x2d1-1\x2d1.4-1\x2d1.4:1.0-sound-card0.device loaded active plugged   Audio Adapter
sys-devices-platform-mv643xx_eth_port.0-net-eth0.device                         loaded active plugged   /sys/devices/platform/mv643xx_eth_port.0/net/eth0
sys-devices-platform-mv643xx_eth_port.1-net-eth1.device                         loaded active plugged   /sys/devices/platform/mv643xx_eth_port.1/net/eth1
sys-devices-platform-serial8250-tty-ttyS1.device                                loaded active plugged   /sys/devices/platform/serial8250/tty/ttyS1
sys-devices-virtual-block-loop0.device                                          loaded active plugged   /sys/devices/virtual/block/loop0
sys-devices-virtual-block-loop1.device                                          loaded active plugged   /sys/devices/virtual/block/loop1
sys-devices-virtual-block-zram0.device                                          loaded active plugged   /sys/devices/virtual/block/zram0
sys-devices-virtual-block-zram1.device                                          loaded active plugged   /sys/devices/virtual/block/zram1
sys-devices-virtual-block-zram2.device                                          loaded active plugged   /sys/devices/virtual/block/zram2
sys-devices-virtual-block-zram3.device                                          loaded active plugged   /sys/devices/virtual/block/zram3
sys-devices-virtual-block-zram4.device                                          loaded active plugged   /sys/devices/virtual/block/zram4
sys-devices-virtual-block-zram5.device                                          loaded active plugged   /sys/devices/virtual/block/zram5
sys-devices-virtual-block-zram6.device                                          loaded active plugged   /sys/devices/virtual/block/zram6
sys-devices-virtual-block-zram7.device                                          loaded active plugged   /sys/devices/virtual/block/zram7
sys-devices-virtual-net-lan0.device                                             loaded active plugged   /sys/devices/virtual/net/lan0
sys-devices-virtual-net-sit0.device                                             loaded active plugged   /sys/devices/virtual/net/sit0
sys-devices-virtual-tty-ttyprintk.device                                        loaded active plugged   /sys/devices/virtual/tty/ttyprintk
sys-module-fuse.device                                                          loaded active plugged   /sys/module/fuse
sys-subsystem-net-devices-eth0.device                                           loaded active plugged   /sys/subsystem/net/devices/eth0
sys-subsystem-net-devices-eth1.device                                           loaded active plugged   /sys/subsystem/net/devices/eth1
sys-subsystem-net-devices-lan0.device                                           loaded active plugged   /sys/subsystem/net/devices/lan0
sys-subsystem-net-devices-sit0.device                                           loaded active plugged   /sys/subsystem/net/devices/sit0
-.mount                                                                         loaded active mounted   /
\x2emntfs.mount                                                                 loaded active mounted   /.mntfs
\x2erootfs_union_root-container.mount                                           loaded active mounted   /.rootfs_union_root/container
\x2erootfs_union_root-loop-overlay.mount                                        loaded active mounted   /.rootfs_union_root/loop/overlay
\x2erootfs_union_root-loop-rootfs.mount                                         loaded active mounted   /.rootfs_union_root/loop/rootfs
\x2erootfs_union_root-mem.mount                                                 loaded active mounted   /.rootfs_union_root/mem
data.mount                                                                      loaded active mounted   /data
dev-mqueue.mount                                                                loaded active mounted   POSIX Message Queue File System
etc-udev.mount                                                                  loaded active mounted   /etc/udev
home-tvheadend-nfs.mount                                                        loaded active mounted   tv recording dir
home-tvheadend.mount                                                            loaded active mounted   tv home dir
lib-modules.mount                                                               loaded active mounted   /lib/modules
media.mount                                                                     loaded active mounted   /media
mnt.mount                                                                       loaded active mounted   /mnt
proc-fs-nfsd.mount                                                              loaded active mounted   NFS Configuration File System
proc-sys-fs-binfmt_misc.mount                                                   loaded active mounted   Arbitrary Executable File Formats File System
rw.mount                                                                        loaded active mounted   /rw
status.mount                                                                    loaded active mounted   /status
sys-fs-fuse-connections.mount                                                   loaded active mounted   FUSE Control File System
sys-kernel-debug.mount                                                          loaded active mounted   Debug File System
tmp.mount                                                                       loaded active mounted   /tmp
var-lib-systemd.mount                                                           loaded active mounted   /var/lib/systemd
var-log.mount                                                                   loaded active mounted   /var/log
var-tmp.mount                                                                   loaded active mounted   /var/tmp
var-www.mount                                                                   loaded active mounted   /var/www
systemd-ask-password-console.path                                               loaded active waiting   Dispatch Password Requests to Console Directory Watch
systemd-ask-password-wall.path                                                  loaded active waiting   Forward Password Requests to Wall Directory Watch
avahi-daemon.service                                                            loaded active running   Avahi mDNS/DNS-SD Stack
dbus.service                                                                    loaded active running   D-Bus System Message Bus
dropbear.service                                                                loaded active running   Dropbear SSH daemon
kmod-static-nodes.service                                                       loaded active exited    Create list of required static device nodes for the current kernel
mongoose at default.service                                                        loaded active running   Mongoose HTTP Daemon
nfsd.service                                                                    loaded active exited    NFS server
rc-local.service                                                                loaded active exited    Runs /etc/rc.local on startup
rpc-mountd.service                                                              loaded active running   NFS Mount Daemon
rpc-statd.service                                                               loaded active running   NFSv2/3 Network Status Monitor Daemon
rpcbind.service                                                                 loaded active running   RPC Bind
serial-getty at ttyS0.service                                                      loaded active running   Serial Getty on ttyS0
systemd-journal-catalog-update.service                                          loaded active exited    Rebuild Journal Catalog
systemd-journald.service                                                        loaded active running   Journal Service
systemd-logind.service                                                          loaded active running   Login Service
systemd-networkd-wait-online.service                                            loaded active exited    Wait for Network to be Configured
systemd-networkd.service                                                        loaded active running   Network Service
systemd-random-seed.service                                                     loaded active exited    Load/Save Random Seed
systemd-remount-fs.service                                                      loaded active exited    Remount Root and Kernel File Systems
systemd-resolved.service                                                        loaded active running   Network Name Resolution
systemd-sysctl.service                                                          loaded active exited    Apply Kernel Variables
systemd-sysusers.service                                                        loaded active exited    Create System Users
systemd-timesyncd.service                                                       loaded active running   Network Time Synchronization
systemd-tmpfiles-setup-dev.service                                              loaded active exited    Create Static Device Nodes in /dev
systemd-tmpfiles-setup.service                                                  loaded active exited    Create Volatile Files and Directories
systemd-udev-hwdb-update.service                                                loaded active exited    Rebuild Hardware Database
systemd-udev-trigger.service                                                    loaded active exited    udev Coldplug all Devices
systemd-udevd.service                                                           loaded active running   udev Kernel Device Manager
systemd-update-done.service                                                     loaded active exited    Update is Completed
systemd-update-utmp.service                                                     loaded active exited    Update UTMP about System Boot/Shutdown
systemd-user-sessions.service                                                   loaded active exited    Permit User Sessions
tvheadend.service                                                               loaded active running   tvheadend
-.slice                                                                         loaded active active    Root Slice
system-mongoose.slice                                                           loaded active active    system-mongoose.slice
system-serial\x2dgetty.slice                                                    loaded active active    system-serial\x2dgetty.slice
system.slice                                                                    loaded active active    System Slice
user.slice                                                                      loaded active active    User and Session Slice
avahi-daemon.socket                                                             loaded active running   Avahi mDNS/DNS-SD Stack Activation Socket
dbus.socket                                                                     loaded active running   D-Bus System Message Bus Socket
systemd-initctl.socket                                                          loaded active listening /dev/initctl Compatibility Named Pipe
systemd-journald-dev-log.socket                                                 loaded active running   Journal Socket (/dev/log)
systemd-journald.socket                                                         loaded active running   Journal Socket
systemd-shutdownd.socket                                                        loaded active listening Delayed Shutdown Socket
systemd-udevd-control.socket                                                    loaded active running   udev Control Socket
systemd-udevd-kernel.socket                                                     loaded active running   udev Kernel Socket
dev-zram0.swap                                                                  loaded active active    /dev/zram0
basic.target                                                                    loaded active active    Basic System
getty.target                                                                    loaded active active    Login Prompts
local-fs-pre.target                                                             loaded active active    Local File Systems (Pre)
local-fs.target                                                                 loaded active active    Local File Systems
multi-user.target                                                               loaded active active    Multi-User System
network-online.target                                                           loaded active active    Network is Online
network.target                                                                  loaded active active    Network
paths.target                                                                    loaded active active    Paths
remote-fs-pre.target                                                            loaded active active    Remote File Systems (Pre)
remote-fs.target                                                                loaded active active    Remote File Systems
rpcbind.target                                                                  loaded active active    RPC Port Mapper
slices.target                                                                   loaded active active    Slices
sockets.target                                                                  loaded active active    Sockets
sound.target                                                                    loaded active active    Sound Card
swap.target                                                                     loaded active active    Swap
sysinit.target                                                                  loaded active active    System Initialization
time-sync.target                                                                loaded active active    System Time Synchronized
timers.target                                                                   loaded active active    Timers
statusfs-bootstat.timer                                                         loaded active elapsed   Exports bootup stats via /status
systemd-tmpfiles-clean.timer                                                    loaded active waiting   Daily Cleanup of Temporary Directories
tvheadend-backup.timer                                                          loaded active waiting   weekly tvheadend config backup

LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.

120 loaded units listed. Pass --all to see loaded but inactive units, too.
To show all installed unit files use 'systemctl list-unit-files'.
(EOF)

> Also service with PrivateTmp=true won't work because the need
> the /tmp /var/tmp split
> 
> See systemd-journal-gatewayd as an example of a systemd service that
> cannot be started in the default configuration
> 
>>>
>>>
>>> Unit Files
>>> ==========
>>>
>>> This section is mostly about packaging guidelines,
>>> the manual doesn't answer the questions below.
>> You're right, the manual is really in need of update on that subject.
>> But there are some pending changes for which I already have patch that
>> I am currently finishing.
>>>
>>> Installation
>>> ------------
>>>
>>> systemd's libdir is /lib/system.
>>> Most unit files (.service et al) are installed to /etc/systemd/system,
>>> systemd's own unit files are installed to /lib/systemd/system and some
>>> packages(*) install their files to /usr/lib/systemd/system, which is rather
>>> confusing. Either dir works (search order is /etc > /lib > /usr/lib),
>>> but what's the recommended location?
>> If I'm reading the FHS correctly, /usr/lib/systemd/ would the the
>> targets and what nots for systemd itself, and so everything in /etc is
>> hosts specific so I would keep everything installed by our packages in
>> /etc/systemd/system.
> I think this depends on your viewpoint:
> /usr/lib is for "distros" since you might say that buildroot is
> generating a custom distro I would say that one might want to
> use /usr/lib
> 
> This keeps /etc/ for making persistent changes based on individual
> systems and /run/ for making non persistent changes
> 
> systemd itself mostly uses /lib
> 
> Also:
> See my other mail about systemctl for an hour ago (was unaware of this
> discussion) The script I'm referring to, taken from open-embedded
> uses /etc to install symlinks to.
> So open-embedded seems to have chosen /etc for enable-symlinks
> independent of where the original unit files are installed (as per
> systemctl behavior I suppose)
> 
>>> I'd prefer to have them installed in one dir (systemd's libdir).
>>>
>>> (*) grepping yields nginx and connman
>>>
>>>
>>> Auto-Enabling
>>> -------------
>>>
>>> Most packages enable their unit files by default(*), others don't.
>>> Example: lighttpd gets enabled, nginx does not.
>>> Is there any policy for when [not] to enable services?
>>>
>>> (*) "ln -s <unit> /etc/systemd/system/<target>.target.wants/<unit>"
>> IMHO, we should enable by default for the moment. The users can
>> disable everything through a post-build script.
>> A better way to handle that, would be, as Samuel Martin said on IRC,
>> to have some infra like the users table to handle what you want to be
>> enabled or not.
>> But that may needs an RFC so we could start discussing this.
> I don't think you want to enable by default since systemd already
> provides a lot of units not enabled by default (journal-gatewayd for
> example)
> 
> See my other mail "systemctl enable" for a suggestion how to handle
> enabling
>>>
>>>
>>> Maybe it'd make sense to introduce some SYSTEMD_ variables so that
>>> packages don't have to hardcode/guess systemd file paths, for example:
>>> * SYSTEMD_LIBDIR          (= /lib/systemd)
>>> * SYSTEMD_UNITDIR         (= $(SYSTEMD_LIBDIR)/system)
>>> * SYSTEMD_CONFDIR         (= /etc/systemd)
>>> * SYSTEMD_UNITCONFDIR     (= $(SYSTEMD_CONFDIR)/system)
>>> * relpath from <confdir> to <libdir> (= ../..$(SYSTEMD_LIBDIR))
>>> * relpath from <confdir>/system to <libdir>/system (= ../../$(SYSTEMD_UNITDIR))
>>>
>>> Bonus: export these variables to post-build scripts
>> Yes, it would be really nice.
>>>
>>>
>>> --
>>> Andr?
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
> ________________________________
> 
> Power Products, LLC Email Notice
> 
> This message is intended only for the use of the Addressee and may contain information that is PRIVILEGED and/or CONFIDENTIAL.
> This email is intended only for the personal and confidential use of the recipient(s) named above. If the reader of this email is not an intended recipient, you have received this email in error and any review, dissemination, distribution or copying is strictly prohibited.
> If you have received this email in error, please notify the sender immediately by return mail and permanently delete the copy you received.
> 
> Thank you.
> 


 
