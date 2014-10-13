From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 13 Oct 2014 14:30:51 +0000 (UTC)
Subject: [Buildroot] [Bug 7478] Multiple chosen python modules are not built
 due to missing header files in include path
In-Reply-To: <bug-7478-163@https.bugs.busybox.net/>
References: <bug-7478-163@https.bugs.busybox.net/>
Message-ID: <20141013143051.5E52BBD42D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7478

--- Comment #7 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-10-13 14:30:50 UTC ---
Even enabling C++ and glibc works fine here:

BR2_x86_64=y
BR2_DL_DIR="~/repo/contrib/dl"
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
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


Build log snippet:
building '_sqlite3' extension
creating
build/temp.linux2-x86_64-2.7/home/tdescham/repo/contrib/buildroot-reproduce/output/build/python-2.7.8/Modules/_sqlite
/home/tdescham/repo/contrib/buildroot-reproduce/output/host/usr/bin/x86_64-buildroot-linux-gnu-gcc
-fPIC -fno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os -DNDEBUG -g -fwrapv -O3 -Wall
-Wstrict-prototypes -DMODULE_NAME="sqlite3" -DSQLITE_OMIT_LOAD_EXTENSION=1
-IModules/_sqlite
-I/home/tdescham/repo/contrib/buildroot-reproduce/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include
-I. -IInclude -I./Include
-I/home/tdescham/repo/contrib/buildroot-reproduce/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include
-I/home/tdescham/repo/contrib/buildroot-reproduce/output/build/python-2.7.8/Include
-I/home/tdescham/repo/contrib/buildroot-reproduce/output/build/python-2.7.8 -c
/home/tdescham/repo/contrib/buildroot-reproduce/output/build/python-2.7.8/Modules/_sqlite/cache.c
-o
build/temp.linux2-x86_64-2.7/home/tdescham/repo/contrib/buildroot-reproduce/output/build/python-2.7.8/Modules/_sqlite/cache.o


Could you try any of these working configurations (build-wise) to check if you
see something differently? I'm testing this on a recent git revision, I haven't
verified if there were changes in this area.


In the Python sources, Lib/distutils/command/build_ext.py seems to be
responsible for building extensions, see function build_extension. I think it
makes sense to debug this further, inspecting the values of ext.include_dirs.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
