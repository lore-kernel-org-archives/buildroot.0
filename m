From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 9 May 2008 03:07:54 -0700
Subject: [Buildroot] [buildroot 0003274]: Package Python broken
Message-ID: <38026ed844eef13adeb9cc669b95169c@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3274 
====================================================================== 
Reported By:                roeme
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3274
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-07-2008 11:01 PDT
Last Modified:              05-09-2008 03:07 PDT
====================================================================== 
Summary:                    Package Python broken
Description: 
When trying to include the python package, the build process fails with the
following error:

make[1]: Leaving directory
`/home/roeme/minim/buildroot/buildroot/build_i586/Python-2.4.2'
/bin/sh: line 8: -/usr/bin/make: No such file or directory
make: ***
[/home/roeme/minim/buildroot/buildroot/build_i586/Python-2.4.2/.hostpython]
Error 127

Enabling "Development Files on target" or removing modules marked as
"unusual" (curses/unicodedata) does not help as well as reducing the
number of jobs to run simultaneously.

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 05-07-08 11:37  
---------------------------------------------------------------------- 
Thy pyhon package wants a big cleanup anyway:

- unpack into one location (I'd use the TOOL_BUIDDIR)
- build python-host (why is that needed anyway?) into
(TOOL_BUILDDIR)/$(PYTHON_DIR)-host
- build python in $(BUILD_DIR) 

---------------------------------------------------------------------- 
 roeme - 05-07-08 12:28  
---------------------------------------------------------------------- 
How can I help? Or what must one do to get the package working?

I'll dive into the docs now. Maybe I'll get something working, I wanted to
get accustomed to buildroot's internals anyway, to add sw by myself.

However, I'm a bloody novice, so any help on this bug is GREATLY
appreciated. Since I'm in a thight schedule, it might take several months
before I even have a clue how to fix it, whereas you guys probably only
need one day.

There's a typo in the submission, by host system I meant build system.

 

---------------------------------------------------------------------- 
 roeme - 05-07-08 12:39  
---------------------------------------------------------------------- 
Python seems to have cross-compilation support (see also:
http://mail.python.org/pipermail/patches/2004-October/016312.html )

However, it's not used: 
(snip)
checking whether we are cross compiling... no
(/snip)

(I might be off-track here, but maybe this is of some use to the
developers) 

---------------------------------------------------------------------- 
 roeme - 05-09-08 00:17  
---------------------------------------------------------------------- 
This particular bug may be closed (It still won't build for me, but it's a
different error)

> On 08.05.2008, at 19:41, Andrew Dyer wrote:
>
>>On Thu, May 8, 2008 at 9:51 AM, Roman Bigler <roeme@roeme.ch> wrote:
>>Hello List,
>>
>>in the last two days I've tried to use the python package, however, it
>>fails to build.
>>The build process barfs the following at me:
>><snip>
>>make[1]: Leaving directory
`/home/roeme/minim/buildroot/buildroot/build_i586/Python-2.4.2'
>>/bin/sh: line 8: -/usr/bin/make: No such file or directory
>>make: *** [/home/roeme/minim/buildroot/buildroot/build_i586/
>>Python-2.4.2/.hostpython] Error 127
>><snap>
>>
>>The error is reproduceable.
>>
>
>the patch fragment below fixes the build error for me and was posted
>to the list a couple of days ago.  I did not test the resulting
>executable.
>
>Index: package/python/python.mk
>===================================================================
>--- package/python/python.mk    (revision 21884)
>+++ package/python/python.mk    (working copy)
>@@ -89,7 +89,7 @@
>              $(MAKE) python Parser/pgen && \
>              mv python hostpython && \
>              mv Parser/pgen Parser/hostpgen && \
>-               -$(MAKE) distclean \
>+               $(MAKE) distclean \
>      ) && \
>      touch $@ 

---------------------------------------------------------------------- 
 rhunger - 05-09-08 03:07  
---------------------------------------------------------------------- 
@roeme:
Python's cross-compilation support actually _is_ used:

"""
...
checking whether we are cross compiling... no
...
checking whether we are cross compiling... yes
...
"""

The first "checking" line comes from compiling python for the build
system. The second from compiling for the target system. This is done
explicitly in package/python/python.mk. Probably a native python for the
build system is needed to be able to cross-compile. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-07-08 11:01  roeme          New Issue                                    
05-07-08 11:01  roeme          Status                   new => assigned     
05-07-08 11:01  roeme          Assigned To               => buildroot       
05-07-08 11:37  bernhardf      Note Added: 0007474                          
05-07-08 12:04  roeme          Note Added: 0007484                          
05-07-08 12:28  roeme          Note Edited: 0007484                         
05-07-08 12:39  roeme          Note Added: 0007494                          
05-09-08 00:17  roeme          Note Added: 0007544                          
05-09-08 03:06  rhunger        File Added: python.patch                     
05-09-08 03:07  rhunger        Note Added: 0007564                          
======================================================================
