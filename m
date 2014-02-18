From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 21:39:53 +0100
Subject: [Buildroot] [PATCH v2 00/20] Python 2 and 3 bumps,
	support for Python 3 external modules
Message-ID: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a v2 of the patch set that does numerous Python support
improvements. Changes since v1:

 * Dropped patches that have been merged.

 * Rebased on top of the next branch, in order to resolve conflicts
   with the parallel build support patches that were merged.

Best regards,

Thomas

Przemyslaw Wrzos (1):
  python, python3: fix to ensure libpython is stripped

Rohan Fletcher (1):
  python-setuptools: bump version to 2.1.2

Thomas Petazzoni (17):
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

 package/Config.in                                  |   4 +-
 package/pkg-python.mk                              |  29 ++--
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
 package/python/python.mk                           |  11 +-
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
 47 files changed, 671 insertions(+), 1048 deletions(-)
 delete mode 100644 package/python-distutilscross/python-distutilscross.mk
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
