From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  3 May 2015 13:05:00 +0000 (UTC)
Subject: [Buildroot] [Bug 8081] New: systemd init system: /tmp is not mode
	1777
Message-ID: <bug-8081-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8081

           Summary: systemd init system: /tmp is not mode 1777
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: bos at je-eigen-domein.nl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Using:

- latest buildroot from git
- start with raspberrypi2_defconfig
- set systemd as init system
- initramfs linked into kernel

/tmp is not mode 1777 causing software that does not run as root and wants to
write to /tmp or (linked folders like /var/log) to fail.

==
# ls -ld /tmp
drwxr-xr-x    7 root     root           220 Jan  1 00:00 /tmp
==

Also tmpfiles service fails to start:

==
 systemd-tmpfiles-setup.service - Create Volatile Files and Directories
   Loaded: loaded (/lib/systemd/system/systemd-tmpfiles-setup.service; static;
vendor preset: enabled)
   Active: failed (Result: exit-code) since Thu 1970-01-01 00:00:06 UTC; 2min
8s ago
     Docs: man:tmpfiles.d(5)
           man:systemd-tmpfiles(8)
  Process: 131 ExecStart=/bin/systemd-tmpfiles --create --remove --boot
--exclude-prefix=/dev (code=exited, status=1/FAILURE)
 Main PID: 131 (code=exited, status=1/FAILURE)
==

And logging is not functional:

==
# journalctl
No journal files were found.
==

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
