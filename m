From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 23 Sep 2007 16:15:09 -0700
Subject: [Buildroot] [buildroot 0001282]: ccache
Message-ID: <c9b8a7627fcdde1c32c1ee4c3429fdbc@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1282 
====================================================================== 
Reported By:                Franck78
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1282
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-21-2007 11:56 PDT
Last Modified:              09-23-2007 16:15 PDT
====================================================================== 
Summary:                    ccache
Description: 
Hello,

1) ccache is built at the end of the toolchain (gcc/uclibc/binutils). It
serves for nothing (ok I except if you slected other package it may...).

2) the ccache_dir is fixed inside 'toolchain_build_i486' It would be
better if the  CCACHE_DIR could be setup somewhere else outside
'buildroot'.
Why? In automated procedure constructing distro, buildroot.tar.gz is
expanded then configured then built as all other packages making the
distro.
It means everytime, buildroot dir is like a virgin.. ;-) No ccache_dir
inside.

but if ccache_dir is outside....ok, it will be preserved accross rebuilds
and the final touch would have ccache used for ALL the toolchain
construction...!


Adding a new option in 'make menuconfig' is beyond my knowledge of
buildroot for now.

Franck
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 06-25-07 11:02  
---------------------------------------------------------------------- 
Although i don't understand a word, i think that this sounds like "Doctor,
it hurts when i do.."

Please describe the problem you are facing and suggest what should be done
why and how, i shall close this bug otherwise. 

---------------------------------------------------------------------- 
 Franck78 - 06-25-07 11:38  
---------------------------------------------------------------------- 
Ok,
A distro is something more complete than buildroot alone. The buildroot
package is only 'one step among others'. The full build can follow some
method like lfs (linux from scratch). 
Having ccache dir outside of the tree build avoid loosing what have been
already compiled when some kind of full rebuild of the distro is
performed. In other words, the cachedir is in a safe configurable place. 

tchuss. 

---------------------------------------------------------------------- 
 chickenandporn - 06-25-07 21:13  
---------------------------------------------------------------------- 
It seems the request is:

Add a Config.in/Kconfig option for user-specified CCACHE_DIR defaulting to
current value

This is within my ability, but I don't have a ccache build working (I'm
broken with MacOSX right now).  I will contact submitter. 

---------------------------------------------------------------------- 
 UlfSamuelsson - 09-23-07 16:15  
---------------------------------------------------------------------- 
ccache will do by default, what you need, but buildroot does:

$(SED) "s,getenv(\"CCACHE_PATH\"),\"$(STAGING_DIR)/usr/bin-ccache\",g" \
	$(CCACHE_DIR1)/execute.c
$(SED) "s,getenv(\"CCACHE_DIR\"),\"$(CCACHE_DIR1)/cache\",g" \
	$(CCACHE_DIR1)/ccache.c

If it did not do that replacement, or replaced with
getenv("BUILDROOT_CCACHE_PATH") and 
getenv("BUILDROOT_CCACHE_DIR") you would be OK.

Then the user has to set up these variables outside Buildroot,
so Buildroot needs to set up these to a default. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-21-07 11:56  Franck78       New Issue                                    
03-21-07 11:56  Franck78       Status                   new => assigned     
03-21-07 11:56  Franck78       Assigned To               => buildroot       
06-25-07 11:02  bernhardf      Note Added: 0002507                          
06-25-07 11:38  Franck78       Note Added: 0002513                          
06-25-07 21:13  chickenandporn Note Added: 0002515                          
09-23-07 16:15  UlfSamuelsson  Note Added: 0002773                          
======================================================================
