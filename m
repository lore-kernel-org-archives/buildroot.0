From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 08 May 2018 12:41:04 +0000
Subject: [Buildroot] [Bug 10996] New: bogus musl ARM toolchain
Message-ID: <bug-10996-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10996

            Bug ID: 10996
           Summary: bogus musl ARM toolchain
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: thomas.petazzoni at free-electrons.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The following defconfig doesn't build:

BR2_arm=y
BR2_cortex_a8=y
BR2_STATIC_LIBS=y
BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_PACKAGE_ZIP=y
# BR2_TARGET_ROOTFS_TAR is not set

It doesn't build because the toolchain is broken, and doesn't manage to link a
simple program like this:

$ cat foo.c 
int main(void) { mktime(); return 0; }

 ./output/host/bin/arm-linux-gcc -o foo foo.c
foo.c: In function ?main?:
foo.c:1:18: warning: implicit declaration of function ?mktime?
[-Wimplicit-function-declaration]
 int main(void) { mktime(); return 0; }
                  ^~~~~~
/home/thomas/projets/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/6.4.0/libgcc.a(_dvmd_lnx.o):
In function `__aeabi_idiv0':
/home/thomas/projets/buildroot/output/build/host-gcc-final-6.4.0/build/arm-buildroot-linux-musleabihf/libgcc/../../../libgcc/config/arm/lib1funcs.S:1354:
undefined reference to `raise'
collect2: error: ld returned 1 exit status

This is causing the following build issues in our autobuilders:
http://autobuild.buildroot.net/?reason=zip%&libc=musl.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
