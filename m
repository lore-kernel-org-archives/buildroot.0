From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 13 Oct 2014 09:35:02 +0000 (UTC)
Subject: [Buildroot] [Bug 7478] Multiple chosen python modules are not built
 due to missing header files in include path
In-Reply-To: <bug-7478-163@https.bugs.busybox.net/>
References: <bug-7478-163@https.bugs.busybox.net/>
Message-ID: <20141013093502.9EE22AFEA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7478

--- Comment #6 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-10-13 09:35:02 UTC ---
I now tried using an internal toolchain:
BR2_x86_64=y
BR2_DL_DIR="~/repo/contrib/dl"
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.13.config"
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_SQLITE=y
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set

but this seems to build fine too, wrt sqlite.

In the build log I also see the mentioned include paths present, for example:

building '_sqlite3' extension
creating
build/temp.linux2-x86_64-2.7/home/tdescham/repo/contrib/buildroot-reproduce/output/build/python-2.7.8/Modules/_sqlite
/home/tdescham/repo/contrib/buildroot-reproduce/output/host/usr/bin/x86_64-buildroot-linux-uclibc-gcc
-fPIC -fno-strict-aliasing -pipe -Os -DNDEBUG -g -fwrapv -O3 -Wall
-Wstrict-prototypes -DMODULE_NAME="sqlite3" -DSQLITE_OMIT_LOAD_EXTENSION=1
-IModules/_sqlite
-I/home/tdescham/repo/contrib/buildroot-reproduce/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include
-I. -IInclude -I./Include
-I/home/tdescham/repo/contrib/buildroot-reproduce/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include
-I/home/tdescham/repo/contrib/buildroot-reproduce/output/build/python-2.7.8/Include
-I/home/tdescham/repo/contrib/buildroot-reproduce/output/build/python-2.7.8 -c
/home/tdescham/repo/contrib/buildroot-reproduce/output/build/python-2.7.8/Modules/_sqlite/cache.c
-o
build/temp.linux2-x86_64-2.7/home/tdescham/repo/contrib/buildroot-reproduce/output/build/python-2.7.8/Modules/_sqlite/cache.o


Your defconfig was:
BR2_x86_i686=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="i386"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_VLC=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_PYC=y
BR2_PACKAGE_PYTHON_BZIP2=y
BR2_PACKAGE_PYTHON_BSDDB=y
BR2_PACKAGE_PYTHON_CODECSCJK=y
BR2_PACKAGE_PYTHON_CURSES=y
BR2_PACKAGE_PYTHON_PYEXPAT=y
BR2_PACKAGE_PYTHON_READLINE=y
BR2_PACKAGE_PYTHON_SSL=y
BR2_PACKAGE_PYTHON_SQLITE=y
BR2_PACKAGE_PYTHON_ZLIB=y
BR2_PACKAGE_PYTHON_HASHLIB=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_HTOP=y
BR2_PACKAGE_UTIL_LINUX=y
BR2_TARGET_ROOTFS_CPIO=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_GRUB=y
BR2_TARGET_GRUB_FS_ISO9660=y

so the main differences I see are:
- 32-bit
- glibc
- c++ support

I will now make a build with glibc and c++ to see if it makes a difference...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
