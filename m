From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Apr 2017 09:01:34 +0000
Subject: [Buildroot] [Bug 9836] New: triggerhappy: systemd unit broken
Message-ID: <bug-9836-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9836

            Bug ID: 9836
           Summary: triggerhappy: systemd unit broken
           Product: buildroot
           Version: 2017.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: posted at heine.so
                CC: buildroot at uclibc.org
  Target Milestone: ---

I'm using triggerhappy in combination with systemd and a bash based system (no
busybox).


The systemd unit fails with this error message:

"Error opening '/dev/input/event*': No such file or directory"


The systemd unit has the start command defined as follows:

ExecStart=/usr/sbin/thd --triggers /etc/triggerhappy/triggers.d --socket
/var/run/thd.socket --user nobody /dev/input/event*


If you run the command directly from bash it is working, I guess because bash
is already expanding the wildcard.


thd started supporting Wildcards in Version 0.5.0. with the option
"--deviceglob" [1]

before it proposed a wrapper script for the systemd unit added in this commit:
[2]

I don't know if the unit currently supplied with buildroot ever worked, but not
with the thd version currently used.

Since 0.5.0 the systemd unit should be like this: [3]


So I could supply a patch but I'm not sure what is preferable. Fix the systemd
unit supplied with the current version included in buildroot 2017.02.1. Or bump
the version and provide the new style unit?

Regards,
Michael

[1]https://github.com/wertarbyte/triggerhappy/commit/c9b6556bd45529eebfabcad3b843beb185aca5fc
[2]https://github.com/wertarbyte/triggerhappy/commit/47a9e4e842676c48d056aefe623af1d29a9b0e5e
[3]https://github.com/wertarbyte/triggerhappy/commit/06720d2305bedc7fcef8b18919f5c73a73164f85

-- 
You are receiving this mail because:
You are on the CC list for the bug.
