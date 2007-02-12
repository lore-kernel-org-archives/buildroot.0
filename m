From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:08 -0800
Subject: [Buildroot] [buildroot 0001096]: build with NPTL selected crashes
Message-ID: <18318be03ea33ee46b3ed0c5569041d0@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1096 
====================================================================== 
Reported By:                znmeb
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1096
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-20-2006 16:11 PST
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    build with NPTL selected crashes
Description: 
I just downloaded the latest buildroot from SVN and am trying to build an
ARM generic development system. I've attached the output of "make
menuconfig". It gets an error in trying to build uClibc snapshot somewhere
trying to deal with NPTL

wget --passive-ftp -P /data1/GenericBuildroot/buildroot/dl
http://www.uclibc.org/downloads/snapshots/uClibc-snapshot.tar.bz2
--16:03:15-- 
http://www.uclibc.org/downloads/snapshots/uClibc-snapshot.tar.bz2
           =>
`/data1/GenericBuildroot/buildroot/dl/uClibc-snapshot.tar.bz2'
Resolving www.uclibc.org... 140.211.166.42
Connecting to www.uclibc.org|140.211.166.42|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 3,675,906 (3.5M) [application/x-tar]

100%[====================================>] 3,675,906    518.79K/s    ETA
00:00

16:03:22 (585.45 KB/s) -
`/data1/GenericBuildroot/buildroot/dl/uClibc-snapshot.tar.bz2' saved
[3675906/3675906]

mkdir -p /data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu
bzcat /data1/GenericBuildroot/buildroot/dl/uClibc-snapshot.tar.bz2 | tar
-C /data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu   -xf -
toolchain/patch-kernel.sh
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc
toolchain/uClibc/ \*.patch
touch
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc/.unpacked
cp toolchain/uClibc/uClibc.config
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc/.config
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/bin/sed -i -e
's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="/data1/GenericBuildroot/buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-",g'
\
                -e 's,# TARGET_arm is not set,TARGET_arm=y,g' \
                -e 's,^TARGET_ARCH="none",TARGET_ARCH=\"arm\",g' \
                -e
's,^KERNEL_SOURCE=.*,KERNEL_SOURCE=\"/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/linux\",g'
\
                -e 's,^RUNTIME_PREFIX=.*,RUNTIME_PREFIX=\"/\",g' \
                -e 's,^DEVEL_PREFIX=.*,DEVEL_PREFIX=\"/usr/\",g' \
                -e
's,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX=\"/lib\",g' \
               
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc/.config
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/bin/sed -i -e
's,^.*CONFIG_ARM_XSCALE.*,CONFIG_ARM_XSCALE=y,g' \
       
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc/.config
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/bin/sed -i -e
'/^# ARCH_LITTLE_ENDIAN /{s,# ,,;s, is not set,=y,g}' \
                -e '/^# ARCH_BIG_ENDIAN /{s,# ,,;s, is not set,=n,g}' \
               
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc/.config
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/bin/sed -i -e
'/^# ARCH_WANTS_LITTLE_ENDIAN /{s,# ,,;s, is not set,=y,g}' \
                -e '/^# ARCH_WANTS_BIG_ENDIAN /{s,# ,,;s, is not
set,=n,g}' \
               
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc/.config
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/bin/sed -i -e
's,^.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=y,g'
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc/.config
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/bin/sed -i -e
's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g'
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc/.config
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/bin/sed -i -e
's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=n\nHAS_FPU=n\nUCLIBC_HAS_FLOATS=y\nUCLIBC_HAS_SOFT_FLOAT=y,g'
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc/.config
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/bin/sed -i -e
's,# UCLIBC_HAS_THREADS is not set,UCLIBC_HAS_THREADS=y,g'
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc/.config
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/bin/sed -i -e
's,# PTHREADS_DEBUG_SUPPORT is not set,PTHREADS_DEBUG_SUPPORT=y,g'
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc/.config
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/bin/sed -i -e
's,# UCLIBC_HAS_THREADS_NATIVE is not set,UCLIBC_HAS_THREADS_NATIVE=y,g'
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc/.config
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/bin/sed -i -e
's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g'
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc/.config
mkdir -p
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc_dev/usr/include
mkdir -p
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc_dev/usr/lib
mkdir -p
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc_dev/lib
make -C /data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc
\
               
PREFIX=/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc_dev/
\
                DEVEL_PREFIX=/usr/ \
               
RUNTIME_PREFIX=/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc_dev/
\
                HOSTCC="gcc" \
                pregen install_dev && \
        touch
/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc/.configured
/bin/sh:
/data1/GenericBuildroot/buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc:
No such file or directory
/bin/sh:
/data1/GenericBuildroot/buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc:
No such file or directory
make[1]:
/data1/GenericBuildroot/buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc:
Command not found
make[1]: Entering directory
`/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc'
make[1]:
/data1/GenericBuildroot/buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc:
Command not found
libpthread/Makefile.in:9: libpthread/nptl/Makefile.in: No such file or
directory
libpthread/Makefile.in:10: libpthread/nptl_db/Makefile.in: No such file or
directory
make[1]: *** No rule to make target `libpthread/nptl_db/Makefile.in'. 
Stop.
make[1]: Leaving directory
`/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc'
make: ***
[/data1/GenericBuildroot/buildroot/toolchain_build_arm_nofpu/uClibc/.configured]
Error 2

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 11-22-06 13:20  
---------------------------------------------------------------------- 
Note that NPTL is not currently working, AFAIK, so use linuxthreads.old.
Please let me know if it works with linuxthreads or not, thanks. 

---------------------------------------------------------------------- 
 vapier - 11-27-06 07:13  
---------------------------------------------------------------------- 
NPTL isnt supported yet, so dont pick that option 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-20-06 16:11  znmeb          New Issue                                    
11-20-06 16:11  znmeb          Status                   new => assigned     
11-20-06 16:11  znmeb          Assigned To               => uClibc          
11-20-06 16:11  znmeb          File Added: xconfig                          
11-20-06 16:13  znmeb          Issue Monitored: znmeb                       
11-22-06 13:20  bernhardf      Note Added: 0001771                          
11-27-06 07:13  vapier         Note Added: 0001808                          
11-27-06 07:13  vapier         Status                   assigned => closed  
11-27-06 07:13  vapier         Resolution               open => no change
required
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
