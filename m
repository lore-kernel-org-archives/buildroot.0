From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:18 -0800
Subject: [Buildroot] [buildroot 0000237]: using crosstool build glibc based
	toolchain to build userland program
Message-ID: <4297426317040a8aa876dd0f698f5396@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=237 
====================================================================== 
Reported By:                shuhao_chang
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   237
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-26-2005 02:08 PDT
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    using crosstool build glibc based toolchain to build
userland program
Description: 
buildroot builds uclibc-based toolchain and uses it to build userland
programs.
here is a patch to enable buildroot to use crosstool build glibc-based
toolchain.

you have to set correct crosstool toolchain location and prefix to use
this feature.
====================================================================== 

---------------------------------------------------------------------- 
 sjhill - 06-18-05 21:32  
---------------------------------------------------------------------- 
Uploaded a new and cleaned up patch allowing a crosstool glibc toolchains
to compile a buildroot. It has been tested with glibc-based toolchains
using GCC-3.4.2 and GCC-4.1.0 for MIPS. 

---------------------------------------------------------------------- 
 sjhill - 08-25-05 19:59  
---------------------------------------------------------------------- 
Uploaded an updated patch against latest buildroot to allow crosstool glibc
toolchains to compile a buildroot. This patch fixes bugs related to
duplicated 'sed' targets and fixes the 'fakeroot' build error. 

---------------------------------------------------------------------- 
 sjhill - 10-08-05 22:22  
---------------------------------------------------------------------- 
Uploaded new patch for buildroot compilation with external toolchain.
Applies and works cleanly with 2005-10-08 checkout of buildroot. 

---------------------------------------------------------------------- 
 chickenandporn - 10-18-05 01:59  
---------------------------------------------------------------------- 
sjhill, your recent 20051008 is a "diff -cr" not a "diff -Ncr", so the
toolchains/crosstool directory is missing.

I wanted to add an alternative... y'see, you can build your own, or define
the information for a crosstool-built one, or "wellknown" -- "Use a
toolchain that is rather universally known"... an example would be the ARM
Linux "toolchain-bin-MM-DD-YY.tar.bz2" that can be drawn from
ftp://ftp.arm.linux.org.uk/ ... just like downloading source files, I have
a partially-working config that downloads a toolchain, knows where to
unpack it, and sets the paths properly.  Interested?  I can submit a patch
if you'll update *you* patch here to include
toolchain/crosstool/{Config.in,glibc.mk}  :) 

---------------------------------------------------------------------- 
 chickenandporn - 10-18-05 05:22  
---------------------------------------------------------------------- 
did a "diff -Ncr" because I cannot get svn to show added files (diff -N). 
Also, this patch is polluted with my "wellknown" mod I have been
babying... changes in toolchain/wellknown, please consider if it breaks
your world.  Applies cleanly to revision 11883, today's (China time)
top-of-tree 

---------------------------------------------------------------------- 
 chickenandporn - 10-27-05 13:43  
---------------------------------------------------------------------- 
revision 11932 (20051027) applies the 20051018 patch cleanly, FYI :) 

---------------------------------------------------------------------- 
 thaddeus - 01-02-06 14:39  
---------------------------------------------------------------------- 
Uploaded a new version of the patch I put together against SVN on
12/29/2005.  It was only quickly tested against gcc 3.4.3 for x86.  YMMV 

---------------------------------------------------------------------- 
 bcook - 05-22-06 19:35  
---------------------------------------------------------------------- 
Hmm, I just build a root filesystem using an armv5teb-xscale toolchain.
Seems like my toolchain needs to be fixed up somehow, but I'm not sure
which thing to fix. Anyway, the build executables got linked to use the
path on my host system to search for libraries. In other words, I had to
do:

ln -sf /usr/lib/cross-tools/arv5teb-xscale/lib /lib

in the resulting root filesystem to fix what looks like perhaps a gcc
specs issue. Any idea how to retarget the cross-compiled stuff to /lib ?

 - Brent 

---------------------------------------------------------------------- 
 bcook - 05-23-06 14:57  
---------------------------------------------------------------------- 
Hmm, nevermind - my *link directive in the gcc specs was pointing to the
wrong path for dynamic-linker. Fixed, and everything is peachy-keen! 

---------------------------------------------------------------------- 
 bernhardf - 01-19-07 08:00  
---------------------------------------------------------------------- 
Can you please respin that patch against current trunk?

Thanks alot in advance. 

---------------------------------------------------------------------- 
 mikewhit - 01-30-07 10:27  
---------------------------------------------------------------------- 
Any chance of providing some docs on the use of this patch ?

I have respun it on a recent buildroot, editing it to adapt to current
files,
but seem to be unable to use an external toolchain - 'make' complains that
the
toolchain directory cannot be created - that's because it already exists
and is read-only !!

Patch file follows as br2-crosstool-build-20070126.patch 

---------------------------------------------------------------------- 
 bernhardf - 02-09-07 07:04  
---------------------------------------------------------------------- 
The possibility to use an external toolchain was added as r17800.

Log (including an email addr to contact for questions about it) is here:
http://busybox.net/lists/buildroot/2007-February/001507.html

Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-26-05 02:08  shuhao_chang   New Issue                                    
04-26-05 02:08  shuhao_chang   File Added: br2_crosstool.patch                  
 
06-18-05 21:23  sjhill         File Added: br2-crosstool-build-20050618.patch   
                
06-18-05 21:32  sjhill         Note Added: 0000248                          
08-25-05 19:58  sjhill         File Added: br2-crosstool-build-20050825.patch   
                
08-25-05 19:59  sjhill         Note Added: 0000434                          
10-08-05 22:21  sjhill         File Added: br2-crosstool-build-20051008.patch   
                
10-08-05 22:22  sjhill         Note Added: 0000615                          
10-18-05 01:59  chickenandporn Note Added: 0000634                          
10-18-05 05:19  chickenandporn File Added: br2-crosstool-build-20051018.patch   
                
10-18-05 05:22  chickenandporn Note Added: 0000635                          
10-25-05 03:53  danieljlaird   Issue Monitored: danieljlaird                    
10-27-05 13:43  chickenandporn Note Added: 0000644                          
12-02-05 10:04  rhunger        Issue Monitored: rhunger                     
12-29-05 17:42  thaddeus       Issue Monitored: thaddeus                    
01-02-06 14:37  thaddeus       File Added: br2-crosstool-build-20051229.patch   
                
01-02-06 14:39  thaddeus       Note Added: 0000839                          
05-22-06 19:35  bcook          Note Added: 0001373                          
05-22-06 19:35  bcook          Note Added: 0001374                          
05-22-06 19:35  bcook          Note Deleted: 0001373                        
05-23-06 14:57  bcook          Note Added: 0001376                          
01-19-07 08:00  bernhardf      Note Added: 0001994                          
01-19-07 08:00  bernhardf      Status                   assigned => feedback
01-30-07 10:27  mikewhit       Note Added: 0002075                          
01-30-07 10:28  mikewhit       File Added: br2-crosstool-build-20070126.patch   
                
02-09-07 07:04  bernhardf      Status                   feedback => closed  
02-09-07 07:04  bernhardf      Note Added: 0002146                          
02-09-07 07:04  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
