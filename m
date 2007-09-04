From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 4 Sep 2007 13:51:18 -0700
Subject: [Buildroot] [buildroot 0001483]: toolchain compilation fails with
	libstdc++ in gcc version 3.4.6
Message-ID: <7fba3e163343da41850c8bbb6b870a21@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1483 
====================================================================== 
Reported By:                HappyCactus
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1483
Category:                   Other
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-04-2007 06:42 PDT
Last Modified:              09-04-2007 13:51 PDT
====================================================================== 
Summary:                    toolchain compilation fails with libstdc++ in gcc
version 3.4.6
Description: 
When compiling gcc 3.4.6 with libstdc++ enabled, many errors make the
compilation fail.

/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/gcc/xgcc
-shared-libgcc
-B/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/gcc/
-nostdinc++
-L/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux-uclibc/libstdc++-v3/src
-L/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux-uclibc/libstdc++-v3/src/.libs
-B/home/happycactus/buildroot/build_i386/staging_dir/i386-linux-uclibc/bin/
-B/home/happycactus/buildroot/build_i386/staging_dir/i386-linux-uclibc/lib/
-isystem
/home/happycactus/buildroot/build_i386/staging_dir/i386-linux-uclibc/include
-isystem
/home/happycactus/buildroot/build_i386/staging_dir/i386-linux-uclibc/sys-include
-I/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux-uclibc/libstdc++-v3/include/i386-linux-uclibc
-I/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux-uclibc/libstdc++-v3/include
-I/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6/libstdc++-v3/libsupc++
-g -Os -g -Os -fno-implicit-templates -Wall -W -Wwrite-strings -Wcast-qual
-fdiagnostics-show-location=once -ffunction-sections -fdata-sections -c
/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6/libstdc++-v3/src/allocator.cc
 -fPIC -DPIC -o .libs/allocator.o
In file included from
/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux-uclibc/libstdc++-v3/include/iosfwd:46,
                 from
/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux-uclibc/libstdc++-v3/include/bits/stl_algobase.h:70,
                 from
/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux-uclibc/libstdc++-v3/include/memory:54,
                 from
/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6/libstdc++-v3/src/allocator.cc:35:
/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux-uclibc/libstdc++-v3/include/i386-linux-uclibc/bits/c++locale.h:
In function `int std::__convert_from_v(char*, int, const char*, _Tv, int*
const&, int)':
/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux-uclibc/libstdc++-v3/include/i386-linux-uclibc/bits/c++locale.h:103:
error: `snprintf' is not a member of `std'
make[4]: *** [allocator.lo] Error 1
make[4]: Leaving directory
`/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux-uclibc/libstdc++-v3/src'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux-uclibc/libstdc++-v3'
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux-uclibc/libstdc++-v3'
make[1]: *** [all-target-libstdc++-v3] Error 2
make[1]: Leaving directory
`/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final'
make: ***
[/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/.compiled]
Error 2

changing the c++locale.h file by removeing the std:: namespace from the
function call doesn't solve the issue completely:

for file in ./i386-linux-uclibc/bits/stdc++.h.gch/*; do \
          /usr/bin/install -c -m 644 $file
/home/happycactus/buildroot/build_i386/staging_dir/include/c++/3.4.6/./i386-linux-uclibc/bits/stdc++.h.gch;
done
/usr/bin/install: impossibile fare stat di
`./i386-linux-uclibc/bits/stdc++.h.gch/*': No such file or directory
make[4]: *** [install-pch] Error 1
make[4]: Leaving directory
`/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux-uclibc/libstdc++-v3/include'
make[3]: *** [install-am] Error 2
make[3]: Leaving directory
`/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux-uclibc/libstdc++-v3/include'
make[2]: *** [install-recursive] Error 1
make[2]: Leaving directory
`/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux-uclibc/libstdc++-v3'
make[1]: *** [install-target-libstdc++-v3] Error 2
make[1]: Leaving directory
`/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final'
make: ***
[/home/happycactus/buildroot/toolchain_build_i386/gcc-3.4.6-final/.installed]
Error 2


====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 09-04-07 13:50  
---------------------------------------------------------------------- 
What OS do you run on the build-host?
Please do
$ uname -a
$ /lib/libc.so.6
$ gcc --version 

---------------------------------------------------------------------- 
 bernhardf - 09-04-07 13:51  
---------------------------------------------------------------------- 
(PS: this sounds much like PR30915) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-04-07 06:42  HappyCactus    New Issue                                    
09-04-07 06:42  HappyCactus    Status                   new => assigned     
09-04-07 06:42  HappyCactus    Assigned To               => buildroot       
09-04-07 06:42  HappyCactus    File Added: .config                          
09-04-07 13:50  bernhardf      Note Added: 0002708                          
09-04-07 13:51  bernhardf      Note Added: 0002709                          
======================================================================
