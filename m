From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 7 Jul 2007 11:51:06 -0700
Subject: [Buildroot] [buildroot 0000944]: Some portability fixes for running
	on a MacOSX host
Message-ID: <baab3cc30283d5201ac30ccce560046f@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=944 
====================================================================== 
Reported By:                wiml
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   944
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-12-2006 23:48 PDT
Last Modified:              07-07-2007 11:51 PDT
====================================================================== 
Summary:                    Some portability fixes for running on a MacOSX host
Description: 
This patch addresses a few minor linuxisms or (non-BSD)isms in buildroot's
shell scripts.

1. Replaces "cp -a" with "cp -pPR". "-a" is just a conveinence for -pPR,
and none of the BSD-derived systems I've checked have it.

2. My 'sed' reqires an explicit empty string after -i, or else it will use
the "-e" arg as the extension for backups. Oops.

3. My 'sed' requires an EOL or semicolon before the closing curly in a
{foo...} construct.

4. Apple's GCC prints a version string that dependencies.sh can't handle.
This change removes any parenthesized bits from the version string before
looking for numbers, so it can handle version strings like
    powerpc-apple-darwin8-gcc-4.0.1 (GCC) 4.0.1 (Apple Computer, Inc.
build 5250)

======================================================================
Relationships       ID      Summary
----------------------------------------------------------------------
has duplicate       0001251 Buildroot uses lots of cp commands that...
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-22-06 04:30  
---------------------------------------------------------------------- 
1) I'd rather prefer if you could expand the host-sed check so we build a
working sed for your system.
2) That cp -a patch looks ok. For files, we usually (try to) use "cp
-dpf", so please use -dpf resp. -Rdpf
  Please attach a new split patch with just the cp changes.
3) I think that the current dependencies.sh should deal with this, please
verify.

Thanks in advance for attaching updated, separate patches that take the
comments above into account.
cheers,
Bernhard 

---------------------------------------------------------------------- 
 bernhardf - 07-07-07 11:51  
---------------------------------------------------------------------- 
To be flexible, i suggest we add
ifeq (linux)
CP_A:=cp -a
endif
ifeq (apple or bsd)
CP_A:=cp ...
endif

variants for "force" "recurse" should be provided. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-12-06 23:48  wiml           New Issue                                    
07-12-06 23:48  wiml           Status                   new => assigned     
07-12-06 23:48  wiml           Assigned To               => uClibc          
07-12-06 23:48  wiml           File Added: buildroot1.patch                    
12-22-06 04:30  bernhardf      Note Added: 0001914                          
12-22-06 04:30  bernhardf      Status                   assigned => feedback
02-12-07 05:34  vapier         Status                   feedback => assigned
02-12-07 05:34  vapier         Assigned To              uClibc => buildroot 
07-07-07 11:46  bernhardf      Relationship added       has duplicate 0001251
07-07-07 11:51  bernhardf      Note Added: 0002559                          
======================================================================
