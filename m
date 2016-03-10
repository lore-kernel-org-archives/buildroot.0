From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 10 Mar 2016 14:56:47 +0000
Subject: [Buildroot] [Bug 8786] New: gdb fails to build with xz and expat
 support at the same
Message-ID: <bug-8786-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8786

            Bug ID: 8786
           Summary: gdb fails to build with xz and expat support at the
                    same
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: vincent.riera at imgtec.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

For some reason gdb fails to build with xz and expat support at the same
time when using an external toolchain.

This is how the problem is shown:

checking for liblzma... no
configure: error: missing liblzma for --with-lzma

Try this defconfig if you want to reproduce the problem:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_XZ=y
BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_DEBUGGER=y
BR2_PACKAGE_EXPAT=y

Using the above defconfig, the error in the gdb/config.log will look
like this:

configure:13241: checking whether to use lzma
configure:13243: result: yes
configure:13657: checking for liblzma
configure:13678: /br/output/host/usr/bin/i686-pc-linux-gnu-gcc -o
conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os
-I/br/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include
-static-libstdc++ -static-libgcc  conftest.c -ldl -ldl -lncurses -lm
-ldl    /usr/lib/liblzma.so >&5
/lib64/liblzma.so.5: undefined reference to `clock_gettime at GLIBC_2.17'
collect2: error: ld returned 1 exit status

You can also use this defconfig to reproduce the problem for MIPS:

BR2_mips=y
BR2_mips_32r2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_XZ=y
BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_DEBUGGER=y
BR2_PACKAGE_EXPAT=y

In that case the error will look like this:

configure:13241: checking whether to use lzma
configure:13243: result: yes
configure:13657: checking for liblzma
configure:13678: /br/output/host/usr/bin/mips-linux-gnu-gcc -o conftest
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
 -I/br/output/host/usr/mips-buildroot-linux-gnu/sysroot/usr/include
-static-libstdc++ -static-libgcc  conftest.c -ldl -ldl -lncurses -lm
-ldl    /usr/lib/liblzma.so >&5
/br/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/5.2.0/../../../../mips-linux-gnu/bin/ld:
skipping incompatible /lib64/liblzma.so.5 when searching for
/lib64/liblzma.so.5
/br/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/5.2.0/../../../../mips-linux-gnu/bin/ld:
cannot find /lib64/liblzma.so.5
collect2: error: ld returned 1 exit status

You can also use this defconfig to reproduce the problem for ARM:

BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_XZ=y
BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_DEBUGGER=y
BR2_PACKAGE_EXPAT=y

In that case the error will look like this:

configure:13241: checking whether to use lzma
configure:13243: result: yes
configure:13657: checking for liblzma
configure:13678: /br/output/host/usr/bin/arm-linux-gnueabihf-gcc -o
conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os
-I/br/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-static-libstdc++ -static-libgcc  conftest.c -ldl -ldl -lncurses -lm
-ldl    /usr/lib/liblzma.so >&5
/lib64/liblzma.so.5: file not recognized: File format not recognized
collect2: error: ld returned 1 exit status

-- 
You are receiving this mail because:
You are on the CC list for the bug.
