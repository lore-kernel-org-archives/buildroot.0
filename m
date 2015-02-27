From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 27 Feb 2015 09:54:50 +0000 (UTC)
Subject: [Buildroot] [Bug 7892] New: systemd-journald is broken
Message-ID: <bug-7892-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7892

           Summary: systemd-journald is broken
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: nroach44 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5876
  --> https://bugs.busybox.net/attachment.cgi?id=5876
Buildroot config

Building the latest git for two known-good configurations (x86_64 & arm, both
glibc), running journalctl results in:

# journalctl
No journal files were found.

Later in the operation of the system, the following is dumped to the default
TTY (the debug header ttyS0 on the arm board, has not been observed in the x86
system)

[ 5125.440000] systemd-journald[521]: Failed to rotate
/var/log/journal/6459213c1d6743478b95723dff97eb1c/system.journal: No such file
or directory

This line is repeated multiple times per second.

/var/log/journal does not exist, and creating it and restarting
systemd-journald does not fix the issue.

Adding /var/log/journal to /usr/lib/tmpfiles.d/* does seem to alleviate the
logspam, but journalctl still does not work.

I do not have any overlay, {pre,post}-build script or startup script that
interferes with tmpfiles.d, /var/log/journal, /tmp or /etc/fstab.

Nothing else in the system appears broken, but bind does get oom-killed after a
while. I can't tell if it's due to my configuration of bind or due to this
issue. Bind was not installed on the x86 system.

All attached files are for the x86 system.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
