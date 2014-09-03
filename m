From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Sep 2014 17:09:44 +0000 (UTC)
Subject: [Buildroot] [Bug 7364] New: monit doesn't start with glibc 2.19
 because geteuid() fails
Message-ID: <bug-7364-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7364

           Summary: monit doesn't start with glibc 2.19 because geteuid()
                    fails
           Product: buildroot
           Version: 2014.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: syntheticpp at gmx.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


monit exits in src/env.c:

  struct passwd *pw;

  /* Get password struct */
  if ( ! (pw= getpwuid(geteuid())) ) {
    LogError("%s: You don't exist. Go away.\n", prog);
    exit(1);
  }

Only happens with glibc and eglibc 2.19 (tested with GCC 4.9.1), 2.18 is fine.

GCC warns while linking:
y.tab.c:(.text+0x379c): warning: Using 'getpwuid' in statically linked
applications requires at runtime the shared libraries from the glibc version
used for linking

Somehow libnss related?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
