From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 12:01:28 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.02/python-bump
Message-ID: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of patches that improve Python support in Buildroot:
Python is bumped to 2.7.1, the package is converted to the autotargets
infrastructure, some third-party Python modules are introduced as
examples, many minor issues were fixed.

The patch set is composed of the following changes :

 * Four initial patches from Maxime Ripard that bump Python to 2.7 and
   update the patches accordingly. Even though those four patches from
   Maxime Ripaard are heavily reworked and modified in the later
   commit that converts the python package to the autotargets
   infrastructure and rewrites all the patches, I have choosen to keep
   Maxime's patches in order to preserve authorship.

 * A patch to add a package for the libffi library (needed by the
   Python interpreter to build its ctype extension).

 * A patch that adjusts the autotools infrastructure to allow host
   packages to use <pkg>_MAKE_ENV and <pkg>_MAKE. The <pkg>_MAKE_ENV
   thing will be used by the converted python package.

 * A patch that bumps Python to 2.7.1, converts it to autotargets,
   rewrites all the patches to clarify their intent, clean up their
   implementation and add new features (options to enable/disable the
   compilation of certain extensions).

 * A patch that does the removing of .py or .pyc files globally (in
   target-finalize) and no longer at the level of the python
   package. This is necessary since the python package is not the only
   one that can install .py or .pyc files.

 * Two patches that add the python-serial and python-mad
   packages. Those have been used to test that our Python
   infrastructure works properly to build a pure Python module
   (python-serial) and a Python module that relies on C code, linked
   to a C library (python-mad). For the moment, those packages use the
   gentargets infrastructure, but once we have a better understanding
   of the Python distutils cross-compilation details, we may want to
   write a pythondistutilstargets infrastructure.

Those changes have been runtime tested with various simple Python
examples in a Qemu ARM target.

Regards,

Thomas

The following changes since commit 34acba1b3ef4ea874a1793f0f36a6b49abbb37ff:
  Peter Korsgaard (1):
        gdb: fixup symlink handling now tolchain gets installed into HOST_DIR

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2011.02/python-bump

Maxime Ripard (4):
      python: Move to version 2.7
      python: Port the python2.4 patches to 2.7
      python: Add the needed patches to compile python2.7 in buildroot.
      python: Fix make install (Workaround python's bug #1669349)

Thomas Petazzoni (6):
      libffi: new package
      autotools: allow host package to use <pkg>_MAKE_ENV and <pkg>_MAKE
      python: convert to autotargets, bump to 2.7.1, many improvements
      Remove .py or .pyc depending on Python configuration
      python-serial: new package
      python-mad: new package

 Makefile                                           |    8 +
 package/Config.in                                  |    2 +
 package/Makefile.autotools.in                      |    2 +-
 package/libffi/Config.in                           |    9 +
 package/libffi/libffi.mk                           |   33 +++
 package/multimedia/Config.in                       |    1 +
 package/multimedia/python-mad/Config.in            |    7 +
 package/multimedia/python-mad/python-mad.mk        |   41 +++
 package/python-serial/Config.in                    |    5 +
 package/python-serial/python-serial.mk             |   21 ++
 package/python/Config.in                           |   65 ++---
 package/python/python-2.4-001-cross-compile.patch  |  106 --------
 package/python/python-2.4-002-cross-compile.patch  |   36 ---
 .../python-2.4-010-disable_modules_and_ssl.patch   |   37 ---
 .../python-2.4-020-gentoo_py_dontcompile.patch     |   18 --
 .../python/python-2.7-001-support-for-build.patch  |  153 +++++++++++
 .../python-2.7-002-cross-compile-variable.patch    |   55 ++++
 ...on-2.7-003-no-import-when-cross-compiling.patch |   26 ++
 .../python-2.7-004-no-host-headers-libs.patch      |   97 +++++++
 .../python-2.7-005-staging-headers-libs.patch      |   38 +++
 .../python/python-2.7-006-disable-extensions.patch |  102 +++++++
 .../python-2.7-007-do-not-generate-pyo-files.patch |   40 +++
 .../python/python-2.7-008-reread-environment.patch |   65 +++++
 package/python/python-2.7-009-python-symlink.patch |   25 ++
 ...python-2.7-010-change-pyconfig-h-location.patch |   76 ++++++
 package/python/python-2.7-011-no-rpath.patch       |   75 ++++++
 .../python-2.7-012-correct-32bit-64bit-check.patch |   55 ++++
 .../python-2.7-100-optional-test-modules.patch     |   84 ++++++
 package/python/python-2.7-101-optional-pydoc.patch |   81 ++++++
 package/python/python-2.7-102-optional-2to3.patch  |   99 +++++++
 .../python/python-2.7-103-optional-sqlite.patch    |   28 ++
 package/python/python-2.7-104-optional-tk.patch    |   68 +++++
 .../python/python-2.7-105-optional-curses.patch    |   53 ++++
 package/python/python-2.7-106-optional-expat.patch |   84 ++++++
 .../python-2.7-107-optional-codecs-cjk.patch       |   25 ++
 package/python/python-2.7-108-optional-nis.patch   |   28 ++
 .../python-2.7-109-optional-unicodedata.patch      |   25 ++
 package/python/python-2.7-110-optional-db.patch    |   81 ++++++
 package/python/python-2.7-111-optional-ssl.patch   |   25 ++
 package/python/python-2.7-112-optional-bzip2.patch |   24 ++
 package/python/python-2.7-113-optional-zlib.patch  |   24 ++
 package/python/python.mk                           |  278 ++++++++------------
 42 files changed, 1799 insertions(+), 406 deletions(-)
 create mode 100644 package/libffi/Config.in
 create mode 100644 package/libffi/libffi.mk
 create mode 100644 package/multimedia/python-mad/Config.in
 create mode 100644 package/multimedia/python-mad/python-mad.mk
 create mode 100644 package/python-serial/Config.in
 create mode 100644 package/python-serial/python-serial.mk
 delete mode 100644 package/python/python-2.4-001-cross-compile.patch
 delete mode 100644 package/python/python-2.4-002-cross-compile.patch
 delete mode 100644 package/python/python-2.4-010-disable_modules_and_ssl.patch
 delete mode 100644 package/python/python-2.4-020-gentoo_py_dontcompile.patch
 create mode 100644 package/python/python-2.7-001-support-for-build.patch
 create mode 100644 package/python/python-2.7-002-cross-compile-variable.patch
 create mode 100644 package/python/python-2.7-003-no-import-when-cross-compiling.patch
 create mode 100644 package/python/python-2.7-004-no-host-headers-libs.patch
 create mode 100644 package/python/python-2.7-005-staging-headers-libs.patch
 create mode 100644 package/python/python-2.7-006-disable-extensions.patch
 create mode 100644 package/python/python-2.7-007-do-not-generate-pyo-files.patch
 create mode 100644 package/python/python-2.7-008-reread-environment.patch
 create mode 100644 package/python/python-2.7-009-python-symlink.patch
 create mode 100644 package/python/python-2.7-010-change-pyconfig-h-location.patch
 create mode 100644 package/python/python-2.7-011-no-rpath.patch
 create mode 100644 package/python/python-2.7-012-correct-32bit-64bit-check.patch
 create mode 100644 package/python/python-2.7-100-optional-test-modules.patch
 create mode 100644 package/python/python-2.7-101-optional-pydoc.patch
 create mode 100644 package/python/python-2.7-102-optional-2to3.patch
 create mode 100644 package/python/python-2.7-103-optional-sqlite.patch
 create mode 100644 package/python/python-2.7-104-optional-tk.patch
 create mode 100644 package/python/python-2.7-105-optional-curses.patch
 create mode 100644 package/python/python-2.7-106-optional-expat.patch
 create mode 100644 package/python/python-2.7-107-optional-codecs-cjk.patch
 create mode 100644 package/python/python-2.7-108-optional-nis.patch
 create mode 100644 package/python/python-2.7-109-optional-unicodedata.patch
 create mode 100644 package/python/python-2.7-110-optional-db.patch
 create mode 100644 package/python/python-2.7-111-optional-ssl.patch
 create mode 100644 package/python/python-2.7-112-optional-bzip2.patch
 create mode 100644 package/python/python-2.7-113-optional-zlib.patch

Thanks,
-- 
Thomas Petazzoni
