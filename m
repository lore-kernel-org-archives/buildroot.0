From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 07 Apr 2011 11:32:27 +0200
Subject: [Buildroot] Patching method
Message-ID: <4D9D84AB.3080101@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I was building a new file system and I have noticed something about 
patching that seems a little dangerous :

 >>> liblockfile 1.08 Patching package/liblockfile
toolchain/patch-kernel.sh 
/home/ldesroches/buildroot/output/build/liblockfile-1.08 
/home/ldesroches/buildroot/dl liblockfile_1.08-4.debian.tar.bz2

...

+ echo 'Applying liblockfile_1.08-4.debian.tar.bz2 using bzip2: '
Applying liblockfile_1.08-4.debian.tar.bz2 using bzip2:
+ echo liblockfile_1.08-4.debian.tar.bz2
+ cat
+ bunzip2 -dc 
/home/ldesroches/buildroot/dl/liblockfile_1.08-4.debian.tar.bz2
+ patch -p1 -E -d /home/ldesroches/buildroot/output/build/liblockfile-1.08
patching file dotlockfile.c
patching file lockfile.c
missing header for unified diff at line 320 of patch
patching file COPYRIGHT
patching file dotlockfile.1
patching file Makefile.in
patch unexpectedly ends in middle of line

...

As you can see, we have an archive and we don't extract it, we simply 
unzip the compressed file and send the tar file to the patch command. 
The content of this archive is a tree with files and directories (one of 
them is the patch directory) that's why I think this method is a little 
dangerous. The patches are not applied in the same order as defined into 
the series file because the patch order is not kept into the archive.

Am I wrong ? Do you think it can be a problem ?


Regards


Ludovic Desroches
