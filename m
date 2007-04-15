From: mike <wtf62@rovoreed.com>
Date: Sun, 15 Apr 2007 18:33:58 +0000
Subject: [Buildroot] genext2fs problem
Message-ID: <1176662039.1050.7.camel@glynys>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've started getting a problem with genext2fs, where it complains that a
file is not a directory. In the example below it flags up on
pcmcia_core.o, but each time I 'make' it reports a different file.

I don't know what is going on, or why this has just started. Can anyone
help ?

# Use fakeroot so genext2fs believes the previous fakery
GENEXT2_REALSIZE=`LANG=C du -l -s -c
-k /home/mike/buildroot/build_i386/root | grep total | sed -e
"s/total//"`; \
GENEXT2_ADDTOROOTSIZE=`if [ $GENEXT2_REALSIZE -ge 20000 ] ; then echo
16384; else echo 2400; fi`; \
GENEXT2_SIZE=`expr $GENEXT2_REALSIZE + $GENEXT2_ADDTOROOTSIZE`; \
GENEXT2_ADDTOINODESIZE=`find /home/mike/buildroot/build_i386/root | wc
-l`; \
GENEXT2_INODES=`expr $GENEXT2_ADDTOINODESIZE + 400`; \
set -x; \
/home/mike/buildroot/build_i386/staging_dir/usr/bin/fakeroot \
        -i /home/mike/buildroot/build_i386/staging_dir/fakeroot.env \
        -s /home/mike/buildroot/build_i386/staging_dir/fakeroot.env -- \
/home/mike/buildroot/build_i386/genext2fs-1.3/genext2fs \
        -b $GENEXT2_SIZE \
        -i $GENEXT2_INODES \
        -d /home/mike/buildroot/build_i386/root \
         /home/mike/buildroot/rootfs.i386.ext2
+ /home/mike/buildroot/build_i386/staging_dir/usr/bin/fakeroot
-i /home/mike/buildroot/build_i386/staging_dir/fakeroot.env
-s /home/mike/buildroot/build_i386/staging_dir/fakeroot.env
-- /home/mike/buildroot/build_i386/genext2fs-1.3/genext2fs -b 7756 -i
969
-d /home/mike/buildroot/build_i386/root /home/mike/buildroot/rootfs.i386.ext2
/home/mike/buildroot/build_i386/genext2fs-1.3/genext2fs: pcmcia_core.o:
Not a directory
make: *** [/home/mike/buildroot/rootfs.i386.ext2] Error 1
[mike at glynys
buildroot]$                                                               
