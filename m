From: Steve Calfee <stevecalfee@gmail.com>
Date: Fri, 11 Oct 2019 13:26:34 -0700
Subject: [Buildroot] Build failure on upgrade to 2019.08.1
In-Reply-To: <fbfd215f-42ec-74e8-b1b6-5650624d7ca0@mind.be>
References: <CAJJ6jxvGsZ0SYgivex5jGCHg21_acu=kp5CdRO2FF2K_xhUZwQ@mail.gmail.com>
 <fced002e-90cf-30e7-d515-f546daaf77bf@mind.be>
 <CAJJ6jxuRAd76-cOzKgGhtq0nvx+w0MeoMTCKdHzNmsGP+Rudzg@mail.gmail.com>
 <90524ee3-a438-fb38-da43-8632066743af@mind.be>
 <CAJJ6jxvGXS4L0fjp16WHGtdd6fKMhTPcCsS2aeaZPrkW0MBNYw@mail.gmail.com>
 <fbfd215f-42ec-74e8-b1b6-5650624d7ca0@mind.be>
Message-ID: <CAJJ6jxvkTS5=9+v7N0BXQD2AWYvp9zEiRyPxtpNBYmjydL5zBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
On Fri, Oct 11, 2019 at 12:34 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Steve,
>
>  I'll continue try to debug remotely but it gets harder and harder :-)
>
> On 10/10/2019 18:09, Steve Calfee wrote:
> [snip]
> > I don't see anything obviously wrong in the output. I hope it is not
> > one of those "order matters" in the link command.
>
>  Order matters generally only applies to static linking.
>
>
> [snip]
> > Toolchain wrapper executing:
> > '/home/calfee/edi-workspace/buildroot/../toolchain/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc.br_real'
> > '--sysroot' '/home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot'
>
>  This is what I wanted to double-check. Looks correct.
>
>
> > gcc version 8.3.0 (Buildroot 2019.11-git-00838-g196e3d2)
>
>  Oh, I hadn't noticed this bit before: you're building the toolchain with
> Buildroot master and use it with Buildroot 2019.8.1. Not that it should matter,
> but I'll just try that use case now.
>
> [snip]
> > -L/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0
> > -L/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/lib
>
>  Clutching at straws here, but: is this also the location where you originally
> built the toolchain, or did you move it around? I would in fact expect
> libpthread.so.0 to be in this directory as well..
>
> > -L/home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/lib
>
>  So the directory containing libpthread.so.0 *is* included with -L...
>
> > -L/home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib
> > --no-as-needed dbus-monitor.o dbus-print-message.o tool-common.o
> > ../dbus/.libs/libdbus-1.so -rpath
>
>  Maybe this .so file has an RPATH and maybe for some reason the linker uses that
> instead of -L for the NEEDED entries?
>
>  Or maybe the fact that a -rpath is specified on the command line overrides the
> -L options?
>
>  But in either case, I should be able to reproduce...
>
>  Could you post the defconfig for your toolchain and for the failing config?
>
>  Regards,
>  Arnout
>
> > /home/calfee/edi-workspace/buildroot/output/build/dbus-1.12.16/dbus/.libs
> > -lgcc --as-needed -lgcc_s --no-as-needed -lc -lgcc --as-needed -lgcc_s
> > --no-as-needed /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/crtend.o
> > /home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crtn.o
> > /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
> > warning: libpthread.so.0, needed by ../dbus/.libs/libdbus-1.so, not
> > found (try using -rpath or -rpath-link)
> > /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
> > ../dbus/.libs/libdbus-1.so: undefined reference to
> > `pthread_mutexattr_init at GLIBC_2.4'
> > /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
> > ../dbus/.libs/libdbus-1.so: undefined reference to
> > `pthread_mutexattr_destroy at GLIBC_2.4'
> > /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
> > ../dbus/.libs/libdbus-1.so: undefined reference to
> > `pthread_condattr_setclock at GLIBC_2.4'
> > /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
> > ../dbus/.libs/libdbus-1.so: undefined reference to
> > `pthread_mutexattr_settype at GLIBC_2.4'
> > collect2: error: ld returned 1 exit status
> > calfee at dock-container:~/edi-workspace/buildroot/output/build/dbus-1.12.16/tools$
> >

Thanks for trying. Here are my two configs:
TOOLCHAIN:
BR2_arm=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
# BR2_TARGET_GENERIC_GETTY is not set
# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
BR2_GENERATE_LOCALE="en_US.UTF-8"
BR2_PACKAGE_LIBPTHREAD_STUBS=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_SHEEVAPLUG=y

The last line selects some stuff in my external, just does a define.
BR2_TARGET_SHEEVAPLUG=y

BUILDROOT defconfig
BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PATH="$(TOPDIR)/../toolchain/output/host/usr"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-buildroot-linux-gnueabi"
BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS="libpthread.so.0"
BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY=y
BR2_TARGET_GENERIC_HOSTNAME="dockstar"
BR2_TARGET_GENERIC_ISSUE="Welcome to Steve's Dockstar"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_ROOTFS_DEVICE_TABLE="$(BR2_EXTERNAL_MY_DOCKSTAR_PATH)/seagatedockstar/device_table.txt"
BR2_ENABLE_LOCALE_WHITELIST="C en_US.utf8 C.UTF-8"
BR2_GENERATE_LOCALE="en_US"
BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL_MY_DOCKSTAR_PATH)/seagatedockstar/skeleton"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL_MY_DOCKSTAR_PATH)/configs/dockstar_linux_defconfig"
BR2_LINUX_KERNEL_UIMAGE=y
BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="kirkwood-dockstar"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_BUSYBOX_CONFIG="$(BR2_EXTERNAL_MY_DOCKSTAR_PATH)/configs/testbb_defconfig"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_TREE=y
BR2_PACKAGE_MTD=y
BR2_PACKAGE_MTD_MKFSUBIFS=y
BR2_PACKAGE_NFS_UTILS=y
BR2_PACKAGE_NFS_UTILS_RPCDEBUG=y
BR2_PACKAGE_SSHFS=y
BR2_PACKAGE_UBOOT_TOOLS=y
BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE=y
BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE=y
BR2_PACKAGE_USBMOUNT=y
BR2_PACKAGE_USBUTILS=y
BR2_PACKAGE_PHP=y
BR2_PACKAGE_PHP_SAPI_CGI=y
BR2_PACKAGE_PHP_SAPI_CLI=y
BR2_PACKAGE_PHP_EXT_SIMPLEXML=y
BR2_PACKAGE_PHP_EXT_WDDX=y
BR2_PACKAGE_PHP_EXT_XML=y
BR2_PACKAGE_PHP_EXT_XMLREADER=y
BR2_PACKAGE_PHP_EXT_XMLWRITER=y
BR2_PACKAGE_PHP_EXT_XSL=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_PYC=y
BR2_PACKAGE_PYTHON_UCS4=y
BR2_PACKAGE_PYTHON_PYMYSQL=y
BR2_PACKAGE_PYTHON_PYRATEMP=y
BR2_PACKAGE_PYTHON_REQUESTS=y
BR2_PACKAGE_PYTHON_TORNADO=y
BR2_PACKAGE_MYSQL=y
BR2_PACKAGE_ORACLE_MYSQL_SERVER=y
BR2_PACKAGE_LIBCURL=y
BR2_PACKAGE_CURL=y
BR2_PACKAGE_LIBCURL_VERBOSE=y
BR2_PACKAGE_NSS_MDNS=y
BR2_PACKAGE_ICU=y
BR2_PACKAGE_NCURSES_WCHAR=y
BR2_PACKAGE_AVAHI=y
BR2_PACKAGE_AVAHI_DAEMON=y
BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY=y
BR2_PACKAGE_NTP=y
BR2_PACKAGE_RSYNC=y
BR2_PACKAGE_STUNNEL=y
BR2_PACKAGE_TCPDUMP=y
BR2_PACKAGE_BASH=y
BR2_PACKAGE_LESS=y
BR2_PACKAGE_MC=y
BR2_PACKAGE_NANO=y
BR2_TARGET_ROOTFS_UBI=y


Note: I have tried both with and without
BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS="libpthread.so.0"
Fails both ways as reported.

Thanks for all your time.
