From: Steve Calfee <nospamcalfee@yahoo.com>
Date: Wed, 15 Dec 2010 11:27:49 -0800 (PST)
Subject: [Buildroot] [PATCH] New package to do a complete build for the
	seagate dockstar hardware.
Message-ID: <346343.68761.qm@web58207.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I keep getting bounced by spam filters and too big emails. So I will try again 
with a tar.gz of my patch


From README for dockstar

All this started with a Seagate Dockstar buildroot contribution by Marcus
Osdoba. He got the original patches set up etc. The buildroot maintainers
want a minimal configuration so other uses can bring up a buildroot
distribution and add their own packages. I left a few that are essential to
using a dockstar without opening up the case.  So I removed most of Marcus'
packages and changed the kernel config to match the dockstar's hardware.
The dockstar is a USB machine with also a gigabit ethernet interface.  So I
configured the kernel to allow booting from from either nfs or usb or the
internal nand flash.  This was after installing Jeff Doozan's uboot which
also could handle this.

The differences needed in the target's file system skeleton are minor, but
important.  So locally, in this device directory, I put a skeleton
filesystem that you want to overlay the default system in fs/skeleton. For
a minimal system only etc/inittab is changed.

All files will be added by the patchscript on every build. So change here,
for your personal configuration, not in the fs/skeleton.

Note that I added a password to etc/shadow for user "root" which is
password "root" so ssh connections to the target are possible.  But this
also affects the serial connection, so the password will need to be used
there too.

While developing and testing, prevent annoying edits of the host ~/.ssh/...
file to change the keys, copy the target's /etc/dropbear/ directory into
the skeleton/etc here and it will be reapplied after every build and so the
keys won't change on the target. If you don't do this dropbear will
regenerate the keys on the first startup. I provide Marcus' initial
dropbear keys here, just copy the dropbear dir to the local
target/device/sheevaplug/SeagateDockStar/skeleton/etc/ directory and then
you will only need to type "yes" the first time to ssh.

Cleaning up the target filesystem is a problem in Buildroot (and clean is
painfully slow). However everything put in the skeleton dir here
(target/device/sheevaplug/SeagateDockStar/skeleton) will be installed every
build.

Similarly it is a pain to try and do everything in one buildroot source
tree.  The clean or distclean targets require the rebuild of everything,
compiler, uclibc library, busybox, buildroot, and the target packages. To
avoid this, check out a complete tree and build it. Then check out another
complete tree. Then in the new tree copy the
target/device/sheevaplug/SeagateDockStar/dockstar_external_toolchain_defconfig
config to the configs directory. You will have to edit the toolchain path
in that config to point to your previously build toolchain in the other
buildroot tree.

In the new tree do a "make dockstar_external_toolchain_defconfig". and use
the just made toolchain and libraries as external toolchains. It saves at
least half the build time.

I have not tried it yet, but both Linux and u-boot can also be built in other
trees to save "clean" problems and allow hacking.

U-boot - I have not tried to use Marcus' build patches for u-boot. I have
successfully downloaded and installed Jeff Doozan's dockstar uboot and use
it with dockstar.  It is dangerous changing the bootstrap - if it is messed
up it means possibly "bricking" the dockstar and forcing either a jtag
recovery, or figuring out how to recover with a xmodem terminal, or setting
up an attractive plastic paperweight.

U-boot - as a future project I would like to try (or have someone else try
it) to set up U-boot to use a usb serial dongle. The kernel already will
start with a USB serial dongle console (except for the very early start up
time), and going to a uboot dongle will mean I no longer have to crack the
pretty plastic case (to get at rs232) to do hacking. Supposedly both
Doozan's u-boot and the kernel will also boot with a netconsole.
---
configs/dockstar_defconfig                         |   83 +
target/device/Config.in                            |    1 +
target/device/sheevaplug/Config.in                 |   13 +
target/device/sheevaplug/Makefile.in               |    4 +
.../device/sheevaplug/SeagateDockStar/Makefile.in  |    5 +
target/device/sheevaplug/SeagateDockStar/README    |   70 +
.../SeagateDockStar-busybox-1.17.x.config          |  966 +++++++++++
.../SeagateDockStar-linux-2.6.36.1.config          | 1781 ++++++++++++++++++++
.../SeagateDockStar_uClibc-0.9.31.config           |  259 +++
.../dockstar_external_toolchain_defconfig          |   83 +
.../dockstar_internal_toolchain_defconfig          |  833 +++++++++
.../SeagateDockStar/dropbear/dropbear_dss_host_key |  Bin 0 -> 458 bytes
.../SeagateDockStar/dropbear/dropbear_rsa_host_key |  Bin 0 -> 426 bytes
...itions-for-the-Seagate-FreeAgent-DockStar.patch |   48 +
...ns-used-by-the-Seagate-FreeAgent-DockStar.patch |   31 +
...for-the-SheevaPlug-to-reflect-the-changes.patch |   46 +
.../sheevaplug/SeagateDockStar/patchrootfs.sh      |   14 +
.../SeagateDockStar/skeleton/etc/inittab           |   46 +
.../sheevaplug/SeagateDockStar/skeleton/etc/shadow |   12 +
...Change-RAM-definitions-to-one-bank-128-MB.patch |   42 +
...6-0002-DockStar-environment-is-at-0xa0000.patch |   27 +
...boot-2010.06-0003-DockStar-MTD-partitions.patch |   27 +
...4-DockStar-Change-prompt-and-ident-string.patch |   35 +
...-0007-DockStar-Include-long-help-messages.patch |   24 +


      
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-New-package-to-do-a-complete-build-for-the-seagate-d.patch.tar.gz
Type: application/x-gzip
Size: 33894 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101215/36be73f0/attachment-0001.bin>
