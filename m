From: Robert Urban <urban@unix-beratung.de>
Date: Sun, 22 Mar 2009 15:46:50 +0100
Subject: [Buildroot] handling packages that use /usr/bin/libtool
Message-ID: <49C64F5A.9000006@unix-beratung.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Folks,

I've narrowed things down a bit with cpufrequtils-005.

From what I gather, libtool is not conducive to cross-compiling.  Apparently
many packages are packaged with their own libtool, known as 'ltmain.sh',
which can be patched by buildroot.

cpufrequtils, however, simply calls /usr/bin/libtool.  I have tried to patch
the cpufrequtils Makefile to use buildroot's idea of $GCC, and the libtool
script *does* get called with the cross-compilation gcc and switches, but
when the library is actually linked by libtool, it simply calls 'gcc':

-snip-
/usr/bin/libtool --tag=CC --mode=link
/data/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc -Os
-pipe -Os  -I/data/buildroot/build_i586/staging_dir/usr/include
-I/data/buildroot/build_i586/staging_dir/include
--sysroot=/data/buildroot/build_i586/staging_dir/ -isysroot
/data/buildroot/build_i586/staging_dir -mtune=i586 -march=i586
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
--sysroot=/data/buildroot/build_i586/staging_dir -o libcpufreq.la -rpath \
                /usr/lib -version-info 0:0:0 lib/cpufreq.lo lib/proc.lo
lib/sysfs.lo
mkdir .libs
gcc -shared  lib/.libs/cpufreq.o lib/.libs/proc.o lib/.libs/sysfs.o
-isysroot /data/buildroot/build_i586/staging_dir -mtune=i586 -march=i586
-Wl,-soname -Wl,libcpufreq.so.0 -o .libs/libcpufreq.so.0.0.0
-snip-

Does someone perhaps have a suggestion how this problem can be solved?

Rob Urban
