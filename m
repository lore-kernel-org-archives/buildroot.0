From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  6 Mar 2012 19:02:07 +0000 (UTC)
Subject: [Buildroot] [Bug 4868] New: Buildroot compile failure for
 toolchain/gdb-7.4/intl/relocatable.c
Message-ID: <bug-4868-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4868

           Summary: Buildroot compile failure for
                    toolchain/gdb-7.4/intl/relocatable.c
           Product: buildroot
           Version: 2012.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: ps.report at gmx.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4082
  --> https://bugs.busybox.net/attachment.cgi?id=4082
buildroot config file

Attached a fix/patch for the following compile failure with buildroot and
gdb-7.4 (.config file attached):

make[3]: Entering directory `/tmp//build-001/build/gdb-7.4-target/libiberty'
make[4]: Entering directory
`/tmp//build-001/build/gdb-7.4-target/libiberty/testsuite'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/tmp//build-001/build/gdb-7.4-target/libiberty/testsuite'
make[3]: Leaving directory `/tmp//build-001/build/gdb-7.4-target/libiberty'
make[3]: Entering directory `/tmp//build-001/build/gdb-7.4-target/intl'
rm -f stamp-h1
/bin/sh ./config.status config.h
config.status: creating config.h
config.status: config.h is unchanged
test -f config.h || (rm -f stamp-h1 && /usr/bin/make stamp-h1)
/tmp//build-001/host/usr/bin/x86_64-unknown-linux-uclibc-gcc -c  -pipe -Os -g2
-fPIC -DPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
-Wno-error -DHAVE_CONFIG_H -DINSTALLDIR="\"/usr/lib\"" -I.
-I/tmp//build-001/toolchain/gdb-7.4/intl
/tmp//build-001/toolchain/gdb-7.4/intl/relocatable.c
/tmp//build-001/toolchain/gdb-7.4/intl/relocatable.c: In function
?libintl_relocate?:
/tmp//build-001/toolchain/gdb-7.4/intl/relocatable.c:392:40: error:
?INSTALLPREFIX? undeclared (first use in this function)
/tmp//build-001/toolchain/gdb-7.4/intl/relocatable.c:392:40: note: each
undeclared identifier is reported only once for each function it appears in
make[3]: *** [relocatable.o] Error 1
make[3]: Leaving directory `/tmp//build-001/build/gdb-7.4-target/intl'
make[2]: *** [all-intl] Error 2
make[2]: Leaving directory `/tmp//build-001/build/gdb-7.4-target'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/tmp//build-001/build/gdb-7.4-target'
make: *** [/tmp//build-001/build/gdb-7.4-target/gdb/gdb] Error 2
make: Leaving directory `/tmp//buildroot'


I think the relevant config options to hit this bug are:

BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_SERVER=y
BR2_GDB_VERSION_7_4=y
BR2_GDB_VERSION="7.4"
BR2_ENABLE_LOCALE=y

Analysis: the Makefile for the gdb-7.4 embedded (lib-)intl fails to set a
define for 'INSTALLPREFIX'.

Fix: see attached buildroot patch

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
