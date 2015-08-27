From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Aug 2015 16:29:29 +0000 (UTC)
Subject: [Buildroot] [Bug 8316] New: lttng-tools and lttng-babeltrace
 executables contain bad RPATH pointing to host machine
Message-ID: <bug-8316-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8316

           Summary: lttng-tools and lttng-babeltrace executables contain
                    bad RPATH pointing to host machine
           Product: buildroot
           Version: 2015.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: benjamin.h.shelton at intel.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The lttng-tools and lttng-babeltrace executables contain bad RPATHs pointing to
the buildroot output/build directory.  This happens with lttng-tools versions
2.6.0 and 2.7.0-rc1, as well as with lttng-babeltrace.

objdump -p shows the following:

RPATH               
/workspace/sw/bhshelto/buildroot/buildroot/output/build/lttng-tools-2.7.0-rc1/src/lib/lttng-ctl/.libs:/workspace/sw/bhshelto/buildroot/buildroot/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/lib:/workspace/sw/bhshelto/buildroot/buildroot/output/build/liburcu-0.8.7/.libs

This is a problem for us because /workspace is an NFS mount that we use for
development builds, and we also mount it on our embedded targets.  When
/workspace is not mounted on the embedded target, the lttng utilities run fine,
since the RPATH does not match anything.  However, if I mount /workspace, I see
the following:

[root at buildroot cli]# lttng stop
lttng: error while loading shared libraries:
/workspace/sw/bhshelto/buildroot/buildroot/output/build/lttng-tools-2.7.0-rc1/src/lib/lttng-ctl/.libs/liblttng-ctl.so.0:
file too short
[root at buildroot cli]# cd
[root at buildroot ~]# umount /workspace
[root at buildroot ~]# lttng stop
Waiting for data availability
Tracing stopped for session my-session

When I use patchelf to remove the RPATH, everything works as expected.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
