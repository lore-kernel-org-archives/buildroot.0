From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 30 Apr 2020 11:52:37 +0200
Subject: [Buildroot] [PATCH 00/11] Overwritten file detection,
 improvements to file listing logic
Message-ID: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The initial starting point for this series was that I wanted to detect
when a package overwrites files installed by another package, which is
something that is not compatible with per-package directory support. I
indeed have a complex build configuration which I'm converting to use
TLP, and this build configuration does lots of overwrites, which I
want to detect and fix.

While doing this overwrite detection, I realized that our existing
logic to detect which files are installed by each package is not
reliable: if a target package installs something in $(HOST_DIR), those
files installed in $(HOST_DIR) are not tracked. Getting this list of
files correct is also needed to properly support the
-reinstall,-rebuild,-reconfigure targets in a per-package
configuration (which this series does not address yet).

So this series goes on like this (I'm only highlighting the main
commits, not all preparation commits and details)

 - We create a new "install" step in PATCH 3. It is executed after all
   installation steps have executed. As of PATCH 3, it does nothing
   except creating a stamp file, but it will allow us to do some logic
   once a package is finished installing. Indeed, so far we had no
   place where we could run some logic after all installation steps of
   a package have completed.

 - In PATCH 5, we rework the pkg_size logic that detects files
   installed by each package to rely on the new "install"
   step. Instead of capturing the list of files "before" at the
   beginning of install-target, install-staging, install-images,
   install-host, and the list of files "after" at the end of these
   steps, we capture the list of files "before" at the beginning of
   the configure step, and the list of files "after" during the new
   "install" step.

 - In PATCH 8, we introduce the logic to detect files overwritten by
   other packages, using a simple md5sum hash.

 - In PATCH 9-11, we add test cases for the "check binary
   architecture" functionality and the "overwritten files detection"
   functionality.

This has received some basic testing so far, I'm definitely interested
in getting feedback from people, simply by testing if it works for
them.

All these changes are also available on the Git branch at:

  https://github.com/tpetazzoni/buildroot/tree/detect-overwrite

Best regards,

Thomas Petazzoni

Thomas Petazzoni (11):
  package/pkg-generic.mk: use $(PKG)_NAME in step_pkg_size_after
  package/pkg-generic.mk: drop useless $(1) argument in
    step_pkg_size_{before,after}
  package/pkg-generic.mk: introduce final 'install' step
  package/pkg-generic.mk: create directories upfront in the configure
    step
  package/pkg-generic.mk: rework pkg_size logic with the "installed"
    step
  package/pkg-generic.mk: exclude the staging sub-directory
  package/pkg-generic.mk: move pkg_size_{before,after} and
    check_bin_arch functions
  package/pkg-generic.mk: detect files overwritten in TARGET_DIR and
    HOST_DIR
  support/testing/infra: add log_file_path() function
  support/testing/tests: add test for check_bin_arch
  support/testing/tests: add test for file overwrite detection

 .gitlab-ci.yml                                |   3 +
 package/pkg-generic.mk                        | 146 ++++++++++--------
 package/pkg-utils.mk                          |   1 -
 support/testing/infra/__init__.py             |  13 +-
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
 .../testing/tests/core/test_file_overwrite.py |  47 ++++++
 16 files changed, 213 insertions(+), 65 deletions(-)
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
2.25.4
