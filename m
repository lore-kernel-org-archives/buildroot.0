From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Mar 2015 19:48:45 +0000 (UTC)
Subject: [Buildroot] [Bug 7981] New: Target file system skeleton permissions
	hazard
Message-ID: <bug-7981-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7981

           Summary: Target file system skeleton permissions hazard
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: juju at cotds.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The content of the file "system/device_table.txt" is a subset of filesystem
structure present in "system/skeleton/".

Permissions of entries in the skeleton that are not in the device_table.txt
will inherits their permission from the building user environment. Those
permissions will mainly depends of the developer's umask at the moment of the
git checkout (or tar extraction).

This could lead to some file permissions hazard, especially when the
developer's umask is not 0022 AND a user is added to the buildroot target
system (with mkusers). Basically, this user account won't be usable if it
cannot access to its home directory or binaries.

How to reproduce:
tested with master branch at commit 6202592

cd /var/tmp/
umask 0077
git clone git://git.buildroot.net/buildroot
make qemu_x86_defconfig   # Any defconfig will be fine
make
ls -al output/target/

Actual result:
The following target filesystem entries won't be accessible by a user other
than root:

/bin
/home
/lib
/media
/mnt
/opt
/proc
/run
/sbin
/sys
/usr
/usr/bin
/usr/lib
/usr/sbin
/var
/var/lib


Expected result:
Default target file system permissions should be stable and usable by a user,
unrelated to the build user umask.

I would suggest to add relevant entries to the device_table.txt file. If not
possible, a sanity check, a warning or a note in the documentation would be
fine.

Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
