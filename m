From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Oct 2012 17:29:31 +0200
Subject: [Buildroot] read-only NFS devtmpfs mount fails
In-Reply-To: <1349189984.20063.YahooMailNeo@web171606.mail.ir2.yahoo.com>
References: <1349189984.20063.YahooMailNeo@web171606.mail.ir2.yahoo.com>
Message-ID: <20121002172931.297a7cd7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Massimo Callegari,

On Tue, 2 Oct 2012 15:59:44 +0100 (BST), Massimo Callegari wrote:

> I'm running buildroot 2012.05 on a MIPSel device, custom kernel 3.3.0.?I'm testing over NFS, building a .TAR target.
> When devices are created statically and fs is mounted in RW, all is OK.
> When I try to use devtmpfs (with or without udev) and read-only filesystem over NFS, I am not able to obtain a dynamic /dev creation.
> I thought the kernel was supposed to do the mounting automagically, but since I'm mounting a NFS tree my init script is busybox, so I added?this instruction at the beginning of /etc/inittab:
> 
> ::sysinit:/bin/mount -t devtmpfs devtmpfs /dev
> 
> 
> Although I get this error:
> mount: mounting devtmpfs on /dev failed: No such device
> 
> 
> I've read a lot of forums and docs and checked everything I could.?
> On my kernel folder: "grep TMPFS .config"?says:
> CONFIG_DEVTMPFS=y
> CONFIG_DEVTMPFS_MOUNT=y

This option normally mounts automatically devtmpfs at boot time, even
before your init application starts. So normally, you have nothing to
do in userspace to get devtmpfs ready.

Are you sure you are running a kernel that has this configuration?

> I also had to create some devices manually to avoid several errors, especially for /dev/null (isn't buildroot supposed to create a minimum set of devices to avoid this ?) so I created these:
> 
> crw-rw-rw- ?1 root root ?5, ?1 2012-10-01 17:14 console
> crw-rw-rw- ?1 root root ?1, ?3 2012-10-01 17:14 null
> 
> crw-rw-rw- ?1 root root ?4, ?0 2012-10-01 17:14 tty0
> 
> crw-rw-rw- ?1 root root ?4, 64 2012-10-01 17:16 ttyS0
> crw-rw-rw- ?1 root root ?1, ?5 2012-10-01 17:38 zero

If you tell Buildroot that you're using devtmpfs, then Buildroot no
longer creates device files, as those are no longer necessary.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
