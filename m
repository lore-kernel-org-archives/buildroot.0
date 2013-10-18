From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Oct 2013 23:28:35 +0000 (UTC)
Subject: [Buildroot] [Bug 6566] New: PHP segfault when crosscompiled to
	mips64
Message-ID: <bug-6566-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6566

           Summary: PHP segfault when crosscompiled to mips64
           Product: buildroot
           Version: 2013.08
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: cassiano at idbinfo.com.br
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5084
  --> https://bugs.busybox.net/attachment.cgi?id=5084
endian fix

PHP crashes with a segfault when compiled do mips64r2 n32.

Any function related to timezone gives a segfault, like date(), gettimeofday(),
and some other random errors, like microtime() dumping garbage on the screen.

I found out that autoconf did not set some macros when configuring, resulting
little endian code being compiled to a big endian machine.

A simple test can be done on a mips64 machine:

php -r 'print_r(date('l'));'

Result in segfault instantly.

Attached is a patch that solves this issue.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
