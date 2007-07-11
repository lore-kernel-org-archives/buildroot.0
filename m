From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 11 Jul 2007 12:22:20 -0700
Subject: [Buildroot] [buildroot 0000944]: Some portability fixes for running
	on a MacOSX host
Message-ID: <6e7e7a78575f859a8354cebd6ed42003@busybox.net>
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
Last Modified:              07-11-2007 12:22 PDT
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

---------------------------------------------------------------------- 
 chickenandporn - 07-11-07 07:36  
---------------------------------------------------------------------- 
Is there a platform that "cp -fPpR" doesn't work on?  Most platforms mimick
the old svr4.2r3.2 behavior, or the 4.0r3.0 that migrated from AT&T to BSD,
as a bare minimum, right?

I point this out because the following:

xxx: yyyy
     cp -fPpR dir1 dir2

...is easier to read than:

xxx: yyyy
     $(SOME_BIG_MACRO) dir1 dir2

OK, it might be easier than I am presenting, but if the base behavior is
acceptible, and we're used to reading unix commands, it's easier to read
if the changes are just made to be the most portable form of commands. 

---------------------------------------------------------------------- 
 holin - 07-11-07 11:55  
---------------------------------------------------------------------- 
Try older OS X (10.2), older busybox versions, maybe older BSDs and less
common Unix flavors, such as IRIX, HP-UX, and wherever cross-gcc may
build. Technically, the POSIX -R is suboptimal substitute to the GNU -d
that's used all over to copy symbolic links, but that's about it in the
gravely missed features section. Anywhoo, I'd be all for changing to POSIX
syntax, too, because that's at least a larger common denominator than GNU.
The biggest problem might be that on some platforms, I hear, the POSIX
syntax does *something*, but not at all what it's supposed to, i.e. you
might get no error, but unwanted results, instead.

 

---------------------------------------------------------------------- 
 chickenandporn - 07-11-07 12:22  
---------------------------------------------------------------------- 
I'm not sure if we can test on older 10.2.x MacOSX, nor Atari-520, nor
anything else thats below a certain usage unless someone here has one of
those.

GNU cp supports cp -R

cp -R causes softlinks to remain exactly, not dereferencing to copy the
linked-to file, nor adjusting any relative softlinks.

If there's no argument against it, I'm going to re-cut the patch to turn
"cp -a" -type functionality to "cp -PpR", avoiding tar-copying,
cpio-copying, and $(CP_A)/$(CP_D)/$(CP_XYZ) notation, with the assumption
that someone with an older system that requires a smaller set of options
can alter further on another bug.  If the next change is incompatible,
then we could do a host-coreutils to provide the required compatible
commands such as "cp", "mkdir", etc. 

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
07-11-07 07:36  chickenandporn Note Added: 0002589                          
07-11-07 11:52  holin          Note Added: 0002590                          
07-11-07 11:55  holin          Note Edited: 0002590                         
07-11-07 12:22  chickenandporn Note Added: 0002591                          
======================================================================
