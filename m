From: Sergey Naumov <sknaumov@gmail.com>
Date: Mon, 17 Jun 2019 12:31:02 +0300
Subject: [Buildroot] Buildroot 2016.05: no path to staging for one toolchain
Message-ID: <CAH3pVZN5cJfVmgiFxfNKgLy1YZO3ArpZc3DmRgGCc9Gv=Ya4Kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

I've integrated multiple external toolchains into Buildroot so far, but I
see the issue I've never seen before:

When compiling openssl, zlib.h header can't be found. I checked paths
compiler looks for headers, and see the following:













*~/git/buildroot-oem/output/build/openssl-1.0.2k/crypto/comp$
LD_LIBRARY_PATH=/home/snaumov/git/buildroot-oem/toolchain/crosstools-mips-gcc-4.6-linux-3.4-uclibc-0.9.32-binutils-2.21.Rel1.2/usr/lib
/home/snaumov/git/buildroot-oem/output/host/usr/bin/mips-linux-gcc -I..
-I../.. -I../modes -I../asn1 -I../evp -I../../include  -fPIC -DOPENSSL_PIC
-DZLIB_SHARED -DZLIB -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN
-DHAVE_DLFCN_H -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os  -ffunction-sections -fdata-sections
-fomit-frame-pointer -Wall   -c -o c_zlib.o c_zlib.c -E -Wp,-v#include
"..." search starts here:#include <...> search starts
here: .. ../.. ../modes ../asn1 ../evp ../../include
/home/snaumov/git/buildroot-oem/toolchain/rsdk-1.5.6-5281-EB-2.6.30-0.9.30.3-131105/include
/home/snaumov/git/buildroot-oem/toolchain/rsdk-1.5.6-5281-EB-2.6.30-0.9.30.3-131105/include/gccEnd
of search list.c_zlib.c:25:19: error: zlib.h: No such file or directory*

For other toolchains I see also a path to buildroot staging dir. At the
same time I see that this path is not provided as an additional -I argument
to compiler:


















*~/git/buildroot-oem/output/build/openssl-1.0.2k/crypto/comp$
LD_LIBRARY_PATH=/home/snaumov/git/buildroot-oem/toolchain/crosstools-mips-gcc-4.6-linux-3.4-uclibc-0.9.32-binutils-2.21.Rel1.2/usr/lib
/home/snaumov/git/buildroot-oem/output/host/usr/bin/mips-linux-gcc -I..
-I../.. -I../modes -I../asn1 -I../evp -I../../include  -fPIC -DOPENSSL_PIC
-DZLIB_SHARED -DZLIB -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN
-DHAVE_DLFCN_H -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os  -ffunction-sections -fdata-sections
-fomit-frame-pointer -Wall   -c -o c_zlib.o c_zlib.c -E -Wp,-vignoring
duplicate directory
"/home/snaumov/git/buildroot-oem/toolchain/crosstools-mips-gcc-4.6-linux-3.4-uclibc-0.9.32-binutils-2.21.Rel1.2/usr/bin/../lib/gcc/../../lib/gcc/mips-unknown-linux-uclibc/4.6.2/include"ignoring
nonexistent directory
"/home/snaumov/git/buildroot-oem/output/host/usr/mips-buildroot-linux-uclibc/sysroot/usr/local/include"ignoring
duplicate directory
"/home/snaumov/git/buildroot-oem/toolchain/crosstools-mips-gcc-4.6-linux-3.4-uclibc-0.9.32-binutils-2.21.Rel1.2/usr/bin/../lib/gcc/../../lib/gcc/mips-unknown-linux-uclibc/4.6.2/include-fixed"ignoring
duplicate directory
"/home/snaumov/git/buildroot-oem/toolchain/crosstools-mips-gcc-4.6-linux-3.4-uclibc-0.9.32-binutils-2.21.Rel1.2/usr/bin/../lib/gcc/../../lib/gcc/mips-unknown-linux-uclibc/4.6.2/../../../../mips-unknown-linux-uclibc/include"#include
"..." search starts here:#include <...> search starts
here: .. ../.. ../modes ../asn1 ../evp ../../include
/home/snaumov/git/buildroot-oem/toolchain/crosstools-mips-gcc-4.6-linux-3.4-uclibc-0.9.32-binutils-2.21.Rel1.2/usr/bin/../lib/gcc/mips-unknown-linux-uclibc/4.6.2/include
/home/snaumov/git/buildroot-oem/toolchain/crosstools-mips-gcc-4.6-linux-3.4-uclibc-0.9.32-binutils-2.21.Rel1.2/usr/bin/../lib/gcc/mips-unknown-linux-uclibc/4.6.2/include-fixed
/home/snaumov/git/buildroot-oem/toolchain/crosstools-mips-gcc-4.6-linux-3.4-uclibc-0.9.32-binutils-2.21.Rel1.2/usr/bin/../lib/gcc/mips-unknown-linux-uclibc/4.6.2/../../../../mips-unknown-linux-uclibc/include
/home/snaumov/git/buildroot-oem/output/host/usr/mips-buildroot-linux-uclibc/sysroot/usr/includeEnd
of search list.*

The highlighted directory is clearly out of toolchain and
buildroot-specific. I thought that it could be related to
toolchain-wrapper, but I see that in both cases exactly the same options
are used to build it and there is no sysroot/usr/include path embedded into
the binary. Where should I look at to add path to the staging dir?

Thanks in advance,
Sergey.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190617/8bac8caa/attachment.html>
