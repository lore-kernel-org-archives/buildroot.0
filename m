From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 5 Jul 2008 23:13:01 -0700
Subject: [Buildroot] [buildroot 0000959]: DirectFB-0.9.25.1' link error:
	/usr/lib/libpng12.so: could not read symbols: File in wrong format
Message-ID: <1dbbe65a52c75b78e3ecbd5a29a2b904@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=959 
====================================================================== 
Reported By:                bowerymarc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   959
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     feedback
====================================================================== 
Date Submitted:             07-16-2006 23:17 PDT
Last Modified:              07-05-2008 23:13 PDT
====================================================================== 
Summary:                    DirectFB-0.9.25.1' link error: 
/usr/lib/libpng12.so: could not read symbols: File in wrong format
Description: 
/home/tools/buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc
-O3 -ffast-math -pipe -Os -pipe
-I/home/tools/buildroot/build_arm_nofpu/staging_dir/usr/include
-D_GNU_SOURCE -Werror-implicit-function-declaration -o directfb-csource
directfb-csource.o 
-L/home/tools/buildroot/build_arm_nofpu/staging_dir/lib
-L/home/tools/buildroot/build_arm_nofpu/staging_dir/usr/lib
/usr/lib/libpng12.so -lz -lm -ldl -lpthread
/usr/lib/libpng12.so: could not read symbols: File in wrong format
collect2: ld returned 1 exit status
make[3]: *** [directfb-csource] Error 1
make[3]: Leaving directory
`/home/tools/buildroot/build_arm_nofpu/DirectFB-0.9.25.1/tools'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/tools/buildroot/build_arm_nofpu/DirectFB-0.9.25.1'
make[1]: *** [all-recursive-am] Error 2
make[1]: Leaving directory
`/home/tools/buildroot/build_arm_nofpu/DirectFB-0.9.25.1'
make: ***
[/home/tools/buildroot/build_arm_nofpu/DirectFB-0.9.25.1/.compiled] Error
2

====================================================================== 

---------------------------------------------------------------------- 
 rashbaugh - 12-31-06 13:43  
---------------------------------------------------------------------- 
I had this same problem while building an Xscale cross-compile of
DirectFB-1.0.0-rc2 on an Ubuntu Edgy desktop.
For some reason libtool makes a substitution of "/usr/lib/libpng12.so"
when "-lpng12" is specified, and then passes this path to gcc. This path
happens to be the host libpng12.so library, when we really want the
target's library, so it has the wrong format. Why libtool does this I have
no idea, but I was able to work around it by explicitly specifiying the
full path of target libpng12.so library in the corresponding DirectFB
"Makefile". In my case, I had to make this correction in only 2 places,
though "-lpng12" is specified in hundreds of places within the DirectFB
Makefile source tree.
For example, in DirectFB/tools/Makefile:
# LIBPNG = -lpng12 << comment this one out
# and add this in
LIBPNG = /home/user/path-to-target-toolchain/lib/libpng12.so 

I also needed this same change in
DirectFB/interfaces/IDirectFBImageProvider/Makefile.
Hope this helps. 

---------------------------------------------------------------------- 
 Correa - 07-05-08 08:22  
---------------------------------------------------------------------- 
DirectFB builds now, I think we can close this. It still have some problems
with pkg-config that have been reported upstream though, but not related to
this particular report. 

---------------------------------------------------------------------- 
 UlfSamuelsson - 07-05-08 14:55  
---------------------------------------------------------------------- 
I saw the same problem in libgtk2 today.
Host "/usr/lib/libpng12.so" is used. 

---------------------------------------------------------------------- 
 UlfSamuelsson - 07-05-08 18:17  
---------------------------------------------------------------------- 
Maybe it is related to compiling with sysroot?

$(STAGING_DIR)/usr/lib/pkgconfig/libpng.pc contains
++++++++++++++++++++++++++++++++++++++++++
prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include/libpng12

Name: libpng
Description: Loads and saves PNG files
Version: 1.2.25
Libs: -L${libdir} -lpng12
Cflags: -I${includedir} 
------------------------------------------

The Configure script will do
LIBPNG=$PKG_CONFIG --libs libpng12

which will return "-lpng12" if "prefix" in libpng12 is "/usr".
If the "prefix" is something else, I.E: "/usr/local" then 

LIBPNG=$PKG_CONFIG --libs libpng12

will return 
"-L/usr/local/lib -lpng12"

I tried editing the libpng12.pc to look like:

++++++++++++++++++++++++++++++++++++++++++
prefix=<$(STAGING_DIR)>/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include/libpng12

Name: libpng
Description: Loads and saves PNG files
Version: 1.2.25
Libs: -L${libdir} -lpng12
Cflags: -I${includedir} 
------------------------------------------

This did not help, so I changed the file to

++++++++++++++++++++++++++++++++++++++++++
prefix=<$(STAGING_DIR)>/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include/libpng12

Name: libpng
Description: Loads and saves PNG files
Version: 1.2.25
Libs: -L${libdir} <$(STAGING_DIR)>/libpng12.so
Cflags: -I${includedir} 
------------------------------------------
This allowed the compile to continue, but bombed
on "/usr/lib/libtiff.so".

Assume that all the <package>.pc files in 
$(STAGING_DIR)/usr/lib/pkgconfig are changed,
will this work at run time????

Not sure, but when you link with a dynamic library
you should not include the contents of the libary
in the application,

I have this suspicion that when you run the binary
on the target, it will look at the non-exisiting
"$(STAGING_DIR)/usr/lib" in the target, if we
do it this way.

To me, it looks like a bug in gcc, which does
not honour --sysroot=$(STAGING_DIR)

Question: is the linker compiled *with* sysroot support.
  I saw a comment on the gcc bugzilla which pointed out this 
  as a potential problem. 

---------------------------------------------------------------------- 
 UlfSamuelsson - 07-05-08 23:13  
---------------------------------------------------------------------- 
binutils is configured with:

                [snip]
		$(BR2_CONFIGURE_DEVEL_SYSROOT) \
		$(BR2_CONFIGURE_STAGING_SYSROOT) \
                [snip]

with toolchain/Makefile.in defining these as:

BR2_CONFIGURE_DEVEL_SYSROOT=--with-sysroot=$(TOOL_BUILD_DIR)/uClibc_dev/
BR2_CONFIGURE_STAGING_SYSROOT=--with-sysroot=$(STAGING_DIR)

----------------
Looking at binutils.configure, I see that "--with-sysroot" is not known.

+++++++++++++++++
ac_help="$ac_help
  --with-build-sysroot=sysroot
                          use sysroot as the system root during the
build"

-----------------

we should replace "--with-sysroot=sysroot"
with "--with-build-sysroot=sysroot"

It looks funny to have TWO "--with-sysroot".
I will try removing
	$(BR2_CONFIGURE_STAGING_SYSROOT) \

I suspect that having the correct sysroot configuration
in binutils, should also solve the problems
with "limits.h" not beeing found, when building gcc-4.3.1 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-16-06 23:17  bowerymarc     New Issue                                    
07-16-06 23:17  bowerymarc     Status                   new => assigned     
07-16-06 23:17  bowerymarc     Assigned To               => uClibc          
10-09-06 12:23  jruere         Issue Monitored: jruere                      
12-31-06 13:43  rashbaugh      Note Added: 0001949                          
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
07-05-08 08:22  Correa         Note Added: 0009014                          
07-05-08 08:22  Correa         Status                   assigned => feedback
07-05-08 14:55  UlfSamuelsson  Note Added: 0009024                          
07-05-08 18:17  UlfSamuelsson  Note Added: 0009054                          
07-05-08 23:13  UlfSamuelsson  Note Added: 0009064                          
======================================================================
