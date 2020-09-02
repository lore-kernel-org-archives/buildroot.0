From: tomas <tomas.arredondo.vidal@gmail.com>
Date: Wed, 2 Sep 2020 00:53:56 -0400
Subject: [Buildroot] user question about missing SELinux seclabel in ubifs /
 ramfs mounts and init approach
Message-ID: <CAJF66WoKbQuva2UiXDKY7boRa2k6eDvkpP0wagTtvsnWxDfBpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have been trying to get a BR ubifs FS mount to have the SELinux *seclabel
*flag enabled and also I am in need of direction about the init script.  If
someone could please help it would mean a lot to me.

I have mainly followed these REFS:
1- https://bootlin.com/blog/creating-flashing-ubi-ubifs-images/
2-
https://bootlin.com/pub/conferences/2013/kernel-recipes/rootfs-kernel-developer/rootfs-kernel-developer.pdf
3- https://buildroot.org/downloads/manual/customize-configuration.txt
4- https://buildroot.org/downloads/manual/manual.html
5- https://fossies.org/linux/buildroot/docs/manual/customize-rootfs.txt
And read this:
https://unix.stackexchange.com/questions/507293/can-a-ubifs-be-set-as-acl/507308#507308
Including this warning: "Note, currently mkfs.ubifs ignores extended
attributes and does not write them to the target file-system image."

Approach 1: So ignoring any warnings I first tried something like:
  33 umount /mnt/library
  34  ubidetach -m  4
  35 rm -Rf /mnt/library
  36  ubiformat -y "/dev/mtd4"
  37 ubiattach /dev/ubi_ctrl -m 4
  38 ubimkvol /dev/ubi0 -N library -m
  39  ubiupdatevol -t /dev/ubi0_0  <=== WITH AND WITHOUT THIS
  41 mkdir /mnt/library
  42 mount -v -t ubifs -o defcontext=system_u:object_r:ncoreapi_content_t
-o sync ubi0:library /mnt/library

and got something like:
    mount -v -t ubifs -o defcontext=system_u:object_r:f_content_t -o sync u
bi0:library /mnt/library
UBIFS (ubi0:0): default file-system created
UBIFS (ubi0:0): Mounting in unauthenticated mode
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 1550
UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "library"
UBIFS (ubi0:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes:
2048 bytes/2048 bytes
UBIFS (ubi0:0): FS size: 497238016 bytes (474 MiB, 3916 LEBs), journal size
24887296 bytes (23 MiB, 196 LEBs)
UBIFS (ubi0:0): reserved for root: 4952683 bytes (4836 KiB)
UBIFS (ubi0:0): media format: w5/r0 (latest is w5/r0), UUID
B768642E-F953-4363-A13A-1F4A2FDE4356, small LPT model
SELinux: defcontext option is invalid for this filesystem type
UBIFS (ubi0:0): un-mount UBI device 0
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" stops
mount: mounting ubi0:library on /mnt/library failed: Invalid argument

==>>> "SELinux: defcontext option is invalid for this filesystem type"

(Also tried without the defcontext in the mount with the result of no
seclabel again.)

Approach 2: Then I tried something like this which sort of matches solution
A of REF 1:
   3 umount /mnt/library
   4  ubidetach -m  4
   5 rm -Rf /mnt/library
   6 ubiformat -y "/dev/mtd4"
   7 ubiattach /dev/ubi_ctrl -m 4
   8 ubimkvol /dev/ubi0 -N library -m
   9 pwd
  10 ubiupdatevol /dev/ubi0_0 /etc/init.d/ubifs.img
  11 mkdir /mnt/library
  12 mount -v -t ubifs -o defcontext=system_u:object_r:ncoreapi_content_t
-o sync ubi0:library /mnt/library
  13 mount
  14 mount -v -t ubifs -o sync ubi0:library /mnt/library
  15 mount

This is how I made the ubifs.img in the host:
~/rootfs/home$ mkfs.ubifs -r /home/tarredondo/rootfs/home/updater -m 2048
-e 126976  -c 160 -o ~/rootfs/home/ubifs.img
which seems to have worked ok...  (used this command in the target to get
the params:
# ubinfo /dev/ubi0ubi0)

(I still got the defcontext invalid for this filesystem type thing so tried
without the defcontext option in the mount but still no seclabel...grrrrr)

# mount
# ubi0:library on /mnt/library type ubifs
(rw,sync,relatime,assert=read-only,ubi=0,vol=0)
# ramfs on /run/info type ramfs (rw,relatime)

Looking at the code in
/buildroot/output/build/linux-headers-5.1.9/security/selinux/hooks.c
I think it is a lack of XATTR or something but not sure:
                if (sbsec->behavior != SECURITY_FS_USE_XATTR &&
                        sbsec->behavior != SECURITY_FS_USE_NATIVE) {
                        rc = -EINVAL;
                        pr_warn("SELinux: defcontext option is "
                               "invalid for this filesystem type\n");
                        goto out;
                }
# uname -a
Linux nshield- 5.1.9 #1 SMP Tue Sep 1 22:55:57 EDT 2020 ppc64 GNU/Linux

refpolicy-2.20190609.tar.bz2

defconfig:
BR2_PACKAGE_LIBSELINUX=y
BR2_PACKAGE_REFPOLICY=y
BR2_PACKAGE_SETOOLS=y
BR2_PACKAGE_POLICYCOREUTILS=y
BR2_PACKAGE_SELINUX_PYTHON=y
BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW=y

Kernel UBIFS .config:
CONFIG_UBIFS_FS=y
CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
CONFIG_UBIFS_FS_LZO=y
CONFIG_UBIFS_FS_ZLIB=y
CONFIG_UBIFS_ATIME_SUPPORT is not set
CONFIG_UBIFS_FS_XATTR=y
CONFIG_UBIFS_FS_SECURITY=y

So is there no way this can work?  I can't seem to find
explicit documentation indicating that this should/should not work anywhere
:-(  It looks like ramfs mounts also does not have the seclabel attribute
:-(   Is the answer jffs2 and tmpfs as they do show the seclabel and they
do respond to restoreconf commands?

Last question is about my init/relabel approach, would it be "basically OK"
to check .autorelabel and if XATTR is supported run restoreconf -Rv / then
del .autorelabel and reboot.  Then on reboot put in enforcing mode?  There
are some other directories/such that would have some special handling but I
am only looking for general validation as again I don't see explicit
examples anywhere without fixfiles, semanage etc aside from an old patch
like this: (
https://lists.busybox.net/pipermail/buildroot/2016-July/167822.html).

Really appreciate any information.

Best regards,
Tomas V. Arredondo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200902/255359f4/attachment-0001.html>
