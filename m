From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:38 -0800
Subject: [Buildroot] [buildroot 0000685]: gcc 3.4.4 with uclibc is build
	with glibc extensions
Message-ID: <d4217db237789b3ba322553ab9f23d8a@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=685 
====================================================================== 
Reported By:                mach
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   685
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-04-2006 00:15 PST
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    gcc 3.4.4 with uclibc is build with glibc extensions
Description: 
The last revision of gcc-3.4.4 patch file 100-uclibc-conf.patch builds file
unwind-dw2-fde-glibc.c into libgcc (at least on mipsel-linux-uclibc and
arm-linux-uclibc, but it should be the same on most architectures). This
creates a dependency on dl_iterate_phdr in every C program built (wich can
be painfully resolved by linking every program against libdl.a).
This also breaks C++ support (because libstdc++ configure try to build a
program without linking in libdl.so).

I would expect this problem to also affect gcc-3.4.5 which has the same
patch.
====================================================================== 

---------------------------------------------------------------------- 
 psm - 02-04-06 02:22  
---------------------------------------------------------------------- 
we need to move dl_iterate_phdr to libc.so as it is and libc.a in a
somewhat
modiffied version, see the dl_iterate_phdr in glibc 

---------------------------------------------------------------------- 
 vapier - 02-04-06 11:34  
---------------------------------------------------------------------- 
the entire point of the gcc config change was to get rid of arch-specific
crap, adding them back in is not an option 

---------------------------------------------------------------------- 
 mach - 02-06-06 15:09  
---------------------------------------------------------------------- 
It would be a good idea to move dl_iterate_phdr to libc.so but I still
don't see why a file that has explicit dependencies on GLIBC in it (there
are defines about the glibc version being used and so on) should be
included in a GCC built with uclibc.

Does this new patch fit better with the new gcc config change ? I only
tested it on mips and it may require few adjustments to work on other
architectures. 

---------------------------------------------------------------------- 
 vapier - 02-06-06 15:15  
---------------------------------------------------------------------- 
yes, that one looks much better :) 

---------------------------------------------------------------------- 
 vapier - 02-06-06 20:58  
---------------------------------------------------------------------- 
can you try this patch instead ?  apply it to the
3.4.4/100-uclibc-conf.patch file 

---------------------------------------------------------------------- 
 mach - 02-08-06 10:41  
---------------------------------------------------------------------- 
Patch is ok except for a typo: 
line 8 is:
+@@ -0,0 +1,4 @@
it should be 
+@@ -0,0 +1,5 @@

otherwise the last line of t-linux-uclibc is removed.

I fixed it in your patch and renamed it 101-uclibc-conf.patch.4 

---------------------------------------------------------------------- 
 vapier - 02-09-06 21:23  
---------------------------------------------------------------------- 
thanks for testing, i've fixed the 3.4.4/3.4.5/4.0.2 patches with your .4
ver 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-04-06 00:15  mach           New Issue                                    
02-04-06 00:15  mach           Status                   new => assigned     
02-04-06 00:15  mach           Assigned To               => uClibc          
02-04-06 00:15  mach           File Added: 101-uclibc-conf.patch                
   
02-04-06 02:22  psm            Note Added: 0001041                          
02-04-06 11:34  vapier         Note Added: 0001042                          
02-06-06 15:09  mach           Note Added: 0001052                          
02-06-06 15:10  mach           File Added: 101-uclibc-conf.patch.2              
     
02-06-06 15:15  vapier         Note Added: 0001053                          
02-06-06 20:57  vapier         File Added: 101-uclibc-conf.patch.3              
     
02-06-06 20:58  vapier         Note Added: 0001055                          
02-08-06 10:39  mach           File Added: 101-uclibc-conf.patch.4              
     
02-08-06 10:41  mach           Note Added: 0001067                          
02-09-06 21:23  vapier         Note Added: 0001077                          
02-09-06 21:23  vapier         Status                   assigned => closed  
02-09-06 21:23  vapier         Resolution               open => fixed       
02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
