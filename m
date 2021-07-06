From: Herve Codina <herve.codina@bootlin.com>
Date: Tue,  6 Jul 2021 16:24:43 +0200
Subject: [Buildroot] [PATCH v2 00/18] Overwritten file detection and fixes,
 one more step to TLP build
Message-ID: <20210706142501.951345-1-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This v2 series performs overwrite fixes (patches 1 to 9) before adding
the overwrite detection tooling at patch 10.

It renames <PKG>_PER_PACKAGE_TWEAK_HOOKS to <PKG>_POST_PREPARE_HOOKS.

It avoids code duplication when fixing <pkg>_{reconfigure,rebuilf,reinstall} in
PATCH 14.

One more patch was added in this v2 series (PATCH 15) to removed a no more
used file and 3 patches related to test (PATCH 16 to 18) are added too.

More changes details are given in each individual patches.

Best regards,
Herv? Codina

Herve Codina (14):
  package/e2fsprogs: fix fsck overwrite in HOST_DIR
  package/pkg-generic.mk: Remove Info documents dir entry
  package/pkg-generic.mk: perform .la files fixup in per-package
    HOST_DIR
  package/pkg-generic: add post-prepare hooks
  package/apr-util: use post-prepare hook
  package/apache: move APACHE_FIXUP_APR_LIBTOOL to post-prepare hook
  package/pkg-python: remove _sysconfigdata*.pyc files when
    _sysconfigdata*.py are changed
  package/pkg-generic.mk: move python fixup to generic package
    infrastructure
  package/owfs: remove Python sysconfigdata fixup
  package/pkg-generic.mk: generate final rsync exclude file list
  Makefile: rsync global {TARGET,HOST}_DIR using exclusion file list
  Makefile: breaks hardlinks in global {TARGET,HOST}_DIR on per-package
    build
  package/pkg-generic.mk: fix per-package
    <pkg>-{reconfigure,rebuild,reinstall}
  package/pkg-generic.mk: remove .files-final-rsync.before temporary
    file

Thomas Petazzoni (4):
  package/pkg-generic.mk: detect files overwritten in TARGET_DIR and
    HOST_DIR
  support/testing/infra: add log_file_path() function
  support/testing/tests: add test for check_bin_arch
  support/testing/tests: add test for file overwrite detection

 Makefile                                      |  33 ++++-
 package/apache/apache.mk                      |   2 +-
 package/apr-util/apr-util.mk                  |  12 +-
 package/e2fsprogs/e2fsprogs.mk                |   1 +
 package/owfs/owfs.mk                          |   9 --
 package/pkg-generic.mk                        | 129 +++++++++++++++++-
 package/pkg-python.mk                         |  10 --
 support/testing/infra/__init__.py             |  11 +-
 .../br2-external/detect-bad-arch/Config.in    |   1 +
 .../detect-bad-arch/external.desc             |   1 +
 .../br2-external/detect-bad-arch/external.mk  |   1 +
 .../package/detect-bad-arch/Config.in         |   4 +
 .../detect-bad-arch/detect-bad-arch.mk        |  15 ++
 .../br2-external/detect-overwrite/Config.in   |   1 +
 .../detect-overwrite/external.desc            |   1 +
 .../br2-external/detect-overwrite/external.mk |   1 +
 .../package/detect-overwrite/Config.in        |   5 +
 .../detect-overwrite/detect-overwrite.mk      |  19 +++
 support/testing/tests/core/test_bad_arch.py   |  19 +++
 .../testing/tests/core/test_file_overwrite.py |  48 +++++++
 20 files changed, 287 insertions(+), 36 deletions(-)
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/Config.in
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/external.desc
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/external.mk
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/Config.in
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/detect-bad-arch.mk
 create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/Config.in
 create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/external.desc
 create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/external.mk
 create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/Config.in
 create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/detect-overwrite.mk
 create mode 100644 support/testing/tests/core/test_bad_arch.py
 create mode 100644 support/testing/tests/core/test_file_overwrite.py

-- 
2.31.1
