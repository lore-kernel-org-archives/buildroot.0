From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 21:48:49 +0100
Subject: [Buildroot] [PATCHv1 00/26] Python 2 and 3 bumps,
	support for Python 3 external modules
Message-ID: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch series contains a significant number of improvements to the
Python packaging in Buildroot:

 * Both the Python 2.x and 3.x interpreters are bumped to their latest
   versions. For Python 3.x, we have chosen to work with Python
   3.4.0rc1 in order to be ready when Python 3.4.0 is released
   mid-March (in fact I started working initially with 3.4.0b1, and
   updated progressively).

 * Add support for building external Python modules with Python
   3.x. This was made possible thanks to the addition of the Python
   package infrastructure in the last Buildroot release.

Quick summary of the patches:

 * Patches 1 to 5 make various preparations and cleanups around Python
   2.x handling, and bump Python 2.7.3 to 2.7.6.

 * Patches 6 to 8 make additional small improvements to the Python
   package infrastructure.

 * Patches 9 to 14 prepare and implement the bump of Python 3.x to
   3.4.0rc1.

 * Patches 15 to 17 allow Python external modules to be built with
   Python 3.x.

 * Patches 18 to 19 are other small improvements, and bumps.

 * Patches 21 to 26 allow a number of existing Python external modules
   to build with Python 3.

It is worth noting that:

 * I have tried to push a few patches that I needed to the upstream
   Python (since by working on 3.4.0 beta versions I was very close to
   upstream), but I never had any feedback so far.

 * In total, this patch set removes approximately 1000 lines of code
   in Buildroot, while providing more features. Which is nice, I
   believe :-)

I really encourage people to test these patches, so I have pushed this
work at the following location:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=python3-pkg

Thanks!

Thomas

Przemyslaw Wrzos (1):
  python, python3: fix to ensure libpython is stripped

Rohan Fletcher (1):
  python-setuptools: bump version to 2.1.2

Thomas Petazzoni (23):
  python: expose PYTHON_PATH
  pkg-python: use the newly defined PYTHON_PATH variable
  pkg-python: also pass PYTHONPATH when building distutils packages
  python: bump to 2.7.6
  pkg-python: simplifications after the Python 2.x bump
  core: remove .py/.pyc for Python
  pkg-python: no longer use distutilscross for setuptools
  python-distutilscross: remove package that is no longer needed
  python3: removal of *.py/*.pyc is now done globally
  python3: make it exclusive from python
  python3: add python -> python3 symlink for the host variant
  python3: use proper PYTHON3_VERSION_MAJOR instead of harcoding 3.3
  python3: bump to 3.4.0rc1
  python3: provide a PYTHON3_PATH
  package: add python3 support in the package infrastructure
  package: allow Python packages with Python3
  python, python3: enable unicodedata for host-python, needed by
    setuptools
  python-pyasn: use the real upstream
  python-bottle: allow to build with Python 3
  python-serial: allow to build with Python 3
  python-pyasn: allow to build with Python 3
  python-pycrypto: allow to build with Python 3
  python-pysnmp{,-apps,-mibs}: allow to build with Python 3

kpa_info at yahoo.fr (1):
  python3: add config directory symbolic link

 Makefile                                           |   4 +-
 package/Config.in                                  |   4 +-
 package/pkg-python.mk                              |  34 ++---
 package/python-bottle/Config.in                    |   2 +-
 .../python-distutilscross/python-distutilscross.mk |  12 --
 package/python-pyasn/Config.in                     |   2 +-
 package/python-pyasn/python-pyasn.mk               |  12 +-
 package/python-pycrypto/Config.in                  |   2 +-
 package/python-pysnmp-apps/Config.in               |   2 +-
 package/python-pysnmp-mibs/Config.in               |   2 +-
 package/python-pysnmp/Config.in                    |   2 +-
 package/python-serial/Config.in                    |   2 +-
 package/python-setuptools/python-setuptools.mk     |  11 +-
 .../python-001-remove-host-header-path.patch       |  32 +++++
 package/python/python-002-fix-get-python-inc.patch |  36 +++++
 ...ython-003-properly-detect-if-python-build.patch |  23 +++
 ...python-004-sysconfigdata-install-location.patch |  76 ++++++++++
 .../python/python-005-pyc-pyo-conditional.patch    |  59 ++++++++
 .../python-006-cross-compile-getaddrinfo.patch     |  13 ++
 package/python/python-007-disable-extensions.patch |  60 ++++++++
 .../python-008-distutils-use-python-sysroot.patch  |  54 +++++++
 .../python/python-009-no-termcap-host-path.patch   |  23 +++
 ...atch => python-100-optional-test-modules.patch} |  48 ++++---
 ...pydoc.patch => python-101-optional-pydoc.patch} |  36 ++---
 ...l-2to3.patch => python-102-optional-2to3.patch} |  51 ++++---
 ...lite.patch => python-103-optional-sqlite.patch} |  49 ++++---
 ...ional-tk.patch => python-104-optional-tk.patch} |  46 +++---
 ...rses.patch => python-105-optional-curses.patch} |  24 ++--
 ...expat.patch => python-106-optional-expat.patch} |  30 ++--
 ....patch => python-107-optional-codecs-cjk.patch} |   8 +-
 ...nal-nis.patch => python-108-optional-nis.patch} |   8 +-
 ...patch => python-109-optional-unicodedata.patch} |   8 +-
 ...ional-db.patch => python-110-optional-db.patch} |  41 +++---
 ...nal-ssl.patch => python-111-optional-ssl.patch} |   8 +-
 ...bzip2.patch => python-112-optional-bzip2.patch} |   8 +-
 ...l-zlib.patch => python-113-optional-zlib.patch} |   8 +-
 .../python/python-2.7-001-support-for-build.patch  | 154 --------------------
 .../python-2.7-002-cross-compile-variable.patch    |  55 -------
 ...on-2.7-003-no-import-when-cross-compiling.patch |  26 ----
 .../python-2.7-004-no-host-headers-libs.patch      | 111 ---------------
 .../python-2.7-005-staging-headers-libs.patch      |  38 -----
 .../python/python-2.7-006-disable-extensions.patch | 102 -------------
 .../python-2.7-007-do-not-generate-pyo-files.patch |  40 ------
 .../python/python-2.7-008-reread-environment.patch |  65 ---------
 ...python-2.7-010-change-pyconfig-h-location.patch |  76 ----------
 package/python/python-2.7-011-no-rpath.patch       |  75 ----------
 .../python-2.7-012-correct-32bit-64bit-check.patch |  55 -------
 .../python-2.7-013-fix-linux-3-compilation.patch   |  24 ----
 .../python-2.7-014-verbose-module-build.patch      |  19 ---
 ...7-015-distutils-cross-compilation-support.patch | 125 ----------------
 .../python-2.7-016-cross-compile-getaddrinfo.patch |  15 --
 package/python/python.mk                           |  61 ++++----
 package/python3/Config.in                          |   1 +
 ...ython3-000-generate-sysconfigdata-buildir.patch | 158 ---------------------
 .../python3-001-remove-host-header-path.patch      |  36 +++++
 .../python3/python3-001-support-for-build.patch    |  68 ---------
 .../python3/python3-002-no-host-headers-libs.patch |  72 ----------
 ...thon3-002-properly-detect-if-python-build.patch |  23 +++
 .../python3/python3-003-staging-header-libs.patch  |  41 ------
 ...ython3-003-sysconfigdata-install-location.patch |  76 ++++++++++
 ...ython3-004-no-import-when-cross-compiling.patch |  27 ----
 ...he.patch => python3-004-old-stdlib-cache.patch} |  39 +++--
 .../python3-005-do-not-generate-pyo-files.patch    |  40 ------
 .../python3/python3-005-pyc-pyo-conditional.patch  |  60 ++++++++
 ...=> python3-006-cross-compile-getaddrinfo.patch} |   8 +-
 .../python3/python3-006-reread-environment.patch   |  63 --------
 .../python3-007-change-pyconfig-h-location.patch   |  76 ----------
 ....patch => python3-007-disable-extensions.patch} |  44 +++---
 ...008-distutils-sysconfig-use-sysconfigdata.patch |  58 ++++++++
 package/python3/python3-008-no-rpath.patch         |  51 -------
 .../python3-009-distutils-use-python-sysroot.patch |  57 ++++++++
 .../python3/python3-009-verbose-module-build.patch |  26 ----
 ...3-010-distutils-cross-compilation-support.patch |  71 ---------
 .../python3/python3-010-no-termcap-host-path.patch |  22 +++
 .../python3-100-optional-test-modules.patch        |  60 ++++----
 package/python3/python3-101-optional-pydoc.patch   |  46 +++---
 package/python3/python3-102-optional-2to3.patch    |  68 +++++----
 package/python3/python3-103-optional-sqlite.patch  |  53 ++++---
 package/python3/python3-104-optional-tk.patch      |  51 ++++---
 package/python3/python3-105-optional-curses.patch  |  30 ++--
 package/python3/python3-106-optional-expat.patch   |  36 ++---
 .../python3/python3-107-optional-codecs-cjk.patch  |   8 +-
 package/python3/python3-108-optional-nis.patch     |   8 +-
 .../python3/python3-109-optional-unicodedata.patch |   8 +-
 package/python3/python3-110-optional-idle.patch    |  39 +++--
 package/python3/python3.mk                         | 102 ++++++-------
 86 files changed, 1265 insertions(+), 2242 deletions(-)
 delete mode 100644 package/python-distutilscross/python-distutilscross.mk
 create mode 100644 package/python/python-001-remove-host-header-path.patch
 create mode 100644 package/python/python-002-fix-get-python-inc.patch
 create mode 100644 package/python/python-003-properly-detect-if-python-build.patch
 create mode 100644 package/python/python-004-sysconfigdata-install-location.patch
 create mode 100644 package/python/python-005-pyc-pyo-conditional.patch
 create mode 100644 package/python/python-006-cross-compile-getaddrinfo.patch
 create mode 100644 package/python/python-007-disable-extensions.patch
 create mode 100644 package/python/python-008-distutils-use-python-sysroot.patch
 create mode 100644 package/python/python-009-no-termcap-host-path.patch
 rename package/python/{python-2.7-100-optional-test-modules.patch => python-100-optional-test-modules.patch} (71%)
 rename package/python/{python-2.7-101-optional-pydoc.patch => python-101-optional-pydoc.patch} (77%)
 rename package/python/{python-2.7-102-optional-2to3.patch => python-102-optional-2to3.patch} (70%)
 rename package/python/{python-2.7-103-optional-sqlite.patch => python-103-optional-sqlite.patch} (57%)
 rename package/python/{python-2.7-104-optional-tk.patch => python-104-optional-tk.patch} (59%)
 rename package/python/{python-2.7-105-optional-curses.patch => python-105-optional-curses.patch} (75%)
 rename package/python/{python-2.7-106-optional-expat.patch => python-106-optional-expat.patch} (84%)
 rename package/python/{python-2.7-107-optional-codecs-cjk.patch => python-107-optional-codecs-cjk.patch} (84%)
 rename package/python/{python-2.7-108-optional-nis.patch => python-108-optional-nis.patch} (85%)
 rename package/python/{python-2.7-109-optional-unicodedata.patch => python-109-optional-unicodedata.patch} (83%)
 rename package/python/{python-2.7-110-optional-db.patch => python-110-optional-db.patch} (75%)
 rename package/python/{python-2.7-111-optional-ssl.patch => python-111-optional-ssl.patch} (83%)
 rename package/python/{python-2.7-112-optional-bzip2.patch => python-112-optional-bzip2.patch} (83%)
 rename package/python/{python-2.7-113-optional-zlib.patch => python-113-optional-zlib.patch} (84%)
 delete mode 100644 package/python/python-2.7-001-support-for-build.patch
 delete mode 100644 package/python/python-2.7-002-cross-compile-variable.patch
 delete mode 100644 package/python/python-2.7-003-no-import-when-cross-compiling.patch
 delete mode 100644 package/python/python-2.7-004-no-host-headers-libs.patch
 delete mode 100644 package/python/python-2.7-005-staging-headers-libs.patch
 delete mode 100644 package/python/python-2.7-006-disable-extensions.patch
 delete mode 100644 package/python/python-2.7-007-do-not-generate-pyo-files.patch
 delete mode 100644 package/python/python-2.7-008-reread-environment.patch
 delete mode 100644 package/python/python-2.7-010-change-pyconfig-h-location.patch
 delete mode 100644 package/python/python-2.7-011-no-rpath.patch
 delete mode 100644 package/python/python-2.7-012-correct-32bit-64bit-check.patch
 delete mode 100644 package/python/python-2.7-013-fix-linux-3-compilation.patch
 delete mode 100644 package/python/python-2.7-014-verbose-module-build.patch
 delete mode 100644 package/python/python-2.7-015-distutils-cross-compilation-support.patch
 delete mode 100644 package/python/python-2.7-016-cross-compile-getaddrinfo.patch
 delete mode 100644 package/python3/python3-000-generate-sysconfigdata-buildir.patch
 create mode 100644 package/python3/python3-001-remove-host-header-path.patch
 delete mode 100644 package/python3/python3-001-support-for-build.patch
 delete mode 100644 package/python3/python3-002-no-host-headers-libs.patch
 create mode 100644 package/python3/python3-002-properly-detect-if-python-build.patch
 delete mode 100644 package/python3/python3-003-staging-header-libs.patch
 create mode 100644 package/python3/python3-003-sysconfigdata-install-location.patch
 delete mode 100644 package/python3/python3-004-no-import-when-cross-compiling.patch
 rename package/python3/{python3-112-old-stdlib-cache.patch => python3-004-old-stdlib-cache.patch} (61%)
 delete mode 100644 package/python3/python3-005-do-not-generate-pyo-files.patch
 create mode 100644 package/python3/python3-005-pyc-pyo-conditional.patch
 rename package/python3/{python3-011-cross-compile-getaddrinfo.patch => python3-006-cross-compile-getaddrinfo.patch} (81%)
 delete mode 100644 package/python3/python3-006-reread-environment.patch
 delete mode 100644 package/python3/python3-007-change-pyconfig-h-location.patch
 rename package/python3/{python3-012-disable-extensions.patch => python3-007-disable-extensions.patch} (78%)
 create mode 100644 package/python3/python3-008-distutils-sysconfig-use-sysconfigdata.patch
 delete mode 100644 package/python3/python3-008-no-rpath.patch
 create mode 100644 package/python3/python3-009-distutils-use-python-sysroot.patch
 delete mode 100644 package/python3/python3-009-verbose-module-build.patch
 delete mode 100644 package/python3/python3-010-distutils-cross-compilation-support.patch
 create mode 100644 package/python3/python3-010-no-termcap-host-path.patch

-- 
1.8.3.2
