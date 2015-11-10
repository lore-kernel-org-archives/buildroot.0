From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Nov 2015 13:36:04 +0000 (UTC)
Subject: [Buildroot] [Bug 8456] New: Building host-pkgconf on Fedora 23
 fails due to incorrect build dependencies
Message-ID: <bug-8456-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8456

           Summary: Building host-pkgconf on Fedora 23 fails due to
                    incorrect build dependencies
           Product: buildroot
           Version: 2015.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: ian_ormshaw at waters.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When building on Fedora 23 with a previously working configuration I receive
the following error:

ls: symbol lookup error: ls: undefined symbol: cap_get_file
configure: error: working directory cannot be determined

This is caused by the by the following lines in the configure script.

   1127 ac_pwd=`pwd` && test -n "$ac_pwd" &&
   1128 ac_ls_di=`ls -di .` &&
   1129 ac_pwd_ls_di=`cd "$ac_pwd" && ls -di .` ||
   1130   as_fn_error $? "working directory cannot be determined"
   1131 test "X$ac_ls_di" = "X$ac_pwd_ls_di" || 
   1132   as_fn_error $? "pwd does not report name of working directory"

This line calls /bin/ls as there is no host ls provided by buildroot, but ls
uses LD_LIBRARY_PATH as set by buildroot to locate the shared libraries it
requires and therefore opens:

${buildpath}/host/usr/lib/libcap.so.2

The same effect can be achieved by typing:

LD_LIBRARY_PATH=${buildpath}/host/usr/lib ls -dl .

Temperately modifying the configure script to be:

   1127 LD_LIBRARY_PATH= ac_pwd=`pwd` && test -n "$ac_pwd" &&
   1128 ac_ls_di=`ls -di .` &&
   1129 ac_pwd_ls_di=`cd "$ac_pwd" && ls -di .` ||
   1130   as_fn_error $? "working directory cannot be determined"
   1131 test "X$ac_ls_di" = "X$ac_pwd_ls_di" || 
   1132   as_fn_error $? "pwd does not report name of working directory"

Allows the build to continue.  But the same problem is encountered in building
other host packages.

But it would appear to be a dependency issue.  I think the build order should
be that

host-coreutils and host-libcap needs to be build before any other host packages
that use ls (or any other commands used in configure scripts).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
