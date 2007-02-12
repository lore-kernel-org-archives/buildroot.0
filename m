From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:25 -0800
Subject: [Buildroot] [buildroot 0000563]: strace fails to build under
	buildroot due to dependency on stropts.h
Message-ID: <25ed12f7aa370f3b2e00c6f8b1668356@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=563 
====================================================================== 
Reported By:                crafterm
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   563
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-25-2005 10:39 PST
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    strace fails to build under buildroot due to
dependency on stropts.h
Description: 
Hi All,

Hope all is going well.

The current version of strace fails to build under buildroot due to a
dependency on stropts.h. See attached build log.

Cheers,

Marcus
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 11-25-05 11:33  
---------------------------------------------------------------------- 
that header is only included if configure detects that it is available

post the config.log file as an attachment 

---------------------------------------------------------------------- 
 crafterm - 11-29-05 02:50  
---------------------------------------------------------------------- 
Ok, uploaded, from inspecting the config.log:

configure:10316: checking sys/stropts.h usability
configure:10328:
/home/crafterm/workspace/build/buildroot/build_i386/staging_dir/bin/i386-linux-uclibc-gcc
-c -Os -pipe   conftest.c >&5
conftest.c:103:25: sys/stropts.h: No such file or directory
configure:10334: $? = 1

..<strip>...

configure:10356: result: no
configure:10360: checking sys/stropts.h presence
configure:10370: gcc -E  conftest.c
configure:10376: $? = 0
configure:10396: result: yes
configure:10409: WARNING: sys/stropts.h: present but cannot be compiled
configure:10411: WARNING: sys/stropts.h:     check for missing
prerequisite headers?
configure:10413: WARNING: sys/stropts.h: see the Autoconf documentation
configure:10415: WARNING: sys/stropts.h:     section "Present But Cannot
Be Compiled"
configure:10417: WARNING: sys/stropts.h: proceeding with the
preprocessor's result
configure:10419: WARNING: sys/stropts.h: in the future, the compiler will
take precedence
configure:10431: checking for sys/stropts.h
configure:10438: result: yes


To me it looks like the first check is using the uclibc toolchain
compiler, which fails as it should since stropts.h doesn't exist in any of
the toolchain include dirs - however the second check seems to be using my
systems gcc compiler which succeeds - causing the compilation error a bit
later on

Is this expected behaviour as far as autoconf goes in buildroot? Is there
something else we can define to ensure the correct c compiler is used?

Cheers,

Marcus 

---------------------------------------------------------------------- 
 crafterm - 11-29-05 03:14  
---------------------------------------------------------------------- 
On further inspection, it looks like the setting for the preprocessor isn't
being overridden and it left as:

CPP='gcc -E'

Should buildroot be overriding the preprocessor and pointing it to the
buildroot toolchain compiler perhaps?

Just a thought. 

---------------------------------------------------------------------- 
 crafterm - 11-29-05 03:25  
---------------------------------------------------------------------- 
Ok, think i've been able to fix it. With the attached patch, CPP is defined
to be the toolchain C compiler/preprocessor, and this lets everything
compile as expected.

What do you guys think? Is the patch ok?

Cheers,

Marcus 

---------------------------------------------------------------------- 
 bernhardf - 01-19-07 08:06  
---------------------------------------------------------------------- 
We have updated to strace-4.5.14 meanwhile, so closing. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-25-05 10:39  crafterm       New Issue                                    
11-25-05 10:39  crafterm       Status                   new => assigned     
11-25-05 10:39  crafterm       Assigned To               => uClibc          
11-25-05 10:39  crafterm       File Added: buildlog.txt                     
11-25-05 11:33  vapier         Note Added: 0000698                          
11-29-05 02:46  crafterm       File Added: config.log                       
11-29-05 02:50  crafterm       Note Added: 0000708                          
11-29-05 03:14  crafterm       Note Added: 0000709                          
11-29-05 03:23  crafterm       File Added: package.makefile.patch               
    
11-29-05 03:25  crafterm       Note Added: 0000710                          
01-19-07 08:06  bernhardf      Status                   assigned => closed  
01-19-07 08:06  bernhardf      Note Added: 0001995                          
01-19-07 08:06  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
