From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Mar 2017 16:03:16 +0100
Subject: [Buildroot] [PATCH v2 0/5] Runtime testing infrastructure
Message-ID: <1488726201-6507-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a second version of a small runtime testing infrastructure for
Buildroot. The first patch introduces the infrastructure itself, the
other 4 patches just add a small number of test cases.

By far and large the most featureful set of tests are the filesystem
tests, testing a lot of features of our filesystem image support.

There are definitely lots of possible improvements to the
infrastructure, and lots of possible tests to add, but we need to get
started at some point, and that's an initial proposal.

Here is a quick start:

 1. List the tests

    ./support/testing/run-tests -l

 2. Run a test:

    ./support/testing/run-tests -d <download dir> -o <output dir> <name of test>

    e.g:

    ./support/testing/run-tests -d ~/dl/ -o ../outputs/ tests.fs.test_ubi.TestUbi

This patch series is also available at:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=runtime-tests

Changes since v1:

 - Improvement to the external toolchain test cases:

   * We are now checking that there are no broken links in target/ and staging/

   * We are now verifying that the program interpreter of the busybox
     binary really exists on the target

   * Some code factorized in a TestExternalToolchain() base class

   * We are now boot testing the ARMv7/Thumb2 system generated with
     the Sourcery toolchain

   * Additional test case for the Linaro ARM toolchain

 - Fix i386 builtin kernel usage by the Emulator() class. Noticed by Ricardo.

 - Fix the shebang of run-tests to use python2 explicitly, since we're
   python2 only for the moment. Noticed by Ricardo.

 - Remove useless "import string" from run-tests. Noticed by Ricardo.

 - Make BRTest.downloaddir and BRTest.outputdir absolute, to avoid
   issues. It fixes a bug with one particular test case. Noticed by
   Ricardo.

 - Fix artefacts -> artifacts, suggested by Luca.

 - Add docstring for the smart_open() and get_elf_arch_tag() helpers,
   suggested by Luca.

 - Fix self.logtofile test in builder.py, noticed by Luca.

 - Use 'cf' as config file handle variable, rather than 'cfd',
   suggested by Luca.

 - Improve the Emulator.boot() method documentation about builtin
   kernel, suggested by Luca.

 - Remove excessive much logging from the Emulator() class.

 - Run "dmesg -n 1" as the first command once logged in, to avoid
   kernel messages polluting the console parsing. Issue reported by
   Ricardo.

 - Remove Emulator.showlog() method, not used. Noticed by Luca.

 - Use BR2_DL_DIR when option -d is not passed. Suggested by Luca.

 - Create output directory if it doesn't exist. Suggested by Luca.

 - Print help of run-tests when there is a failure.

 - Remove bogus TODO, noticed by Ricardo.

 - Fix some of the ISO9660 test cases, that were wrongly expecting a
   read-only filesystem, while they really get a read/write
   filesystem. Noticed by Ricardo.

 - Use "testpwd" as the root password for the Dropbear test case
   instead of "root", which could be confused with the login name.

 - Don't quiet grep commands in test cases, as their output can be
   useful. Suggested by Ricardo.

 - Use Emulator.login() instead of Emulator.login("root") to simply
   login as root with no password. Indeed, the argument of the login()
   method is the password, not the login name. Noticed by Ricardo.

Best regards,

Thomas Petazzoni

Thomas Petazzoni (5):
  support/testing: core testing infrastructure
  support/testing: add core tests
  support/testing: add fs tests
  support/testing: add package tests
  support/testing: add toolchain tests

 support/testing/conf/grub-menu.lst                 |  20 +++
 support/testing/conf/grub2.cfg                     |   7 +
 support/testing/conf/isolinux.cfg                  |   5 +
 .../testing/conf/minimal-x86-qemu-kernel.config    |  23 +++
 support/testing/conf/unittest.cfg                  |   6 +
 support/testing/infra/__init__.py                  |  89 +++++++++++
 support/testing/infra/basetest.py                  |  66 +++++++++
 support/testing/infra/builder.py                   |  49 +++++++
 support/testing/infra/emulator.py                  | 135 +++++++++++++++++
 support/testing/run-tests                          |  83 +++++++++++
 support/testing/tests/__init__.py                  |   0
 support/testing/tests/core/__init__.py             |   0
 support/testing/tests/core/post-build.sh           |  10 ++
 support/testing/tests/core/post-image.sh           |  10 ++
 .../testing/tests/core/rootfs-overlay1/test-file1  | Bin 0 -> 4096 bytes
 .../tests/core/rootfs-overlay2/etc/test-file2      | Bin 0 -> 8192 bytes
 support/testing/tests/core/test_post_scripts.py    |  35 +++++
 support/testing/tests/core/test_rootfs_overlay.py  |  27 ++++
 support/testing/tests/core/test_timezone.py        |  66 +++++++++
 support/testing/tests/fs/__init__.py               |   0
 support/testing/tests/fs/test_ext.py               | 119 +++++++++++++++
 support/testing/tests/fs/test_iso9660.py           | 162 +++++++++++++++++++++
 support/testing/tests/fs/test_jffs2.py             |  45 ++++++
 support/testing/tests/fs/test_squashfs.py          |  37 +++++
 support/testing/tests/fs/test_ubi.py               |  39 +++++
 support/testing/tests/fs/test_yaffs2.py            |  12 ++
 support/testing/tests/package/__init__.py          |   0
 support/testing/tests/package/test_dropbear.py     |  28 ++++
 support/testing/tests/package/test_python.py       |  35 +++++
 support/testing/tests/toolchain/__init__.py        |   0
 support/testing/tests/toolchain/test_external.py   | 156 ++++++++++++++++++++
 31 files changed, 1264 insertions(+)
 create mode 100644 support/testing/conf/grub-menu.lst
 create mode 100644 support/testing/conf/grub2.cfg
 create mode 100644 support/testing/conf/isolinux.cfg
 create mode 100644 support/testing/conf/minimal-x86-qemu-kernel.config
 create mode 100644 support/testing/conf/unittest.cfg
 create mode 100644 support/testing/infra/__init__.py
 create mode 100644 support/testing/infra/basetest.py
 create mode 100644 support/testing/infra/builder.py
 create mode 100644 support/testing/infra/emulator.py
 create mode 100755 support/testing/run-tests
 create mode 100644 support/testing/tests/__init__.py
 create mode 100644 support/testing/tests/core/__init__.py
 create mode 100755 support/testing/tests/core/post-build.sh
 create mode 100755 support/testing/tests/core/post-image.sh
 create mode 100644 support/testing/tests/core/rootfs-overlay1/test-file1
 create mode 100644 support/testing/tests/core/rootfs-overlay2/etc/test-file2
 create mode 100644 support/testing/tests/core/test_post_scripts.py
 create mode 100644 support/testing/tests/core/test_rootfs_overlay.py
 create mode 100644 support/testing/tests/core/test_timezone.py
 create mode 100644 support/testing/tests/fs/__init__.py
 create mode 100644 support/testing/tests/fs/test_ext.py
 create mode 100644 support/testing/tests/fs/test_iso9660.py
 create mode 100644 support/testing/tests/fs/test_jffs2.py
 create mode 100644 support/testing/tests/fs/test_squashfs.py
 create mode 100644 support/testing/tests/fs/test_ubi.py
 create mode 100644 support/testing/tests/fs/test_yaffs2.py
 create mode 100644 support/testing/tests/package/__init__.py
 create mode 100644 support/testing/tests/package/test_dropbear.py
 create mode 100644 support/testing/tests/package/test_python.py
 create mode 100644 support/testing/tests/toolchain/__init__.py
 create mode 100644 support/testing/tests/toolchain/test_external.py

-- 
2.7.4
