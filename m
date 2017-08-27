From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 27 Aug 2017 19:35:59 +0200
Subject: [Buildroot] [PATCH 0/7] glibc: bump to 2.26
Message-ID: <20170827173606.13144-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series bump glibc to the latest release and allow to remove all
local patches!

While testing this new version, some build issues has been dicovered.
Two gcc patch are needed to build a toolchain with older compiler
(gcc 4.9 to 6.4), gcc 7.2 contain already the fix.

Another C++ namespace change trigger a build issue when the code
contain a workaround for math functions:

mesa3d:
"using std::fpclassify;"

https://github.com/mesa3d/mesa/blob/master/include/c99_math.h#L197

jsoncpp:
"#define isfinite std::isfinite"

It's not easy to catch all packages affected by this issue before
bumping glibc. So here is the v1 for testing and review.

This series is rebased on master in order to have gcc 7.2 from
2017.08-rc3.
https://git.buildroot.net/buildroot/commit/?id=80546e97fa63e7ce196be648f0fc1eb4e7d711b3

Best regards,
Romain

Romain Naour (7):
  package/gcc: fix build issue with glibc 2.26
  package/gcc: fix build issue with glibc 2.26
  package/mesa3d: fix build issue with glibc >= 2.26
  package/jsoncpp: fix build with glibc >= 2.26
  package/glibc: needs kernel headers >= 3.10 on powerpc64le
  package/gcc: enable float128 on powerpc64le with glibc >= 2.26
    toolchains
  package/glibc: bump to 2.26

 ...t_t-not-struct-ucontext-in-linux-unwind.h.patch | 190 ++++++++++++
 package/gcc/4.9.4/944-sanitizer-linux.patch        |  88 ++++++
 ...t_t-not-struct-ucontext-in-linux-unwind.h.patch | 192 +++++++++++++
 package/gcc/5.4.0/944-sanitizer-linux.patch        |  87 ++++++
 ...t_t-not-struct-ucontext-in-linux-unwind.h.patch | 191 +++++++++++++
 package/gcc/6.4.0/943-sanitizer-linux.patch        |  87 ++++++
 package/gcc/gcc.mk                                 |   8 +
 .../glibc/0001-sh-Fix-building-with-gcc5-6.patch   |  56 ----
 ...00366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch |  35 ---
 ...ject-overly-long-LD_PRELOAD-path-elements.patch | 122 --------
 ...Reject-overly-long-LD_AUDIT-path-elements.patch | 204 -------------
 package/glibc/0005-fix-binutils-2-29-build.patch   |  65 -----
 ...g-IS_IN-libc-guards-to-vectorized-strcspn.patch |  47 ---
 package/glibc/0006-sh4-trap.patch                  | 318 ---------------------
 package/glibc/glibc.hash                           |   2 +-
 package/glibc/glibc.mk                             |   2 +-
 ...001-json_writer-fix-build-with-glibc-2.26.patch |  28 ++
 ...-c99_math-fix-build-issue-with-glibc-2.26.patch |  82 ++++++
 toolchain/toolchain-buildroot/Config.in            |   8 +-
 19 files changed, 962 insertions(+), 850 deletions(-)
 create mode 100644 package/gcc/4.9.4/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
 create mode 100644 package/gcc/4.9.4/944-sanitizer-linux.patch
 create mode 100644 package/gcc/5.4.0/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
 create mode 100644 package/gcc/5.4.0/944-sanitizer-linux.patch
 create mode 100644 package/gcc/6.4.0/942-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
 create mode 100644 package/gcc/6.4.0/943-sanitizer-linux.patch
 delete mode 100644 package/glibc/0001-sh-Fix-building-with-gcc5-6.patch
 delete mode 100644 package/glibc/0002-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
 delete mode 100644 package/glibc/0003-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
 delete mode 100644 package/glibc/0004-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch
 delete mode 100644 package/glibc/0005-fix-binutils-2-29-build.patch
 delete mode 100644 package/glibc/0006-i686-Add-missing-IS_IN-libc-guards-to-vectorized-strcspn.patch
 delete mode 100644 package/glibc/0006-sh4-trap.patch
 create mode 100644 package/jsoncpp/0001-json_writer-fix-build-with-glibc-2.26.patch
 create mode 100644 package/mesa3d/0005-c99_math-fix-build-issue-with-glibc-2.26.patch

-- 
2.9.5
