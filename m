From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Oct 2011 13:14:01 +0000 (UTC)
Subject: [Buildroot] [Bug 4303] New: Toolchains qmake causes DEBUG builds
	with -O2
Message-ID: <bug-4303-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4303

           Summary: Toolchains qmake causes DEBUG builds with -O2
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: buildroot at bluespirit.la
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3637
  --> https://bugs.busybox.net/attachment.cgi?id=3637
.config file of buildroot 2011.08

When compiling/installing Qt with buildroot, also the qmake.conf is correct.
When buildroot is compiled with the "-O2" flag, the QMAKE_CXXFLAGS of
qmake.conf also includes the "-O2" flag, which causes that all builds (even the
DEBUG ones) are compiled with "-O2", and thus the debugger goes crazy ;)

I would suggest, that when writing the QMAKE_CXXFLAGS (and QMAKE_CFLAGS) to
qmake.conf, we should filter the flags (e.g. -pipe is ok).


############ Result ##############

#
# qmake configuration for building with arm-linux-g++
#

include(../../common/g++.conf)
include(../../common/linux.conf)
include(../../common/qws.conf)
QMAKE_LFLAGS = 
QMAKE_CXXFLAGS = -pipe -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
QMAKE_CFLAGS   = -pipe -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
QMAKE_STRIP    = /opt/damian/toolchain-arm/usr/bin/arm-none-linux-gnueabi-strip
QMAKE_RANLIB   =
/opt/damian/toolchain-arm/usr/bin/arm-none-linux-gnueabi-ranlib
QMAKE_OBJCOPY  =
/opt/damian/toolchain-arm/usr/bin/arm-none-linux-gnueabi-objcopy
QMAKE_AR       = /opt/damian/toolchain-arm/usr/bin/arm-none-linux-gnueabi-ar
cqs
QMAKE_LINK_SHLIB = /opt/damian/toolchain-arm/usr/bin/arm-none-linux-gnueabi-g++
QMAKE_LINK     = /opt/damian/toolchain-arm/usr/bin/arm-none-linux-gnueabi-g++
QMAKE_CXX      = /opt/damian/toolchain-arm/usr/bin/arm-none-linux-gnueabi-g++
QMAKE_CC       = /opt/damian/toolchain-arm/usr/bin/arm-none-linux-gnueabi-gcc

# modifications to g++.conf

# modifications to linux.conf

load(qt_config)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
