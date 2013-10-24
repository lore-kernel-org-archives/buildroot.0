From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Oct 2013 06:41:24 +0000 (UTC)
Subject: [Buildroot] [Bug 6596] New: Slow bootup if mdev is chosen
Message-ID: <bug-6596-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6596

           Summary: Slow bootup if mdev is chosen
           Product: buildroot
           Version: 2013.08
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: andreas.koop at zf.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5090
  --> https://bugs.busybox.net/attachment.cgi?id=5090
disable CONFIG_UEVENT_HELPER_PATH option

When I choose mdev my Nios II based board stalls for about two minutes during
boot up. Then it proceeds again and boots normally. I've tracked the issue
down. It's because buildroot sets CONFIG_UEVENT_HELPER_PATH to "/sbin/mdev"
during kernel configuration. When I set it to an empty string Linux (3.10.0)
boots up as usual again.
If you look at the kernel's own description of CONFIG_UEVENT_HELPER_PATH it
states it shouldn't be used today anymore since it creates a high system load
on bootup.
Mdev still works after it's startup script has been run. It writes "/sbin/mdev"
to /proc/sys/kernel/hotplug which causes the kernel to inform mdev about new
events.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
