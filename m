From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  8 Mar 2012 08:24:59 +0000 (UTC)
Subject: [Buildroot] [Bug 4892] build fails on
 ltp-testsuite-20101031/testcases/kernel/fs/ftest/ftest04.c:146: undefined
 reference to `sigset'
In-Reply-To: <bug-4892-163@https.bugs.busybox.net/>
References: <bug-4892-163@https.bugs.busybox.net/>
Message-ID: <20120308082459.D811E90D0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4892

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-03-08 08:24:59 UTC ---
Thanks for your bug report.

The help text of the ltp-testsuite package says:

"""
          The LTP testsuite uses several functions that are considered
          obsolete, such as sigset() and others. Therefore, the LTP
          testsuite does not build with Buildroot's default uClibc
          configuration, and options such as
          UCLIBC_HAS_OBSOLETE_BSD_SIGNAL are needed.
"""

So, it is well-known that ltp-testsuite doesn't build with our default uClibc
configuration. You must add the uCLIBC_HAS_OBSOLETE_BSD_SIGNAL option to it. So
you should do:

make clean
make uclibc-menuconfig
# add the UCLIBC_HAS_OBSOLETE_BSD_SIGNAL option
make

and then it should work.

A good improvement would be to adapt ltp-testsuite so that if sigset() isn't
available, it doesn't try to use it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
