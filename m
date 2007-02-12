From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:21 -0800
Subject: [Buildroot] [buildroot 0000779]: Error during compilation of uclibc
	and libstdc++ related to large file support
Message-ID: <dbb23330b42074b4ae3fcdaa662a726a@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=779 
====================================================================== 
Reported By:                blurgk
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   779
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-08-2006 06:51 PST
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    Error during compilation of uclibc and libstdc++
related to large file support
Description: 
I am trying to compile a cross-compilation toolchain for an ARM system
under cygwin, without large file support (buildroot config file attached),
but I get several errors.

First during the compilation of uclibc:
error: 'lseek64' undeclared here (not in a function)
in
toolchain_build_arm_nofpu/uClibc/libc/sysdeps/linux/common/pread_write.c

Then several times during the compilation of libstdc++, because of
_GLIBCXX_USE_LFS incorrectly set:

toolchain_buid_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3/include/ext/stdio_sync_filebuf.h:170:
error: there are no arguments to 'fseek64' that depend on a template
parameter, so a declaration of 'fseeko64' must be available 

and

/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/gcc/xgcc
-shared-libgcc
-B/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/gcc/
-nostdinc++
-L/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3/src
-L/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3/src/.libs
-B/usr/src/buildroot/build_arm_nofpu/staging_dir/arm-linux-uclibc/bin/
-B/usr/src/buildroot/build_arm_nofpu/staging_dir/arm-linux-uclibc/lib/
-isystem
/usr/src/buildroot/build_arm_nofpu/staging_dir/arm-linux-uclibc/include
-isystem
/usr/src/buildroot/build_arm_nofpu/staging_dir/arm-linux-uclibc/sys-include
-I/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3/include/arm-linux-uclibc
-I/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3/include
-I/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5/libstdc++-v3/libsupc++
-g -Os -g -Os -fno-implicit-templates -Wall -W -Wwrite-strings -Wcast-qual
-fdiagnostics-show-location=once -ffunction-sections -fdata-sections -c
basic_file.cc  -fPIC -DPIC -o .libs/basic_file.o
basic_file.cc: In member function `std::__basic_file<char>*
std::__basic_file<char>::open(const char*, std::_Ios_Openmode, int)':
basic_file.cc:232: error: `fopen64' was not declared in this scope
basic_file.cc:232: warning: unused variable 'fopen64'
basic_file.cc: In member function `std::streamoff
std::__basic_file<char>::seekoff(std::streamoff, std::_Ios_Seekdir)':
basic_file.cc:316: error: `lseek64' was not declared in this scope
basic_file.cc:316: warning: unused variable 'lseek64'
make[4]: *** [basic_file.lo] Error 1
make[4]: Leaving directory
`/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3/src'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3'
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3'
make[1]: *** [all-target-libstdc++-v3] Error 2
make[1]: Leaving directory
`/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final'
make: ***
[/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/.compiled]
Error 2

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-28-06 01:08  
---------------------------------------------------------------------- 
Works for me with the fixes i just installed (revision 17099) for gcc-4.2
on i386. Please try 4.2 and report back. 

---------------------------------------------------------------------- 
 bernhardf - 01-19-07 08:15  
---------------------------------------------------------------------- 
Fixed in gcc-4.2 and gcc-4.3; See
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=30365 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-08-06 06:51  blurgk         New Issue                                    
03-08-06 06:51  blurgk         Status                   new => assigned     
03-08-06 06:51  blurgk         Assigned To               => uClibc          
03-08-06 06:51  blurgk         File Added: .config                          
05-22-06 11:14  tabgal         Issue Monitored: tabgal                      
12-28-06 01:08  bernhardf      Note Added: 0001944                          
12-28-06 01:08  bernhardf      Status                   assigned => feedback
01-09-07 06:15  stephaneC      Issue Monitored: stephaneC                    
01-19-07 08:15  bernhardf      Status                   feedback => closed  
01-19-07 08:15  bernhardf      Note Added: 0001997                          
01-19-07 08:15  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
