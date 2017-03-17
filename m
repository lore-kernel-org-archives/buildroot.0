From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Fri, 17 Mar 2017 17:02:54 +0100
Subject: [Buildroot] =?iso-8859-1?q?=5BPATCH_1/1=5D_Fix_permissions_on_/de?=
	=?iso-8859-1?q?v/pts/ptmx_for_PTY_allocation_with_systemd?=
Message-ID: <35a6c994-5279-4823-8864-be52f6f925ef@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(This is my first patch to buildroot, please feel free to pester me if you 
prefer a different coding style or if you have some commit message 
suggestions.)

Without this patch, it is not possible to allocate PTYs when a generated 
rootfs image with a recent glibc and systemd is launched as a container  on 
an RHEL7 system via machinectl/systemd-nspawn. The container boots, but 
`machinectl login mycontainer` fails. The culprit is /dev/pts/ptmx with 
0000 perms.

On a typical system, there are two `ptmx` devices. One is provided by the 
devpts at /dev/pts/ptmx and it is typically not directly accessed from 
userspace. The other one which actually *is* opened by processes is 
/dev/ptmx. Kernel's documentation says these days that /dev/ptmx should be 
either a symlink, or a bind mount of the /dev/pts/ptmx from devpts.

When a container is launched via machinectl/machined/systemd-nspawn, the 
container manager prepares a root filesystem so that the container can live 
in an appropriate namespace (this is similar to what initramfs is doing on 
x86 desktops). During these preparations, systemd-nspawn mounts a devpts 
instance using a correct ptmxmode=0666 within the container-to-be's 
/dev/pts, and it adds a compatibility symlink at /dev/ptmx. However, once 
systemd takes over as an init in the container, 
/lib/systemd/systemd-remount-fs applies mount options from /etc/fstab to 
all fileystems. Because the buildroot's template used to not include the 
ptmxmode=... option, a default value of 0000 was taking an effect which in 
turn led to not being able to allocate any pseudo-terminals.

The relevant kernel option was introduced upstream in commit 1f8f1e29 back 
in 2009. The oldest linux-headers referenced from buildroot's config is 
3.0, and that version definitely has that commit. I believe that adding 
this mount option therefore does not constitute any backward 
incompatibility issues.

Cheers,
Jan
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Fix-permissions-on-dev-pts-ptmx-for-PTY-allocation-w.patch
Type: text/x-patch
Size: 2774 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170317/77d931d0/attachment.bin>
