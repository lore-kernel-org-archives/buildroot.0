From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Mar 2012 23:58:19 +0000 (UTC)
Subject: [Buildroot] [Bug 4922] New: Please consider introducing host-make
 for building software packages within the buildroot
Message-ID: <bug-4922-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4922

           Summary: Please consider introducing host-make for building
                    software packages within the buildroot
           Product: buildroot
           Version: 2012.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: develop at kristov.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4136
  --> https://bugs.busybox.net/attachment.cgi?id=4136
changes the core build system to correctly include host-make into the build
process

Currently, the host's 'make' utility is used to build the software packages in
the buildroot. However, it would be more flexible if -- similar to
host-autoconf, host-automake etc. -- at the very beginning a buildroot-specific
host-make would be built (using the host's 'make') which is later used for
building all the rest.

Why would this be useful? For one, it would allow to be independent of the
host's 'make' and, consequently, guarantee specific 'make' behaviour.
Additionally, one would be able to patch 'make'. In my case, I wanted to patch
make 3.82 such that $(wildcard ...) results are sorted as in previous versions,
as this is the only way to guarantee that the same binaries are produced each
time the software packages are built. (Otherwise, the *.o files may be passed
in different orders to the linker as, due to -j2, the object files may be
created differently on each build, causing slightly different binaries due to
symbols being reordered.)

I have attached a simple patch that allows this. I'm afraid the patch is not
quite complete as it does not change the 'make' version check in
support/dependencies/dependencies.sh which can probably be weakened as the
host's 'make' is basically only used for building host-make and some
configuration programs. But it should definitely provide a good start. With
this patch, I'm able to successfully using a patched 'make' in the current
buildroot (2012.02).

Kind regards,

Christoph Schulz

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
