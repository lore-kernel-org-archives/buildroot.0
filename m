From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Thu,  3 May 2018 16:31:45 +0200
Subject: [Buildroot] [RFC PATCH 0/2] Verify hardened builds
Message-ID: <20180503143147.5301-1-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series introduces a new package post install check that
verifies that the correct build hardening flags has been applied.

Most of the work here is done by the annobin GCC plugin that annotates
all objects files, libraries and executables with the flags used in
the build. 

The checking functionality is heavily based on the check-bin-arch
functionality with only minor adjustments, and with the validation
itself performed by the hardened.sh script from the annobin package.

At the end of the package install step, it will output any failed
checks:
hardened.sh: output/target/usr/bin/foo: FAIL: compiled with -fstack-protector-off
hardened.sh: output/target/usr/bin/foo: FAIL: optimization level of -O0 used
hardened.sh: output/target/usr/bin/foo: FAIL: insufficient value for -D_FORTIFY_SOURCE=0
hardened.sh: output/target/usr/bin/foo: FAIL: -Wl,-z,now not used

Stefan S?rensen (2):
  annobin: New package
  core: Verify that hardening flags are used

 Config.in                                     | 15 ++++
 ...1-Only-issue-warning-for-PIC-PIE-mix.patch | 47 ++++++++++++
 package/annobin/Config.in                     | 12 +++
 package/annobin/annobin.hash                  |  2 +
 package/annobin/annobin.mk                    | 44 +++++++++++
 package/gcc/gcc-final/gcc-final.mk            |  3 +
 package/pkg-generic.mk                        | 36 +++++++++
 support/scripts/check-hardened                | 74 +++++++++++++++++++
 toolchain/Config.in                           |  2 +
 .../pkg-toolchain-external.mk                 |  3 +
 toolchain/toolchain-wrapper.c                 |  3 +
 toolchain/toolchain/toolchain.mk              |  4 +
 12 files changed, 245 insertions(+)
 create mode 100644 package/annobin/0001-Only-issue-warning-for-PIC-PIE-mix.patch
 create mode 100644 package/annobin/Config.in
 create mode 100644 package/annobin/annobin.hash
 create mode 100644 package/annobin/annobin.mk
 create mode 100755 support/scripts/check-hardened

-- 
2.17.0
