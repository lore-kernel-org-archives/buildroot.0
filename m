From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 22 Aug 2008 07:27:33 -0700
Subject: [Buildroot] [buildroot 0004624]: Cannot build Modular X.org:
	undefined references in libX11.so
Message-ID: <705cd12236582b57c84c15ab6e7b52b2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             08-17-2008 23:36 PDT
Last Modified:              08-22-2008 07:27 PDT
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

---------------------------------------------------------------------- 
 Paul Bussmann - 08-22-08 00:22  
---------------------------------------------------------------------- 
AFAIK buildroot does such stuff by adding e.g. 

echo "CONFIG_FEATURE_HAVE_RPC=y" >>
project_build_arm/uclibc/busybox-1.10.3/.config 
that will overrride the setting before and then doing something like "make
oldconfig" ...

I'm not really familiar with it, but I think, I've seen it from time to
time. 

---------------------------------------------------------------------- 
 bernhardf - 08-22-08 01:10  
---------------------------------------------------------------------- 
The correct thing to do is to fix Xorg (upstream, of course) not to rely on
locale support unless it's available and not explicitely turned off in the
configuration. 

---------------------------------------------------------------------- 
 jacmet - 08-22-08 07:27  
---------------------------------------------------------------------- 
I've committed a workaround to trunk as r23181:

xorg: depend on WCHAR and LOCALE
    
Xorg needs WCHAR and LOCALE, so make sure it cannot be selected unless
this is enabled in the toolchain.
    
We unfortunately cannot make BR2_XSERVER_xorg depend on BR2_USE_LOCALE
because of a strange recursion error with dbus, but now we atleast
inform the user what to do to get a working configuration.
    
The real solution is ofcause of fix xorg, but that's for another day. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-17-08 23:36  lykowdk        New Issue                                    
08-17-08 23:36  lykowdk        Status                   new => assigned     
08-17-08 23:36  lykowdk        Assigned To               => buildroot       
08-20-08 06:41  antialize      Note Added: 0010554                          
08-21-08 15:55  lykowdk        Note Added: 0010614                          
08-22-08 00:15  antialize      Note Added: 0010634                          
08-22-08 00:22  Paul Bussmann  Note Added: 0010644                          
08-22-08 01:10  bernhardf      Note Added: 0010654                          
08-22-08 07:27  jacmet         Status                   assigned => closed  
08-22-08 07:27  jacmet         Note Added: 0010674                          
======================================================================
