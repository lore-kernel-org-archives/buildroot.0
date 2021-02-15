From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 15 Feb 2021 01:03:08 +0000
Subject: [Buildroot] [Bug 13536] New: Build issues and workarounds with
 qemu_aarch64_virt_defconfig
Message-ID: <bug-13536-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13536

            Bug ID: 13536
           Summary: Build issues and workarounds with
                    qemu_aarch64_virt_defconfig
           Product: buildroot
           Version: 2020.11.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jarkko.sakkinen at iki.fi
                CC: buildroot at uclibc.org
  Target Milestone: ---

_STAT_VER
=========

See: https://www.spinics.net/lists/fedora-devel/msg280965.html

I fixed this with a trivial patch:

diff --git a/package/fakeroot/fakeroot-stat_ver.patch
b/package/fakeroot/fakeroot-stat_ver.patch
new file mode 100644
index 0000000000..1ff98f324b
--- /dev/null
+++ b/package/fakeroot/fakeroot-stat_ver.patch
@@ -0,0 +1,11 @@
+--- fakeroot-1.25.1.org/libfakeroot.c  2020-10-08 20:13:18.000000000 +0300
++++ fakeroot-1.25.1/libfakeroot.c      2021-02-11 04:54:48.160372740 +0200
+@@ -31,6 +31,8 @@
+ */
+ #define _GNU_SOURCE
+
++#define _STAT_VER 1
++
+ #define FAKEROOT_LIBFAKEROOT
+
+ #ifdef __APPLE__

ld and -no-pie
==============

Neither '-no-pie' nor '--no-pie' works anymore with the binutils version I
have:

? pacman -Qe |grep binutils
binutils 2.36-3

So, I just go on and manually edit the QEMU build file, when I hit to the
error.

The build file is:

output/build/host-qemu-5.2.0/build/config-host.mak

And you want to:

LDFLAGS_NOPIE=""

-- 
You are receiving this mail because:
You are on the CC list for the bug.
