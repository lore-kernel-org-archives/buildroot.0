From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 09 May 2018 21:38:37 +0000
Subject: [Buildroot] [Bug 11001] New: loopback interface not configure
 properly with ifupdown-scripts + standalone ifupdown + systemd
Message-ID: <bug-11001-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11001

            Bug ID: 11001
           Summary: loopback interface not configure properly with
                    ifupdown-scripts + standalone ifupdown + systemd
           Product: buildroot
           Version: 2018.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: tpiepho at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

If one has selected:

systemd
ifupdown-scripts
ifupdown (standalone, not work busybox)

Then the lo interface will be up, but with no address assigned.

The reason is that the systemd unit that is part of of ifupdown-scripts,
network.service, flushes the address(es) from "lo" before calling ifup -a.  It
is normal for lo to already be up, but not via ifupdown, and ifup -a will
complain  if it run in this state.  The address flush leaves "lo" in an up but
with no address state.  

In that state, busybox ifup will configure lo without complaint and give it an
address.  This is what we want.

But standalone ifup will skip the interface and not configure it.  This is not
what we want.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
