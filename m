From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Jan 2011 14:23:36 +0100
Subject: [Buildroot] [git commit master 1/1] docs: remove outdated files
Message-ID: <20110115132856.C465F8A2EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f55d8dff351fa8d08e9acc2d5688380b0864d77e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Misleading/outdated docs is worse than no documentation.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 TODO                  |   17 ----
 docs/README           |    4 +-
 docs/README.diskimage |   37 -------
 docs/TESTING.html     |   67 -------------
 docs/U-boot.html      |  254 -------------------------------------------------
 docs/patches.html     |   43 --------
 scripts/mkpkg         |  109 ---------------------
 7 files changed, 1 insertions(+), 530 deletions(-)
 delete mode 100644 TODO
 delete mode 100644 docs/README.diskimage
 delete mode 100644 docs/TESTING.html
 delete mode 100644 docs/U-boot.html
 delete mode 100644 docs/patches.html
 delete mode 100755 scripts/mkpkg

diff --git a/TODO b/TODO
deleted file mode 100644
index bf98fea..0000000
--- a/TODO
+++ /dev/null
@@ -1,17 +0,0 @@
-Buildroot2 TODOs
-
-- fix packages/Makefile.autotools.in to use a package-imposed patchdir
-  (Ivan Kuten)
-- convert all packages that use autoconf to use the infrastructure of
-  packages/Makefile.autotools.in
-- fix setting of flags for packages
-
-- coreutils: use make install-strip to install the packages. For now,
-  it fails beause even if we pass STRIP="/path/to/$(ARCH)-strip", the
-  coreutils build system uses the host strip to strip target
-  binaries. The ./configure execution done by Buildroot properly
-  detects the cross-strip, but when running make, build-aux/missing
-  gets run, complains about aclocal-1.10c and atuomake-1.10c not being
-  present, and rerun the configuration... with the wrong environment
-  variables (STRIP= is missing). An autoreconf on this package is
-  probably necessary.
diff --git a/docs/README b/docs/README
index e756329..974adeb 100644
--- a/docs/README
+++ b/docs/README
@@ -4,15 +4,13 @@ To build and use the buildroot stuff, do the following:
 2) select the packages you wish to compile
 3) run 'make'
 4) wait while it compiles
-5) Use your shiny new root filesystem.  Depending on which sortof
+5) Use your shiny new root filesystem. Depending on which sort of
     root filesystem you selected, you may want to loop mount it,
     chroot into it, nfs mount it on your target device, burn it
     to flash, or whatever is appropriate for your target system.
 
 You do not need to be root to build or run buildroot.  Have fun!
 
- -Erik
-
 Offline build:
 ==============
 
diff --git a/docs/README.diskimage b/docs/README.diskimage
deleted file mode 100644
index 67a0aad..0000000
--- a/docs/README.diskimage
+++ /dev/null
@@ -1,37 +0,0 @@
-# Sample for i386 to create a 6MB disk-image
-
-# create an image file
-dd if=/dev/zero bs=512 count=$((6*1024*1024/512)) of=img
-# create a partition (optional)
-echo -e "n\np\n1\n\nw\n" | \
-  ~/src/busybox/busybox fdisk -C 16065 -H 255 -S 63 ./img
-# as root, associate the image with a look-device:
-# The offset of 512 comes from the the layout of the image. See
-# ~/src/busybox/busybox fdisk -C 16065 -H 255 -S 63 -l ./img for the start
-# block and multiply this with the block size (==512).
-~/src/busybox/busybox losetup -o 512 /dev/loop/0 /path/to/the/img
-# create some filesystem on it, for example ext2
-mkfs.ext2 -m0 -Lslash /dev/loop/0
-# mount it and copy your stuff to it
-~/src/busybox/busybox mount -oloop,rw /dev/loop/0 /media/l0
-~/src/busybox/busybox mkdir -p /media/l0/boot/grub
-~/src/busybox/busybox cp -a project_build_i386/root/boot/grub/stage? /media/l0/boot/grub/
-~/src/busybox/busybox cp -a project_build_i386/root/boot/bzImage /media/l0/boot/
-~/src/busybox/busybox cat > /media/l0/boot/grub/menu.lst <<EOF
-title=GNU/Linux
-root (hd0,0)
-kernel /boot/bzImage
-EOF
-# finally unmount the dist and disassociate the loopdev
-~/src/busybox/busybox umount /media/l0
-~/src/busybox/busybox losetup -d /dev/loop/0
-# now install grub from the chroot
-~/src/busybox/busybox losetup /dev/loop/0 /path/to/the/img
-project_build_i386/root/usr/sbin/grub --device-map=/dev/null
-device (hd0) img
-geometry (hd0) 16065 255 63
-root (hd0,0)
-setup (hd0)
-quit
-# finally boot the thing
-/opt/qemu-trunk_ggi-2.2.2/bin/qemu -snapshot -hda img -boot c
diff --git a/docs/TESTING.html b/docs/TESTING.html
deleted file mode 100644
index 0f320ee..0000000
--- a/docs/TESTING.html
+++ /dev/null
@@ -1,67 +0,0 @@
-<!--#include file="header.html" -->
-
-<h2>Testing Buildroot for an Architecture</h2>
-
-<p>
-<h4>scripts/mkpkg script</h4>
-If you want to test the build of a single package you can use the mkpkg script.
-</p>
-<p>
-<li>$ scripts/mkpkg PACKAGE</li> 
-</p>
-<p>
-Will make the board, and save the result in a log file.
-The log file resides in
-<li>$ log/OK/PACKAGE.log.OK</li> 
-</p>
-<p>
-if the build succeeds and in
-<li>$ log/OK/PACKAGE.log.FAIL</li>
-</p>
-<p>
-if it cannot complete.
-</p>
-
-<p>
-By creating an alias
-<li>alias mk=scripts/mkpkg</li>
-</p>
-<p>
-it is enough to type
-<li>$ mk PACKAGE</li> 
-</p>
-<p>
-mkpkg will only print out the <h4>{PACKAGE}......OK</h4> or <h4>{PACKAGE}......FAIL</h4>
-depending on success or failure making it easy to get an overview
-of the status of this specific architecture.
-</p>
-<p>
-It is recommended to build a simple board before running the test
-to get some basic things done.
-</p>
-<p>
-<h4>scripts/buildall.sh script</h4>
-</p>
-<p>
-By running this script you will run scripts/mkpkg on
-a lot of the packages available in Buildroot.
-</p>
-<p>
-You need to run the script while in the TOP directory.
-I.E: Where you typically run make.
-</p>
-<p>
-There are a few lacking, for no very good reason,
-but these can be easily added.
-</p>
-<p>
-Note that some packages will not build properly
-if you do not enable them using makeconfig.
-</p>
-<p>
-Examples are:
-<li>freetype</li>
-<li>socat</li>
-</p>
-
-<!--#include file="footer.html" -->
diff --git a/docs/U-boot.html b/docs/U-boot.html
deleted file mode 100644
index 7d78e00..0000000
--- a/docs/U-boot.html
+++ /dev/null
@@ -1,254 +0,0 @@
-<?xml version="1.0" encoding="iso-8859-1"?>
-<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
-	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
-
-<html xmlns="http://www.w3.org/1999/xhtml">
-<head>
-	<title>Buildroot - U-boot extensions in 2009.01-rc1</title>
-	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
-	<link rel="stylesheet" type="text/css" href="stylesheet.css" />
-</head>
-
-<body>
-	<div class="main">
-	<div class="titre">
-	<a name="top" id="top"></a>
-	<h1>U-boot extensions in 2009.01-rc1</h1>
-	</div>
-
-	<p><a href="http://buildroot.net/">U-Boot</a>
-	usage and documentation by Ulf Samuelsson.
-	</p>
-
-	<ul>
-		<li><a href="#about">About U-Boot</a></li>
-		<li><a href="#at91rm9200dk">Board Support for AT91RM9200DK</a></li>
-		<li><a href="#at91rm9200ek">Board Support for AT91RM9200EK</a></li>
-		<li><a href="#at91sam9g20ek">Board Support for AT91SAM9G20EK</a></li>
-		<li><a href="#Minicom extensions">X-Modem/Raw extensions to minicom</a></li>
-		<li><a href="#cmd_factory">New Command: factory</a></li>
-		<li><a href="#cmd_os">New Command: os</a></li>
-		<li><a href="#cmd_fs">New Command: fs</a></li>
-		<li><a href="#cmd_setargs">New Command: setargs</a></li>
-		<li><a href="#cmd_led">New Command: led</a></li>
-		<li><a href="#cmd_mux">New Command: mux</a></li>
-		<li><a href="#cmd_ethinit">New Command: ethinit</a></li>
-		<li><a href="#environment">Special environment variables</a></li>
-	</ul>
-	<h2><a name="about" id="about"></a>About U-boot</h2>
-	<a href="#top"><small>[TOP]</small></a>
-
-	<p>
-	U-Boot is an open source bootloader ported to a multitude of processors.
-	See (<a href="http://www.denx.de/wiki/U-Boot/WebHome">U-Boot Home</a>)
-	for documentation for vanilla U-Boot. This document only describes
-	changes compared to the vanilla u-boot.
-	</p>
-
-	<h2><a name="at91rm9200dk" id="at91rm9200dk"></a>Board support for at91rm9200dk</h2>
-	<a href="#top"><small>[TOP]</small></a>
-
-	<p>
-	"at91rm9200dk" is updated to use a linux like API for gpio.
-	A new target "at91rm9200dk_df" is defined to support boot from dataflash.
-	</p>
-
-	<h2><a name="at91rm9200ek" id="at91rm9200ek"></a>Board support for at91rm9200ek</h2>
-	<a href="#top"><small>[TOP]</small></a>
-
-	<p>
-	The "at91rm9200ek" BSP supports booting from a parallel flash.
-	The "at91rm9200df" BSP supports a generic target booting from dataflash.
-	</p>
-
-	<h2><a name="#at91sam9g20ek" id="#at91sam9g20ek"></a>Board support for at91sam9g20ek</h2>
-	<a href="#top"><small>[TOP]</small></a>
-
-	<p>
-	The "at91sam9g20ek" target with dataflash(card) and NAND boot support.
-	</p>
-
-	<h2><a name="minicom_extensions" id="minicom_extensions"></a>Minicom extensions </h2>
-	<a href="#top"><small>[TOP]</small></a>
-
-	<p>
-	"sx-at91" is a reliable X-Modem application allowing download to the at91rm9200
-	based board
-	</p>
-	<p>
-	"raw-at91" is a download application which will download binary data using minicom.
-	Typically used to download an environment script.
-	</p>
-
-	<h2><a name="cmd_factory" id="cmd_factory"></a>New command: factory</h2>
-	<a href="#top"><small>[TOP]</small></a>
-
-	<p>
-	<h3><code>factory</code></h3>
-	</p>
-
-	<p>
-	"factory" will set a selected set of environment variables 
-	back to the compile time default. The following will give some
-	hints on capabilities, but is not yet complete.
-	</p>
-
-	<p>
-	It will generate a set of scripts which will facilitate downloading
-	the kernel and root file system using tftp and will also
-	add commands to store into and retrieve from flash
-	</p>
-
-	<h2><a name="cmd_os" id="cmd_os"></a>New command: os</h2>
-	<a href="#top"><small>[TOP]</small></a>
-
-	<p>
-	<h3><code>os<code></h3>
-	</p>
-	<p>
-	"os" computes a new name for the linux kernel
-	</p>
-
-	<h2><a name="cmd_fs" id="cmd_fs"></a>New command: fs</h2>
-	<a href="#top"><small>[TOP]</small></a>
-
-	<p>
-	<h3><code>fs<code></h3>
-	</p>
-	<p>
-	"fs" computes a new name for the file system
-	</p>
-
-	<h2><a name="cmd_setargs" id="cmd_setargs"></a>New command: setargs</h2>
-	<a href="#top"><small>[TOP]</small></a>
-	<p>
-	<h3><code>setargs<code></h3>
-	</p>
-	<p>
-	"setargs" will create new bootcmd/bootargs combination from
-	kernel name, filesystem name, and rootfs type.
-	</p>
-
-	<h2><a name="cmd_led" id="cmd_led"></a>New command: led</h2>
-	<a href="#top"><small>[TOP]</small></a>
-
-	<p>
-	<h3><code>led [green | yellow | red | all ]  [ on | off ]<code></h3>
-	</p>
-
-	<p>
-	"led" will turn on or off the specified (coloured) led
-	</p>
-
-	<h2><a name="cmd_mux" id="cmd_mux"></a>New command: mux</h2>
-	<a href="#top"><small>[TOP]</small></a>
-
-	<p>
-	<h3><code>mux [spi | mmc ]<code></h3>
-	</p>
-
-	<p>
-	"mux" will select how to use the flash card connector on the 
-	at91rm9200dk or at91rm9200ek
-	</p>
-
-	<h2><a name="cmd_ethinit" id="cmd_ethinit"></a>New command: ethinit</h2>
-	<a href="#top"><small>[TOP]</small></a>
-
-	<p>
-	<h3><code>ethinit<code></h3>
-	</p>
-
-	<p>
-	"ethinit" can be used to delay the boot of linux, until a valid network
-	connection has been established. This is useful if the machine is NFS mounting
-	the root file system and both this machine and the NFS server are powering up
-	simultaneously. The NFS server could take a lot longer to boot, and waiting
-	for this to boot may be neccessary for proper operation.
-	</p>
-
-	<h2><a name="environment" id="environment"></a>Special environment variables</h2>
-	<a href="#top"><small>[TOP]</small></a>
-
-	<p>
-	<h3><code>rd<code></h3>
-	</p>
-	<p>
-	rd contains the name of the current root file system
-	It is autmatically generated from <bold>ver</bold> and <bold>rd-1</bold>, <bold>rd-2</bold> etc.
-	The "fs-date" is added at the end.
-	</p>
-
-	<p>
-	<h3><code>ver<code></h3>
-	</p>
-	<p>
-	You can handle a number of different root fs by defining <code>ver</code>.
-	When running <code>fs</code> rd will be assigned from one of:
-	<ul><code>rd-1, rd2, rd-3 ...<code></ul>
-	</p>
-	<p>
-	By defining <code>ver</code> to a number you will
-	select the appropriate disk name 
-	</p>
-
-	<p>
-	<h3><code>fs-date<code></h3>
-	</p>
-	<p>
-	"date" part of the root file system name
-	</p>
-
-	<p>
-	<h3><code>linux<code></h3>
-	</p>
-	<p>
-	linux contains the name of the current kernel.
-	</p>
-	<p>
-	It is generated from several environment variables when <code>os</code> is run
-	</p>
-	<p>
-	A typical name would be "at91sam9263ek-linux-2.6.28-20090105.gz"
-	</p>
-
-	<p>
-	<h3><code>hostname<code></h3>
-	</p>
-	<p>
-	"name" part of the kernel file name
-	</p>
-
-	<p>
-	<h3><code>kernel-version<code></h3>
-	</p>
-	<p>
-	"version" part of the kernel file name
-	</p>
-
-	<p>
-	<h3><code>kernel-date<code></h3>
-	</p>
-	<p>
-	"date" part of the kernel file name
-	</p>
-
-	<p>
-	<h3><code>fstype [ ram | flash ]<code></h3>
-	<p>
-	You can have several file system types.
-	bootargs is created depending on fstype..
-	</p>
-
-	<a href="#top"><small>[TOP]</small></a>
-
-	</div>
-<!--
-	<a href="http://validator.w3.org/check?uri=referer"><img
-	border="0" height="31" width="88"
-	src="images/valid-html401.png"
-	alt="Valid HTML"></img></a>
--->
-
-</body>
-</html>
diff --git a/docs/patches.html b/docs/patches.html
deleted file mode 100644
index 2d886e5..0000000
--- a/docs/patches.html
+++ /dev/null
@@ -1,43 +0,0 @@
-<!--#include file="header.html" -->
-
-<h2>Buildroot patch structure</h2>
-
-<p>
-<h4>Keeping track of applied patches</h4>
-Whenever a patch is applied to a source code directory in buildroot, a text file named .applied_patches_list is created inside that source directory. 
-This file contains a list of all the patch filenames that were applied to that source code, just for reference. 
-</p>
-
-<p>
-<h4>Linux kernel patches</h4>
-The Linux kernel has several patch levels available for it in the buildroot patch system. 
-Buildroot first downloads the chosen kernel source from the mirror site, followed by any selected minor patch.
-Buildroot then extracts the kernel source from the compressed file and applies the minor patch, if one was chosen.
-After extracting the source and applying the official minor patch, buildroot looks for more patches in the following locations and in the order shown:
-
-<ol>
-<li> a custom, user downloaded kernel patch can be located in $(DL_DIR) and the filename is stored as $(LINUX26_BSP_PATCH) </li>
-<li> Atmel keeps their official kernel patches in target/device/Atmel/Linux/kernel-patches with subdirectories for each kernel release. 
-They also keep any board-specific patches in $(BR2_BOARD_PATH) </li>
-<li> globally available patches are kept in toolchain/kernel-headers </li>
-<li> IPMI (<a href="http://www.intel.com/design/servers/ipmi/ipmi.htm">Intelligent Platform Management Interface</a>) 
-kernel patches are kept in toolchain/kernel-headers/ipmi </li>
-<li> LZMA kernel compression support patches are kept in toolchain/kernel-headers/lzma </li>
-<li> <a href="http://www.realtimelinuxfoundation.org/downloads/downloads.html">Real-time Linux kernel</a> patches are kept in $(LINUX_RT_SOURCE) </li>
-<li> <a href="http://www.openswan.org/">Openswan</a> kernel patches are kept in package/openswan </li>
-</ol>
-</p>
- 
- <p>
- <h4>Package source patches</h4>
- Any patches for the Linux programs supported by buildroot are kept in that program's corresponding package/ directory.
- </p>
- 
- <p>
- <h4>How the patching is done</h4>
-Patches are applied in buildroot by running a shell script called toolchain/patch-kernel.sh with three arguments. The first argument is the target directory
-where the source code to be patched is saved. The second argument is the directory where the patch is saved. The third argument is the filename pattern
-to match when looking in the patch directory. The third argument can include wildcards to select multiple patch files. 
-</p>
-
-<!--#include file="footer.html" -->
diff --git a/scripts/mkpkg b/scripts/mkpkg
deleted file mode 100755
index 4db0fef..0000000
--- a/scripts/mkpkg
+++ /dev/null
@@ -1,109 +0,0 @@
-#!/bin/bash
-OK=0
-FAIL=1
-TOPDIR=`pwd`
-LOG_FILE=$1.log
-LOG_DIR=${TOPDIR}/log/
-LOG=${LOG_DIR}/${LOG_FILE}
-DEPENDENCY=${LOG_DIR}/DEPEND/$1.depend.txt
-
-LOG_OK_DIR=${LOG_DIR}/OK
-LOG_FAIL_DIR=${LOG_DIR}/FAIL
-LOG_OK_FILE=${LOG_OK_DIR}/${LOG_FILE}.OK
-LOG_FAIL_FILE=${LOG_FAIL_DIR}/${LOG_FILE}.FAIL
-
-mkdir -p ${LOG_DIR}
-mkdir -p ${LOG_OK_DIR}
-mkdir -p ${LOG_FAIL_DIR}
-mkdir -p ${LOG_DIR}/DEPEND
-
-test=${OK}
-
-function	clean_files()
-{
-	rm -f ${LOG}
-	rm -f ${LOG_OK_FILE}
-	rm -f ${LOG_FAIL_FILE}
-	rm -f ${DEPENDENCY}
-}
-
-function	dirclean ()
-{
-	make $1-dirclean > /dev/null 2>&1
-}
-
-function	process ()
-{
-	make $1 >> ${LOG} 2>&1 || test=${FAIL}
-	grep "\.tar\." ${LOG} > ${DEPENDENCY}
-	if [ ${test} = ${OK} ] ; then
-		mv ${LOG} ${LOG_OK_FILE}
-		printf "%-16s" "OK"
-		if [ "${2}X" != "X" ] ; then
-			printf	"%-16s"	"\"$2\"";
-		fi
-		if [ "${3}X" != "X" ] ; then
-			printf	"%s"	"\"$3\"";
-		fi
-		echo
-	else
-		mv ${LOG} ${LOG_FAIL_FILE}
-		printf "%-16s" "FAIL"
-		if [ "${2}X" != "X" ] ; then
-			printf	"%-16s"	"\"$2\"";
-		else
-			printf	"%-16s"	"\"\""
-		fi
-		if [ "${3}X" != "X" ] ; then
-			printf	"%s"	"\"$3\"";
-		fi
-		echo
-	fi
-}
-
-function build_package ()
-{
-	# echo "BUILD PACKAGE:1=$1 2=$2 3=$3 4=$4 5=$5 6=$6 7=$7"
-	printf "mk	%-32s" "$1"
-	if [ "$2X" = "X" ] ; then		# no parameters
-		clean_files	$1
-		dirclean	$1
-		process		$1 "$3"
-	elif [ "$2X" = "?X" ] ; then		# no parameters
-		clean_files	$1
-		dirclean	$1
-		process		$1 "$3"
-	elif [ "$2X" = "OKX" ] ; then	# Previous build was OK
-		clean_files	$1
-		dirclean	$1
-		process		$1 "$3"
-	elif [ "$2X" = "FAILX" ] ; then
-		clean_files	$1
-		dirclean	$1
-		process		$1 "$3"
-	elif [ "$2X" = "BROKENX" ] ; then
-		printf  "%-16s" "BROKEN"
-		if [ "${3}X" != "X" ] ; then
-			printf	"%s"	"\"$3\"";
-		fi
-		echo
-	elif [ "$2X" = "DISABLEDX" ] ; then
-		printf  "%-16s" "DISABLED"
-		if [ "${3}X" != "X" ] ; then
-			printf	"%s"	"\"$3\"";
-		fi
-		echo
-	else
-		printf  "%-16s" "?BROKEN"
-		if [ "${3}X" != "X" ] ; then
-			printf	"%s"	"\"$3\"";
-		fi
-		echo
-	fi
-}
-
-#build_package $1 $2 "\"$3\""
-build_package $1 $2 "$3"
-
-
-
-- 
1.7.3.4
