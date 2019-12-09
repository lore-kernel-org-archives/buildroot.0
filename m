From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 09 Dec 2019 22:04:46 +0000
Subject: [Buildroot] [Bug 12391] New: CMake-based host package fails to
 include output/host/include
Message-ID: <bug-12391-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12391

            Bug ID: 12391
           Summary: CMake-based host package fails to include
                    output/host/include
           Product: buildroot
           Version: 2019.08.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: thirtythreeforty at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8311
  --> https://bugs.busybox.net/attachment.cgi?id=8311&action=edit
Work-in-progress package to replicate the issue

I am struggling to package a new version of mfgtools.  My work-in-progress is
attached; ideally you can extract this into your working directory and
replicate my error.

mfgtools depends on bzlib.h while building.  The compiler (/usr/bin/gcc) cannot
find the bzlib.h file, which at first doesn't make sense... it's in
output/host/include where bzip2 puts it.

/home/ghilliard/Code/buildroot/output/build/host-mfgtools-1.3.102/libuuu/buffer.cpp:43:10:
fatal error: bzlib.h: No such file or directory
 #include "bzlib.h"
          ^~~~~~~~~

The problem is that even though Buildroot passes
-Imy/buildroot/output/host/include into CMake, CMake detects this as an
"implicit include directory" because GCC reports it as such (I think GCC
notices that it has "system" include files, but honestly I am not exactly sure
about its logic).  Then, when the compiler is actually called, this include is
omitted by CMake. Without the include, the compiler doesn't implicitly include
the directory at all, and the build fails.

This hasn't been hit before because there are no bzip2-dependant host packages
in the tree that are built with CMake.  I do not think this is specific to
mfgtools; rather, it will be hit by the first package that does all of the
following:

- Be a host package
- Use CMake to build
- Include a file in output/host/include, not one of its subdirectories

-- 
You are receiving this mail because:
You are on the CC list for the bug.
