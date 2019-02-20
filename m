From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 20 Feb 2019 09:45:26 +0000
Subject: [Buildroot] [Bug 11681] New:
 .../buildroot/output/host/bin/x86_64-buildroot-linux-gnu-ld:
 arch/x86/kernel/head_64.o: unable to initialize decompress status for
 section .debug_line
Message-ID: <bug-11681-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11681

            Bug ID: 11681
           Summary: .../buildroot/output/host/bin/x86_64-buildroot-linux-g
                    nu-ld: arch/x86/kernel/head_64.o: unable to initialize
                    decompress status for section .debug_line
           Product: buildroot
           Version: 2018.11.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: janusz.krzysztofik at intel.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

Buildroot 2018.11.2 hosted on Fedora 29 here. The failure started appearing
during kernel build surprisingly after elfutils RPMs had been upgraded from
0.174 to 0.176.

Two workarounds worked for me:
- downgrading elfutils RPMs back to 0.174,
- symlinking .../buildroot/output/host/bin/x86_64-buildroot-linux-gnu-ld to a
fixed one provided by Fedora 29 RPM bintuils-2.31.1-18.fc19 (see Changelog on
https://koji.fedoraproject.org/koji/buildinfo?buildID=1211905).

For more details, please see:
https://bugzilla.redhat.com/show_bug.cgi?id=1678204#c11
https://sourceware.org/bugzilla/show_bug.cgi?id=23919

My conclusion is, something under output/ (probably
output/build/linux-xxx/tools/objtool/objtool) used for building the kernel is
using host provided libelf.

$ ldd ./output/build/linux-custom/tools/objtool/objtool
        linux-vdso.so.1 (0x00007ffc5bed4000)
        libelf.so.1 => /lib64/libelf.so.1 (0x00007f1c23c78000)
        libc.so.6 => /lib64/libc.so.6 (0x00007f1c23ab2000)
        libz.so.1 => /home/jkrzyszt/git/buildroot/output/host/lib/libz.so.1
(0x00007f1c23a98000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f1c23cb7000)

I can see 2 possible ways of fixing the issue:
a) making objtool (or other executable which exposes the issue if that's not
objtool) use libelf provided by buildroot (the preferred way, I believe),
or
b) applying the fix from
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=88739f776b733b0b84600b283417f862a010bb5d
on binutils so it doesn't suffer from the issue whatever libelf version is
installed on a host.

BTW, the bug also exists in 2019.02-rc1.

Thanks,
Janusz

-- 
You are receiving this mail because:
You are on the CC list for the bug.
