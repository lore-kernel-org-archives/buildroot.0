From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:18 -0800
Subject: [Buildroot] [buildroot 0000759]: FLOAT: Building fails when using
	ARM920t and software Floating Point
Message-ID: <0411a2db3d52da32ce5d40dc724ba9ec@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=759 
====================================================================== 
Reported By:                agusfusa
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   759
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-28-2006 09:14 PST
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    FLOAT: Building fails when using ARM920t and
software Floating Point
Description: 
When building the toolchain using as a target an ARM920t and selecting that
the device does not have an floating point unit, this error ocurrs:

(...)
make -C /root/buildroot/toolchain_build_arm/uClibc \
PREFIX= \
DEVEL_PREFIX=/ \
RUNTIME_PREFIX=/ \
HOSTCC="gcc" \
        all
make[1]: Entering directory `/root/buildroot/toolchain_build_arm/uClibc'

Current kernel version is 2.4.31

Using kernel headers from 2.4.31 for architecture 'arm'
        provided in directory /root/buildroot/toolchain_build_arm/linux/

  CC ldso/ldso/ldso.oS
  AS ldso/ldso/arm/resolve.oS
  STRIP -x -R .note -R .comment ldso/ldso/ld-uClibc_so.a
  AR cr ldso/ldso/ld-uClibc_so.a
  LD ld-uClibc-0.9.28.so
/root/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld: ERROR:
/root/buil
droot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.2/libgcc.a(_udivsi3.o)
uses hardware FP, whereas lib/ld-uClibc-0.9.28.so uses software FP
/root/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld: failed to
merge t arget specific data of file
/root/buildroot/build_arm/staging_dir/lib/gcc/arm-li
nux-uclibc/3.4.2/libgcc.a(_udivsi3.o)
/root/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld: ERROR:
/root/buil
droot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.2/libgcc.a(_dvmd_lnx.o)
 uses hardware FP, whereas lib/ld-uClibc-0.9.28.so uses software FP
/root/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld: failed to
merge t arget specific data of file
/root/buildroot/build_arm/staging_dir/lib/gcc/arm-li
nux-uclibc/3.4.2/libgcc.a(_dvmd_lnx.o)
make[1]: *** [lib/ld-uClibc.so] Error 1
make[1]: Leaving directory `/root/buildroot/toolchain_build_arm/uClibc'
make: *** [/root/buildroot/toolchain_build_arm/uClibc/lib/libc.a] Error 2

Has anybody had this problem? Thanks very much!!

====================================================================== 

---------------------------------------------------------------------- 
 prpplague - 03-02-06 05:11  
---------------------------------------------------------------------- 
please provide the .config you are using for this build so that i can try
replicating the problem. 

---------------------------------------------------------------------- 
 agusfusa - 03-02-06 06:06  
---------------------------------------------------------------------- 
Here's the .config file as you requested. 
When I'm asked I select (If not specified I go with the default answers):
Arm Target (option 2)
Use BX in function return: NO
Arm 920t (option 6)
Little Endian (option 2)
Taget CPU has FPU: NO

Hope you can replicate this situation!
Thx a lot! 

---------------------------------------------------------------------- 
 trav - 04-05-06 00:26  
---------------------------------------------------------------------- 
I've also been having this issue.  I'm currently working with
buildroot-20060404, but the bug seems to be present in all recent versions
of buildroot.  It is apparently triggered by this option:

   [*] Use a daily snapshot of uClibc?

I've uploaded my config file as well, titled "config_trav".  It's
basically a default build.  The only non-default options I'm using are:

   Target Architecture          (arm)
   Target Architecture Variant  (generic_arm)

and then, during the build, I select "Little Endian" and answer NO to
"Target has an FPU".

Thanks!

 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-28-06 09:14  agusfusa       New Issue                                    
02-28-06 09:14  agusfusa       Status                   new => assigned     
02-28-06 09:14  agusfusa       Assigned To               => uClibc          
03-02-06 05:11  prpplague      Note Added: 0001158                          
03-02-06 05:11  prpplague      Status                   assigned => feedback
03-02-06 06:06  agusfusa       Note Added: 0001159                          
03-02-06 06:07  agusfusa       File Added: .config                          
04-05-06 00:20  trav           File Added: config_trav                      
04-05-06 00:23  trav           Note Added: 0001223                          
04-05-06 00:25  trav           Note Edited: 0001223                         
04-05-06 00:26  trav           Note Edited: 0001223                         
10-09-06 12:25  jruere         Issue Monitored: jruere                      
02-04-07 09:14  bernhardf      Summary                  Building fails when
using ARM920t and software Floating Point => FLOAT: Building fails when using
ARM920t and software Floating Point
02-12-07 05:33  vapier         Status                   feedback => assigned
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
