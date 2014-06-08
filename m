From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  8 Jun 2014 02:41:35 +0000 (UTC)
Subject: [Buildroot] [Bug 7172] New: Name collision of rpath token expansion
 and internal variables
Message-ID: <bug-7172-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7172

           Summary: Name collision of rpath token expansion and internal
                    variables
           Product: buildroot
           Version: 2014.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: minimod at morethan.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Ref:  man ld.so

Example:
In menu -> tool chain -> Target Linker Options (BR2_TARGET_LDFLAGS) to:
-Wl,-rpath='$ORIGIN/../lib'
(A relative path from executable to pathname of its required libraries.
The example in ld.so manual.).

Build BusyBox (which honors BR_TARGET_LDFLAGS, not everything does).

Use: readelf -dl on the resulting binary and find an entry similar to:
 0x0000000f (RPATH)                      Library rpath: [outputRIGIN/../lib]

Where the $O of $ORIGIN has been expanded to an internal value by the time the
content of BR2_TARGET_LDFLAGS is seen by the compiler.

This was when using the Buildroot generation of a toolchain.
Other toolchain selections not tested.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
