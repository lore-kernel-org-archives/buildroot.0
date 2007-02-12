From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:38 -0800
Subject: [Buildroot] [buildroot 0000788]: psmisc no longer builds
Message-ID: <108eb4ee70f3d4a32405b979236a1a10@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=788 
====================================================================== 
Reported By:                likewise
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   788
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-18-2006 13:43 PST
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    psmisc no longer builds
Description: 
The shell scripting in the Makefile for psmisc tries to create signames.h
from signames.c through numerous shell commands. That works. The next
command does a sanity check for the HUP signal to appear in the resulting
signames.h. This grep errors with return code 1 (which invokes rm to
remove signames.h again). The Makefile errors out there with 'exit 1':

grep '^{ 1,"HUP" },$$' signames.h >/dev/null || \
                  { rm -f signames.h; exit 1; }


In my case, there is no space after the opening accolade '{' in the
signames.h file (fix 1).

Even then, grep will not match, only when I remove the $$ (EOL) marker.
This might as well be a grep 2.5.1 bug -- please test against other
systems.
====================================================================== 

---------------------------------------------------------------------- 
 likewise - 03-18-06 13:53  
---------------------------------------------------------------------- 
It's the line continuator (\) in the sed command that screws things up
(maybe a sed bug then??); it introduces a newline in the signames.h file.
---
signames.h: signames.c Makefile
               
/home/leon/sandbox/wrap/buildroot/build_i386/staging_dir/bin/i3$          
     tr -s '\t ' ' ' | sort -n -k 3 | sed \
        's:#define SIG\([A-Z]\+[0-9]*\) \([0-9]\+\) *\(\|/\*.*\)$$:{\
\2,"\1" },:p;d' | \
---

Putting it one a single line makes the build work again.

GNU sed version 4.1.4 

---------------------------------------------------------------------- 
 vapier - 03-19-06 00:52  
---------------------------------------------------------------------- 
the $$ is translated by make to just $ when calling grep

ive updated the version to 22.8 as it already has this issue fixed 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-18-06 13:43  likewise       New Issue                                    
03-18-06 13:43  likewise       Status                   new => assigned     
03-18-06 13:43  likewise       Assigned To               => uClibc          
03-18-06 13:53  likewise       Note Added: 0001187                          
03-19-06 00:52  vapier         Note Added: 0001188                          
03-19-06 00:52  vapier         Status                   assigned => closed  
03-19-06 00:52  vapier         Resolution               open => fixed       
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
