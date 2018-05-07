From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Mon,  7 May 2018 14:10:29 +0200
Subject: [Buildroot] [RFC PATCH v2] Verify hardened builds
Message-ID: <20180507121032.25794-1-stefan.sorensen@spectralink.com>
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

---
Changes v1-v2:
 * Make annobin a proper host package
 * Split package addition and toolchain integeration
 * Remove GCC 6 dependency
 * Add patches to fix PIC/PIE checks in hardened.sh
 * Install annobin plugin in $(HOST_DIR)/lib/gcc/plugin/annobin
 * Spelling fixes

Stefan S?rensen (3):
  annobin: New package
  toolchain: Integrate annobin gcc plugin
  core: Verify that hardening flags are used

 Config.in                                     |  9 +++
 DEVELOPERS                                    |  1 +
 package/Config.in.host                        |  1 +
 package/annobin/0001-Fix-pic-pie-check.patch  | 43 +++++++++++
 ...reat-.so.-files-as-dynamic-libraries.patch | 32 ++++++++
 ...3-Only-issue-warning-for-PIC-PIE-mix.patch | 52 +++++++++++++
 package/annobin/Config.in.host                | 13 ++++
 package/annobin/annobin.hash                  |  2 +
 package/annobin/annobin.mk                    | 43 +++++++++++
 package/gcc/gcc-final/gcc-final.mk            |  3 +
 package/pkg-generic.mk                        | 36 +++++++++
 support/scripts/check-hardened                | 75 +++++++++++++++++++
 .../pkg-toolchain-external.mk                 |  3 +
 toolchain/toolchain-wrapper.c                 |  3 +
 toolchain/toolchain/toolchain.mk              |  4 +
 15 files changed, 320 insertions(+)
 create mode 100644 package/annobin/0001-Fix-pic-pie-check.patch
 create mode 100644 package/annobin/0002-Also-treat-.so.-files-as-dynamic-libraries.patch
 create mode 100644 package/annobin/0003-Only-issue-warning-for-PIC-PIE-mix.patch
 create mode 100644 package/annobin/Config.in.host
 create mode 100644 package/annobin/annobin.hash
 create mode 100644 package/annobin/annobin.mk
 create mode 100755 support/scripts/check-hardened

-- 
2.17.0
