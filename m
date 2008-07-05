From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 5 Jul 2008 14:55:30 -0700
Subject: [Buildroot] [buildroot 0000959]: DirectFB-0.9.25.1' link error:
	/usr/lib/libpng12.so: could not read symbols: File in wrong format
Message-ID: <fb57b2b83b55735fa6e85e9fcec34d69@busybox.net>
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
Last Modified:              07-05-2008 14:55 PDT
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
======================================================================
