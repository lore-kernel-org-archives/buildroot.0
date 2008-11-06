From: hartleys <hartleys@visionengravers.com>
Date: Thu, 6 Nov 2008 13:11:01 -0500
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <COL102-DS184854396C0DF2D8C3CCEFDC1E0@phx.gbl>
References: <20081106125430.01B343C758@busybox.net>
	<BD79186B4FD85F4B8E60E381CAEE1909C92005@mi8nycmail19.Mi8.com>
	<COL102-DS184854396C0DF2D8C3CCEFDC1E0@phx.gbl>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909C92102@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, November 06, 2008 10:45 AM, Dan Laird wrote:
> My change will not have quite made it there due to MTD using its own
> variables.
> 
> I think I have a local change much like the one you have indicated.
> I wonder if mtd 1.2 etc can be autotool'ed?

Not sure about 1.2, currently ./package/mtd/mtd-utils/mtd.mk fetches
1.1.0 which just has a Makefile build.

> I am just putting the finishing touches to the patch I spoke about
> which allows use of a config.cache file (configurable) It is
> throwing up the occasional dependency that is not correct at the
moment.
> Hopefully once in configuring will be faster and better than it is
right
> now.....

Just ran into another problem with the patch.

I deleted my generated root filesystem and kernel to make sure
everything still works. I'm not sure of the "correct" way to do this so
I just deleted the following:

./binaries/*/*
./project_build_arm/*/autotools-stamps/*
./project_build_arm/*/root
./project_build_arm/*/.root

I have done this before and it worked then.

When I try a make with you patch I get an error right after the external
toolchain libraries have been copied to the filesystem.

I think the next step is when buildroot tries to build the kernel
modules. This is the error message:

rm -rf
/home/bigguiness/buildroot/project_build_arm/ep9307/root/lib/modules/2.6
.27.4
rm -f
/home/bigguiness/buildroot/project_build_arm/ep9307/root/sbin/cardmgr
/usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm
CFLAGS_KERNEL="-Os
-I/home/bigguiness/buildroot/build_arm/staging_dir/include
-I/home/bigguiness/buildroot/build_arm/staging_dir/usr/include
-I/usr/local/arm/4.1.1-920t/arm-linux/include"
INSTALL_MOD_PATH=/home/bigguiness/buildroot/project_build_arm/ep9307/roo
t CROSS_COMPILE=/usr/local/arm/4.1.1-920t/bin/arm-linux-
LDFLAGS="-L/home/bigguiness/buildroot/build_arm/staging_dir/lib
-L/home/bigguiness/buildroot/build_arm/staging_dir/usr/lib
-Wl,--rpath-link
-Wl,/home/bigguiness/buildroot/build_arm/staging_dir/lib
-Wl,--rpath-link
-Wl,/home/bigguiness/buildroot/build_arm/staging_dir/usr/lib"
LZMA="/home/bigguiness/buildroot/toolchain_build_arm/bin/lzma" -C
/home/bigguiness/buildroot/project_build_arm/ep9307/linux-2.6.27.4
modules
make[1]: Entering directory
`/home/bigguiness/buildroot/project_build_arm/ep9307/linux-2.6.27.4'
  CHK     include/linux/version.h
make[2]: `include/asm-arm/mach-types.h' is up to date.
  CHK     include/linux/utsrelease.h
  CALL    scripts/checksyscalls.sh
<stdin>:1097:2: warning: #warning syscall fadvise64 not implemented
<stdin>:1265:2: warning: #warning syscall migrate_pages not implemented
<stdin>:1321:2: warning: #warning syscall pselect6 not implemented
<stdin>:1325:2: warning: #warning syscall ppoll not implemented
<stdin>:1365:2: warning: #warning syscall epoll_pwait not implemented
  Building modules, stage 2.
  MODPOST 1 modules
  LD [M]  drivers/scsi/scsi_wait_scan.ko
/usr/local/arm/4.1.1-920t/bin/arm-linux-ld: unrecognized option
'-Wl,--rpath-link'
/usr/local/arm/4.1.1-920t/bin/arm-linux-ld: use the --help option for
usage information
make[2]: *** [drivers/scsi/scsi_wait_scan.ko] Error 1
make[1]: *** [modules] Error 2
make[1]: Leaving directory
`/home/bigguiness/buildroot/project_build_arm/ep9307/linux-2.6.27.4'
make: ***
[/home/bigguiness/buildroot/project_build_arm/ep9307/root/lib/modules/2.
6.27.4/modules.dep] Error 2

Removing the -Wl,--rpath-link -Wl,$(STAGING_DIR)/lib -Wl,--rpath-link
-Wl,$(STAGING_DIR)/usr/lib stuff makes everything work again.

Hartley
