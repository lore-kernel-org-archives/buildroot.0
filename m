From: Iouri Kharon <bc-info@styx.cabel.net>
Date: Mon, 18 Jun 2007 10:38:18 +0400
Subject: [Buildroot] Bug's (and resolution) for building g++uclibc-x86_64
Message-ID: <704628851.20070618103818@styx.cabel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Erik,

  All the bugs described below are for the x86_64, host x86_64 (linux)
  target for building g++ (checked with 3.4.6, 4.1.0, 4.2.0)

1. On kernel headers stage not all 'asm' directories are created in
   %stage_dir% and %host%.
   (For some packages asm-i386 is needed, and for others asm-x64 in %host%)

   Resolution: In attached (asmhdr-amd64) patch (make with svn)


2. When building libstdc++3 for 64bit the gcc build system can't find the directory
       <stagedir>/uclibc-...x86_64/usr/lib64

   Resolution: temporary create a symlink in the gcc-build-tree 'usr'
               directory to ../lib64.

               In attached (g++amd64) patch (make with svn)



3. Can't build gcc (libstdc++) with MULTILIB:
   When building libstdc++3 for 32bit I get the following diagnostic
      'link test ar not allowed after GCC_NO_EXECUTABLES'

   In the config - $gcc_no_link is set to 'yes' after running xgcc with
   the -m32 option, ld reported:
   skipping incompatible .../lib/libc.so.0
   cannot find .../lib/libc.so.0

   My host system also can't link C++ programs with -m32, but we are
   building a cross-compiler and this shouldn't matter, or am I wrong?

   I don't known how to correct this situation :(, any ideas?


-- 
Best regards,
 Iouri                          mailto:bc-info at styx.cabel.net
-------------- next part --------------
A non-text attachment was scrubbed...
Name: g++-amd64.diff.gz
Type: application/x-gzip
Size: 468 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070618/f20e11bc/attachment.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: asmhdr-amd64.diff.gz
Type: application/x-gzip
Size: 421 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070618/f20e11bc/attachment-0001.bin 
