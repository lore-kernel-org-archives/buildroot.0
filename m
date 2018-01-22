From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Jan 2018 12:48:24 +0000
Subject: [Buildroot] [Bug 10661] New: /etc/init.d/S29netplug starts multiple
 instances of netplugd
Message-ID: <bug-10661-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10661

            Bug ID: 10661
           Summary: /etc/init.d/S29netplug starts multiple instances of
                    netplugd
           Product: buildroot
           Version: 2017.11.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mail2k at web.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

If you execute the command "/etc/init.d/S29netplug start" multiple times, you
get multiple instances of netplugd. 
This is not the desired behaviour. We should only have one running netplugd.

The change has to be made in  package/netplug/S29netplug:
line 46:
-       start-stop-daemon -S -q -p /var/run/netplugd.pid -x /sbin/netplugd
${NETPLUGDARGS}

+       start-stop-daemon -S -q -x /sbin/netplugd -- -p /var/run/netplugd.pid
${NETPLUGDARGS}

Reason: 
If the start-stop-daemon gets the parameter -p /var/run/netplug.pid it will try
to identify a running process by this pid-file but the file doesn't exist. As a
result, every call of  "/etc/init.d/S29netplug start" starts a new netplugd.

--> The parameter -p /var/run/netplug.pid must be passed to netplugd.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
