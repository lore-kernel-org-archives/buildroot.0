From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 24 Oct 2012 10:40:47 +0000 (UTC)
Subject: [Buildroot] [Bug 5624] New: When building directfb,
 BR2_TARGET_LDFLAGS not used by libtool
Message-ID: <bug-5624-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5624

           Summary: When building directfb, BR2_TARGET_LDFLAGS not used by
                    libtool
           Product: buildroot
           Version: 2012.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: dunk_palmer at yahoo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4592
  --> https://bugs.busybox.net/attachment.cgi?id=4592
Snippet of build output, showing incorrect linker invocation.

I'm using the CodeSourcery mips-4.4 toolchain, and have a little endian target,
so I set BR2_TARGET_LDFLAGS="-EL" in my .config. Works fine for most things,
however directfb fails to build; at one stage, it invokes the linker, without
the -EL argument, and the link fails because the linker (which defaults to BE)
is attempting to link LE object files.

Dodgy workaround is to replace output/host/usr/bin/mips-linux-gnu-ld with a
script that contains:

#!/bin/sh
exec /opt/CodeSourcery/mips-4.4//bin/mips-linux-gnu-ld -EL $*


Relevant build output attached. The interesting parts of my .config are:

#
# Toolchain
#
# BR2_TOOLCHAIN_BUILDROOT is not set
BR2_TOOLCHAIN_EXTERNAL=y
# BR2_TOOLCHAIN_CTNG is not set
# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109 is not set
# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103 is not set
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44=y
# BR2_TOOLCHAIN_EXTERNAL_CUSTOM is not set
# BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD is not set
BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y
BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/CodeSourcery/mips-4.4/"
BR2_TOOLCHAIN_EXTERNAL_PREFIX="mips-linux-gnu"
BR2_TOOLCHAIN_EXTERNAL_GLIBC=y

BR2_TARGET_OPTIMIZATION="-pipe -EL"
BR2_TARGET_LDFLAGS="-EL"

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
