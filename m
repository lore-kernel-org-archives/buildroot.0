From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:33 -0800
Subject: [Buildroot] [buildroot 0001156]: coldfire (no mmu) support
Message-ID: <62262b0b717e728d8ad89fbd05630599@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1156 
====================================================================== 
Reported By:                kendallc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1156
Category:                   Architecture Specific
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-11-2007 16:11 PST
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    coldfire (no mmu) support
Description: 
Here is a patch to add the ability for Buildroot to target the Coldfire
processor, which lacks an MMU and FPU.
====================================================================== 

---------------------------------------------------------------------- 
 kendallc - 01-11-07 16:18  
---------------------------------------------------------------------- 
'-m52000' should be '-m5200', sorry. Also, you might be able to use
'-m5206e' or '-m5307' to better support you coldfire version. I use
'-m5206e' for the MCF5272. 

---------------------------------------------------------------------- 
 kendallc - 01-22-07 10:23  
---------------------------------------------------------------------- 
Buildroot changes quickly, and I frequently need to update this patch to
get it to apply. If anyone pursues integrating any of the changes in this
patch, post a note here and I'll post an updated patch. 

---------------------------------------------------------------------- 
 vapier - 01-27-07 21:28  
---------------------------------------------------------------------- 
most of your patches are directed to the wrong places

fix individual projects, dont dump into buildroot

for example:
split your uClibc fixes out and e-mail the uClibc list
split your elf2flt fixes out and e-mail the uClinux list
split out your mtd fixes and e-mail the mtd list
etc... 

---------------------------------------------------------------------- 
 kendallc - 01-28-07 13:16  
---------------------------------------------------------------------- 
i'll split out the buildroot makefile patches from the upstream project
patches, and i'll do what I can to get the upstream patches to their
repective projects; however, most of them might not get back upstream for
the following reasons.

elf2flt: no patch, only patched the buildroot makefile

mtd-utils: does not appear to be maintained for linux 2.4
portmap: maintainership is unclear, but we'll see
boa: it's a patch i took from uclinux, they should probably get it to boa

busybox: i'll try
uclibc: patched against release 0.9.28 because i needed to start with a
stable base to get everything else working

the buildroot patches are not really tied to the upstream patches except
in the case of uclibc. i noticed and took advantage of a rule in the
buildroot makefile that handles patches for released uclibc versions. i'll
look into the latest uclibc code, but any changes would obviously not go
into release 0.9.28.

so, i'll break out the buildroot patch. let me know if you have any
suggestions on what to do about patching released uclibc versions. 

---------------------------------------------------------------------- 
 kendallc - 02-01-07 15:18  
---------------------------------------------------------------------- 
i just attached a much leaner patch for the buildroot makefiles only.

some of the changes are to propagate LDFLAGS so that you can link BFLT
binaries with elf2flt. there is a fix to the elf2flt makefile to for
cleaning and rebuilding. there are changes to zlib to build it statically.
these changes will be needed for most mmu-less builds.

the rest of the changes are for the coldfire/nommu support itself. they
add a menu option for the coldfire, some associated vars like
BR2_ARCH_HAS_NO_MMU, and some changes to the gcc and uclibc makefiles.
they also pass CFLAGS for mmu-less builds to packages like busybox if
necessary. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-11-07 16:11  kendallc       New Issue                                    
01-11-07 16:11  kendallc       Status                   new => assigned     
01-11-07 16:11  kendallc       Assigned To               => uClibc          
01-11-07 16:11  kendallc       File Added: buildroot.patch                    
01-11-07 16:12  kendallc       File Added: buildroot_coldfire.config            
       
01-11-07 16:12  kendallc       File Added: buildroot_powerpc.config             
      
01-11-07 16:13  kendallc       File Added: busybox.config                    
01-11-07 16:18  kendallc       Note Added: 0001984                          
01-22-07 10:23  kendallc       Note Added: 0002029                          
01-27-07 21:28  vapier         Note Added: 0002063                          
01-28-07 13:16  kendallc       Note Added: 0002064                          
02-01-07 14:52  kendallc       File Added: buildroot-only.patch                 
  
02-01-07 15:18  kendallc       Note Added: 0002084                          
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
