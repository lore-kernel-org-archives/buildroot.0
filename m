From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 23 Sep 2017 23:23:59 +0200
Subject: [Buildroot] [PATCH v3 0/7] glibc: bump to 2.26
Message-ID: <20170923212414.16744-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series bump glibc to the latest release and allow to remove all
patches required for the previous version! But glibc come with some
new issue that are hopefully already fixed in the 2.26.x stable branch.

While testing this new version, some build issues has been dicovered.
Two gcc patch are needed to build a toolchain with older compiler
(gcc 4.9 to 6.4), gcc 7.2 contain already the fix.

Backport a series related to bug 21930 and 22146.
Without them the float128 support break the C++ build for some
packages.

https://sourceware.org/bugzilla/show_bug.cgi?id=21930
https://sourceware.org/bugzilla/show_bug.cgi?id=22146

This third series is for testing and review.
Let's hope that glibc 2.26.1 will be released soon :)

Best regards,
Romain

Romain Naour (7):
  package/gcc: fix build issue with glibc 2.26
  package/gcc: fix build issue with glibc 2.26
  package/glibc: needs kernel headers >= 3.10 on powerpc64le
  package/gcc: enable float128 on powerpc64le with glibc >= 2.26
    toolchains
  package/diffutils: disable getopt_long replacement with glibc
  package/flex: disable reallocarray
  package/glibc: bump to 2.26

 package/diffutils/diffutils.mk                     |   6 +
 package/flex/flex.mk                               |   3 +-
 ...t_t-not-struct-ucontext-in-linux-unwind.h.patch | 190 ++++++++++++
 package/gcc/4.9.4/944-sanitizer-linux.patch        |  88 ++++++
 ...t_t-not-struct-ucontext-in-linux-unwind.h.patch | 192 +++++++++++++
 package/gcc/5.4.0/944-sanitizer-linux.patch        |  91 ++++++
 ...t_t-not-struct-ucontext-in-linux-unwind.h.patch | 192 +++++++++++++
 package/gcc/6.4.0/943-sanitizer-linux.patch        |  91 ++++++
 package/gcc/Config.in.host                         |   4 +
 package/gcc/gcc.mk                                 |   8 +
 ...__builtin_types_compatible_p-in-C-mode-bu.patch |  50 ++++
 .../glibc/0001-sh-Fix-building-with-gcc5-6.patch   |  56 ----
 ...00366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch |  35 ---
 ...02-Do-not-use-generic-selection-in-C-mode.patch |  56 ++++
 ...-version-of-issignaling-that-does-not-use.patch | 225 +++++++++++++++
 ...ject-overly-long-LD_PRELOAD-path-elements.patch | 122 --------
 ...ersion-of-issignaling-when-__NO_LONG_DOUB.patch |  47 +++
 ...Reject-overly-long-LD_AUDIT-path-elements.patch | 204 -------------
 ...-version-of-iszero-that-does-not-use-__MA.patch | 210 ++++++++++++++
 package/glibc/0005-fix-binutils-2-29-build.patch   |  65 -----
 ...ify-use-the-builtin-when-optimizing-for-s.patch |  63 ++++
 ...g-IS_IN-libc-guards-to-vectorized-strcspn.patch |  47 ---
 package/glibc/0006-sh4-trap.patch                  | 318 ---------------------
 package/glibc/glibc.hash                           |   2 +-
 package/glibc/glibc.mk                             |   2 +-
 toolchain/toolchain-buildroot/Config.in            |   6 +
 26 files changed, 1523 insertions(+), 850 deletions(-)
 create mode 100644 package/gcc/4.9.4/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
 create mode 100644 package/gcc/4.9.4/944-sanitizer-linux.patch
 create mode 100644 package/gcc/5.4.0/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
 create mode 100644 package/gcc/5.4.0/944-sanitizer-linux.patch
 create mode 100644 package/gcc/6.4.0/942-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
 create mode 100644 package/gcc/6.4.0/943-sanitizer-linux.patch
 create mode 100644 package/glibc/0001-Do-not-use-__builtin_types_compatible_p-in-C-mode-bu.patch
 delete mode 100644 package/glibc/0001-sh-Fix-building-with-gcc5-6.patch
 delete mode 100644 package/glibc/0002-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
 create mode 100644 package/glibc/0002-Do-not-use-generic-selection-in-C-mode.patch
 create mode 100644 package/glibc/0003-Provide-a-C-version-of-issignaling-that-does-not-use.patch
 delete mode 100644 package/glibc/0003-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
 create mode 100644 package/glibc/0004-Fix-the-C-version-of-issignaling-when-__NO_LONG_DOUB.patch
 delete mode 100644 package/glibc/0004-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch
 create mode 100644 package/glibc/0005-Provide-a-C-version-of-iszero-that-does-not-use-__MA.patch
 delete mode 100644 package/glibc/0005-fix-binutils-2-29-build.patch
 create mode 100644 package/glibc/0006-Let-fpclassify-use-the-builtin-when-optimizing-for-s.patch
 delete mode 100644 package/glibc/0006-i686-Add-missing-IS_IN-libc-guards-to-vectorized-strcspn.patch
 delete mode 100644 package/glibc/0006-sh4-trap.patch

-- 
2.9.5
