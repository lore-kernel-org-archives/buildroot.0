From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Jun 2015 17:47:42 +0000 (UTC)
Subject: [Buildroot] [Bug 8161] New: default /bin/sh symlink to busybox is
 full path and not relative
Message-ID: <bug-8161-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8161

           Summary: default /bin/sh symlink to busybox is full path and
                    not relative
           Product: buildroot
           Version: 2015.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mstarr at hedonline.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Busybox creates all symlinks from all the utilities it contains to the
/bin/busybox binary as relative paths.  As an example all of busybox's
utilities in /bin all have symlinks set to "busybox" since the busybox utility
is located in the same directory.

When buildroot added the BR2_SYSTEM_BIN_SH option in 2014.11 and allowed the
path to the sh symlink to be set, the default is setup as "/bin/busybox".  This
modifies what busybox setups by default which is to just be "busybox".  The
issue with this is that any access to /bin/sh under the target directory points
to the host build systems /bin/busybox which can be problematic.  As an example
I perform an md5sum on all files in the root file system under the target
directory and then compare them to the installed system on the target hardware,
but /bin/sh fails this test since it pointed to the host build systems busybox
for the md5 instead of the one built for the target hardware.

The solution would be to change the default value of BR2_SYSTEM_BIN_SH to
"busybox" when BR2_SYSTEM_BIN_SH_BUSYBOX is selected.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
