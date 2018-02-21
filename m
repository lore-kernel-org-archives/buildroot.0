From: Christian Stewart <christian@paral.in>
Date: Wed, 21 Feb 2018 17:30:37 -0500
Subject: [Buildroot] 
 =?utf-8?b?W0phbiBLdW5kcsOhdF0gIFtQQVRDSCAxLzNdIHN5?=
 =?utf-8?q?stemd=3A_Ensure_/run_and_/var/run_are_the_same_on_R/O_rootfs?=
In-Reply-To: <4c98d294-42c6-45f7-b518-f5d7901ad0db@cesnet.cz>
References: <87k1vfz2m4.fsf@paral.in> <87eflnyxjy.fsf@paral.in>
 <4c98d294-42c6-45f7-b518-f5d7901ad0db@cesnet.cz>
Message-ID: <87d10yrn5e.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan,

To preface this note, it seems OK against the new release RC.

Jan Kundr?t <jan.kundrat@cesnet.cz> writes:
>> [   16.650294] systemd[1]: System is tainted: var-run-bad
>
> Systemd reports that your /var/run is "bad". From what you wrote later, 
> that's indeed the root cause which should be fixed.

From what I've seen a lot of things can cause this taint, but I actually
have not yet been able to find a single place where it's listed what
this error actually means. The directory tree is there, and I haven't
really modified it.

> Now, my patch fixed it only for a read-only rootfs. I assumed that 
> everything worked well on a regular, r/w rootfs.

The system I'm running is a bit non-standard, I basically execute an
initramfs and then mount a ramfs to make the rootfs read/write.

> Can you please:
>
> - state whether you're using a read-only or read-write rootfs 
> (BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW config option),

BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y

> - confirm that you completely nuked your build dir after applying this 
> patch,

Yes.

> - check which packages actually provide your /var/run and /run, and how 
> your setup looks like, i.e.:
>   - grep ,./run build/packages-file-list.txt
>   - grep ,./var build/packages-file-list.txt
>   - 
> - how is your /etc/fstab?

% grep ,./run build/packages-file-list.txt
skeleton-init-common,./run

% grep ,./var build/packages-file-list.txt
skeleton-init-systemd,./var
linux-pam,./var/run
linux-pam,./var/run/sepermit
systemd,./var/log/README
systemd,./var/lib
systemd,./var/lib/systemd
systemd,./var/log
systemd,./var/log/journal
dbus,./var/lib/dbus/machine-id
dbus,./var/lib/dbus
dbus,./var/run/dbus
dhcpcd,./var/db
network-manager,./var/lib/NetworkManager
openssh,./var/empty

% grep dbus build/packages-file-list.txt | grep run
dbus,./usr/bin/dbus-run-session
dbus,./var/run/dbus

% cat target/etc/fstab
# <file system> <mount pt>      <type>  <options>       <dump>  <pass>
proc            /proc           proc    defaults        0       0
devpts          /dev/pts        devpts  defaults,gid=5,mode=620 0       0
tmpfs           /dev/shm        tmpfs   mode=0777       0       0
tmpfs           /tmp            tmpfs   mode=1777       0       0
tmpfs           /run            tmpfs   mode=0755,nosuid,nodev  0       0
sysfs           /sys            sysfs   defaults        0       0

>> # ls /var/run/
>
> These are not sufficient as they do not show the type of the individual 
> items. `ls -al` should be better.

my mistake, I usually use -lah.

# ls -lah /var/run/
total 20K
drwxr-xr-x  7 root root     0 Feb 21 22:18 .
drwxr-xr-x 11 root root     0 Feb 21 22:18 ..
drwxr-xr-x  3 root root     0 Feb 21 22:18 NetworkManager
drwxr-xr-x  2 dbus dbus     0 Feb 21 22:18 dbus
drwxr-xr-x  3 root root     0 Feb 21 22:18 dhcpcd
-rw-r--r--  1 root root     4 Feb 21 22:18 dhcpcd.pid
srw-rw----  1 root root     0 Feb 21 22:18 dhcpcd.sock
srw-rw-rw-  1 root root     0 Feb 21 22:18 dhcpcd.unpriv.sock
drwx------  5 root root     0 Feb 21 22:18 docker
-rw-r--r--  1 root root     3 Feb 21 22:18 docker.pid
srw-rw----  1 root docker   0 Feb 21 22:18 docker.sock
-rw-r--r--  1 root root     6 Feb 21 22:18 ifstate
drwxr-xr-x  2 root root     0 Feb 16 11:48 sepermit
-rw-r--r--  1 root root     4 Feb 21 22:18 sshd.pid
-rw-r--r--  1 root root   384 Feb 21 22:24 utmp

>> If I link dbus like so:
>>
>> # ln -s /var/run/dbus/ /run/dbus
>>
>> It seems then that everything works fine.
>
> Yeah, that's it. Based on how I read the code, though, this should already 
> happen on a regular installation without a r/o rootfs...

I upgraded Docker to the new RC and it seems OK now. I do have your
patch applied:

4aaada448b * docker-engine: bump to v17.12.1-ce-rc1
4ff748f908 * docker-containerd: bump to v1.0.1
35e27a785d * runc: bump to 9f9c96235cc
cdf17f32a2 * docker-engine: add dependency on docker-proxy
aa01038df2 * docker-proxy: new package
f642b99974 * docker-engine: select static for tini and dumb-init
011a49093a * docker-engine: add support for init processes
4bbf8495d1 * dumb-init: new package
da2b6103ec * tini: new package
72024b7e5a * generate-ipv6-address: new package
b00d9c9711 * rtl8192cu: new package
8f6e68358e * rtl8821au: bump to latest
7c4f49d4d9 * go: bump to 1.10
15e767672f * systemd: Ensure /run and /var/run are the same on R/O rootfs
5f6e1c0d61 * support/dependencies: recognize C.UTF-8 as a utf8 locale
44cec6431c * 2018.02-rc2 Update for 2018.02-rc2
5e66d15646 * libcpprestsdk: needs host-pkgconf

Best,
Christian
