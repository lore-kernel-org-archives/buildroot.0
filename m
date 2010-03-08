From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 8 Mar 2010 16:27:14 -0500
Subject: [Buildroot] mtd-utils fails to build
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190902242788@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190902242788@mi8nycmail19.Mi8.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190902242793@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FYI, I just found another post about this same issue:

http://lists.busybox.net/pipermail/buildroot/2010-February/032479.html

Regards,
Hartley

-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of H Hartley Sweeten
Sent: Monday, March 08, 2010 2:05 PM
To: buildroot at busybox.net
Subject: [Buildroot] mtd-utils fails to build

Hello all,

I am trying to do a clean build using the current git pull of buildroot.

Everything goes as expected until trying to build mtd-utils. When trying
to build mkfs.jffs2 the build cannot find zlib.h and errors out.

It appears that a compile and assemble, but do not link (option -c), happens
first for each file followed by compile and place output into <file>
(option -o).

The problem appears to be that the -c option happens without passing the
--sysroot configuration so the compiler cannot locate the external headers.

Following is a snip of the last part of the build:


...
/home/bigguiness/toolchain/x-tools/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-gcc -I./include   -DWITHOUT_XATTR -O2 -g -Wall -Wextra -Wwrite-strings -Wno-sign-compare -c -o /home/bigguiness/buildroot/output/build/mtd-utils-1.3.1/jffs2dump.o jffs2dump.c -g -Wp,-MD,/home/bigguiness/buildroot/output/build/mtd-utils-1.3.1/.jffs2dump.c.dep
/home/bigguiness/toolchain/x-tools/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-gcc -O2 -g -Wall -Wextra -Wwrite-strings -Wno-sign-compare --sysroot /home/bigguiness/buildroot/output/staging/  -g -o /home/bigguiness/buildroot/output/build/mtd-utils-1.3.1/jffs2dump /home/bigguiness/buildroot/output/build/mtd-utils-1.3.1/jffs2dump.o /home/bigguiness/buildroot/output/build/mtd-utils-1.3.1/crc32.o  
/home/bigguiness/toolchain/x-tools/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-gcc -I./include   -DWITHOUT_XATTR -O2 -g -Wall -Wextra -Wwrite-strings -Wno-sign-compare -c -o /home/bigguiness/buildroot/output/build/mtd-utils-1.3.1/mkfs.jffs2.o mkfs.jffs2.c -g -Wp,-MD,/home/bigguiness/buildroot/output/build/mtd-utils-1.3.1/.mkfs.jffs2.c.dep
mkfs.jffs2.c:73:18: error: zlib.h: No such file or directory
mkfs.jffs2.c:1519: warning: initialization discards qualifiers from pointer target type
mkfs.jffs2.c:1521: warning: initialization discards qualifiers from pointer target type
mkfs.jffs2.c: In function 'main':
mkfs.jffs2.c:1881: warning: passing argument 2 of 'recursive_add_host_directory' discards qualifiers from pointer target type
make[1]: *** [/home/bigguiness/buildroot/output/build/mtd-utils-1.3.1/mkfs.jffs2.o] Error 1
rm /home/bigguiness/buildroot/output/build/mtd-utils-1.3.1/ftl_check.o /home/bigguiness/buildroot/output/build/mtd-utils-1.3.1/docfdisk.o /home/bigguiness/buildroot/output/build/mtd-utils-1.3.1/flash_unlock.o /home/bigguiness/buildroot/output/build/mtd-utils-1.3.1/flash_lock.o /home/bigguiness/buildroot/output/build/mtd-utils-1.3.1/flashcp.o /home/bigguiness/buildroot/output/build/mtd-utils-1.3.1/doc_loadbios.o /home/bigguiness/buildroot/output/build/mtd-utils-1.3.1/flash_erase.o /home/bigguiness/buildroot/output/build/mtd-utils-1.3.1/ftl_format.o /home/bigguiness/buildroot/output/build/mtd-utils-1.3.1/flash_info.o
make[1]: Leaving directory `/home/bigguiness/buildroot/output/build/mtd-utils-1.3.1'
make: *** [/home/bigguiness/buildroot/output/build/mtd-utils-1.3.1/docfdisk] Error 2


Any ideas how to fix this?

Regards,
Hartley
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
