From: joe at smittys.pointclark.net <joe@smittys.pointclark.net>
Date: Tue, 23 Jan 2007 19:28:41 -0500
Subject: [Buildroot] libintl_gettext errors at end of build??
Message-ID: <20070123192841.6sa6ze5j404ckcks@www.smittys.pointclark.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
No matter what versions I choose I keep getting ": undefined reference  
to `libintl_gettext'" error at the very end of the build. I tried to  
build gettext into the build thinking this would solve the problem but  
no go, still comes up. Looks like it is looking for it in the kernel  
build config area? Anyone know why this is happening and how to  
correct it?

Thanks - Joe




# These are in /lib, so...
rm -rf /root/buildroot/build_i686/root/usr/lib/libgcc_s*.so*
cp -dpf  
/root/buildroot/build_i686/staging_dir/i686-linux-uclibc/lib/libgcc_s*  
/root/buildroot/build_i686/root/lib/
/sbin/ldconfig -r /root/buildroot/build_i686/root 2>/dev/null
# Use fakeroot to pretend all target binaries are owned by root
rm -f /root/buildroot/build_i686/staging_dir/_fakeroot.rootfs.i686.ext2
touch /root/buildroot/build_i686/staging_dir/.fakeroot.00000
cat /root/buildroot/build_i686/staging_dir/.fakeroot* >  
/root/buildroot/build_i686/staging_dir/_fakeroot.rootfs.i686.ext2
echo "chown -R root:root /root/buildroot/build_i686/root" >>  
/root/buildroot/build_i686/staging_dir/_fakeroot.rootfs.i686.ext2
# Use fakeroot to pretend to create all needed device nodes
echo "/root/buildroot/build_i686/staging_dir/bin/makedevs -d  
target/generic/device_table.txt /root/buildroot/build_i686/root" \
         >> /root/buildroot/build_i686/staging_dir/_fakeroot.rootfs.i686.ext2
# Use fakeroot so genext2fs believes the previous fakery
GENEXT2_REALSIZE=`LC_ALL=C du -l -s -c -k  
/root/buildroot/build_i686/root | grep total | sed -e "s/total//"`; \
GENEXT2_ADDTOROOTSIZE=`if [ $GENEXT2_REALSIZE -ge 20000 ] ; then echo  
16384; else echo 2400; fi`; \
GENEXT2_SIZE=`expr $GENEXT2_REALSIZE + $GENEXT2_ADDTOROOTSIZE`; \
GENEXT2_ADDTOINODESIZE=`find /root/buildroot/build_i686/root | wc -l`; \
GENEXT2_INODES=`expr $GENEXT2_ADDTOINODESIZE + 400`; \
set -x; \
echo "/root/buildroot/build_i686/genext2fs-1.3/genext2fs -b $GENEXT2_SIZE " \
         "-i $GENEXT2_INODES -d /root/buildroot/build_i686/root " \
         " -U -r 0 /root/buildroot/rootfs.i686.ext2" >>  
/root/buildroot/build_i686/staging_dir/_fakeroot.rootfs.i686.ext2
+ echo '/root/buildroot/build_i686/genext2fs-1.3/genext2fs -b 5204 '  
'-i 743 -d /root/buildroot/build_i686/root ' ' -U -r 0  
/root/buildroot/rootfs.i686.ext2'
chmod a+x /root/buildroot/build_i686/staging_dir/_fakeroot.rootfs.i686.ext2
/root/buildroot/build_i686/staging_dir/usr/bin/fakeroot --  
/root/buildroot/build_i686/staging_dir/_fakeroot.rootfs.i686.ext2
rootdir=/root/buildroot/build_i686/root
table='target/generic/device_table.txt'
-rw-r--r--  1 root root 5328896 Jan 23 14:34 /root/buildroot/rootfs.i686.ext2
cp target/device/x86/i386/linux26.config  
/root/buildroot/build_i686/linux-2.6.19.2/.config
make -j1  
PATH="/root/buildroot/build_i686/staging_dir/bin:/root/buildroot/toolchain_build_i686/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/local/bin" AR=/root/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-ar AS=/root/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-as LD=/root/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-ld NM=/root/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-nm CC=/root/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc GCC=/root/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc CXX=/root/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-g++ CPP=/root/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-cpp RANLIB=/root/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-ranlib STRIP=/root/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-strip OBJCOPY=/root/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-objcopy CC_FOR_BUILD="gcc" PKG_CONFIG_SYSROOT=/root/buildroot/build_i686/staging_dir PKG_CONFIG=/root/buildroot/build_i686/staging_dir/usr/bin/pkg-config CXX="" ARCH=i386 PATH="/root/buildroot/build_i686/staging_dir/bin:/root/buildroot/toolchain_build_i686/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/local/bin" INSTALL_MOD_PATH=/root/buildroot/build_i686/root CROSS_COMPILE=/root/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc- -C /root/buildroot/build_i686/linux-2.6.19.2  
oldconfig
make[1]: Entering directory `/root/buildroot/build_i686/linux-2.6.19.2'
   HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf.o(.text+0x93): In function `check_stdin':
: undefined reference to `libintl_gettext'
scripts/kconfig/conf.o(.text+0xa7): In function `check_stdin':
: undefined reference to `libintl_gettext'
scripts/kconfig/conf.o(.text+0xbb): In function `check_stdin':
: undefined reference to `libintl_gettext'
scripts/kconfig/conf.o(.text+0x804): In function `check_conf':
: undefined reference to `libintl_gettext'
scripts/kconfig/conf.o(.text+0xdf1): In function `main':
: undefined reference to `libintl_gettext'
scripts/kconfig/conf.o(.text+0xffe): more undefined references to  
`libintl_gettext' follow
collect2: ld returned 1 exit status
make[2]: *** [scripts/kconfig/conf] Error 1
make[1]: *** [oldconfig] Error 2
make[1]: Leaving directory `/root/buildroot/build_i686/linux-2.6.19.2'
make: *** [/root/buildroot/build_i686/linux-2.6.19.2/.configured] Error 2
[root at rm4100 buildroot]#
