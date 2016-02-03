From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 03 Feb 2016 19:50:59 +0000
Subject: [Buildroot] [Bug 8646] New: check-host-rpath script returns false
 positives when rpath contains symlink
Message-ID: <bug-8646-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8646

            Bug ID: 8646
           Summary: check-host-rpath script returns false positives when
                    rpath contains symlink
           Product: buildroot
           Version: 2015.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: abamberger at aesaustin.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6296
  --> https://bugs.busybox.net/attachment.cgi?id=6296&action=edit
Patch for support/scripts/check_host_rpath script

A project I am working on recently updated from buildroot 2015.08 to 2015.11.1.
 After the upgrade, our build started breaking with the error message "ERROR:
package <package> installs executables without proper RPATH", which I
eventually tracked down to the support/scripts/check-host-rpath script, which
appears to be new in 2015.11.

Unfortunately, I don't have a reliable set of steps to reproduce, as I was
never able to reproduce this issue in a deterministic manner.  Different builds
would produce the error messages for different packages, and sometimes would
complete successfully without the error appearing at all.  Regardless, I
believe I've been able to determine at least a partial cause for the issue
(possibly not the root cause), and have come up with a fix.

The path that buildroot is checked out under on our build server contains a
symlink (it's checked out under /home, which is actually a symlink to
/share/home).  After looking at the RUNPATH of the libraries that are
triggering the error, it appears that something in the build system is
canonicalizing the RUNPATH (it contains /share/home), while the hostdir that
the script is checking against has not been canonicalized (it just contains
/home).  Therefore, even though the paths are logically the same, the string
comparison of the paths in the script returns false.

I fixed this issue by modifying the check-host-rpath script to use realpath to
canonicalize both the R(UN)PATH parsed from the library, and the hostdir used
by the script to check against.  I have no idea if this is the best way to fix
this, as I don't have a very solid understanding of how the R(UN)PATHS are
built into the libraries, or if using realpath is portable.

The compiler on the build system is gcc 4.7.3 for x86_64, and the build server
is running gentoo linux with kernel 3.14.14

I've attached a patch with my changes to the check-host-rpath script.  I
understand that patches are only accepted via the mailing list, I'm mostly
posting it here for informational purposes.  I wanted to get some feedback on
whether this was a valid solution for this issue (or if it's even going in the
right direction) before posting a potential patch to the mailing list

-- 
You are receiving this mail because:
You are on the CC list for the bug.
