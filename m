From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  7 Feb 2017 12:35:58 +0100
Subject: [Buildroot] [PATCH 0/5] Runtime testing infrastructure
Message-ID: <1486467363-19881-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

At last, here is a first version of a small runtime testing
infrastructure for Buildroot. The first patch introduces the
infrastructure itself, the other 4 patches just add a few patches.

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
 support/testing/infra/__init__.py                  |  61 ++++++++
 support/testing/infra/basetest.py                  |  66 +++++++++
 support/testing/infra/builder.py                   |  50 +++++++
 support/testing/infra/emulator.py                  | 144 ++++++++++++++++++
 support/testing/run-tests                          |  77 ++++++++++
 support/testing/tests/__init__.py                  |   0
 support/testing/tests/core/__init__.py             |   0
 support/testing/tests/core/post-build.sh           |  10 ++
 support/testing/tests/core/post-image.sh           |  10 ++
 .../testing/tests/core/rootfs-overlay1/test-file1  | Bin 0 -> 4096 bytes
 .../tests/core/rootfs-overlay2/etc/test-file2      | Bin 0 -> 8192 bytes
 support/testing/tests/core/test_post_scripts.py    |  36 +++++
 support/testing/tests/core/test_rootfs_overlay.py  |  27 ++++
 support/testing/tests/core/test_timezone.py        |  66 +++++++++
 support/testing/tests/fs/__init__.py               |   0
 support/testing/tests/fs/test_ext.py               | 119 +++++++++++++++
 support/testing/tests/fs/test_iso9660.py           | 161 +++++++++++++++++++++
 support/testing/tests/fs/test_jffs2.py             |  45 ++++++
 support/testing/tests/fs/test_squashfs.py          |  37 +++++
 support/testing/tests/fs/test_ubi.py               |  39 +++++
 support/testing/tests/fs/test_yaffs2.py            |  12 ++
 support/testing/tests/package/__init__.py          |   0
 support/testing/tests/package/test_dropbear.py     |  28 ++++
 support/testing/tests/package/test_python.py       |  35 +++++
 support/testing/tests/toolchain/__init__.py        |   0
 support/testing/tests/toolchain/test_external.py   |  77 ++++++++++
 31 files changed, 1161 insertions(+)
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
