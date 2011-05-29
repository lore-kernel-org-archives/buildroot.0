From: Christopher Boumenot <boumenot@gmail.com>
Date: Sun, 29 May 2011 11:03:27 -0400
Subject: [Buildroot] Build Fails with ruby-1.9.2-p0
Message-ID: <BANLkTimm-3LX2S8-17VyPhuiaLqZC3m4jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to create a minimal x86 root image that includes ruby-1.9.2-p0,
but the build fails when compiling ruby.

/home/boumenot/src/buildroot-2011.05/output/build/ruby-1.9.2-p0/lib/mkmf.rb:365:in
`try_do': The complier failed to generate an executable file. (RuntimeError)
You have to install development tools first.
        from
/home/boumenot/src/buildroot-2011.05/output/build/ruby-1.9.2-p0/lib/mkmf.rb:446:in
`try_compile'
        from
/home/boumenot/src/buildroot-2011.05/output/build/ruby-1.9.2-p0/lib/mkmf.rb:496:in
`try_static_assert'
        from ../.././ext/bigdecimal/extconf.rb:5
        from ./ext/extmk.rb:156:in `load'
        from ./ext/extmk.rb:156:in `extmake'
        from ./ext/extmk.rb:445
        from ./ext/extmk.rb:441:in `each'
        from ./ext/extmk.rb:441
make: *** [mkmain.sh] Error 1

Here's the code that the ruby build process was trying to build.

boumenot at linux-5fgv:~/src/buildroot-2011.05/output/build/ruby-1.9.2-p0/ext/bigdecimal>
cat mkmf.log
"/home/boumenot/src/buildroot-2011.05/output/host/usr/bin/ccache
/home/boumenot/src/buildroot-2011.05/output/host/usr/bin/i686-unknown-linux-uclibc-gcc
-o conftest -I../../.ext/include/i686-linux -I../.././include
-I../.././ext/bigdecimal    -pipe -Os  conftest.c  -L. -L../.. -L.
 -rdynamic -Wl,-export-dynamic     -Wl,-R -Wl,/usr/lib -L/usr/lib
-lruby-static  -lpthread -lrt -ldl -lcrypt -lm   -lc"
/home/boumenot/src/buildroot-2011.05/output/host/usr/i686-unknown-linux-uclibc/sysroot/usr/lib/crt1.o:
In function `_start':
(.text+0x1d): undefined reference to `__uClibc_main'
collect2: ld returned 1 exit status
checked program was:
/* begin */
1: #include "ruby.h"
2:
3: int main() {return 0;}
/* end */

This is against buildroot-2011.05.  I am building on OpenSuSE v11.4
x86_64 targeting x86.  I am using the default toolchain values for this
version of buildroot.  I am not sure what other information would help.

GCC is 4.3.5.

These are the data for .config and .defconfig files.

BR2_TARGET_ROOTFS_SQUASHFS=y
BR2_TARGET_ROOTFS_SQUASHFS4=y
BR2_TARGET_ROOTFS_SQUASHFS4_XZ=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_2_6_38=y
BR2_LINUX_KERNEL_VERSION="2.6.38.7"
BR2_LINUX_KERNEL_PATCH=""
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="/usr/src/linux-2.6.38.7/.config"
BR2_LINUX_KERNEL_BZIMAGE=y
BR2_HAVE_DOT_CONFIG=y
BR2_i386=y
BR2_x86_i686=y
BR2_ARCH="i686"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="i686"
BR2_GCC_TARGET_ARCH="i686"

I would like to fix the issue and submit a patch, but I am not sure how or
what to fix.  Help is very much appreciated.


Thanks!
Chris
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110529/cfbbac1b/attachment.html>
