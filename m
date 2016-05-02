From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 02 May 2016 18:53:42 +0000
Subject: [Buildroot] [Bug 8901] New: gcc failes to build if fortran is
	enabled
Message-ID: <bug-8901-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8901

            Bug ID: 8901
           Summary: gcc failes to build if fortran is enabled
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: thijsvermeir at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When BR2_TOOLCHAIN_BUILDROOT_FORTRAN is enabled, gcc failes to build with this
error:

---
In file included from ../../../libgfortran/generated/any_l4.c:26:0:
../../../libgfortran/libgfortran.h:60:29: fatal error: quadmath_weak.h: No such
file or directory
 #  include "quadmath_weak.h"
                             ^
compilation terminated.
---

A quick fix is to also enable BR2_TOOLCHAIN_BUILDROOT_WCHAR as this is enabling
libquadmath in `package/gcc/gcc.mk`.

This can be reproduces with a minimal qemu config:
---
BR2_x86_64=y
BR2_DL_DIR="$(TOPDIR)/../dl"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_SYSTEM_DHCP="eth0"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.5.config"
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set
---

-- 
You are receiving this mail because:
You are on the CC list for the bug.
