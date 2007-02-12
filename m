From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:05 -0800
Subject: [Buildroot] [buildroot 0000932]: make didn't run through buildroot
Message-ID: <eaefc57b528e80315cbf20afa06cab7d@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=932 
====================================================================== 
Reported By:                raina
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   932
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-02-2006 14:27 PDT
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    make didn't run through buildroot
Description: 
I tried compiling buildroot following the instructions on
http://buildroot.uclibc.org/buildroot.html
but make didn't run through. I did:

~/buildroot$ make menuconfig
~/buildroot$ make -d 2>&1 |tee logfile

Here is some tail from the logfile (omitted lots of checking lines):
...
checking ...
checking for unistd.h... (cached) yes
updating cache ./config.cache
configure: creating ./config.status
config.status: creating Makefile
config.status: executing default-1 commands
Adding multilib support to Makefile in
/home/raina/Desktop/buildroot/toolchain_build_i586/gcc-4.0.3/zlib
multidirs=64
with_multisubdir=
Running configure in multilib subdirs 64
pwd:
/home/raina/Desktop/buildroot/toolchain_build_i586/gcc-4.0.3-final/zlib
Running configure in multilib subdir 64
pwd: /home/raina/Desktop/buildroot/toolchain_build_i586/gcc-4.0.3-final
mkdir 64
configure: creating cache ./config.cache
checking build system type... i386-pc-linux-gnu
checking ...
...
checking ...
checking whether to build static libraries... yes
creating libtool
updating cache ./config.cache
configure: loading cache ./config.cache
checking how to run the C preprocessor... gcc  -m64 -E
checking for memcpy... configure: error: Link tests are not allowed after
GCC_NO_EXECUTABLES.
Reaping losing child 0x080c3838 PID 11125
make[1]: *** [configure-zlib] Error 1
Removing child 0x080c3838 PID 11125 from chain.
make[1]: Leaving directory
`/home/raina/Desktop/buildroot/toolchain_build_i586/gcc-4.0.3-final'
Reaping losing child 0x08651818 PID 9366
make: ***
[/home/raina/Desktop/buildroot/toolchain_build_i586/gcc-4.0.3-final/.compiled]
Error 2
Removing child 0x08651818 PID 9366 from chain.


====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 08-28-06 03:50  
---------------------------------------------------------------------- 
Sounds like
http://gcc.gnu.org/PR16838 

---------------------------------------------------------------------- 
 jimdigriz - 10-29-06 04:04  
---------------------------------------------------------------------- 
Just reporting a 'me too' bug report, it is fixed when MULTILIB is turned
off though as suggested in the GCC bug report.

Any ideas how to get around it?  I am building for an arm926t target with
a i386 host.  Below I have attached the relevant bits from my config.  In
addition when building uclibc I throw through ARCH_HAS_MMU=N,
BUILD_UCLIBC_LDSO=Y, DL_FINI_CRT_COMPAT=N and UCLIBC_MALLOC_DEBUGGING=N.

I'm using the 'buildroot-20061029' snapshot and applying the patch
mentioned in the mailing list[1].  I'm happy to be a 'test monkey' too if
people need me to do some legwork for them.

Cheers

Alex

[1] http://buildroot.uclibc.org/lists/buildroot/2006-October/000356.html

=============
alex at inskipp:~/buildroot$ grep .config -e '^[^#]'
BR2_HAVE_DOT_CONFIG=y
BR2_arm=y
BR2_arm926t=y
BR2_ARM_TYPE="ARM926T"
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_WGET="wget --passive-ftp"
BR2_SVN="svn co"
BR2_ZCAT="zcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
BR2_JLEVEL=1
BR2_KERNEL_HEADERS_2_6_12=y
BR2_DEFAULT_KERNEL_HEADERS="2.6.12"
BR2_ENABLE_LOCALE=y
BR2_PTHREADS_NATIVE=y
BR2_BINUTILS_VERSION_2_17=y
BR2_BINUTILS_VERSION="2.17"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
BR2_GCC_VERSION_4_1_1=y
BR2_GCC_VERSION="4.1.1"
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_INSTALL_LIBSTDCPP=y
BR2_GCC_SHARED_LIBGCC=y
BR2_CCACHE=y
BR2_PACKAGE_GDB=y
BR2_GDB_VERSION_6_3=y
BR2_GDB_VERSION="6.3"
BR2_ELF2FLT=y
BR2_PACKAGE_SSTRIP_TARGET=y
BR2_PACKAGE_SSTRIP_HOST=y
BR2_ENABLE_MULTILIB=y
BR2_LARGEFILE=y
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
BR2_PACKAGE_BUSYBOX=y
BR2_PACKAGE_BUSYBOX_SNAPSHOT=y
BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox.config"
BR2_PACKAGE_BASH=y
BR2_PACKAGE_BZIP2=y
[snipped]
BR2_PACKAGE_WHICH=y
BR2_PACKAGE_ZLIB=y
BR2_TARGET_ROOTFS_SQUASHFS=y 

---------------------------------------------------------------------- 
 bernhardf - 11-22-06 15:16  
---------------------------------------------------------------------- 
jimdigriz,
Can you please attach your buildroot.config and your uClibc.config

thanks 

---------------------------------------------------------------------- 
 bernhardf - 01-19-07 08:27  
---------------------------------------------------------------------- 
Please retry with current trunk and gcc >= 4.1, preferably 4.2

I shall close this report as fixed unless i hear anything back within a
few days.
Thanks for the report. 

---------------------------------------------------------------------- 
 jimdigriz - 01-20-07 05:20  
---------------------------------------------------------------------- 
Hi,

Sorry for not being able to get back to you.  I am unable to repeat the
issue
and the original project that needed buildroot 'expired' :-/

Anyway, once again sorry for having wasted your time.

Regards

Alex 

---------------------------------------------------------------------- 
 bernhardf - 01-20-07 11:00  
---------------------------------------------------------------------- 
Works for me (tm). Thanks for the report anyway :) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-02-06 14:27  raina          New Issue                                    
07-02-06 14:28  raina          Status                   new => assigned     
07-02-06 14:28  raina          Assigned To               => uClibc          
07-02-06 14:28  raina          File Added: .config                          
07-06-06 03:16  raina          Issue Monitored: raina                       
08-28-06 03:50  bernhardf      Note Added: 0001594                          
10-29-06 04:04  jimdigriz      Note Added: 0001725                          
11-22-06 15:16  bernhardf      Note Added: 0001784                          
01-19-07 08:27  bernhardf      Note Added: 0002000                          
01-19-07 08:27  bernhardf      Status                   assigned => feedback
01-20-07 05:20  jimdigriz      Note Added: 0002011                          
01-20-07 11:00  bernhardf      Status                   feedback => closed  
01-20-07 11:00  bernhardf      Note Added: 0002012                          
01-20-07 11:00  bernhardf      Resolution               open => unable to
reproduce
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
