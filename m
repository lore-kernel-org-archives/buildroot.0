From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 24 Jun 2011 14:52:03 +0200
Subject: [Buildroot] cyrus-sasl in buildroot: makemd5 is wrongly
	cross-compiled
In-Reply-To: <4E04828A.6030908@lucaceresoli.net>
References: <4E04828A.6030908@lucaceresoli.net>
Message-ID: <4E048873.1090000@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
after having worked around the "apparent CFLAGS mismatch" problem, I hit
another cross-compilation error while trying to build cyrus-sasl in 
buildroot:

   $ make cyrus-sasl-dirclean
   $ make cyrus-sasl 2>&1 | tee cyrus-sasl.log
   [...]
   /home/murray/devel/buildroot/output/host/usr/bin/ccache 
/home/murray/devel/buildroot/output/host/usr/bin/arm-linux-gcc -Wall -W 
-Os -pipe -Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 -o makemd5 makemd5.o -lresolv
   rm -f md5global.h
   ./makemd5 md5global.h
   /bin/bash: ./makemd5: cannot execute binary file
   make[3]: *** [md5global.h] Error 126
   [...]

The problem here is pretty clear: makemd5, which is meant to run on the 
host,
has been cross-compiled instead:

   $ file output/build/cyrus-sasl-2.1.24rc1/include/makemd5
   output/build/cyrus-sasl-2.1.24rc1/include/makemd5: ELF 32-bit LSB 
executable, ARM, version 1 (SYSV), dynamically linked (uses shared 
libs), for GNU/Linux 2.6.31, not stripped

Attached is my patch to allow makemd5 to correctly (non-cross) compiled.
Basically, it consists in replacing $(CC) with $(HOSTCC) in cyrus-sasl's
include/Makefile.in.
Note that I'm not the first that faced this problem. My patch has been
inspired by:
http://tech.dir.groups.yahoo.com/group/nslu2-linux/message/4044?var=0

The build log is attached too.

Luca

-------------- next part --------------
A non-text attachment was scrubbed...
Name: cyrus-sasl-makemd5.log.gz
Type: application/x-gzip
Size: 3477 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110624/6e781892/attachment-0002.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: cyrus-sasl-hostcc.patch
Type: text/x-patch
Size: 1317 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110624/6e781892/attachment-0003.bin>
