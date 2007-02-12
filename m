From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:00 -0800
Subject: [Buildroot] [buildroot 0001097]: dependency checks - Debian gcc
Message-ID: <d2d2adba4ba39d91d9a1ca33f498f7f3@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1097 
====================================================================== 
Reported By:                alchemar
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1097
Category:                   Other
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-20-2006 17:47 PST
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    dependency checks - Debian gcc
Description: 
My Debian Distribution adds a version number in gcc that was creating a
warning on the dependency checks.  I modified the sed statement so that it
will grab the first set of numbers instead of the last by looking for "not
a number" [^0-9]* instead of "any" .*  character at the start of the
pattern.



checked out code from svn on 11-19-2006

buildroot/toolchain/dependencies/dependencies.sh

Line 73


COMPILER_VERSION=$($COMPILER --version 2>&1 | head -n1 | $XSED -e 's/^.*
\([0-9\.]\)/\1/g' -e "s/[-\ ].*//g")

COMPILER_VERSION=$($COMPILER --version 2>&1 | head -n1 | $XSED -e
's/^[^0-9]* \([0-9\.]\)/\1/g' -e "s/[-\ ].*//g")

======================================================================
Relationships       ID      Summary
----------------------------------------------------------------------
duplicate of        0000961 compiler version check broken on cygwin
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 11-22-06 13:16  
---------------------------------------------------------------------- 
This is completely harmless. I do not consider fixing this, fwiw. 

---------------------------------------------------------------------- 
 alchemar - 11-22-06 15:41  
---------------------------------------------------------------------- 
Yes it is minor as far as finished executables, but when you are first
trying to compile and the first thing you see is an error in the depedency
checks it looks worse than it is.  I tracked it down, because it was the
logical place to start when the the make exited on "Error 2" shortly after
the dependecy checks.  What you are doing with this program sounds like a
really good thing (would have probably had enough time this weekend to
finaly get things to compile correctly so I could find out), but I don't
expect something this complex to work out of the box.  The less "harmless"
errors that display on the screen, the less things to verify when things
don't work.  I am a little disappointed that you won't even consider
fixing it when it involves adding four characters to one line.  It took
more effort to post the reply stating that it was not worth fixing than it
would to fix.

Since posting this error, I have gotten more familar with the bug tracking
system, and have found other people that were having problems with this
exact problem under other distributions.  Just because it is "harmless" by
the programs standard, doesn't mean that there is not a cost of time and
effort involved that could have been used helping to track down more
substantial reasons for failures.

It is your project to manage how you see fit.  I am sorry that I wasted
your time and server resources by posting the fix to something so
insignificant, I just hope that it might help the people that don't know
it is harmless find out easier than I did. 

---------------------------------------------------------------------- 
 bernhardf - 11-22-06 16:14  
---------------------------------------------------------------------- 
I've closed and/or fixed about 10, 20 bugs in buildroot this evening.
The thing is that first, i would need to see if your proposed version
stripping does work with the simples sed from busybox and second that i
have to be absolutely sure that we don't produce *wrong* version strings
from the HOSTCC.

If you can check that the most simple sed configuration from busybox-1.0.0
without any features sanitizes your versionstring in an expected way, then
please let me know.

Apart from that, i'm not the only one who fixes bugs or checks stuff into
buildroot, and no, it's also not my project. But as said, if you can check
against busybox-1.0.0 and all behaves properly, then we'll apply the
patch.

TIA 

---------------------------------------------------------------------- 
 bernhardf - 11-28-06 01:48  
---------------------------------------------------------------------- 
With your proposed patch, i get:

$ gcc-4.2-HEAD --version 2>&1 | head -n 1 
gcc-4.2-HEAD (GCC) 4.3.0 20061024 (experimental)
$ gcc-4.2-HEAD --version 2>&1 | head -n 1 | sed -e 's/^[^0-9]*
\([0-9\.]\)/\1/g' -e "s/[-\ ].*//g"
gcc

which is not acceptable.
