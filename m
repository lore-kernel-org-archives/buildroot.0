From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 22 Aug 2008 00:15:21 -0700
Subject: [Buildroot] [buildroot 0004624]: Cannot build Modular X.org:
	undefined references in libX11.so
Message-ID: <548bc9c5dadabffbbe5df0f92a6f0a7f@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4624 
====================================================================== 
Reported By:                lykowdk
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4624
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-17-2008 23:36 PDT
Last Modified:              08-22-2008 00:15 PDT
====================================================================== 
Summary:                    Cannot build Modular X.org: undefined references in
libX11.so
Description: 
Trying to build Modular X.org it crashes here..
I've tried everything I can think of to find the dependencies.
I am building with WCHAR enabled.

/bin/bash ../libtool --tag=CC   --mode=link
/home/lykowdk/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
-Os  -I/home/lykowdk/buildroot/build_i686/staging_dir/usr/include
-I/home/lykowdk/buildroot/build_i686/staging_dir/include
--sysroot=/home/lykowdk/buildroot/build_i686/staging_dir/ -isysroot
/home/lykowdk/buildroot/build_i686/staging_dir -mtune=i686 -march=i686 
-Wall -Wpointer-arith -Wstrict-prototypes 	-Wmissing-prototypes
-Wmissing-declarations 	-Wnested-externs -fno-strict-aliasing -g -O2   -o
sxpm sxpm.o -lX11   -lXt -lX11 -lSM -lICE -lXext   ../src/libXpm.la 
/home/lykowdk/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
-Os -I/home/lykowdk/buildroot/build_i686/staging_dir/usr/include
-I/home/lykowdk/buildroot/build_i686/staging_dir/include
--sysroot=/home/lykowdk/buildroot/build_i686/staging_dir/ -isysroot
/home/lykowdk/buildroot/build_i686/staging_dir -mtune=i686 -march=i686
-Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes
-Wmissing-declarations -Wnested-externs -fno-strict-aliasing -g -O2 -o
sxpm sxpm.o 
/home/lykowdk/buildroot/build_i686/staging_dir//usr/lib//libXt.so
/home/lykowdk/buildroot/build_i686/staging_dir//usr/lib//libSM.so
/home/lykowdk/buildroot/build_i686/staging_dir//usr/lib//libICE.so
/home/lykowdk/buildroot/build_i686/staging_dir//usr/lib//libXext.so
../src/.libs/libXpm.so
/home/lykowdk/buildroot/build_i686/staging_dir//usr/lib//libX11.so
/home/lykowdk/buildroot/build_i686/staging_dir/usr/lib/libxcb-xlib.so
/home/lykowdk/buildroot/build_i686/libxcb-1.1/src/.libs/libxcb.so
/home/lykowdk/buildroot/build_i686/staging_dir/usr/lib/libxcb.so
/home/lykowdk/buildroot/build_i686/staging_dir//usr/lib//libXau.so
/home/lykowdk/buildroot/build_i686/staging_dir//usr/lib//libXdmcp.so -ldl
-Wl,--rpath -Wl,/home/lykowdk/buildroot/build_i686/staging_dir//usr/lib/
-Wl,--rpath
-Wl,/home/lykowdk/buildroot/build_i686/xlib_libXpm-3.5.7/src/.libs
-Wl,--rpath -Wl,/home/lykowdk/buildroot/build_i686/staging_dir/usr/lib
-Wl,--rpath -Wl,/home/lykowdk/buildroot/build_i686/libxcb-1.1/src/.libs
-Wl,--rpath -Wl,/home/lykowdk/buildroot/build_i686/staging_dir//usr/lib/
-Wl,--rpath -Wl,/home/lykowdk/buildroot/build_i686/staging_dir/usr/lib
/home/lykowdk/buildroot/build_i686/staging_dir//usr/lib//libX11.so:
undefined reference to `wctomb'
/home/lykowdk/buildroot/build_i686/staging_dir//usr/lib//libX11.so:
undefined reference to `mbstowcs'
/home/lykowdk/buildroot/build_i686/staging_dir//usr/lib//libX11.so:
undefined reference to `mbtowc'
/home/lykowdk/buildroot/build_i686/staging_dir//usr/lib//libX11.so:
undefined reference to `_stdlib_mb_cur_max'
/home/lykowdk/buildroot/build_i686/staging_dir//usr/lib//libX11.so:
undefined reference to `mblen'

====================================================================== 

---------------------------------------------------------------------- 
 antialize - 08-20-08 06:41  
---------------------------------------------------------------------- 
Have you tried adding "locale support" in "make uclibc-menuconfig", it did
the trick for me! 

---------------------------------------------------------------------- 
 lykowdk - 08-21-08 15:55  
---------------------------------------------------------------------- 
That did the trick.. So how do I close this out?

Shouldn't there be an autodependency defined such that both WCHAR and
locale support are added automatically when Xorg is selected? 

---------------------------------------------------------------------- 
 antialize - 08-22-08 00:15  
---------------------------------------------------------------------- 
I'v been trying to look into how one would go about doing that, currently
it is not possible to add deps between different menuconfigs. I have found
several places where there realy should be deps between buildroot and
linux26,uclibc or bussybox. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-17-08 23:36  lykowdk        New Issue                                    
08-17-08 23:36  lykowdk        Status                   new => assigned     
08-17-08 23:36  lykowdk        Assigned To               => buildroot       
08-20-08 06:41  antialize      Note Added: 0010554                          
08-21-08 15:55  lykowdk        Note Added: 0010614                          
08-22-08 00:15  antialize      Note Added: 0010634                          
======================================================================
