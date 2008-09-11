From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 11 Sep 2008 02:09:26 -0700
Subject: [Buildroot] [buildroot 0004804]: lzo1x.h not found
Message-ID: <362035a498f3732482d2664d817f524f@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=4804 
====================================================================== 
Reported By:                iceman_im
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4804
Category:                   Other
Reproducibility:            have not tried
Severity:                   crash
Priority:                   normal
Status:                     closed
Resolution:                 reopened
Fixed in Version:           
====================================================================== 
Date Submitted:             09-03-2008 08:43 PDT
Last Modified:              09-11-2008 02:09 PDT
====================================================================== 
Summary:                    lzo1x.h not found
Description: 
I try to make a compilation for arm architecutre for an AT91sam9260EK board
and I have a compilation error in mtd_orig...

Looks like lzo1x.h could not be found but :

# find -name lzo1x.h
./build_arm_wchar/lzo-2.03/include/lzo/lzo1x.h
./build_arm_wchar/staging_dir/usr/include/lzo/lzo1x.h

======================================================================
Relationships       ID      Summary
----------------------------------------------------------------------
related to          0004894 host lzo and zlib can't be built within...
====================================================================== 

---------------------------------------------------------------------- 
 hmoffatt - 09-03-08 18:40  
---------------------------------------------------------------------- 
Fixed in r23315.. thanks

Please consider sending compile error logs in English (eg set LANG=C
before compiling). Thanks 

---------------------------------------------------------------------- 
 iceman_im - 09-04-08 08:25  
---------------------------------------------------------------------- 
Sorry for the french error log, next time it will be in english.
Thanks for the fix but I allready have the same problem...

In fact the build works find for an ext2 file system but crashed for a
jffs2 one... 

---------------------------------------------------------------------- 
 vintonc - 09-04-08 14:30  
---------------------------------------------------------------------- 
I have the same issue.  I have verified that lzo and lzo-devel are
installed on the host system, they were suggested as possible causes of
the issue elsewhere. It will build for ext2 only just fine. I am currently
trying to build for jffs2 only.  I am running R23324, newer than the fixed
note indicates.

/home/vintonc/buildroot/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
-I. -I./include
-I/home/vintonc/buildroot/buildroot/toolchain_build_arm/linux/include
-I/home/vintonc/buildroot/buildroot/build_arm/staging_dir/usr/include -Os 
-I/home/vintonc/buildroot/buildroot/build_arm/staging_dir/usr/include
-I/home/vintonc/buildroot/buildroot/build_arm/staging_dir/include
--sysroot=/home/vintonc/buildroot/buildroot/build_arm/staging_dir/
-isysroot /home/vintonc/buildroot/buildroot/build_arm/staging_dir
-mtune=arm920t -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -g -c -o
/home/vintonc/buildroot/buildroot/build_arm/mtd_orig/compr_lzo.o
compr_lzo.c -g
-Wp,-MD,/home/vintonc/buildroot/buildroot/build_arm/mtd_orig/.compr_lzo.c.dep
compr_lzo.c:29:19: error: lzo1x.h: No such file or directory
compr_lzo.c: In function 'jffs2_lzo_cmpr':
compr_lzo.c:56: error: 'LZO_E_OK' undeclared (first use in this function)
compr_lzo.c:56: error: (Each undeclared identifier is reported only once
compr_lzo.c:56: error: for each function it appears in.)
compr_lzo.c: In function 'jffs2_lzo_decompress':
compr_lzo.c:76: error: 'LZO_E_OK' undeclared (first use in this function)
compr_lzo.c: In function 'jffs2_lzo_init':
compr_lzo.c:95: error: 'LZO1X_999_MEM_COMPRESS' undeclared (first use in
this function)
make[1]: ***
[/home/vintonc/buildroot/buildroot/build_arm/mtd_orig/compr_lzo.o] Error
1
rm /home/vintonc/buildroot/buildroot/build_arm/mtd_orig/ftl_check.o
/home/vintonc/buildroot/buildroot/build_arm/mtd_orig/mkfs.jffs.o
/home/vintonc/buildroot/buildroot/build_arm/mtd_orig/doc_loadbios.o
/home/vintonc/buildroot/buildroot/build_arm/mtd_orig/flash_erase.o
/home/vintonc/buildroot/buildroot/build_arm/mtd_orig/ftl_format.o
/home/vintonc/buildroot/buildroot/build_arm/mtd_orig/nanddump.o
make[1]: Leaving directory
`/home/vintonc/buildroot/buildroot/build_arm/mtd_orig'
make: ***
[/home/vintonc/buildroot/buildroot/build_arm/mtd_orig/flash_erase] Error
2
[vintonc at discovery buildroot]$ svn info
Path: .
URL: svn://uclibc.org/trunk/buildroot
Repository Root: svn://uclibc.org
Repository UUID: 69ca8d6d-28ef-0310-b511-8ec308f3f277
Revision: 23324
Node Kind: directory
Schedule: normal
Last Changed Author: hamish
Last Changed Rev: 23319
Last Changed Date: 2008-09-04 01:50:31 -0400 (Thu, 04 Sep 2008) 

---------------------------------------------------------------------- 
 hmoffatt - 09-04-08 17:50  
---------------------------------------------------------------------- 
After updating from svn you need to make mtd-host-dirclean and
mtd-dirclean, because the old patches have already been applied and need
to be undone.

Can you please try this and update the issue if you still have trouble?
I have built mtd-utils.git successfully with these patches removed and the
latest lzo in the tree.

Sorry for my ignorance of French :) 

---------------------------------------------------------------------- 
 iceman_im - 09-05-08 06:45  
---------------------------------------------------------------------- 
Still unsolved and now i have an another error a the same time.
during a clean just before the previous one.

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/lib/ccache/gcc'
C compiler version '4.1.2':                     Ok
C++ compiler '/usr/lib/ccache/g++'
C++ compiler version '4.1.2':                   Ok
awk installed:                                  Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf
/home/assensg/Bureau/Buildroot/buildroot/project_build_arm_wchar/at91sam9260pf/buildroot-config
mkdir -p
/home/assensg/Bureau/Buildroot/buildroot/project_build_arm_wchar/at91sam9260pf
cp -dpRf package/config/buildroot-config
/home/assensg/Bureau/Buildroot/buildroot/project_build_arm_wchar/at91sam9260pf/buildroot-config
rm -rf
/home/assensg/Bureau/Buildroot/buildroot/project_build_arm_wchar/at91sam9260pf/root/usr/include
/home/assensg/Bureau/Buildroot/buildroot/project_build_arm_wchar/at91sam9260pf/root/usr/lib/pkgconfig
find
/home/assensg/Bureau/Buildroot/buildroot/project_build_arm_wchar/at91sam9260pf/root/usr/lib
-name '*.a' -delete
find
/home/assensg/Bureau/Buildroot/buildroot/project_build_arm_wchar/at91sam9260pf/root/lib
-name '*.a' -delete
find
/home/assensg/Bureau/Buildroot/buildroot/project_build_arm_wchar/at91sam9260pf/root/usr/lib
-name '*.la' -delete
find
/home/assensg/Bureau/Buildroot/buildroot/project_build_arm_wchar/at91sam9260pf/root/lib
-name '*.la' -delete
/usr/bin/make -j20 \
                MEMORY=dataflashcard \
               
CROSS_COMPILE=/home/assensg/Bureau/Buildroot/buildroot/build_arm_wchar/staging_dir/usr/bin/arm-linux-uclibc-
\
                -C
/home/assensg/Bureau/Buildroot/buildroot/project_build_arm_wchar/at91sam9260pf/at91bootstrap-2.3
\
                at91sam9260dfc_defconfig
make[1]: Entering directory
`/home/assensg/Bureau/Buildroot/buildroot/project_build_arm_wchar/at91sam9260pf/at91bootstrap-2.3'
find . -type f \( -name .depend \
                -o -name '*.srec' \
                -o -name '*.elf' \
                -o -name '*.map' \
                -o -name '*.o' \
                -o -name '*~' \) \
                -print0 \
                | xargs -0 rm -f
xargs: xargs.c:445: main: Assertion `bc_ctl.arg_max <= (131072-2048)'
failed.
/bin/sh: line 7: 16391 Done                    find . -type f \( -name
.depend -o -name '*.srec' -o -name '*.elf' -o -name '*.map' -o -name '*.o'
-o -name '*~' \) -print0
     16392 Aborted                 | xargs -0 rm -f
make[1]: *** [clean] Error 134
make[1]: Target `at91sam9260dfc_defconfig' not remade because of errors.
make[1]: Leaving directory
`/home/assensg/Bureau/Buildroot/buildroot/project_build_arm_wchar/at91sam9260pf/at91bootstrap-2.3'
make: ***
[/home/assensg/Bureau/Buildroot/buildroot/project_build_arm_wchar/at91sam9260pf/at91bootstrap-2.3/.configured]
Erreur 2
CC="/usr/lib/ccache/gcc" CROSS=
CFLAGS=-I/home/assensg/Bureau/Buildroot/buildroot/toolchain_build_arm_wchar/linux/include
\
                /usr/bin/make -j20
LINUXDIR=/home/assensg/Bureau/Buildroot/buildroot/project_build_arm_wchar/at91sam9260pf/linux-2.6.26.3
\
               
BUILDDIR=/home/assensg/Bureau/Buildroot/buildroot/toolchain_build_arm_wchar/mtd_orig
\
                -C
/home/assensg/Bureau/Buildroot/buildroot/toolchain_build_arm_wchar/mtd_orig
mkfs.jffs2
make[1]: Entering directory
`/home/assensg/Bureau/Buildroot/buildroot/toolchain_build_arm_wchar/mtd_orig'
mkdir -p
/home/assensg/Bureau/Buildroot/buildroot/toolchain_build_arm_wchar/mtd_orig
gcc -I./include -O2 -Wall -g -c -o
/home/assensg/Bureau/Buildroot/buildroot/toolchain_build_arm_wchar/mtd_orig/compr_lzo.o
compr_lzo.c -g
-Wp,-MD,/home/assensg/Bureau/Buildroot/buildroot/toolchain_build_arm_wchar/mtd_orig/.compr_lzo.c.dep
compr_lzo.c:29:23: error: lzo/lzo1x.h: No such file or directory
compr_lzo.c: In function 'jffs2_lzo_cmpr':
compr_lzo.c:54: warning: implicit declaration of function
'lzo1x_999_compress'
compr_lzo.c:56: error: 'LZO_E_OK' undeclared (first use in this function)
compr_lzo.c:56: error: (Each undeclared identifier is reported only once
compr_lzo.c:56: error: for each function it appears in.)
compr_lzo.c: In function 'jffs2_lzo_decompress':
compr_lzo.c:74: warning: implicit declaration of function
'lzo1x_decompress_safe'
compr_lzo.c:76: error: 'LZO_E_OK' undeclared (first use in this function)
compr_lzo.c: In function 'jffs2_lzo_init':
compr_lzo.c:95: error: 'LZO1X_999_MEM_COMPRESS' undeclared (first use in
this function)
make[1]: ***
[/home/assensg/Bureau/Buildroot/buildroot/toolchain_build_arm_wchar/mtd_orig/compr_lzo.o]
Error 1
make[1]: Target `mkfs.jffs2' not remade because of errors.
make[1]: Leaving directory
`/home/assensg/Bureau/Buildroot/buildroot/toolchain_build_arm_wchar/mtd_orig'
make: ***
[/home/assensg/Bureau/Buildroot/buildroot/toolchain_build_arm_wchar/mtd_orig/mkfs.jffs2]
Erreur 2
rm -f
/home/assensg/Bureau/Buildroot/buildroot/project_build_arm_wchar/at91sam9260pf/.fakeroot*

 

---------------------------------------------------------------------- 
 hmoffatt - 09-05-08 08:04  
---------------------------------------------------------------------- 
xargs: xargs.c:445: main: Assertion `bc_ctl.arg_max <= (131072-2048)'
failed.

That's your system's xargs crashing.. nothing to do with buildroot.. :-|
I'm not sure what to suggest sorry. 

---------------------------------------------------------------------- 
 vintonc - 09-05-08 08:12  
---------------------------------------------------------------------- 
Your suggestion to make mtd-host-dirclean and mtd-dirclean worked.  I when
back and did a make distclean just to be sure nothing else was cached that
could cause a problem.  This is my first time using buildroot so I still
need to determine if my build results are a problem or not. Thanks for the
help.

/home/vintonc/buildroot/buildroot/build_arm/staging_dir/usr/bin/fakeroot
--
/home/vintonc/buildroot/buildroot/project_build_arm/uclibc/_fakeroot.rootfs.arm.jffs2
rootdir=/home/vintonc/buildroot/buildroot/project_build_arm/uclibc/root
table='target/generic/mini_device_table.txt'
mkfs.jffs2: skipping device_table entry '/dev': no parent directory!
mkfs.jffs2: skipping device_table entry '/tmp': no parent directory!
mkfs.jffs2: skipping device_table entry '/etc': no parent directory!
mkfs.jffs2: skipping device_table entry '/sys': no parent directory!
mkfs.jffs2: skipping device_table entry '/config': no parent directory!
mkfs.jffs2: skipping device_table entry '/proc': no parent directory!
mkfs.jffs2: skipping device_table entry '/root': no parent directory!
-rw-r--r-- 1 vintonc vintonc 2041644 2008-09-04 22:59
/home/vintonc/buildroot/buildroot/binaries/uclibc/rootfs.arm.jffs2
rm -f
/home/vintonc/buildroot/buildroot/project_build_arm/uclibc/.fakeroot* 

---------------------------------------------------------------------- 
 hmoffatt - 09-10-08 19:16  
---------------------------------------------------------------------- 
This is really fixed I believe.. users need to make mtd-dirclean and
host-mtd-dirclean and rebuild so that the new patch gets applied. 

---------------------------------------------------------------------- 
 iceman_im - 09-11-08 02:02  
---------------------------------------------------------------------- 
Sorry to reopen but the problem still here for me...
For xargs it was my fault, thank you ;O)

For mtd_orig there i allready have the same problem... Maybe another
mistake from me.. 
In make menu config do we have to choose 'MTD-utils realese' or 'MTD-utils
from GIT' ?

just in case it may help -> see my log :

toolchain/patch-kernel.sh
/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig \
		package/mtd/mtd-utils mtd-utils-1.1.0-host\*.patch
touch
/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig/.unpacked
CC="/usr/bin/gcc" CROSS=
CFLAGS=-I/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/linux/include
\
		/usr/bin/make -j8
LINUXDIR=/home/assensg/Desktop/buildroot/project_build_arm_wchar/at91sam9260pf/linux-2.6.26.3
\
		BUILDDIR=/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig
\
		-C /home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig
mkfs.jffs2
make[1]: Entering directory
`/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig'
mkdir -p
/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig
gcc -I./include -O2 -Wall -g -c -o
/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig/crc32.o
crc32.c -g
-Wp,-MD,/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig/.crc32.c.dep
mkdir -p
/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig
gcc -I./include -O2 -Wall -g -c -o
/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig/compr_rtime.o
compr_rtime.c -g
-Wp,-MD,/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig/.compr_rtime.c.dep
mkdir -p
/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig
gcc -I./include -O2 -Wall -g -c -o
/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig/mkfs.jffs2.o
mkfs.jffs2.c -g
-Wp,-MD,/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig/.mkfs.jffs2.c.dep
mkdir -p
/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig
gcc -I./include -O2 -Wall -g -c -o
/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig/compr_zlib.o
compr_zlib.c -g
-Wp,-MD,/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig/.compr_zlib.c.dep
mkdir -p
/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig
gcc -I./include -O2 -Wall -g -c -o
/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig/compr_lzo.o
compr_lzo.c -g
-Wp,-MD,/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig/.compr_lzo.c.dep
mkdir -p
/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig
compr_zlib.c:36:18: error: zlib.h: No such file or directory
gcc -I./include -O2 -Wall -g -c -o
/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig/compr.o
compr.c -g
-Wp,-MD,/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig/.compr.c.dep
compr_zlib.c: In function ?jffs2_zlib_compress?:
compr_zlib.c:56: error: ?z_stream? undeclared (first use in this
function)
compr_zlib.c:56: error: (Each undeclared identifier is reported only once
compr_zlib.c:56: error: for each function it appears in.)
compr_zlib.c:56: error: expected ?;? before ?strm?
compr_zlib.c:62: error: ?strm? undeclared (first use in this function)
compr_zlib.c:65: error: ?Z_OK? undeclared (first use in this function)
compr_zlib.c:65: warning: implicit declaration of function ?deflateInit?
compr_zlib.c:77: warning: implicit declaration of function ?deflate?
compr_zlib.c:77: error: ?Z_PARTIAL_FLUSH? undeclared (first use in this
function)
compr_zlib.c:79: warning: implicit declaration of function ?deflateEnd?
compr_zlib.c:85: error: ?Z_FINISH? undeclared (first use in this
function)
compr_zlib.c:86: error: ?Z_STREAM_END? undeclared (first use in this
function)
compr_zlib.c: In function ?jffs2_zlib_decompress?:
compr_zlib.c:104: error: ?z_stream? undeclared (first use in this
function)
compr_zlib.c:104: error: expected ?;? before ?strm?
compr_zlib.c:107: error: ?strm? undeclared (first use in this function)
compr_zlib.c:110: error: ?Z_OK? undeclared (first use in this function)
compr_zlib.c:110: warning: implicit declaration of function ?inflateInit?
compr_zlib.c:121: warning: implicit declaration of function ?inflate?
compr_zlib.c:121: error: ?Z_FINISH? undeclared (first use in this
function)
compr_zlib.c:124: warning: implicit declaration of function ?inflateEnd?
make[1]: ***
[/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig/compr_zlib.o]
Error 1
make[1]: *** Waiting for unfinished jobs....
compr_lzo.c:29:23: error: lzo/lzo1x.h: No such file or directory
compr_lzo.c: In function ?jffs2_lzo_cmpr?:
compr_lzo.c:54: warning: implicit declaration of function
?lzo1x_999_compress?
compr_lzo.c:56: error: ?LZO_E_OK? undeclared (first use in this function)
compr_lzo.c:56: error: (Each undeclared identifier is reported only once
compr_lzo.c:56: error: for each function it appears in.)
compr_lzo.c: In function ?jffs2_lzo_decompress?:
compr_lzo.c:74: warning: implicit declaration of function
?lzo1x_decompress_safe?
compr_lzo.c:76: error: ?LZO_E_OK? undeclared (first use in this function)
compr_lzo.c: In function ?jffs2_lzo_init?:
compr_lzo.c:95: error: ?LZO1X_999_MEM_COMPRESS? undeclared (first use in
this function)
make[1]: ***
[/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig/compr_lzo.o]
Error 1
mkfs.jffs2.c:69:21: error: sys/acl.h: No such file or directory
mkfs.jffs2.c:73:18: error: zlib.h: No such file or directory
mkfs.jffs2.c: In function ?formalize_posix_acl?:
mkfs.jffs2.c:1084: error: ?ACL_USER_OBJ? undeclared (first use in this
function)
mkfs.jffs2.c:1084: error: (Each undeclared identifier is reported only
once
mkfs.jffs2.c:1084: error: for each function it appears in.)
mkfs.jffs2.c:1085: error: ?ACL_GROUP_OBJ? undeclared (first use in this
function)
mkfs.jffs2.c:1086: error: ?ACL_MASK? undeclared (first use in this
function)
mkfs.jffs2.c:1087: error: ?ACL_OTHER? undeclared (first use in this
function)
mkfs.jffs2.c:1093: error: ?ACL_USER? undeclared (first use in this
function)
mkfs.jffs2.c:1094: error: ?ACL_GROUP? undeclared (first use in this
function)
make[1]: ***
[/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig/mkfs.jffs2.o]
Error 1
make[1]: Leaving directory
`/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig'
make: ***
[/home/assensg/Desktop/buildroot/toolchain_build_arm_wchar/mtd_orig/mkfs.jffs2]
Error 2


Thank you in advance 

---------------------------------------------------------------------- 
 hmoffatt - 09-11-08 02:06  
---------------------------------------------------------------------- 
lzo/lzo1x.h is the correct file but you just don't have it.. and you're
missing zlib.h as well. This is not the same problem as the original
report though it's still a problem.

It appears to be a problem building host-mtd.. I couldn't find somewhere
that builds a host zlib. You might need to install a zlib-dev package on
your system or similar, same for lzma. We should maybe be building this
within buildroot.

I'd prefer to start a new bug report for this if you wouldn't mind, it's
not the same problem and this report is very long already. 

---------------------------------------------------------------------- 
 hmoffatt - 09-11-08 02:09  
---------------------------------------------------------------------- 
I created http://busybox.net/bugs/view.php?id=4894 to log the new problem. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-03-08 08:43  iceman_im      New Issue                                    
09-03-08 08:43  iceman_im      Status                   new => assigned     
09-03-08 08:43  iceman_im      Assigned To               => buildroot       
09-03-08 18:40  hmoffatt       Status                   assigned => closed  
09-03-08 18:40  hmoffatt       Note Added: 0010974                          
09-03-08 18:40  hmoffatt       Resolution               open => fixed       
09-04-08 08:21  iceman_im      Issue Monitored: iceman_im                    
09-04-08 08:22  iceman_im      Issue End Monitor: iceman_im                    
09-04-08 08:25  iceman_im      Status                   closed => feedback  
09-04-08 08:25  iceman_im      Resolution               fixed => reopened   
09-04-08 08:25  iceman_im      Note Added: 0011004                          
09-04-08 14:30  vintonc        Note Added: 0011054                          
09-04-08 17:50  hmoffatt       Note Added: 0011074                          
09-05-08 06:40  iceman_im      Note Added: 0011114                          
09-05-08 06:45  iceman_im      Note Edited: 0011114                         
09-05-08 08:04  hmoffatt       Note Added: 0011124                          
09-05-08 08:12  vintonc        Note Added: 0011134                          
09-10-08 19:16  hmoffatt       Status                   feedback => closed  
09-10-08 19:16  hmoffatt       Note Added: 0011364                          
09-10-08 19:16  hmoffatt       Resolution               reopened => fixed   
09-11-08 02:02  iceman_im      Status                   closed => feedback  
09-11-08 02:02  iceman_im      Resolution               fixed => reopened   
09-11-08 02:02  iceman_im      Note Added: 0011384                          
09-11-08 02:06  hmoffatt       Note Added: 0011394                          
09-11-08 02:08  hmoffatt       Issue cloned             0004894             
09-11-08 02:08  hmoffatt       Relationship added       related to 0004894  
09-11-08 02:09  hmoffatt       Status                   feedback => closed  
09-11-08 02:09  hmoffatt       Note Added: 0011404                          
======================================================================
